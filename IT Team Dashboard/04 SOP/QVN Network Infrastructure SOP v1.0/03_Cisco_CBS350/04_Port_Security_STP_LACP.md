# 🔐 Phần 3.4 — Port Security, STP, LACP

## 1. Port Security (giới hạn MAC address trên port)
📌 Ngăn người dùng cắm thêm switch/hub trái phép hoặc đổi thiết bị lạ vào port khu vực xưởng.

```
SW-ACC-XUONG-01(config)# interface gi1/0/5
SW-ACC-XUONG-01(config-if)# port security
SW-ACC-XUONG-01(config-if)# port security max 2
SW-ACC-XUONG-01(config-if)# port security mode max-addresses
SW-ACC-XUONG-01(config-if)# port security discard trap 30
SW-ACC-XUONG-01(config-if)# exit
```
| Tham số | Ý nghĩa |
|---|---|
| `max 2` | Tối đa 2 địa chỉ MAC học được trên port (VD: 1 kiosk + 1 thiết bị phụ) |
| `discard trap 30` | Gửi SNMP trap khi có vi phạm, giới hạn tần suất trap mỗi 30 giây |

⚠️ Không đặt `port security` trên port Trunk kết nối switch-to-switch hoặc port kết nối AP (sẽ học nhiều MAC hợp lệ từ nhiều thiết bị phía sau) — chỉ áp dụng cho port Access đầu cuối.

## 2. Spanning Tree Protocol (STP) — chống loop mạng
📌 Mặc định CBS350 bật STP (thường ở chế độ RSTP) — xác nhận lại và cấu hình đúng Root Bridge dự kiến (nên là switch Core) để tránh STP tự chọn switch không mong muốn làm Root, gây định tuyến traffic không tối ưu.

```
SW-CORE-01(config)# spanning-tree mode rstp
SW-CORE-01(config)# spanning-tree priority 4096
```
📌 Priority càng thấp, càng ưu tiên làm Root Bridge — đặt switch Core (`SW-CORE-01`) có priority thấp nhất trong toàn hệ thống.

Trên các switch Access (không nên làm Root):
```
SW-ACC-XUONG-01(config)# spanning-tree priority 32768
```
(giữ giá trị mặc định hoặc cao hơn switch Core)

### Bật BPDU Guard trên port Access (bảo vệ khỏi switch lạ cắm vào)
```
SW-ACC-XUONG-01(config)# interface gi1/0/5
SW-ACC-XUONG-01(config-if)# spanning-tree bpduguard enable
SW-ACC-XUONG-01(config-if)# exit
```
🔒 Nếu ai đó cắm nhầm 1 switch/router khác vào port máy trạm (port Access), BPDU Guard sẽ tự động shutdown port đó — ngăn loop mạng lan rộng ra toàn hệ thống.

## 3. LACP (Link Aggregation) — gộp nhiều link vật lý thành 1 logic
📌 Dùng cho uplink giữa switch Core và switch Access (nếu có 2 dây trở lên) để tăng băng thông và dự phòng.

```
SW-CORE-01(config)# interface range gi1/0/1-2
SW-CORE-01(config-if-range)# channel-group 1 mode active
SW-CORE-01(config-if-range)# exit
SW-CORE-01(config)# interface port-channel 1
SW-CORE-01(config-if)# switchport mode trunk
SW-CORE-01(config-if)# switchport trunk allowed vlan add 10,20,30,40,50,99
SW-CORE-01(config-if)# description "LACP Uplink to SW-ACC-XUONG-01"
SW-CORE-01(config-if)# exit
```
`channel-group 1 mode active` = dùng LACP (chuẩn 802.3ad), chế độ **active** nghĩa là switch chủ động khởi tạo đàm phán LACP (khuyến nghị dùng active ở cả 2 đầu để đảm bảo tương thích).

Cấu hình tương ứng phía switch Access:
```
SW-ACC-XUONG-01(config)# interface range gi1/0/23-24
SW-ACC-XUONG-01(config-if-range)# channel-group 1 mode active
SW-ACC-XUONG-01(config-if-range)# exit
SW-ACC-XUONG-01(config)# interface port-channel 1
SW-ACC-XUONG-01(config-if)# switchport mode trunk
SW-ACC-XUONG-01(config-if)# switchport trunk allowed vlan add 10,20,30,40,50,99
SW-ACC-XUONG-01(config-if)# exit
```

## 4. Storm Control (chống broadcast storm)
📌 Bảo vệ mạng khỏi lưu lượng broadcast/multicast bất thường (thường do lỗi thiết bị hoặc loop chưa được STP chặn kịp).
```
SW-ACC-XUONG-01(config)# interface gi1/0/5
SW-ACC-XUONG-01(config-if)# storm-control broadcast enable
SW-ACC-XUONG-01(config-if)# storm-control broadcast level 10
SW-ACC-XUONG-01(config-if)# exit
```

## 5. Kiểm tra
```
SW-ACC-XUONG-01# show port security
SW-ACC-XUONG-01# show spanning-tree
SW-CORE-01# show interfaces port-channel 1
SW-ACC-XUONG-01# show storm-control
```
- [ ] ✅ Port Security đã bật đúng trên toàn bộ port Access khu vực nhạy cảm (xưởng).
- [ ] ✅ `show spanning-tree` xác nhận `SW-CORE-01` là Root Bridge.
- [ ] ✅ BPDU Guard đã bật trên port Access.
- [ ] ✅ LACP Port-Channel ở trạng thái `Up` (nếu dùng).
- [ ] ✅ Lưu cấu hình.

➡️ Tiếp theo: [[05_8021X_RADIUS]]
