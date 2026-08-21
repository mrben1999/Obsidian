---
tags: [glpi, security, password-policy]
---

# Password Policy — Chính sách mật khẩu

Liên quan: [[2FA]] · [[Profiles]]

## Checklist
- [ ] Đặt độ dài/độ phức tạp tối thiểu (áp dụng cho tài khoản local, không phải AD)
- [ ] Đặt thời hạn đổi mật khẩu định kỳ nếu cần
- [ ] Khóa tài khoản sau nhiều lần đăng nhập sai

## Command / Cấu hình GLPI
`Setup > General > Security > Password policy`:
```
Độ dài tối thiểu: 12 ký tự
Bắt buộc chữ hoa, chữ thường, số, ký tự đặc biệt
Khóa sau 5 lần sai, trong 30 phút
```
> Với user đăng nhập qua AD, chính sách mật khẩu thực tế nằm ở Group Policy AD — cấu hình này chỉ áp dụng cho tài khoản local/dịch vụ.

## Verify
Thử tạo mật khẩu yếu cho tài khoản local test, xác nhận hệ thống từ chối.

## Troubleshooting
| Lỗi | Nguyên nhân | Cách xử lý |
|---|---|---|
| Chính sách không áp dụng cho user AD | Nhầm lẫn phạm vi áp dụng | Nhắc lại: chính sách AD phải cấu hình riêng trên Domain Controller |

**Tiếp theo:** [[Session]]
