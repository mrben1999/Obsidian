# 🚪 Phần 5.5 — Guest Network & Portal

## 1. Mục tiêu Guest Network
Cho phép khách/đối tác đến nhà máy dùng Wi-Fi để truy cập Internet, **hoàn toàn cô lập** khỏi mạng nội bộ (không dùng AD, không qua RADIUS xác thực nhân viên).

## 2. Tạo SSID Guest với Captive Portal

1. **Settings** → **WiFi** → **Create New WiFi Network**.
2. **Name/SSID:** `QVN-Guest`.
3. **Security Protocol:** **Open** (không mật khẩu) kết hợp Captive Portal, hoặc **WPA2-Personal** với mật khẩu đơn giản đổi định kỳ (tuỳ chính sách nhà máy — Captive Portal chuyên nghiệp hơn cho khách doanh nghiệp).
4. **Network/VLAN:** chọn VLAN 50 (Guest) — cố định, không dùng RADIUS.
5. Bật **Guest Policies** (tính năng cô lập Guest có sẵn trong UniFi):
   - **Guest Control** → Enable.
   - Tích **Isolate clients from LAN** hoặc tương đương — client Guest không thấy nhau và không thấy mạng LAN nội bộ.

## 3. Cấu hình Captive Portal
1. **Settings** → **Guest Control** → **Portal Customization**.
2. Chọn kiểu xác thực Portal:
   - **Simple Password** — 1 mật khẩu chung, đổi định kỳ (đơn giản nhất cho nhà máy).
   - **Voucher** — tạo mã dùng 1 lần/có giới hạn thời gian, phù hợp nếu muốn kiểm soát chặt hơn theo từng lượt khách.
3. Tuỳ chỉnh giao diện đăng nhập (logo công ty, điều khoản sử dụng) nếu cần chuyên nghiệp hoá.
4. **Save**.

## 4. Giới hạn băng thông Guest
1. Trong cấu hình SSID `QVN-Guest` → mục **Advanced** → **Bandwidth Limits**.
2. Đặt giới hạn hợp lý (VD: Download 10 Mbps / Upload 5 Mbps mỗi client) — tránh khách chiếm băng thông ảnh hưởng hệ thống sản xuất.
3. 📌 Đối chiếu thêm với Rate Limiting đã cấu hình phía FortiGate ([[../04_FortiGate_200F/06_Firewall_Policy_Chuan]]) — 2 lớp giới hạn (UniFi + FortiGate) đảm bảo Guest không ảnh hưởng hạ tầng dù ở lớp nào.

## 5. Kiểm tra cô lập Guest (bắt buộc test kỹ)
- [ ] ✅ Kết nối thiết bị test vào `QVN-Guest`, thử ping tới `10.10.10.10` (DC01) → phải **thất bại** (timeout).
- [ ] ✅ Thử ping tới thiết bị Guest khác cùng kết nối → phải **thất bại** (client isolation).
- [ ] ✅ Thử truy cập Internet bình thường (VD: mở trang web bất kỳ) → phải **thành công**.
- [ ] ✅ Kiểm tra tốc độ tải có đúng giới hạn băng thông đã đặt.

## 6. Đổi mật khẩu Guest định kỳ
📌 Nếu dùng Simple Password, đặt lịch đổi mật khẩu Guest hàng tháng hoặc hàng quý (tuỳ mức độ khách vãng lai) — cập nhật tại **Guest Control → Portal Customization**, thông báo lại cho lễ tân/bảo vệ (người thường cung cấp mật khẩu Wi-Fi cho khách).

➡️ Tiếp theo: [[06_Backup_Restore_UniFi]]
