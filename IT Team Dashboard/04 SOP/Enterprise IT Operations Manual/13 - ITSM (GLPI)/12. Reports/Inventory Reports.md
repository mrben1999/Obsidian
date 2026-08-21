---
tags: [glpi, reports, inventory]
---

# Inventory Reports — Báo cáo kiểm kê tài sản

Liên quan: [[Assets Reports]] · [[GLPI Agent]]

## Checklist
- [ ] Báo cáo tỷ lệ tài sản đã inventory gần đây (30 ngày)
- [ ] Báo cáo tài sản theo Entity/chi nhánh
- [ ] Xuất định kỳ hàng tháng cho team IT nội bộ

## Command
```sql
SELECT
  (SELECT COUNT(*) FROM glpi_computers WHERE last_inventory_update > NOW() - INTERVAL 30 DAY AND is_deleted=0) AS da_kiem_ke,
  (SELECT COUNT(*) FROM glpi_computers WHERE is_deleted=0) AS tong_so;
```

## Verify
Tỷ lệ `da_kiem_ke / tong_so` nên ≥ 95% — nếu thấp hơn, điều tra máy nào không gửi inventory (xem [[Inventory Automation]]).

## Troubleshooting
| Lỗi | Nguyên nhân | Cách xử lý |
|---|---|---|
| Tỷ lệ kiểm kê thấp bất thường | Nhiều agent bị gỡ hoặc lỗi | Rà soát theo [[Inventory Automation]] |

**Tiếp theo:** [[Assets Reports]]
