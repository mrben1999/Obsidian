---
tags: [glpi, asset, ups]
---

# UPS — Quản lý bộ lưu điện

Liên quan: [[Disk]] · [[Disaster Recovery]]

## Checklist
- [ ] Nhập UPS phòng server + UPS tại các tủ mạng tầng
- [ ] Theo dõi tình trạng pin (battery health) định kỳ
- [ ] Liên kết UPS với các thiết bị được bảo vệ (server, switch core)

## Command / Cấu hình GLPI
`Assets > Network Equipment > Add > Type = UPS (or Peripherals)` (hoặc dùng module Peripherals tùy version GLPI).
Ghi công suất (VA), tải hiện tại, ngày thay pin gần nhất trong ghi chú.

## Verify
Kiểm tra thực tế thời gian pin dự phòng còn lại (qua phần mềm quản lý UPS như APC PowerChute), đối chiếu với ghi chú "ngày thay pin" — pin quá 3 năm cần lên kế hoạch thay.

## Troubleshooting
| Lỗi | Nguyên nhân | Cách xử lý |
|---|---|---|
| UPS báo lỗi pin nhưng không ai để ý | Không có giám sát/cảnh báo | Tích hợp cảnh báo SNMP trap từ UPS vào [[Logs]] nếu UPS hỗ trợ |

---
**Hoàn tất chương Asset Management.** Tiếp theo: [[Categories]]
