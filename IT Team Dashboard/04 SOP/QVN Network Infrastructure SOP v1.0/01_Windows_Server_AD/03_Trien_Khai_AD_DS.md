# 🏗️ Phần 1.3 — Triển khai AD DS (Domain Controller đầu tiên)

## 1. Điều kiện tiên quyết
- [ ] Windows Server 2012 R2 đã cài đặt hoàn chỉnh theo [[02_Cai_Dat_Windows_Server_2012_R2]].
- [ ] IP tĩnh đã cấu hình đúng `10.10.10.10/24`.
- [ ] Đã xác nhận tên miền nội bộ sẽ dùng: `qvn.local`.
- [ ] 💾 Đã có snapshot/backup máy ảo (nếu chạy trên hypervisor) trước khi thực hiện — bước dcpromo khó rollback nếu không có backup.

## 2. Cài đặt Role AD DS

**Qua Server Manager:**
1. **Server Manager** → **Add roles and features**.
2. **Installation Type** → **Role-based or feature-based installation** → Next.
3. Chọn server đích (local server) → Next.
4. Tích chọn **Active Directory Domain Services** → khi được hỏi thêm feature liên quan → **Add Features** → Next → Next → **Install**.

**Qua PowerShell (khuyến nghị lưu script để tái sử dụng):**
```powershell
Install-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools
```

## 3. Promote Server thành Domain Controller (dcpromo)

⚠️ **Bước rủi ro cao** — sau khi promote, server sẽ khởi động lại và thay đổi cấu trúc hệ thống sâu (Database NTDS, SYSVOL). Đảm bảo đã backup trước khi tiếp tục.

**Qua PowerShell:**
```powershell
Install-ADDSForest `
  -DomainName "qvn.local" `
  -DomainNetbiosName "QVN" `
  -ForestMode "WinThreshold" `
  -DomainMode "WinThreshold" `
  -InstallDns:$true `
  -SafeModeAdministratorPassword (ConvertTo-SecureString "M@tKhauKhoiPhucManh!2026" -AsPlainText -Force) `
  -Force:$true
```
📌 `SafeModeAdministratorPassword` là mật khẩu **Directory Services Restore Mode (DSRM)** — dùng khi cần khôi phục AD ở chế độ an toàn. **Lưu mật khẩu này vào nơi an toàn riêng biệt** (không chung nơi lưu mật khẩu vận hành hàng ngày) — xem [[07_Backup_Restore_AD]].

> 📌 Ghi chú tương thích: `ForestMode`/`DomainMode` giá trị `WinThreshold` tương ứng mức Windows Server 2016 trong PowerShell cmdlet; đối với môi trường thuần Windows Server 2012 R2, dùng giá trị `Win2012R2` để đảm bảo đúng functional level mục tiêu — xác nhận lại tuỳ theo phiên bản module ADDSDeployment đang cài trên máy.

**Qua GUI (nếu không quen PowerShell):**
1. Sau khi cài xong Role, click **Promote this server to a domain controller** (notification icon trên Server Manager).
2. Chọn **Add a new forest**, nhập Root domain name: `qvn.local` → Next.
3. Giữ Forest/Domain Functional Level phù hợp hạ tầng hiện có → Next.
4. Nhập mật khẩu DSRM → Next.
5. Bỏ qua cảnh báo DNS delegation (bình thường với forest mới) → Next.
6. Xác nhận NetBIOS name: `QVN` → Next.
7. Giữ đường dẫn mặc định cho Database, Log files, SYSVOL (hoặc trỏ sang ổ D: nếu đã phân vùng riêng) → Next.
8. Review → **Install**. Máy sẽ tự khởi động lại.

## 4. Kiểm tra sau khi triển khai

✅ Sau khi server khởi động lại và đăng nhập bằng `QVN\Administrator`:

```powershell
# Kiểm tra dịch vụ AD DS đang chạy
Get-Service NTDS, DNS, Netlogon | Select-Object Name, Status

# Kiểm tra thông tin domain
Get-ADDomain

# Kiểm tra Domain Controller
Get-ADDomainController

# Kiểm tra sức khoẻ tổng thể AD (dcdiag)
dcdiag /v
```

- [ ] ✅ `dcdiag /v` không có lỗi nghiêm trọng (FAIL) ở các test chính (Connectivity, Advertising, KnowsOfRoleHolders, NetLogons).
- [ ] ✅ Dịch vụ `NTDS`, `DNS`, `Netlogon` đều **Running**.
- [ ] ✅ `Get-ADDomain` trả về đúng thông tin domain `qvn.local`.

## 5. Cài đặt công cụ quản trị AD (RSAT — nếu quản trị từ máy khác)
Trên máy trạm quản trị (không phải DC), nếu dùng Windows 10/11 để quản trị từ xa:
```powershell
Get-WindowsCapability -Name RSAT* -Online | Add-WindowsCapability -Online
```

## 6. Rollback nếu triển khai lỗi
- Nếu promote lỗi giữa chừng và cần làm lại: dùng snapshot/backup đã lưu ở bước điều kiện tiên quyết để khôi phục về trạng thái trước dcpromo, sau đó thực hiện lại từ đầu.
- Không tự ý `Uninstall-ADDSDomainController` trên forest/domain đầu tiên nếu chưa hiểu rõ hậu quả (sẽ xoá toàn bộ domain) — trong môi trường chỉ có 1 DC, việc này đồng nghĩa **mất toàn bộ AD**.

➡️ Tiếp theo: [[04_Cau_Hinh_DNS_Cho_AD]]
