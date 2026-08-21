---
category: "2.2 Infosec Policy"
visibility: Public (toàn công ty)
tags: [policy, security, password]
---

# [Policy] Quy định đặt mật khẩu an toàn

## 1. Tóm tắt hiện tượng (Symptom)
Nhân viên cần biết tiêu chuẩn đặt mật khẩu bắt buộc áp dụng cho tài khoản công ty (AD, Email, VPN, phần mềm nội bộ).

## 2. Nguyên nhân (Root Cause)
Mật khẩu yếu là nguyên nhân hàng đầu dẫn đến các sự cố bảo mật (chiếm quyền tài khoản, phát tán mã độc, rò rỉ dữ liệu) — chính sách này áp dụng thống nhất để giảm thiểu rủi ro.

## 3. Các bước xử lý (Resolution) — Quy định cụ thể
1. **Độ dài tối thiểu:** 12 ký tự.
2. **Độ phức tạp:** bắt buộc có chữ hoa, chữ thường, số và ký tự đặc biệt.
3. **Không sử dụng:** tên công ty, tên bản thân, ngày sinh, các mật khẩu thông dụng (`123456`, `Password1`...).
4. **Không dùng chung** 1 mật khẩu cho nhiều hệ thống (đặc biệt không dùng lại mật khẩu cá nhân cho tài khoản công ty).
5. **Đổi định kỳ:** hệ thống AD sẽ tự động yêu cầu đổi mật khẩu theo chu kỳ quy định — xem hướng dẫn tại [[../../01. End-User Self-Service/1.1 Accounts & Passwords/[AD] Đổi mật khẩu Windows-AD]].
6. **Không chia sẻ** mật khẩu qua chat/email dưới bất kỳ hình thức nào, kể cả với đồng nghiệp/IT.

## 4. Thông tin bổ sung (Notes)
- IT sẽ **không bao giờ** chủ động gọi điện/nhắn tin hỏi mật khẩu của bạn — nếu nhận được yêu cầu như vậy, đây là dấu hiệu lừa đảo (phishing/social engineering), báo ngay cho IT.
- Khuyến khích dùng passphrase dễ nhớ nhưng khó đoán (ví dụ ghép 3-4 từ không liên quan + số + ký tự đặc biệt) thay vì mật khẩu ngắn phức tạp khó nhớ.
