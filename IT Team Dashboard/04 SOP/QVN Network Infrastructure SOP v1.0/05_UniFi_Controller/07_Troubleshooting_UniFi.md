# 🧯 Phần 5.7 — Troubleshooting UniFi

## 1. Bảng sự cố thường gặp

| Triệu chứng | Nguyên nhân khả dĩ | Cách xử lý |
|---|---|---|
| AP hiển thị "Disconnected" trong Controller | Mất kết nối mạng tới AP, PoE lỗi, cấu hình VLAN trunk sai trên switch | Kiểm tra đèn LED AP, kiểm tra port switch (`show interfaces status` trên CBS350), kiểm tra Native VLAN trunk |
| Client không kết nối được SSID `QVN-Staff` | RADIUS reject, certificate không tin cậy | Đối chiếu [[../02_NPS_RADIUS/07_Troubleshooting_NPS]], kiểm tra Root CA trust trên client |
| Client kết nối được nhưng vào sai VLAN | RADIUS-assigned VLAN chưa bật, hoặc Tunnel-Pvt-Group-ID sai trên NPS | Kiểm tra lại [[04_VLAN_Mapping_SSID]] và [[../02_NPS_RADIUS/06_Tich_Hop_AD_Groups_VLAN]] |
| Wi-Fi chập chờn, tốc độ chậm | Nhiễu kênh (channel interference), quá nhiều client trên 1 AP | Kiểm tra **Insights → RF Environment**, cân nhắc đổi kênh/băng tần, thêm AP nếu mật độ client cao |
| Guest vẫn truy cập được mạng nội bộ | Client Isolation chưa bật đúng, hoặc Firewall Policy FortiGate thiếu rule Deny | Kiểm tra lại [[05_Guest_Network_Portal]] mục 5 và [[../04_FortiGate_200F/06_Firewall_Policy_Chuan]] mục 4 |
| Controller không adopt được AP mới | Sai địa chỉ inform, Layer 3 giữa AP và Controller bị chặn | Kiểm tra `set-inform`, kiểm tra Firewall Policy cho phép traffic quản lý AP↔Controller |

## 2. Công cụ chẩn đoán trong Controller
- **Insights → RF Environment** — xem chất lượng tín hiệu, nhiễu kênh theo từng AP.
- **Insights → Wireless Clients** — xem chi tiết từng client: SSID, VLAN, tín hiệu, thời gian kết nối.
- **Devices → [chọn AP] → Statistics** — xem log kết nối/ngắt kết nối của AP theo thời gian.

## 3. SSH trực tiếp vào AP để chẩn đoán sâu (khi Controller không truy cập được AP)
```
ssh ubnt@<IP AP>
info
```
Lệnh `info` hiển thị trạng thái kết nối AP tới Controller (inform URL, uptime, trạng thái adoption).

## 4. Restart AP từ xa qua Controller
**Devices** → chọn AP → **Actions** → **Restart Device** — thực hiện khi AP treo/không phản hồi nhưng vẫn còn kết nối mạng tới Controller.

## 5. Quy trình xử lý "Khu vực Wi-Fi mất sóng hoàn toàn"
1. Kiểm tra đèn LED AP tại vị trí thực tế — có sáng/nhấp nháy bình thường không.
2. Kiểm tra nguồn PoE — đèn port switch cấp PoE có sáng không (`show interfaces status` trên CBS350).
3. Kiểm tra trạng thái AP trong Controller — Disconnected hay vẫn Connected nhưng SSID không phát.
4. Nếu switch/PoE bình thường nhưng AP không lên: thử **Restart Device** qua Controller.
5. Nếu vẫn không được: kiểm tra cáp mạng vật lý, thử đổi port switch khác để loại trừ lỗi port.
6. Ghi nhận vào [[../07_Phu_Luc/01_Bieu_Mau]] nếu cần thay thế phần cứng.

➡️ Tiếp theo: [[08_Checklist_Van_Hanh_UniFi]]
