---
tags: [glpi, reports, assets]
---

# Assets Reports — Báo cáo tổng hợp tài sản

Liên quan: [[Inventory Reports]] · [[Warranty]]

## Checklist
- [ ] Báo cáo số lượng tài sản theo loại (Computer/Printer/Network...)
- [ ] Báo cáo giá trị tài sản còn lại theo khấu hao
- [ ] Xuất báo cáo cho Kế toán đối chiếu

## Command
```sql
SELECT 'Computer' AS loai, COUNT(*) FROM glpi_computers WHERE is_deleted=0
UNION ALL
SELECT 'Printer', COUNT(*) FROM glpi_printers WHERE is_deleted=0
UNION ALL
SELECT 'NetworkEquipment', COUNT(*) FROM glpi_networkequipments WHERE is_deleted=0;
```

## Verify
Đối chiếu tổng số với báo cáo tài sản cố định của phòng Kế toán — chênh lệch cần điều tra (tài sản thanh lý nhưng chưa cập nhật GLPI hoặc ngược lại).

## Troubleshooting
| Lỗi | Nguyên nhân | Cách xử lý |
|---|---|---|
| Số liệu GLPI và Kế toán lệch nhau | Thiếu quy trình đồng bộ khi thanh lý | Đảm bảo mọi thanh lý đều qua [[../13. SOP/Thanh lý]] |

**Tiếp theo:** [[Licenses Reports]]
