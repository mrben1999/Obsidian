# 🔀 Phần 2.6 — Tích hợp AD Groups & gán VLAN động

## 1. Mục tiêu
Khi user/thiết bị xác thực 802.1X thành công, NPS không chỉ trả "Accept/Reject" mà còn có thể **chỉ định VLAN** cho port/kết nối đó — dựa vào AD Group của user. Đây là cơ chế **Dynamic VLAN Assignment**.

## 2. Nguyên lý hoạt động
NPS trả về các RADIUS attribute chuẩn (Tunnel-Type, Tunnel-Medium-Type, Tunnel-Pvt-Group-ID) trong gói Access-Accept — switch/AP (CBS350/UniFi) đọc các attribute này và tự động gán port/client vào đúng VLAN tương ứng.

## 3. Bảng ánh xạ AD Group → VLAN

| AD Group | VLAN gán | Áp dụng cho |
|---|---|---|
| `GG-Mang-Day-SanXuat` | VLAN 30 (Production) | Máy trạm/kiosk kết nối dây khu xưởng |
| `GG-Wifi-VanPhong` | VLAN 40 (Wifi-Staff) | Nhân viên văn phòng kết nối Wi-Fi |
| `GG-IT-Admin` | VLAN 99 (Management) | Máy quản trị IT kết nối dây/Wi-Fi |

## 4. Cấu hình RADIUS Attributes trong Network Policy

Mở Network Policy (VD: `802.1X-Wired-SanXuat`) → **Properties** → tab **Settings** → **RADIUS Attributes** → **Standard**:

1. Click **Add** → chọn attribute **Tunnel-Medium-Type**:
   - Value: **802 (Includes all 802 media plus Ethernet canonical format)**.
2. Click **Add** → chọn attribute **Tunnel-Pvt-Group-ID**:
   - Value: nhập số VLAN tương ứng, VD `30`.
3. Click **Add** → chọn attribute **Tunnel-Type**:
   - Value: **Virtual LANs (VLAN)**.
4. (Tuỳ thiết bị yêu cầu) Nếu switch/AP yêu cầu thêm **Tunnel-Tag**, thêm theo tài liệu thiết bị — nếu không thấy đề cập trong tài liệu CBS350/UniFi, **không thêm** attribute này (thêm sai có thể khiến switch không nhận VLAN).

📌 Ba attribute (Tunnel-Medium-Type, Tunnel-Pvt-Group-ID, Tunnel-Type) là **bộ 3 chuẩn RFC** để RADIUS server chỉ định VLAN — hầu hết thiết bị hỗ trợ 802.1X (bao gồm CBS350) đều đọc đúng theo chuẩn này.

## 5. Lặp lại cho từng Network Policy tương ứng từng VLAN
- `802.1X-Wired-SanXuat` → Tunnel-Pvt-Group-ID = `30`.
- `802.1X-Wireless-Staff` → Tunnel-Pvt-Group-ID = `40`.
- Policy riêng cho IT Admin (nếu tách riêng) → Tunnel-Pvt-Group-ID = `99`.

## 6. Cấu hình phía CBS350 để nhận VLAN động từ RADIUS
📌 Xem chi tiết cấu hình phía switch tại [[../03_Cisco_CBS350/05_8021X_RADIUS]] — CBS350 cần bật chế độ chấp nhận VLAN assignment từ RADIUS (`dot1x radius-attributes vlan`) tương ứng port đã bật 802.1X.

## 7. Cấu hình phía UniFi để nhận VLAN động từ RADIUS
📌 Xem chi tiết tại [[../05_UniFi_Controller/04_VLAN_Mapping_SSID]] — UniFi hỗ trợ tính năng "RADIUS-assigned VLAN" khi bật tuỳ chọn tương ứng trong cấu hình Wireless Network.

## 8. Kiểm tra hoạt động gán VLAN động
- [ ] ✅ Kết nối máy trạm test (thành viên `GG-Mang-Day-SanXuat`) vào port đã bật 802.1X trên switch xưởng → xác nhận máy nhận IP thuộc dải VLAN 30 (`10.10.30.x`).
- [ ] ✅ Kết nối 1 tài khoản khác (thành viên `GG-Wifi-VanPhong`) qua Wi-Fi → xác nhận nhận IP thuộc dải VLAN 40 (`10.10.40.x`).
- [ ] ✅ Test tài khoản không thuộc group nào được cấu hình → xác nhận bị từ chối hoặc rơi vào VLAN mặc định an toàn (không phải VLAN nhạy cảm như Server/Production).

## 9. Rủi ro cần lưu ý
⚠️ Nếu cấu hình sai Tunnel-Pvt-Group-ID (VD: gõ nhầm số VLAN), user có thể vô tình được gán vào **VLAN Server (10)** hoặc VLAN nhạy cảm khác — luôn **test trên 1 port/AP thử nghiệm** trước khi áp dụng đại trà toàn bộ switch/AP sản xuất.

➡️ Tiếp theo: [[07_Troubleshooting_NPS]]
