---
tags: [glpi, monitoring, mariadb]
---

# MariaDB — Giám sát cơ sở dữ liệu

Liên quan: [[Apache]] · [[Disk]] · [[04 MariaDB]]

## Checklist
- [ ] Giám sát slow query log
- [ ] Theo dõi số connection hiện tại so với `max_connections`
- [ ] Giám sát dung lượng database tăng trưởng theo thời gian

## Command
```bash
tail -f /var/log/mysql/slow.log
mysql -u root -p -e "SHOW STATUS LIKE 'Threads_connected';"
mysql -u root -p -e "SELECT table_schema, ROUND(SUM(data_length+index_length)/1024/1024,1) AS MB FROM information_schema.tables WHERE table_schema='glpidb' GROUP BY table_schema;"
```

## Verify
So sánh `Threads_connected` với `max_connections` — nếu thường xuyên > 80%, cần tăng giới hạn hoặc tối ưu query.

## Troubleshooting
| Lỗi | Nguyên nhân | Cách xử lý |
|---|---|---|
| Query chậm dần theo thời gian | Thiếu index hoặc bảng log quá lớn chưa purge | Bật purgelogs định kỳ, xem [[04 SOP/Enterprise IT Operations Manual/13 - ITSM (GLPI)/08. Automation/Cron]] |
| Database tăng dung lượng bất thường | Log/lịch sử tích lũy không giới hạn | Rà soát cấu hình purge trong `Setup > General > Logs` |

**Tiếp theo:** [[Disk]]
