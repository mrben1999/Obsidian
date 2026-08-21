---
category: "1.1 Accounts & Passwords"
visibility: Public (toàn công ty)
tags: [password, AD, windows, self-service]
---

# [AD] Hướng dẫn tự đổi mật khẩu Windows/AD

## 1. Tóm tắt hiện tượng (Symptom)
Mật khẩu đăng nhập máy tính (Windows) và các hệ thống liên kết (Email, WiFi, VPN) sắp hết hạn hoặc bạn muốn chủ động đổi mật khẩu định kỳ theo chính sách công ty.

## 2. Nguyên nhân (Root Cause)
Theo [[[Policy] Quy định đặt mật khẩu an toàn|chính sách bảo mật Quảng Việt]], mật khẩu Active Directory (AD) cần đổi định kỳ. Vì email, WiFi, VPN, GLPI đều xác thực qua cùng 1 tài khoản AD nên chỉ cần đổi 1 lần tại máy tính, mọi hệ thống khác sẽ tự cập nhật.

## 3. Các bước xử lý (Resolution)
**Cách 1 — Đổi ngay trên máy đang đăng nhập (khuyến nghị):**
1. Nhấn tổ hợp phím `Ctrl + Alt + Delete`.
2. Chọn **"Change a password"**.
3. Nhập mật khẩu cũ, sau đó nhập mật khẩu mới 2 lần theo đúng yêu cầu độ phức tạp (xem mục 4).
4. Nhấn Enter — máy sẽ xác nhận đổi thành công, không cần khởi động lại.

**Cách 2 — Nếu đang làm việc từ xa qua VPN:**
1. Kết nối VPN trước (xem [[[VPN] Cấu hình VPN làm việc từ xa|hướng dẫn VPN]]).
2. Thực hiện tương tự Cách 1.
3. ⚠️ Nếu đổi mật khẩu khi **không** kết nối VPN, máy sẽ chỉ đổi cache cục bộ, gây lệch với AD — dẫn đến lỗi đăng nhập email/GLPI. Luôn đổi khi đã có VPN hoặc đang ở văn phòng.

## 4. Thông tin bổ sung (Notes)
- Yêu cầu mật khẩu: tối thiểu 12 ký tự, có chữ hoa, chữ thường, số và ký tự đặc biệt.
- Sau khi đổi mật khẩu, thiết bị di động (email trên điện thoại) có thể yêu cầu nhập lại mật khẩu mới — đây là hiện tượng bình thường, không phải lỗi.
- Không tự đổi được / quên mật khẩu hoàn toàn → xem [[[Outlook] Lỗi không nhận - gửi được mail|các lỗi liên quan]] hoặc tạo Ticket danh mục "Tài khoản > Reset password".
