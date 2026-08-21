---
tags: [glpi, asset, access-point]
---

# Access Point — Quản lý thiết bị phát WiFi

Liên quan: [[SNMP Discovery]] · [[Camera]]

## Checklist
- [ ] Quét qua SNMP nếu AP hỗ trợ (Ubiquiti, Aruba...)
- [ ] Gán vị trí lắp đặt chính xác (theo tầng/khu vực)
- [ ] Ghi nhận SSID quản lý bởi từng AP nếu công ty có nhiều SSID

## Command / Cấu hình GLPI
`Assets > Network Equipment > Add > Type = Access Point`
Nếu dùng hệ controller tập trung (Ubiquiti UniFi/Aruba Central), có thể export danh sách AP rồi import hàng loạt qua Data Injection plugin.

## Verify
Đối chiếu số lượng AP trong GLPI với controller quản lý WiFi thực tế, kiểm tra vị trí lắp đặt đúng.

## Troubleshooting
| Lỗi | Nguyên nhân | Cách xử lý |
|---|---|---|
| AP không hỗ trợ SNMP | Model giá rẻ, giới hạn tính năng | Nhập tay hoặc export từ controller quản lý |

**Tiếp theo:** [[Camera]]
