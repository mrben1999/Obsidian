# 🧮 Bảng địa chỉ IP & VLAN chuẩn

> Đây là **nguồn sự thật duy nhất (Single Source of Truth)** cho toàn bộ địa chỉ IP/VLAN dùng trong tài liệu. Mọi phần (AD, NPS, CBS350, FortiGate, UniFi) đều tham chiếu bảng này. Khi triển khai thực tế, cập nhật đúng giá trị thật của nhà máy và giữ nguyên cấu trúc bảng để các SOP khác vẫn đối chiếu đúng.

## 1. Bảng VLAN chuẩn

| VLAN ID | Tên VLAN   | Dải mạng (subnet) | Gateway    | Mục đích                                                |
| ------- | ---------- | ----------------- | ---------- | ------------------------------------------------------- |
| 10      | SERVER     | 10.10.10.0/24     | 10.10.10.1 | AD/DNS/NPS, UniFi Controller, các server nội bộ         |
| 20      | OFFICE     | 10.10.20.0/24     | 10.10.20.1 | Máy trạm văn phòng (kế toán, nhân sự, kinh doanh)       |
| 30      | PRODUCTION | 10.10.30.0/24     | 10.10.30.1 | Kiosk Dashboard/MES, máy tính khu vực xưởng             |
| 40      | WIFI-STAFF | 10.10.40.0/24     | 10.10.40.1 | Wi-Fi nhân viên (WPA2/3-Enterprise qua RADIUS)          |
| 50      | GUEST      | 10.10.50.0/24     | 10.10.50.1 | Wi-Fi khách/đối tác (cô lập hoàn toàn)                  |
| 99      | MGMT       | 10.10.99.0/24     | 10.10.99.1 | Quản trị thiết bị mạng (SSH/HTTPS Switch, Firewall, AP) |

## 2. Bảng IP tĩnh thiết bị hạ tầng chính

| Thiết bị | Vai trò | VLAN | Địa chỉ IP | Ghi chú |
|---|---|---|---|---|
| Windows Server 2012 R2 (DC01) | AD DS, DNS, NPS | 10 (Server) | 10.10.10.10 | Domain Controller chính |
| FortiGate 200F | Firewall/Gateway | Multi (trunk) | 10.10.10.1 (internal), WAN theo ISP | Gateway mặc định toàn mạng |
| Cisco CBS350 — Core | Core/Distribution Switch | Trunk toàn bộ VLAN | 10.10.99.2 | Quản trị qua VLAN 99 |
| Cisco CBS350 — Server Switch | Access Switch khu Server | 10 | 10.10.99.3 | |
| Cisco CBS350 — Access Switch Xưởng | Access Switch khu Sản xuất | 30 (access), trunk uplink | 10.10.99.4 | |
| UniFi Controller (VM/máy chủ) | Quản lý AP | 10 | 10.10.10.20 | |
| UniFi AP — Văn phòng | Access Point | Trunk (SSID map VLAN 20/40) | DHCP (10.10.10.x) | |
| UniFi AP — Xưởng may | Access Point | Trunk (SSID map VLAN 30/40) | DHCP (10.10.10.x) | |
| UniFi AP — Kho | Access Point | Trunk (SSID map VLAN 40/50) | DHCP (10.10.10.x) | |

## 3. Dải DHCP (nếu dùng DHCP cho client)

| VLAN            | Dải cấp phát DHCP          | DNS Server                      | Thời hạn lease |
| --------------- | -------------------------- | ------------------------------- | -------------- |
| 20 (Office)     | 10.10.20.50 – 10.10.20.200 | 10.10.10.10                     | 8 giờ          |
| 30 (Production) | 10.10.30.50 – 10.10.30.200 | 10.10.10.10                     | 8 giờ          |
| 40 (Wifi-Staff) | 10.10.40.50 – 10.10.40.220 | 10.10.10.10                     | 4 giờ          |
| 50 (Guest)      | 10.10.50.50 – 10.10.50.250 | 8.8.8.8 (không dùng DNS nội bộ) | 2 giờ          |

## 4. Bảng tài khoản dịch vụ (Service Account) tham chiếu

| Tài khoản | Dùng cho | Ghi chú bảo mật |
|---|---|---|
| `svc-nps-radius` | NPS truy vấn AD | Không dùng làm tài khoản đăng nhập thường, chỉ phục vụ dịch vụ |
| `svc-fortigate-ldap` | FortiGate bind LDAP tới AD | Quyền Read-only trên OU cần thiết |
| `svc-backup` | Chạy script backup định kỳ (AD, config thiết bị) | Giới hạn quyền, không phải Domain Admin |

> ⚠️ Không dùng tài khoản `Administrator`/`Domain Admin` cho các dịch vụ tích hợp (NPS, FortiGate LDAP...) — vi phạm nguyên tắc *Least Privilege*, xem chi tiết tại [[../06_Van_Hanh_Chuan/02_Hardening_Baseline_Tong_The]].

## 5. Quy tắc đặt tên thiết bị (Hostname Convention)

```
<Loại thiết bị>-<Vị trí/Vai trò>-<Số thứ tự>
```

| Ví dụ             | Ý nghĩa                      |
| ----------------- | ---------------------------- |
| `DC01`            | Domain Controller số 1       |
| `SW-CORE-01`      | Switch Core số 1             |
| `SW-ACC-XUONG-01` | Switch Access khu Xưởng số 1 |
| `FGT-200F-01`     | FortiGate 200F số 1          |
| `AP-VANPHONG-01`  | UniFi AP khu Văn phòng số 1  |
