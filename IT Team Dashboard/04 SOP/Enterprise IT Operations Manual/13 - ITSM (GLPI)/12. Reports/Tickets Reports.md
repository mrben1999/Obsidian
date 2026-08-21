---
tags: [glpi, reports, tickets]
---

# Tickets Reports — Báo cáo hoạt động Ticket

Liên quan: [[SLA]] · [[04 SOP/Enterprise IT Operations Manual/13 - ITSM (GLPI)/12. Reports/KPI]]

## Checklist
- [ ] Báo cáo số ticket theo trạng thái/tháng
- [ ] Báo cáo ticket theo Category (phát hiện vấn đề lặp lại)
- [ ] Báo cáo thời gian xử lý trung bình

## Command
```sql
SELECT c.name AS danh_muc, COUNT(*) AS so_luong
FROM glpi_tickets t
JOIN glpi_itilcategories c ON t.itilcategories_id = c.id
WHERE t.date BETWEEN '2026-07-01' AND '2026-07-31'
GROUP BY c.name ORDER BY so_luong DESC;
```

## Verify
Đối chiếu Top danh mục ticket nhiều nhất — nếu 1 danh mục chiếm tỷ trọng quá lớn, đây là tín hiệu cần xử lý gốc rễ (ví dụ đổi thiết bị hay lỗi hệ thống lặp lại), không chỉ xử lý từng ticket riêng lẻ.

## Troubleshooting
| Lỗi | Nguyên nhân | Cách xử lý |
|---|---|---|
| Số liệu không khớp giữa các tháng | Category bị đổi cấu trúc giữa chừng | Hạn chế đổi cấu trúc dropdown sau khi có dữ liệu lịch sử |

**Tiếp theo:** [[04 SOP/Enterprise IT Operations Manual/13 - ITSM (GLPI)/12. Reports/KPI]]
