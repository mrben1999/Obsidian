# 🔒 Phần 1.8 — Hardening AD Security Baseline

## 1. Rủi ro vòng đời hệ điều hành (Windows Server 2012 R2)
⚠️ Windows Server 2012 R2 đã hết **Extended Support** (10/10/2023) — không còn nhận bản vá bảo mật thường xuyên từ Microsoft trừ khi mua **Extended Security Updates (ESU)**. Đây là rủi ro nền tảng không thể khắc phục hoàn toàn chỉ bằng cấu hình.

**Khuyến nghị bắt buộc ghi nhận trong kế hoạch IT:**
- [ ] Đánh giá mua ESU (nếu ngân sách cho phép) để tiếp tục nhận bản vá.
- [ ] Lên lộ trình nâng cấp lên Windows Server 2019/2022 trong 12-24 tháng tới.
- [ ] Trong thời gian chưa nâng cấp: **cô lập tối đa** server AD khỏi truy cập không cần thiết (chỉ VLAN 99 quản trị được SSH/RDP vào), không cho AD server duyệt web/nhận email.

## 2. Password Policy (Default Domain Policy)
```powershell
Set-ADDefaultDomainPasswordPolicy -Identity qvn.local `
  -MinPasswordLength 12 `
  -PasswordHistoryCount 10 `
  -MaxPasswordAge 90.00:00:00 `
  -MinPasswordAge 1.00:00:00 `
  -ComplexityEnabled $true `
  -LockoutThreshold 5 `
  -LockoutDuration 00:30:00 `
  -LockoutObservationWindow 00:30:00
```
| Thông số | Giá trị khuyến nghị | Lý do |
|---|---|---|
| Độ dài tối thiểu | 12 ký tự | Chuẩn tối thiểu hiện đại (dài hơn 8 ký tự mặc định) |
| Độ phức tạp | Bật | Chống brute-force cơ bản |
| Khoá sau N lần sai | 5 lần | Cân bằng bảo mật và trải nghiệm người dùng nhà máy |
| Thời gian khoá | 30 phút | Đủ để giảm brute-force, không gây phiền hà quá mức |

## 3. Hạn chế tài khoản Administrator/Domain Admin
- [ ] 🔒 Không dùng tài khoản `Administrator`/`Domain Admin` cho công việc hàng ngày (kể cả của IT Manager) — tạo tài khoản quản trị riêng (VD: `admin.itmgr`) chỉ dùng khi cần quyền cao.
- [ ] 🔒 Đổi tên tài khoản `Administrator` mặc định (giảm nguy cơ bị đoán tên tài khoản khi brute-force):
```powershell
Get-ADUser -Identity "Administrator" | Rename-ADObject -NewName "adm-qvn-2026"
Set-ADUser -Identity "adm-qvn-2026" -SamAccountName "adm-qvn-2026"
```
- [ ] 🔒 Giới hạn thành viên nhóm `Domain Admins` ở mức tối thiểu (chỉ IT Manager, không thêm tài khoản dịch vụ vào nhóm này).

## 4. Tài khoản dịch vụ (Service Account) — nguyên tắc Least Privilege
📌 Các dịch vụ tích hợp (NPS, FortiGate LDAP bind...) **không được dùng** tài khoản Admin. Tạo tài khoản riêng, quyền tối thiểu:
```powershell
$svcPassword = ConvertTo-SecureString "MatKhauDichVuManh!2026#" -AsPlainText -Force
New-ADUser -Name "svc-fortigate-ldap" `
  -SamAccountName "svc-fortigate-ldap" `
  -UserPrincipalName "svc-fortigate-ldap@qvn.local" `
  -Path "OU=QVN-ServiceAccounts,DC=qvn,DC=local" `
  -AccountPassword $svcPassword -Enabled $true `
  -PasswordNeverExpires $true `
  -CannotChangePassword $true
```
📌 `PasswordNeverExpires` chỉ áp dụng cho tài khoản dịch vụ (không phải người dùng thật) vì mật khẩu hết hạn đột ngột có thể làm gián đoạn xác thực RADIUS/LDAP toàn hệ thống — bù lại, mật khẩu tài khoản dịch vụ phải **rất mạnh** và được rà soát định kỳ 6-12 tháng/lần.

## 5. Cấu hình Audit Policy (ghi log để điều tra sự cố)
```powershell
auditpol /set /subcategory:"Logon" /success:enable /failure:enable
auditpol /set /subcategory:"Account Lockout" /success:enable /failure:enable
auditpol /set /subcategory:"User Account Management" /success:enable /failure:enable
auditpol /set /subcategory:"Security Group Management" /success:enable /failure:enable
```
🔒 Bật audit cho các sự kiện quan trọng: đăng nhập thất bại liên tục (dấu hiệu brute-force), thay đổi thành viên nhóm quản trị (dấu hiệu leo thang quyền), tạo/xoá tài khoản.

## 6. Hardening dịch vụ trên Domain Controller
- [ ] 🔒 Chỉ mở port cần thiết cho AD (LDAP 389/636, Kerberos 88, DNS 53, RPC dynamic range) — dùng Windows Firewall giới hạn nguồn kết nối chỉ từ các VLAN cần thiết.
- [ ] 🔒 Tắt các dịch vụ không cần thiết trên server (Print Spooler nếu không dùng, SMBv1 — giao thức cũ có nhiều lỗ hổng đã biết):
```powershell
Disable-WindowsOptionalFeature -Online -FeatureName SMB1Protocol
```
- [ ] 🔒 Không cài phần mềm không liên quan trên DC (server AD nên "sạch", chỉ chạy vai trò AD/DNS/NPS).

## 7. Bật LDAP Signing / LDAPS (mã hoá truy vấn LDAP)
📌 Mặc định LDAP (port 389) truyền dữ liệu không mã hoá — khi FortiGate/ứng dụng khác bind LDAP để tra cứu user, khuyến nghị dùng LDAPS (port 636) nếu thiết bị hỗ trợ, hoặc tối thiểu bật LDAP Signing bắt buộc:
```powershell
# Kiểm tra trạng thái yêu cầu LDAP signing hiện tại (Group Policy: Domain controller: LDAP server signing requirements)
```
Cấu hình qua GPO: `Computer Configuration → Policies → Windows Settings → Security Settings → Local Policies → Security Options → Domain controller: LDAP server signing requirements` → đặt **Require signing**.

## 8. Checklist Hardening AD tổng hợp
- [ ] Password Policy đạt chuẩn tối thiểu 12 ký tự, có độ phức tạp.
- [ ] Đã đổi tên/giới hạn tài khoản Administrator mặc định.
- [ ] Tài khoản dịch vụ tách riêng, không nằm trong nhóm Domain Admins.
- [ ] Audit Policy đã bật cho các sự kiện quan trọng.
- [ ] AD Recycle Bin đã bật (xem [[07_Backup_Restore_AD]] mục 7).
- [ ] Windows Firewall trên DC giới hạn nguồn kết nối theo VLAN.
- [ ] Đã ghi nhận rủi ro vòng đời OS 2012 R2 vào kế hoạch nâng cấp IT.
- [ ] SMBv1 đã tắt.
- [ ] LDAP Signing đã yêu cầu bắt buộc (Require).

➡️ Tiếp theo: [[09_Checklist_Van_Hanh_AD]]
