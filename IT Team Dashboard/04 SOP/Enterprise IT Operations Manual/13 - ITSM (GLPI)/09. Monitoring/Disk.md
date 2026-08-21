---
tags: [glpi, monitoring, disk]
---

# Disk — Giám sát dung lượng ổ đĩa

Liên quan: [[MariaDB]] · [[NAS]]

## Checklist
- [ ] Giám sát dung lượng ổ đĩa GLPI server (DB + files đính kèm)
- [ ] Giám sát dung lượng NAS lưu backup
- [ ] Cảnh báo khi dung lượng còn dưới 20%

## Command
```bash
df -h /
du -sh /var/www/html/glpi/files/
du -sh /var/lib/mysql/glpidb/
```
Script cảnh báo đơn giản:
```bash
USAGE=$(df / | tail -1 | awk '{print $5}' | tr -d '%')
if [ $USAGE -gt 80 ]; then echo "Disk usage cao: ${USAGE}%" | mail -s "Cảnh báo Disk GLPI" it@quangviet.com.vn; fi
```

## Verify
Chạy script trên qua cron hàng ngày, xác nhận nhận được cảnh báo khi test giả lập ngưỡng 80%.

## Troubleshooting
| Lỗi | Nguyên nhân | Cách xử lý |
|---|---|---|
| Thư mục `files/` tăng nhanh bất thường | File đính kèm ticket quá nhiều/quá lớn | Xem lại giới hạn `upload_max_filesize` tại [[03 PHP]] |

**Tiếp theo:** [[CPU]]
