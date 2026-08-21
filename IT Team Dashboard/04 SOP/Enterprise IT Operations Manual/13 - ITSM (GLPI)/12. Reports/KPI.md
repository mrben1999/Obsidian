---
tags: [glpi, reports, kpi]
---

# KPI — Chỉ số đánh giá hiệu quả

Liên quan: [[Tickets Reports]] · [[Monthly Reports]] · [[SLA]]

## Checklist
- [ ] Xác định bộ KPI cốt lõi
- [ ] Setup báo cáo tự động gửi định kỳ
- [ ] Review KPI với Ban Giám đốc hàng quý

## Bảng KPI đề xuất
| KPI | Công thức | Mục tiêu |
|---|---|---|
| Tỷ lệ tuân thủ SLA | Ticket đúng hạn / Tổng ticket đã đóng | ≥ 90% |
| Tỷ lệ ticket mở lại | Ticket reopen / Tổng ticket đã đóng | ≤ 5% |
| Tỷ lệ tài sản đã kiểm kê | Xem [[Inventory Reports]] | ≥ 95% |

## Command
```sql
SELECT
  SUM(CASE WHEN t.solvedate <= t.time_to_resolve THEN 1 ELSE 0 END) / COUNT(*) * 100 AS ty_le_dung_han
FROM glpi_tickets t
WHERE t.status IN (5,6) AND t.time_to_resolve IS NOT NULL
  AND t.closedate BETWEEN '2026-07-01' AND '2026-07-31';
```

## Verify
So sánh kết quả với mục tiêu đề ra — nếu lệch nhiều, xem lại [[SLA]] có đặt hợp lý với năng lực đội ngũ hay không.

## Troubleshooting
| Lỗi | Nguyên nhân | Cách xử lý |
|---|---|---|
| KPI không phản ánh đúng thực tế | Category/Priority nhập sai từ đầu | Đào tạo lại nhân viên tạo ticket đúng chuẩn |

**Tiếp theo:** [[Monthly Reports]]
