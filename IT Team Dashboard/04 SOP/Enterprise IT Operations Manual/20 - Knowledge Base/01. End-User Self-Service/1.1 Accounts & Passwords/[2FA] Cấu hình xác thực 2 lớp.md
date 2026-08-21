---
category: "1.1 Accounts & Passwords"
visibility: Public (toàn công ty)
tags: [2fa, otp, security, self-service]
---

# [2FA] Hướng dẫn cấu hình xác thực 2 lớp (Two-Factor Authentication)

## 1. Tóm tắt hiện tượng (Symptom)
Khi đăng nhập một số hệ thống nội bộ (GLPI dành cho IT, Email quan trọng, VPN), bạn được yêu cầu cấu hình thêm mã xác thực OTP ngoài mật khẩu thông thường.

## 2. Nguyên nhân (Root Cause)
Đây là yêu cầu bảo mật bắt buộc theo chính sách công ty — xác thực 2 lớp (2FA) giúp bảo vệ tài khoản ngay cả khi mật khẩu bị lộ, vì kẻ tấn công vẫn cần có mã OTP sinh ra trên điện thoại của bạn mới đăng nhập được.

## 3. Các bước xử lý (Resolution)
1. Cài ứng dụng xác thực trên điện thoại: **Microsoft Authenticator** (khuyến nghị vì đồng bộ với Office 365) hoặc **Google Authenticator**.
2. Đăng nhập vào hệ thống yêu cầu 2FA lần đầu, hệ thống sẽ hiện mã QR.
3. Mở app Authenticator trên điện thoại, chọn **"Add account" > "Scan QR code"**, quét mã QR trên màn hình máy tính.
4. App sẽ hiện mã 6 số, thay đổi mỗi 30 giây — nhập mã này vào ô xác nhận trên máy tính để hoàn tất liên kết.
5. Từ lần đăng nhập sau, sau khi nhập mật khẩu, bạn mở app lấy mã 6 số hiện tại và nhập vào để hoàn tất đăng nhập.

## 4. Thông tin bổ sung (Notes)
- **Lưu lại mã backup code** hệ thống cung cấp lúc thiết lập — dùng khi mất điện thoại, không cài lại được app.
- Nếu đổi điện thoại/mất điện thoại và không có backup code, liên hệ phòng IT để được reset 2FA thủ công (yêu cầu xác minh danh tính trực tiếp).
- 2FA hiện áp dụng bắt buộc cho: GLPI (Technician/Admin), VPN, không áp dụng cho tài khoản Self-Service GLPI thông thường.
