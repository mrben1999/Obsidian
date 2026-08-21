---
tags: [glpi, reports, warranty]
---

# Warranty — Báo cáo bảo hành thiết bị

Liên quan: [[Assets Reports]] · [[04 SOP/Enterprise IT Operations Manual/13 - ITSM (GLPI)/06. Asset Management/Firewall]]

## Checklist
- [ ] Báo cáo thiết bị sắp hết bảo hành (30-60-90 ngày)
- [ ] Ưu tiên báo cáo cho thiết bị hạ tầng quan trọng (server, firewall, switch core)
- [ ] Lên kế hoạch gia hạn/thay thế trước khi hết bảo hành

## Command
```sql
SELECT name, warranty_date, warranty_duration,
  DATE_ADD(warranty_date, INTERVAL warranty_duration MONTH) AS het_han
FROM glpi_computers
WHERE warranty_date IS NOT NULL
HAVING het_han < NOW() + INTERVAL 60 DAY
ORDER BY het_han ASC;
```

## Verify
Đối chiếu danh sách với hợp đồng bảo hành gốc, gửi cho IT Manager để lên kế hoạch ngân sách gia hạn/thay thế.

## Troubleshooting
| Lỗi | Nguyên nhân | Cách xử lý |
|---|---|---|
| Nhiều thiết bị thiếu ngày bảo hành | Không nhập đầy đủ lúc tạo asset | Bổ sung bắt buộc trường này trong [[Asset]] |

**Tiếp theo:** [[Tickets Reports]]
