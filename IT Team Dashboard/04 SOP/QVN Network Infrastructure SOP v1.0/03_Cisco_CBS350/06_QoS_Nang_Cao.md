# ⚡ Phần 3.6 — QoS & cấu hình nâng cao

## 1. Vì sao cần QoS trong hạ tầng nhà máy
📌 Khi mạng dùng chung cho: dữ liệu Dashboard/MES (cần độ trễ thấp, cập nhật liên tục), lưu lượng văn phòng (email, duyệt web), và Wi-Fi nhân viên — QoS giúp ưu tiên lưu lượng quan trọng (VD: traffic tới server MES/Dashboard) không bị nghẽn bởi traffic ít quan trọng hơn.

## 2. Bật QoS toàn cục
```
SW-CORE-01(config)# qos
```
📌 CBS350 hỗ trợ 2 chế độ QoS: **Basic** (gán độ ưu tiên theo port/CoS/DSCP đơn giản) và **Advanced** (policy-based, phức tạp hơn) — với quy mô nhà máy vừa, khuyến nghị dùng **Basic QoS** đủ đáp ứng nhu cầu và dễ bảo trì.

## 3. Ưu tiên traffic theo port (Basic QoS)
```
SW-SERVER-01(config)# interface gi1/0/2
SW-SERVER-01(config-if)# qos trust cos
SW-SERVER-01(config-if)# exit
```
📌 Port kết nối tới server Dashboard/MES nên đặt mức ưu tiên cao hơn port thông thường.

## 4. Rate Limiting (giới hạn băng thông) — hữu ích cho VLAN Guest
```
SW-CORE-01(config)# interface vlan 50
SW-CORE-01(config-if)# rate-limit input 10000
SW-CORE-01(config-if)# exit
```
📌 Giới hạn băng thông VLAN Guest (VD: 10 Mbps) để tránh khách/đối tác chiếm băng thông ảnh hưởng hệ thống sản xuất.

## 5. Cấu hình SNMP (giám sát tập trung, nếu có hệ thống Monitoring)
```
SW-CORE-01(config)# snmp-server community "QVN-ReadOnly-2026" ro
SW-CORE-01(config)# snmp-server location "Nha may - Phong may chu"
SW-CORE-01(config)# snmp-server contact "IT Manager - qvn.local"
```
🔒 Khuyến nghị dùng **SNMPv3** (có xác thực + mã hoá) thay vì SNMPv2 community string dạng plaintext nếu switch/hệ thống giám sát hỗ trợ:
```
SW-CORE-01(config)# snmp-server group QVN-MonitorGroup v3 priv
SW-CORE-01(config)# snmp-server user qvn-monitor QVN-MonitorGroup v3 auth sha AuthPass123! priv aes 128 PrivPass123!
```

## 6. Port Mirroring (SPAN) — hỗ trợ điều tra sự cố/phân tích traffic
📌 Hữu ích khi cần bắt gói tin (packet capture) để chẩn đoán sự cố mạng phức tạp mà log thông thường không đủ thông tin.
```
SW-CORE-01(config)# monitor session 1 source interface gi1/0/5
SW-CORE-01(config)# monitor session 1 destination interface gi1/0/24
```
Sau đó dùng Wireshark trên máy cắm vào port `gi1/0/24` để bắt gói tin từ port `gi1/0/5`.

## 7. Loopback Detection (bổ sung cho STP)
```
SW-ACC-XUONG-01(config)# interface gi1/0/5
SW-ACC-XUONG-01(config-if)# loopback-detection enable
SW-ACC-XUONG-01(config-if)# exit
```
📌 Phát hiện loop cục bộ nhanh hơn hội tụ STP trong một số trường hợp — bổ sung thêm lớp bảo vệ, không thay thế STP.

## 8. Kiểm tra
```
SW-CORE-01# show qos interface gi1/0/2
SW-CORE-01# show snmp
SW-CORE-01# show monitor session 1
```
- [ ] ✅ QoS đã áp dụng đúng port ưu tiên (server Dashboard/MES).
- [ ] ✅ Rate limit VLAN Guest hoạt động đúng (test tải thử).
- [ ] ✅ SNMP (nếu dùng) đã đổi community string mặc định, ưu tiên SNMPv3.

➡️ Tiếp theo: [[07_Backup_Firmware]]
