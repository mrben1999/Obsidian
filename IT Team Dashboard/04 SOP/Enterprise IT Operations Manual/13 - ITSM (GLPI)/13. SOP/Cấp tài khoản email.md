---
tags: [glpi, sop]
---

# SOP: Cấp tài khoản email

Liên quan: [[01 Create Service Account]] · [[Reset Password]]

## Checklist
- [ ] Tạo tài khoản AD trước (email phụ thuộc AD tại Quảng Việt)
- [ ] Đồng bộ về GLPI qua LDAP Sync
- [ ] Gửi thông tin đăng nhập an toàn (không qua kênh chat thông thường)

## Các bước thực hiện
1. HR gửi yêu cầu nhân viên mới qua Ticket "Cấp tài khoản email".
2. IT tạo user AD theo đúng OU phòng ban (`OU=QuangViet_HN/OU=<PhongBan>`).
3. Đợi chu kỳ [[07 Sync]] (tối đa 1 giờ) hoặc chạy tay `cron.php` để đồng bộ ngay về GLPI.
4. Gửi thông tin đăng nhập qua kênh bảo mật (ví dụ trực tiếp hoặc qua password manager chia sẻ tạm thời).
5. Đóng ticket, xác nhận nhân viên đăng nhập thành công lần đầu.

## Ghi chú thực tế
Không gửi mật khẩu qua email/chat thông thường — vi phạm nguyên tắc bảo mật cơ bản dù là công ty nhỏ.

**Tiếp theo:** [[Reset Password]]
