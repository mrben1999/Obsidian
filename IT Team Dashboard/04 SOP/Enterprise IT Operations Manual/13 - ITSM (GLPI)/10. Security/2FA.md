---
tags: [glpi, security, 2fa]
---

# 2FA — Xác thực hai lớp

Liên quan: [[Password Policy]] · [[Session]]

## Checklist
- [ ] Bật 2FA bắt buộc cho Profile Super Admin/Technician
- [ ] Hướng dẫn nhân viên IT cài app xác thực (Google Authenticator/Microsoft Authenticator)
- [ ] Có phương án backup code khi mất thiết bị

## Command / Cấu hình GLPI
`Setup > General > Security (TFA/2FA)` → bật, ép buộc cho Profile Super Admin và Technician.
Người dùng quét mã QR trong `Cấu hình cá nhân > Bảo mật` để liên kết app xác thực.

## Verify
Đăng nhập thử tài khoản Technician, xác nhận hệ thống yêu cầu nhập mã OTP sau bước nhập mật khẩu.

## Troubleshooting
| Lỗi | Nguyên nhân | Cách xử lý |
|---|---|---|
| Nhân viên mất điện thoại, không đăng nhập được | Chưa lưu backup code | Super Admin reset 2FA thủ công cho user đó qua giao diện quản trị |

**Tiếp theo:** [[Password Policy]]
