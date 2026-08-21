# 👤 Phần 1.6 — Quản lý User & Group hàng ngày

## 1. Quy ước đặt tên tài khoản người dùng
| Loại | Định dạng | Ví dụ |
|---|---|---|
| Username đăng nhập (sAMAccountName) | `<tên>.<họ>` viết không dấu, chữ thường | `an.nguyen` |
| Email/UPN (nếu dùng chung domain) | `<username>@qvn.local` | `an.nguyen@qvn.local` |
| Display Name | `Họ Tên đầy đủ` | `Nguyễn Văn An` |

## 2. Quy trình Onboarding — Tạo user mới

**Điều kiện tiên quyết:** Đã nhận yêu cầu từ HR/quản lý bộ phận, xác nhận vai trò và phòng ban.

```powershell
$password = ConvertTo-SecureString "MatKhauTamThoi!2026" -AsPlainText -Force

New-ADUser -Name "Nguyễn Văn An" `
  -GivenName "An" -Surname "Nguyễn" `
  -SamAccountName "an.nguyen" `
  -UserPrincipalName "an.nguyen@qvn.local" `
  -Path "OU=VanPhong,OU=QVN-Users,DC=qvn,DC=local" `
  -AccountPassword $password `
  -Enabled $true `
  -ChangePasswordAtLogon $true `
  -Department "Kế toán" -Title "Nhân viên kế toán"

# Thêm vào group tương ứng (VD: được dùng Wi-Fi văn phòng)
Add-ADGroupMember -Identity "GG-Wifi-VanPhong" -Members "an.nguyen"
```

✅ **Checklist Onboarding:**
- [ ] Tạo user đúng OU theo phòng ban.
- [ ] Bật `ChangePasswordAtLogon` — bắt buộc đổi mật khẩu lần đầu.
- [ ] Thêm vào đúng Security Group theo nhu cầu truy cập (Wi-Fi, VPN, thư mục chia sẻ...).
- [ ] Bàn giao thông tin đăng nhập qua kênh an toàn (không gửi qua chat không mã hoá).

## 3. Quy trình Offboarding — Vô hiệu hoá user khi nghỉ việc

⚠️ Thực hiện **ngay trong ngày nghỉ việc cuối cùng** (hoặc sớm hơn theo chỉ đạo HR) — chậm trễ là rủi ro bảo mật.

```powershell
# Vô hiệu hoá tài khoản (không xoá ngay — giữ lại để tham chiếu/audit)
Disable-ADAccount -Identity "an.nguyen"

# Xoá khỏi tất cả group (tránh còn quyền truy cập ẩn qua group cũ)
Get-ADUser "an.nguyen" -Properties MemberOf | Select-Object -ExpandProperty MemberOf | ForEach-Object {
    Remove-ADGroupMember -Identity $_ -Members "an.nguyen" -Confirm:$false
}

# Chuyển vào OU "Disabled Users" để dễ quản lý, tránh lẫn với user đang hoạt động
Move-ADObject -Identity (Get-ADUser "an.nguyen").DistinguishedName -TargetPath "OU=DisabledUsers,DC=qvn,DC=local"
```
📌 Sau 30-90 ngày (tuỳ chính sách lưu trữ nhà máy), có thể xoá hẳn tài khoản đã vô hiệu hoá lâu ngày.

## 4. Reset mật khẩu người dùng
```powershell
Set-ADAccountPassword -Identity "an.nguyen" -Reset -NewPassword (ConvertTo-SecureString "MatKhauMoiTam!2026" -AsPlainText -Force)
Set-ADUser -Identity "an.nguyen" -ChangePasswordAtLogon $true
```

## 5. Quản lý Computer Object (máy trạm/kiosk join domain)
```powershell
# Kiểm tra danh sách máy đã join domain trong OU sản xuất
Get-ADComputer -Filter * -SearchBase "OU=PC-SanXuat,OU=QVN-Computers,DC=qvn,DC=local" | Select-Object Name, DistinguishedName

# Join máy trạm vào domain (chạy trên máy trạm, PowerShell Admin)
Add-Computer -DomainName "qvn.local" -OUPath "OU=PC-SanXuat,OU=QVN-Computers,DC=qvn,DC=local" -Credential (Get-Credential) -Restart
```

## 6. Kiểm tra định kỳ tài khoản (khuyến nghị hàng tháng)
```powershell
# Danh sách tài khoản không đăng nhập > 60 ngày (nghi ngờ đã nghỉ nhưng chưa vô hiệu hoá)
$time = (Get-Date).AddDays(-60)
Get-ADUser -Filter {LastLogonTimeStamp -lt $time -and Enabled -eq $true} -Properties LastLogonTimeStamp |
  Select-Object Name, @{N="LastLogon";E={[DateTime]::FromFileTime($_.LastLogonTimeStamp)}}

# Danh sách tài khoản bị khoá (locked out)
Search-ADAccount -LockedOut
```
- [ ] ✅ Rà soát danh sách tài khoản không hoạt động lâu ngày — xác nhận với HR có cần vô hiệu hoá không.
- [ ] ✅ Không còn tài khoản `Enabled` thuộc nhân viên đã nghỉ việc quá 7 ngày.

➡️ Tiếp theo: [[07_Backup_Restore_AD]]
