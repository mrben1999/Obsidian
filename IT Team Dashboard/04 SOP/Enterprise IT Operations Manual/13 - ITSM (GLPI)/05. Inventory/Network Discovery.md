---
tags: [glpi, inventory, network-discovery]
---

# Network Discovery — Tổng hợp quy trình quét mạng

Liên quan: [[SNMP Discovery]] · [[Bandwidth & Scan Range]]

> **GLPI 11:** Toàn bộ tính năng Discovery nằm trong plugin **GLPI Inventory** (Marketplace), không phải core GLPI.

## Checklist
- [ ] Xác định toàn bộ dải IP cần quét theo từng chi nhánh
- [ ] Chọn agent làm local relay đúng subnet
- [ ] Lên lịch quét định kỳ (không phải chỉ 1 lần)

## Command
`GLPI Inventory plugin (Marketplace) > Agents > Tasks > Discovery > Add`
| Trường | Giá trị (ví dụ HN) |
|---|---|
| Dải IP | `10.10.10.0/24` |
| Agent thực thi | agent đặt tại server HN |
| Lịch chạy | Hàng tuần, 23:00 Chủ nhật |

## Verify
Kiểm tra kết quả Discovery > số thiết bị tìm được, đối chiếu với ước tính thực tế (switch + printer + camera + AP...).

## Troubleshooting
| Lỗi | Nguyên nhân | Cách xử lý |
|---|---|---|
| Quét không đủ thiết bị | Local agent khác subnet | Đặt agent đúng VLAN quét |
| Quét làm chậm mạng giờ hành chính | Lịch chạy sai giờ | Chuyển lịch sang ngoài giờ hành chính |

**Tiếp theo:** [[Bandwidth & Scan Range]]
