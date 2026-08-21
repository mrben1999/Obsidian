---
tags: [glpi, automation, backup]
---

# Backup — Vận hành backup tự động

Liên quan: [[10 Backup]] · [[Backup Cron]]

## Checklist
- [ ] Script backup DB + file chạy hàng ngày qua cron
- [ ] Đồng bộ ra NAS/offsite tự động
- [ ] Giám sát log backup, cảnh báo khi thất bại

## Command
```bash
crontab -l | grep glpi-backup
tail -20 /var/log/glpi-backup.log
```
Chi tiết script và chiến lược 3-2-1 xem [[Backup Cron]].

## Verify
```bash
ls -lh /data/backup/glpi/ | tail -5   # file mới nhất phải trong 24h qua, dung lượng > 0
```

## Troubleshooting
| Lỗi | Nguyên nhân | Cách xử lý |
|---|---|---|
| Backup log không có entry mới | Cron không chạy | Kiểm tra `crontab -l`, `systemctl status cron` |
| File backup dung lượng bất thường (quá nhỏ) | Lỗi mysqldump giữa chừng | Chạy tay để xem lỗi chi tiết |

**Tiếp theo:** [[Inventory Automation]]
