---
tags: [glpi, backup, cron]
---

# Backup Cron — Điều phối lịch backup tổng thể

Liên quan: [[MariaDB Backup]] · [[Files Backup]] · [[04 SOP/Enterprise IT Operations Manual/13 - ITSM (GLPI)/08. Automation/Backup]]

## Checklist
- [ ] Gộp toàn bộ script backup vào 1 script điều phối chạy tuần tự
- [ ] Đặt lịch chạy ngoài giờ cao điểm (02:00)
- [ ] Log lại kết quả từng bước, gửi email tổng kết

## Command
```bash
cat > /usr/local/bin/glpi-backup-all.sh << 'SH'
#!/bin/bash
LOG=/var/log/glpi-backup.log
echo "=== Backup bắt đầu $(date) ===" >> $LOG
/usr/local/bin/glpi-backup.sh >> $LOG 2>&1
rsync -avz /data/backup/glpi/ backup-svc@nas.quangviet.local:/backup/glpi/ >> $LOG 2>&1
echo "=== Backup kết thúc $(date) ===" >> $LOG
mail -s "Backup GLPI $(date +%Y-%m-%d)" it@quangviet.com.vn < $LOG
SH
chmod +x /usr/local/bin/glpi-backup-all.sh
(crontab -l 2>/dev/null; echo "0 2 * * * /usr/local/bin/glpi-backup-all.sh") | crontab -
```

## Verify
```bash
/usr/local/bin/glpi-backup-all.sh
tail -30 /var/log/glpi-backup.log
```

## Troubleshooting
| Lỗi | Nguyên nhân | Cách xử lý |
|---|---|---|
| Không nhận được email tổng kết | Server chưa cấu hình `mail`/`sendmail`/`msmtp` | Cài `mailutils` hoặc `msmtp`, cấu hình relay qua SMTP nội bộ |

**Tiếp theo:** [[Restore]]
