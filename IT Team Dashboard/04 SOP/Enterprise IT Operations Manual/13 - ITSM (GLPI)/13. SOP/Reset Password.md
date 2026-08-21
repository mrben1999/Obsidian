---
tags: [glpi, sop]
---

# SOP: Reset Password

Liên quan: [[Cấp email]] · [[2FA]] · [[Templates]]

## Checklist
- [ ] Xác minh danh tính người yêu cầu trước khi reset (chống social engineering)
- [ ] Dùng Template ticket có sẵn (giảm thời gian xử lý)
- [ ] Ép đổi mật khẩu ngay lần đăng nhập tiếp theo

## Các bước thực hiện
1. Nhân viên tạo ticket từ Template "Reset password" (xem [[Templates]]).
2. Kỹ thuật viên **xác minh danh tính** (gọi điện xác nhận qua số nội bộ đã đăng ký, không chỉ tin theo ticket).
3. Reset mật khẩu trên AD (`Reset-ADAccountPassword` hoặc qua ADUC), tick "User must change password at next logon".
4. Thông báo trực tiếp qua điện thoại/gặp mặt, không gửi qua email/chat.
5. Đóng ticket sau khi nhân viên xác nhận đăng nhập lại thành công.

## Ghi chú thực tế
Đây là kịch bản social engineering phổ biến nhất nhắm vào Helpdesk — bước xác minh danh tính ở #2 **không được bỏ qua** dù ticket có vẻ hợp lệ.

**Tiếp theo:** [[Đổi máy]]
