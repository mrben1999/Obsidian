# 💾 Phần 1.7 — Backup & Restore Active Directory

## 1. Nguyên tắc backup AD
🔒 AD là **single point of failure** cho toàn bộ xác thực mạng trong kiến trúc này (802.1X, Wi-Fi, VPN đều phụ thuộc). Mất AD mà không có backup = toàn bộ hệ thống mạng ngừng xác thực.

| Loại backup | Tần suất khuyến nghị | Công cụ |
|---|---|---|
| **System State Backup** (đầy đủ AD database, SYSVOL, Registry) | Hàng ngày (tự động, ngoài giờ sản xuất) | `wbadmin` (Windows Server Backup) |
| **Full Server / VM Snapshot** (nếu chạy ảo hoá) | Hàng tuần | Công cụ hypervisor (Hyper-V/VMware) |
| **Export cấu hình GPO** | Sau mỗi lần thay đổi GPO quan trọng | `Backup-GPO` |

## 2. Cài đặt Windows Server Backup (nếu chưa có)
```powershell
Install-WindowsFeature Windows-Server-Backup
```

## 3. Backup System State thủ công (chạy 1 lần để kiểm tra)
```powershell
wbadmin start systemstatebackup -backupTarget:D:\ADBackup -quiet
```
📌 Khuyến nghị lưu backup vào ổ đĩa **khác** ổ hệ thống (D:), và tốt hơn nữa là **thiết bị lưu trữ ngoài server** (NAS nội bộ, ổ mạng riêng) — tránh trường hợp hỏng ổ cứng server làm mất luôn cả backup.

## 4. Tự động hoá backup hàng ngày (Scheduled Task)
```powershell
$backupTarget = "D:\ADBackup"

$action = New-ScheduledTaskAction -Execute "wbadmin.exe" `
  -Argument "start systemstatebackup -backupTarget:$backupTarget -quiet"

$trigger = New-ScheduledTaskTrigger -Daily -At 1:00AM

Register-ScheduledTask -TaskName "AD-SystemState-Backup-Daily" `
  -Action $action -Trigger $trigger -RunLevel Highest -User "SYSTEM"
```
✅ Chọn giờ chạy **1:00 AM** (ngoài giờ hoạt động của nhà máy) để không ảnh hưởng hiệu năng server trong giờ sản xuất.

## 5. Kiểm tra tình trạng backup định kỳ
```powershell
wbadmin get versions -backupTarget:D:\ADBackup
```
✅ Checklist kiểm tra hàng tuần:
- [ ] Có bản backup mới nhất trong vòng 24-48 giờ gần nhất.
- [ ] Dung lượng backup hợp lý (không phải file 0KB — dấu hiệu backup lỗi).
- [ ] Đã copy bản backup ra vị trí lưu trữ ngoài server ít nhất 1 lần/tuần (3-2-1 rule — xem [[../06_Van_Hanh_Chuan/01_Quy_Trinh_Backup_Tong_The]]).

## 6. Khôi phục AD — Restore System State (Authoritative/Non-Authoritative)

⚠️ **Chỉ thực hiện khi có sự cố nghiêm trọng** (AD DB corrupt, mất DC duy nhất). Đây là thao tác rủi ro cao, cần làm đúng trình tự.

### 6.1 Khởi động vào Directory Services Restore Mode (DSRM)
```powershell
bcdedit /set safeboot dsrepair
Restart-Computer
```
Đăng nhập bằng tài khoản DSRM (mật khẩu đã đặt lúc `Install-ADDSForest`, xem [[03_Trien_Khai_AD_DS]]).

### 6.2 Restore Non-Authoritative (khôi phục về trạng thái backup, để DC tự đồng bộ lại nếu có DC khác)
```cmd
wbadmin start systemstaterecovery -version:<phiên bản backup> -backupTarget:D:\ADBackup -quiet
```
📌 Dùng khi có **từ 2 DC trở lên** — DC vừa restore sẽ tự đồng bộ (replicate) dữ liệu mới nhất từ các DC còn sống sau khi khởi động lại bình thường.

### 6.3 Restore Authoritative (khi chỉ có 1 DC — bản backup chính là "sự thật" cần khôi phục)
```cmd
wbadmin start systemstaterecovery -version:<phiên bản backup> -backupTarget:D:\ADBackup -quiet
```
Sau khi restore xong nhưng **trước khi khởi động lại bình thường**, chạy `ntdsutil` để đánh dấu Authoritative Restore cho toàn bộ hoặc 1 phần AD:
```cmd
ntdsutil
activate instance ntds
authoritative restore
restore database
quit
quit
```
Sau đó thoát DSRM và khởi động lại bình thường:
```powershell
bcdedit /deletevalue safeboot
Restart-Computer
```

### 6.4 Kiểm tra sau khi restore
```powershell
dcdiag /v
Get-ADDomainController
repadmin /replsummary
```
- [ ] ✅ `dcdiag /v` không còn lỗi nghiêm trọng.
- [ ] ✅ Các user/computer/group đã khôi phục đúng như trước sự cố (kiểm tra mẫu vài object quan trọng).
- [ ] ✅ Dịch vụ NPS/RADIUS hoạt động lại bình thường (test đăng nhập 802.1X/Wi-Fi thử).

## 7. Khôi phục 1 đối tượng bị xoá nhầm (Object-level restore) — không cần restore toàn bộ hệ thống
📌 Nếu chỉ xoá nhầm 1 user/OU (không phải sự cố toàn hệ thống), dùng **AD Recycle Bin** (nếu đã bật) thay vì restore toàn bộ System State:
```powershell
# Bật AD Recycle Bin (chỉ cần làm 1 lần, khuyến nghị bật ngay từ đầu)
Enable-ADOptionalFeature -Identity 'Recycle Bin Feature' -Scope ForestOrConfigurationSet -Target "qvn.local"

# Khôi phục object bị xoá
Get-ADObject -Filter {displayName -eq "Nguyễn Văn An"} -IncludeDeletedObjects | Restore-ADObject
```
🔒 **Khuyến nghị bật AD Recycle Bin ngay sau khi triển khai AD DS** — giúp khôi phục nhanh chóng các trường hợp xoá nhầm phổ biến mà không cần đụng đến DSRM/restore toàn hệ thống.

➡️ Tiếp theo: [[08_Hardening_AD]]
