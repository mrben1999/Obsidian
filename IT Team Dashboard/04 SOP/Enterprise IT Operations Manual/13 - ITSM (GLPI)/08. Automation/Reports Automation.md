---
tags: [glpi, automation, reports]
---

# Reports Automation — Tự động hóa xuất báo cáo

Liên quan: [[04 SOP/Enterprise IT Operations Manual/13 - ITSM (GLPI)/12. Reports/KPI]] · [[Monthly Reports]]

## Checklist
- [ ] Script CLI trích xuất báo cáo định kỳ
- [ ] Lên lịch cron gửi báo cáo tự động qua email
- [ ] Lưu trữ báo cáo cũ để so sánh xu hướng

## Command
```bash
cat > /usr/local/bin/glpi-monthly-report.sh << 'SH'
#!/bin/bash
DATE=$(date +%Y%m)
mysql -u glpi_report -p'Report_ReadOnly_2026!' glpidb \
  -e "SELECT e.name, COUNT(t.id) FROM glpi_tickets t JOIN glpi_entities e ON t.entities_id=e.id GROUP BY e.name" \
  > /data/reports/tickets_by_entity_$DATE.csv
SH
chmod +x /usr/local/bin/glpi-monthly-report.sh
(crontab -l 2>/dev/null; echo "0 6 1 * * /usr/local/bin/glpi-monthly-report.sh") | crontab -
```

## Verify
```bash
/usr/local/bin/glpi-monthly-report.sh
cat /data/reports/tickets_by_entity_*.csv
```

## Troubleshooting
| Lỗi | Nguyên nhân | Cách xử lý |
|---|---|---|
| File CSV rỗng | User `glpi_report` chưa được tạo | Xem [[SQL]] |

**Tiếp theo:** [[Rules Automation]]
