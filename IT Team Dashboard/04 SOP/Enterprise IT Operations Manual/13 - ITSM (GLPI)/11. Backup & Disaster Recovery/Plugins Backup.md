---
tags: [glpi, backup, plugins]
---

# Plugins Backup — Sao lưu cấu hình & mã nguồn plugin

Liên quan: [[08 Marketplace]] · [[Files Backup]]

## Checklist
- [ ] Backup thư mục `marketplace/` và `plugins/`
- [ ] Ghi lại danh sách phiên bản plugin đang cài (để rollback đúng version)
- [ ] Backup trước mỗi lần update plugin

## Command
```bash
tar -czf /data/backup/glpi/plugins_$(date +%Y%m%d).tar.gz \
  /var/www/html/glpi/marketplace /var/www/html/glpi/plugins
sudo -u www-data php /var/www/html/glpi/bin/console plugin:list > /data/backup/glpi/plugin_list_$(date +%Y%m%d).txt
```

## Verify
```bash
cat /data/backup/glpi/plugin_list_*.txt   # đối chiếu danh sách + version plugin
```

## Troubleshooting
| Lỗi | Nguyên nhân | Cách xử lý |
|---|---|---|
| Update plugin làm hỏng hệ thống, cần rollback | Không backup trước khi update | Luôn chạy backup này trước mỗi lần update, không ngoại lệ |

**Tiếp theo:** [[Marketplace Backup]]
