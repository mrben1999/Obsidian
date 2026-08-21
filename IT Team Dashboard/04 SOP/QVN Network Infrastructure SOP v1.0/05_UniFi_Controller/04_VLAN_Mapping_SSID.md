# 🔀 Phần 5.4 — VLAN Mapping cho từng SSID

## 1. Hai cấp độ gán VLAN
| Cấp độ | Mô tả |
|---|---|
| **VLAN tĩnh theo SSID** | Toàn bộ client kết nối SSID này luôn vào 1 VLAN cố định |
| **VLAN động theo RADIUS (RADIUS-assigned VLAN)** | VLAN được NPS chỉ định theo AD Group của từng user — cùng 1 SSID nhưng user khác nhau có thể vào VLAN khác nhau |

📌 Kiến trúc nhà máy này dùng **VLAN động** cho SSID `QVN-Staff` (theo AD Group, giống cơ chế mạng dây tại [[../02_NPS_RADIUS/06_Tich_Hop_AD_Groups_VLAN]]), và **VLAN tĩnh** cho SSID `QVN-Guest`.

## 2. Bật RADIUS-assigned VLAN cho SSID `QVN-Staff`

1. Vào **Settings** → **WiFi** → chọn SSID `QVN-Staff` → **Edit**.
2. Kéo xuống mục **RADIUS MAC Authentication** / **Advanced** → tìm tuỳ chọn **"Use VLAN ID from RADIUS reply"** (hoặc tên tương đương tuỳ phiên bản UniFi Network Application — thường nằm gần mục cấu hình RADIUS Profile).
3. Bật tuỳ chọn này.
4. **Network/VLAN mặc định** vẫn cần chọn 1 giá trị (VD: VLAN 40 Wifi-Staff) — đây là **VLAN dự phòng** dùng khi RADIUS không trả về VLAN cụ thể (VD: NPS reject không rõ lý do nhưng vẫn cho qua ở mức thấp — trong thực tế nên hiếm khi xảy ra nếu Network Policy cấu hình đúng).
5. **Save**.

## 3. Đối chiếu với cấu hình NPS
📌 VLAN động hoạt động dựa trên các Network Policy đã cấu hình tại [[../02_NPS_RADIUS/06_Tich_Hop_AD_Groups_VLAN]]:
- User thuộc `GG-Wifi-VanPhong` → NPS trả Tunnel-Pvt-Group-ID = `40` → UniFi gán VLAN 40.
- Nếu sau này có thêm group riêng cho khu vực khác, tạo thêm Network Policy tương ứng trên NPS, UniFi sẽ tự động áp dụng đúng VLAN mà không cần sửa gì phía Controller.

## 4. Cấu hình VLAN tĩnh cho SSID Guest
1. Vào SSID `QVN-Guest` → **Edit**.
2. **Network/VLAN:** chọn cố định VLAN 50 (Guest) — **không** bật RADIUS-assigned VLAN cho SSID này (Guest không xác thực qua AD).
3. **Save**.

## 5. Kiểm tra
- [ ] ✅ Kết nối user thuộc `GG-Wifi-VanPhong` → xác nhận nhận IP thuộc dải `10.10.40.x`.
- [ ] ✅ Kết nối thiết bị Guest → xác nhận luôn nhận IP thuộc dải `10.10.50.x` bất kể tài khoản nào dùng.
- [ ] ✅ Trong **Insights → Wireless Clients**, cột **Network** hiển thị đúng VLAN tương ứng cho từng client.

⚠️ **Lưu ý rủi ro:** Nếu cấu hình sai Tunnel-Pvt-Group-ID trên NPS (gõ nhầm số VLAN), nhân viên Wi-Fi có thể vô tình lọt vào VLAN Server hoặc VLAN nhạy cảm khác — luôn test kỹ với 1 tài khoản mẫu trước khi công bố SSID cho toàn bộ nhân viên.

➡️ Tiếp theo: [[05_Guest_Network_Portal]]
