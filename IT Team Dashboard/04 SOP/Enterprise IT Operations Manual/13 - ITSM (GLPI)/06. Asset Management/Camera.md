---
tags: [glpi, asset, camera]
---

# Camera — Quản lý hệ thống camera giám sát

Liên quan: [[NAS]] · [[Access Point]]

## Checklist
- [ ] Nhập danh sách camera theo khu vực lắp đặt
- [ ] Liên kết với đầu ghi (NVR) tương ứng
- [ ] Ghi nhận thời hạn bảo hành thiết bị

## Command / Cấu hình GLPI
`Assets > Network Equipment > Add > Type = Camera` (hoặc tạo Loại tùy chỉnh "Camera giám sát" trong dropdown nếu cần phân biệt rõ với thiết bị mạng thông thường).
Vị trí ghi chi tiết: `Quảng Việt > Chi nhánh HCM > Kho vận > Cổng ra vào`.

## Verify
Đối chiếu số lượng camera trong GLPI với sơ đồ lắp đặt thực tế do đội an ninh/bảo vệ quản lý.

## Troubleshooting
| Lỗi | Nguyên nhân | Cách xử lý |
|---|---|---|
| Camera không có trong Discovery | Hệ thống camera dùng giao thức riêng (ONVIF) không phải SNMP chuẩn | Nhập thủ công, không cố quét tự động |

**Tiếp theo:** [[NAS]]
