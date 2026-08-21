# 📡 Phần 5.3 — Tạo Wireless Network xác thực RADIUS

## 1. Điều kiện tiên quyết
- [ ] NPS đã khai báo RADIUS Client cho UniFi ([[../02_NPS_RADIUS/03_Cau_Hinh_RADIUS_Clients]]).
- [ ] Network Policy PEAP đã sẵn sàng cho Wireless ([[../02_NPS_RADIUS/04_Cau_Hinh_Network_Policy_PEAP]]).
- [ ] AP đã Adopt thành công ([[02_Cai_Dat_Controller_Adopt_AP]]).

## 2. Khai báo RADIUS Server trong UniFi Controller (Profile dùng chung)

1. Vào **Settings** → **Profiles** → **RADIUS** → **Create New RADIUS Profile**.
2. Đặt tên: `RADIUS-NPS-QVN`.
3. **Authentication Servers:**
   - IP Address: `10.10.10.10`
   - Port: `1812`
   - Password (Shared Secret): nhập đúng secret đã khai báo cho RADIUS Client `UNIFI-CTRL-01` trên NPS.
4. **Accounting Servers** (tuỳ chọn, nếu muốn ghi log chi tiết phiên kết nối):
   - IP Address: `10.10.10.10`
   - Port: `1813`
   - Password: cùng shared secret.
5. **Save**.

## 3. Tạo SSID xác thực RADIUS (`QVN-Staff`)

1. Vào **Settings** → **WiFi** → **Create New WiFi Network**.
2. **Name/SSID:** `QVN-Staff`.
3. **Security Protocol:** chọn **WPA2/WPA3 Enterprise** (hoặc **WPA2 Enterprise** nếu thiết bị cũ trong nhà máy chưa hỗ trợ WPA3).
4. **RADIUS Profile:** chọn `RADIUS-NPS-QVN` đã tạo ở bước trên.
5. **Network/VLAN:** chọn VLAN tương ứng (mặc định — sẽ được ghi đè động nếu bật RADIUS-assigned VLAN, xem [[04_VLAN_Mapping_SSID]]).
6. **Advanced Options** (khuyến nghị bật):
   - **Band Steering:** Enable (ưu tiên thiết bị dùng băng tần 5GHz nếu hỗ trợ, giảm nghẽn 2.4GHz).
   - **Fast Roaming (802.11r):** Enable nếu nhà máy có nhiều AP để nhân viên di chuyển giữa các khu vực không bị gián đoạn kết nối.
   - **PMF (Protected Management Frames):** Optional hoặc Required tuỳ độ tương thích thiết bị — khuyến nghị **Optional** ban đầu để tránh thiết bị cũ không kết nối được, nâng lên **Required** sau khi xác nhận tương thích.
7. **Save**.

## 4. Kiểm tra kết nối thử
- [ ] ✅ Kết nối thử 1 laptop/điện thoại vào SSID `QVN-Staff`, nhập tài khoản AD (VD: `an.nguyen`).
- [ ] ✅ Xác nhận xuất hiện cảnh báo certificate lần đầu (nếu thiết bị chưa trust Root CA nội bộ) — đây là hành vi đúng, xem [[../02_NPS_RADIUS/05_Trien_Khai_Certificate]] mục 5 để cài Root CA cho thiết bị không join domain.
- [ ] ✅ Sau khi kết nối thành công, kiểm tra **Insights → Wireless Clients** trên UniFi Controller — thiết bị hiển thị đúng username đã xác thực (không chỉ hiển thị MAC).
- [ ] ✅ Kiểm tra Event Viewer trên NPS ([[../02_NPS_RADIUS/07_Troubleshooting_NPS]]) — log Access-Accept xuất hiện tương ứng.

## 5. Cấu hình lịch tự động tắt SSID ngoài giờ (tuỳ chọn, tăng bảo mật)
📌 Nếu nhà máy chỉ hoạt động giờ hành chính, cân nhắc lên lịch tắt SSID nhân viên ngoài giờ để giảm bề mặt tấn công không cần thiết:
**Settings → WiFi → [chọn SSID] → Schedule** → thiết lập khung giờ hoạt động.

➡️ Tiếp theo: [[04_VLAN_Mapping_SSID]]
