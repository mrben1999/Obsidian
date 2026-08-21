---
category: "4.2 Software"
visibility: Technician / Supervisor / Super-Admin only
tags: [outlook, email, known-error, technician]
---

# [Outlook] Lỗi không nhận/gửi được mail

## 1. Tóm tắt hiện tượng (Symptom)
Outlook mở được nhưng không nhận mail mới, hoặc gửi mail bị treo ở "Outbox" không đi được, đôi khi kèm thông báo lỗi dạng "Cannot connect to server" hoặc "Sending reported error 0x8004010F".

## 2. Nguyên nhân (Root Cause)
Với Outlook chạy trên nền Microsoft 365 (Modern Auth), nguyên nhân phổ biến theo thứ tự:
1. **Mất kết nối mạng/Internet cục bộ** tại máy người dùng (nguyên nhân hay gặp nhất, cần loại trừ trước).
2. **Phiên đăng nhập (token) hết hạn** — thường do đổi mật khẩu AD gần đây nhưng Outlook chưa cập nhật lại.
3. **Hộp thư quá dung lượng** (hiếm khi xảy ra nếu công ty dùng Office 365 vì dung lượng lớn, nhưng vẫn cần kiểm tra).
4. **File dữ liệu Outlook (.OST) bị lỗi/corrupt.**
5. **Dịch vụ Microsoft 365 đang gặp sự cố diện rộng** (kiểm tra qua Microsoft 365 Service Health, hiếm nhưng cần loại trừ nếu nhiều người dùng cùng báo lỗi 1 lúc).

## 3. Các bước xử lý (Resolution)
1. **Loại trừ nguyên nhân mạng trước:** kiểm tra máy có truy cập Internet bình thường không (mở thử 1 website), xem thêm bài "Xử lý nhanh khi mất mạng" nếu cần.
2. **Kiểm tra trạng thái kết nối Outlook** (góc dưới màn hình Outlook): nếu hiện "Disconnected" hoặc "Need Password", chọn **File > Account Settings**, đăng nhập lại tài khoản.
3. **Nếu vừa đổi mật khẩu AD:** đăng xuất hoàn toàn và đăng nhập lại (`File > Office Account > Sign out`, mở lại Outlook đăng nhập bằng mật khẩu mới).
4. **Kiểm tra nhiều người dùng cùng báo lỗi cùng lúc** → khả năng sự cố diện rộng Microsoft 365, kiểm tra https://status.cloud.microsoft (không phải lỗi cục bộ, chỉ cần theo dõi và thông báo người dùng chờ).
5. **Sửa file .OST lỗi (nếu các bước trên không giải quyết được):**
   - Đóng Outlook hoàn toàn.
   - Đổi tên file `.ost` tại `C:\Users\<user>\AppData\Local\Microsoft\Outlook\` (thêm `.old` vào cuối tên).
   - Mở lại Outlook — hệ thống sẽ tự tạo file `.ost` mới và tải lại toàn bộ mail từ server (có thể mất thời gian với hộp thư lớn).

## 4. Thông tin bổ sung (Notes)
- Không xóa file `.ost` cũ ngay — đổi tên giữ lại phòng trường hợp cần khôi phục thủ công 1 số mail chưa đồng bộ lên server.
- Nếu chỉ 1 người dùng bị lỗi trong khi cả phòng ban bình thường → tập trung điều tra máy/tài khoản cá nhân đó, không cần nghi ngờ hạ tầng chung.
- Liên quan: [[[Outlook] Cài đặt và cấu hình Email]]
