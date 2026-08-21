# 🧩 Phần 3.3 — Cấu hình VLAN

## 1. Danh sách VLAN cần tạo (theo [[../00_Tong_Quan/02_Bang_Dia_Chi_IP_VLAN]])

| VLAN ID | Tên | Mục đích |
|---|---|---|
| 10 | SERVER | Server AD/DNS/NPS, UniFi Controller |
| 20 | OFFICE | Máy trạm văn phòng |
| 30 | PRODUCTION | Kiosk/máy trạm khu xưởng |
| 40 | WIFI-STAFF | Wi-Fi nhân viên |
| 50 | GUEST | Wi-Fi khách |
| 99 | MGMT | Quản trị thiết bị mạng |

## 2. Tạo VLAN
```
SW-CORE-01# configure terminal
SW-CORE-01(config)# vlan 10
SW-CORE-01(config-vlan)# name SERVER
SW-CORE-01(config-vlan)# exit
SW-CORE-01(config)# vlan 20
SW-CORE-01(config-vlan)# name OFFICE
SW-CORE-01(config-vlan)# exit
SW-CORE-01(config)# vlan 30
SW-CORE-01(config-vlan)# name PRODUCTION
SW-CORE-01(config-vlan)# exit
SW-CORE-01(config)# vlan 40
SW-CORE-01(config-vlan)# name WIFI-STAFF
SW-CORE-01(config-vlan)# exit
SW-CORE-01(config)# vlan 50
SW-CORE-01(config-vlan)# name GUEST
SW-CORE-01(config-vlan)# exit
SW-CORE-01(config)# vlan 99
SW-CORE-01(config-vlan)# name MGMT
SW-CORE-01(config-vlan)# exit
```

## 3. Cấu hình port Trunk (giữa các switch, và switch–FortiGate)
📌 Trunk port cho phép nhiều VLAN đi qua 1 đường dây vật lý — dùng cho kết nối switch-to-switch và switch-to-firewall.

```
SW-CORE-01(config)# interface gi1/0/1
SW-CORE-01(config-if)# switchport mode trunk
SW-CORE-01(config-if)# switchport trunk allowed vlan add 10,20,30,40,50,99
SW-CORE-01(config-if)# description "Uplink to FortiGate 200F"
SW-CORE-01(config-if)# exit
```

⚠️ Khuyến nghị **không** đưa VLAN Guest (50) qua trunk kết nối tới switch khu Server — giới hạn `switchport trunk allowed vlan` chỉ đúng các VLAN cần thiết trên từng trunk, giảm rủi ro VLAN hopping.

## 4. Cấu hình port Access (cho máy trạm/kiosk cắm trực tiếp)
```
SW-ACC-XUONG-01(config)# interface gi1/0/5
SW-ACC-XUONG-01(config-if)# switchport mode access
SW-ACC-XUONG-01(config-if)# switchport access vlan 30
SW-ACC-XUONG-01(config-if)# description "Kiosk MES - Chuyen L01"
SW-ACC-XUONG-01(config-if)# exit
```

📌 Nếu port này sẽ dùng 802.1X (khuyến nghị cho khu vực xưởng), VLAN access ở đây đóng vai trò VLAN mặc định/dự phòng — VLAN thực tế gán có thể được RADIUS ghi đè động, xem [[05_8021X_RADIUS]].

## 5. Cấu hình VLAN Interface (SVI) cho VLAN cần định tuyến nội bộ
📌 CBS350 hỗ trợ Layer 3 lite — có thể gán IP cho VLAN Interface để switch tự định tuyến giữa các VLAN nội bộ (routing cơ bản), tuy nhiên trong kiến trúc này, **FortiGate 200F đóng vai trò gateway chính và routing/firewall giữa các VLAN** — CBS350 chỉ cần VLAN Interface cho **VLAN 99 (quản trị)**, các VLAN khác định tuyến qua FortiGate.

```
SW-CORE-01(config)# interface vlan 99
SW-CORE-01(config-if)# ip address 10.10.99.2 255.255.255.0
SW-CORE-01(config-if)# exit
```

## 6. Cấu hình VLAN cho port kết nối UniFi AP
📌 UniFi AP nhận nhiều SSID ánh xạ nhiều VLAN khác nhau qua 1 dây — port kết nối AP phải là **Trunk**, với **Native VLAN** là VLAN quản lý AP (thường là VLAN 10 hoặc VLAN riêng cho thiết bị mạng).

```
SW-ACC-XUONG-01(config)# interface gi1/0/20
SW-ACC-XUONG-01(config-if)# switchport mode trunk
SW-ACC-XUONG-01(config-if)# switchport trunk native vlan 10
SW-ACC-XUONG-01(config-if)# switchport trunk allowed vlan add 10,30,40,50
SW-ACC-XUONG-01(config-if)# description "UniFi AP - Khu xuong"
SW-ACC-XUONG-01(config-if)# exit
```

## 7. Kiểm tra cấu hình VLAN
```
SW-CORE-01# show vlan
SW-CORE-01# show interfaces switchport gi1/0/1
SW-CORE-01# show interfaces trunk
```
- [ ] ✅ Toàn bộ VLAN 10/20/30/40/50/99 xuất hiện đúng trong `show vlan`.
- [ ] ✅ Trunk port hiển thị đúng danh sách VLAN allowed.
- [ ] ✅ Access port hiển thị đúng VLAN gán cho từng khu vực.
- [ ] ✅ Lưu cấu hình: `copy running-config startup-config`.

➡️ Tiếp theo: [[04_Port_Security_STP_LACP]]
