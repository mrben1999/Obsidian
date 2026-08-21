---
tags: [glpi, monitoring, cron]
---

# Cron — Giám sát tác vụ định kỳ

Liên quan: [[04 SOP/Enterprise IT Operations Manual/13 - ITSM (GLPI)/08. Automation/Cron]] · [[Logs]]

## Checklist
- [ ] Kiểm tra tác vụ chạy đúng chu kỳ khai báo
- [ ] Cảnh báo khi tác vụ nào đó không chạy quá 2 chu kỳ liên tiếp
- [ ] Theo dõi thời gian thực thi (tác vụ chạy chậm dần là dấu hiệu cần tối ưu)

## Command
```sql
SELECT name, lastrun, frequency FROM glpi_crontasks ORDER BY lastrun ASC;
```

## Verify
Chạy query trên, xác nhận `lastrun` của mọi tác vụ đều trong khoảng `frequency` gần nhất — nếu có tác vụ "lastrun" quá cũ, cần điều tra ngay.

## Troubleshooting
| Lỗi | Nguyên nhân | Cách xử lý |
|---|---|---|
| Một tác vụ dừng chạy đột ngột | Lỗi PHP không bắt được, tác vụ bị "treo" | Xem log `php-errors.log`, chạy tay tác vụ để debug |

**Tiếp theo:** [[Apache]]
