---
tags: [glpi, reports, sql]
---

# SQL — Truy vấn báo cáo tùy chỉnh

Liên quan: [[Dashboard]] · [[04 MariaDB]]

## Checklist
- [ ] Tạo user MySQL read-only riêng cho báo cáo
- [ ] Không chỉnh sửa dữ liệu trực tiếp qua SQL trên production
- [ ] Ghi chú lại thư viện query dùng chung cho team

## Command
```sql
CREATE USER 'glpi_report'@'%' IDENTIFIED BY 'Report_ReadOnly_2026!';
GRANT SELECT ON glpidb.* TO 'glpi_report'@'%';
FLUSH PRIVILEGES;
```
Ví dụ — Top kỹ thuật viên xử lý nhiều ticket nhất trong tháng:
```sql
SELECT u.name, COUNT(*) AS so_ticket
FROM glpi_tickets_users tu
JOIN glpi_users u ON tu.users_id = u.id
JOIN glpi_tickets t ON tu.tickets_id = t.id
WHERE tu.type = 2 AND t.closedate BETWEEN '2026-07-01' AND '2026-07-31'
GROUP BY u.name ORDER BY so_ticket DESC;
```

## Verify
```bash
mysql -u glpi_report -p -e "SHOW GRANTS;"   # phải chỉ có SELECT, không có INSERT/UPDATE/DELETE
```

## Troubleshooting
| Lỗi | Nguyên nhân | Cách xử lý |
|---|---|---|
| Query chậm trên bảng lớn | Thiếu index | `EXPLAIN` query, phối hợp DBA thêm index (không tự sửa schema GLPI) |
| Kết quả sai lệch so với dashboard GLPI | Thiếu điều kiện `is_deleted=0` | Đối chiếu logic WHERE với dashboard gốc |

---
**Đây là bài cuối chương Reports.**
