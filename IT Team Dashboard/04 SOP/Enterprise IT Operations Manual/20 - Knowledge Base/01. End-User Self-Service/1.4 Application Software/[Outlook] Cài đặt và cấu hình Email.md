---
category: "1.4 Application Software"
visibility: Public (toàn công ty)
tags: [outlook, email, office365, self-service]
---

# [Outlook] Hướng dẫn cài đặt và cấu hình Email (Outlook/Webmail)

## 1. Tóm tắt hiện tượng (Symptom)
Máy tính mới hoặc cài lại chưa có Outlook đăng nhập email công ty; hoặc cần cấu hình email trên điện thoại cá nhân.

## 2. Nguyên nhân (Root Cause)
Email công ty Quảng Việt chạy trên nền Microsoft 365 — tài khoản email chính là tài khoản AD, xác thực qua Microsoft 365 Login (Modern Authentication).

## 3. Các bước xử lý (Resolution)
**Trên máy tính (Outlook Desktop có sẵn trong bộ Office 365):**
1. Mở Outlook, chọn **Add Account**.
2. Nhập địa chỉ email công ty (ví dụ `nguyenvana@quangviet.com.vn`), nhấn Connect.
3. Hệ thống chuyển sang trang đăng nhập Microsoft 365, nhập mật khẩu AD.
4. Nếu tài khoản có bật 2FA, nhập mã OTP (xem [[[2FA] Cấu hình xác thực 2 lớp|hướng dẫn 2FA]]).
5. Outlook tự đồng bộ email, có thể mất vài phút với hộp thư lớn.

**Trên điện thoại (Outlook Mobile App):**
1. Tải app **Microsoft Outlook** từ App Store/Google Play.
2. Mở app, nhập email công ty, đăng nhập tương tự bước trên.

**Trên trình duyệt (Webmail):**
Truy cập `https://outlook.office.com`, đăng nhập bằng tài khoản AD.

## 4. Thông tin bổ sung (Notes)
- Không dùng "POP/IMAP thủ công" để cấu hình — luôn dùng Add Account tự động, tránh lỗi đồng bộ.
- Gặp lỗi không gửi/nhận được mail sau khi đã cấu hình xong → xem [[[Outlook] Lỗi không nhận - gửi được mail]].
