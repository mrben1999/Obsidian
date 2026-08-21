---
tags: [glpi, backup, files]
---

# Files Backup — Sao lưu file đính kèm & upload

Liên quan: [[MariaDB Backup]] · [[NAS]]

## Checklist
- [ ] Backup thư mục `files/` (đính kèm ticket, tài liệu asset)
- [ ] Loại trừ thư mục cache/log không cần backup
- [ ] Đồng bộ ra NAS riêng biệt với server chính

## Command
```bash
tar --exclude='files/_cache' --exclude='files/_log' \
  -czf /data/backup/glpi/glpifiles_$(date +%Y%m%d_%H%M).tar.gz /var/www/html/glpi/files
rsync -avz /data/backup/glpi/ backup-svc@nas.quangviet.local:/backup/glpi/
```

## Verify
```bash
tar -tzf /data/backup/glpi/glpifiles_*.tar.gz | head   # xác nhận danh sách file bên trong hợp lý
```

## Troubleshooting
| Lỗi | Nguyên nhân | Cách xử lý |
|---|---|---|
| File backup quá lớn, chậm | Không loại trừ cache | Đảm bảo cờ `--exclude` hoạt động đúng |
| rsync tới NAS thất bại | Sai SSH key/credential | Test kết nối SSH riêng trước khi đưa vào cron |

**Tiếp theo:** [[Plugins Backup]]
