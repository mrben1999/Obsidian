---
tags: [glpi, installation, backup]
---

# 10 Backup — Backup nền tảng ban đầu

Liên quan: [[09 Cron]] · [[MariaDB Backup]]

> Bước này thiết lập backup **tối thiểu** ngay sau khi cài xong hệ thống. Chiến lược backup đầy đủ (3-2-1, DR) xem tại chương [[Disaster Recovery|11. Backup & Disaster Recovery]].

## Checklist
- [ ] Script backup DB + file chạy được thủ công
- [ ] Lên lịch cron hàng ngày
- [ ] Xác nhận file backup sinh ra đúng, dung lượng hợp lý

## Command
```bash
mkdir -p /usr/local/bin /data/backup/glpi
cat > /usr/local/bin/glpi-backup.sh << 'SH'
#!/bin/bash
DATE=$(date +%Y%m%d_%H%M)
DIR="/data/backup/glpi"
mysqldump -u glpiuser -p'MatKhauManh_QV2026!' glpidb | gzip > $DIR/glpidb_$DATE.sql.gz
tar -czf $DIR/glpifiles_$DATE.tar.gz /var/www/html/glpi/files
find $DIR -type f -mtime +30 -delete
SH
chmod +x /usr/local/bin/glpi-backup.sh
(crontab -l 2>/dev/null; echo "0 2 * * * /usr/local/bin/glpi-backup.sh >> /var/log/glpi-backup.log 2>&1") | crontab -
```

## Verify
```bash
/usr/local/bin/glpi-backup.sh
ls -lh /data/backup/glpi/   # phải thấy file .sql.gz và .tar.gz vừa tạo, dung lượng > 0
```

## Troubleshooting
| Lỗi | Nguyên nhân | Cách xử lý |
|---|---|---|
| File backup 0 byte | Sai user/password MySQL | Test tay `mysqldump` để xem lỗi cụ thể |
| Cron không tự chạy | Chưa cài vào crontab đúng user | `crontab -l` kiểm tra lại |

**Cài đặt nền tảng hoàn tất.** Tiếp theo: [[01 Create Service Account]]
