---
tags: [glpi, authentication, ldap]
---

# 01 Create Service Account — Tài khoản dịch vụ LDAP

Liên quan: [[02 Delegation]] · [[03 LDAP Basic Config]]

## Checklist
- [ ] Yêu cầu team AD tạo tài khoản dịch vụ riêng (không dùng tài khoản cá nhân)
- [ ] Đặt mật khẩu không hết hạn (service account policy)
- [ ] Lưu credential vào password manager công ty
- [ ] Giới hạn quyền chỉ Read trên OU cần thiết

## Command
Trên Domain Controller (PowerShell, thực hiện bởi Admin AD):
```powershell
New-ADUser -Name "svc-glpi-ldap" -SamAccountName "svc-glpi-ldap" `
  -UserPrincipalName "svc-glpi-ldap@quangviet.local" `
  -Path "OU=ServiceAccounts,DC=quangviet,DC=local" `
  -AccountPassword (Read-Host -AsSecureString "Nhập mật khẩu") `
  -Enabled $true -PasswordNeverExpires $true -CannotChangePassword $true
```

## Verify
```powershell
Get-ADUser -Identity svc-glpi-ldap -Properties PasswordNeverExpires
```
Test bind từ GLPI server (xem [[06 Test]]).

## Troubleshooting
| Lỗi | Nguyên nhân | Cách xử lý |
|---|---|---|
| Tài khoản bị khóa sau vài tháng | Chính sách domain ép đổi mật khẩu bất chấp `PasswordNeverExpires` | Kiểm tra Fine-Grained Password Policy áp cho OU ServiceAccounts |
| Không tạo được do thiếu quyền | Người thực hiện không có quyền trên OU | Yêu cầu Domain Admin thực hiện hoặc [[02 Delegation|delegate quyền]] |

**Tiếp theo:** [[02 Delegation]]
