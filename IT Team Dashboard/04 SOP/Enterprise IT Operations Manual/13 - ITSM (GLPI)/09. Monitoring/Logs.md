---
tags: [glpi, monitoring, logs]
---

# Logs — Giám sát nhật ký hệ thống

Liên quan: [[Apache]] · [[MariaDB]] · [[Audit]]

## Checklist
- [ ] Xác định vị trí toàn bộ log liên quan GLPI
- [ ] Xoay vòng log (logrotate) tránh đầy ổ đĩa
- [ ] Giám sát log lỗi nghiêm trọng hàng ngày

## Command
```bash
tail -f /var/log/apache2/glpi_error.log
tail -f /var/log/mysql/error.log
tail -f /var/www/html/glpi/files/_log/php-errors.log

cat /etc/logrotate.d/apache2   # xác nhận có xoay vòng log
```

## Verify
```bash
ls -lh /var/log/apache2/*.log   # không có file nào quá lớn (>1GB) chưa xoay vòng
```

## Troubleshooting
| Lỗi | Nguyên nhân | Cách xử lý |
|---|---|---|
| Ổ đĩa đầy do log | Thiếu logrotate | Cấu hình `logrotate` cho `/var/www/html/glpi/files/_log/` |
| Không tìm thấy log lỗi PHP | Đường dẫn log GLPI cấu hình khác mặc định | Kiểm tra `Setup > General > Logs` |

**Tiếp theo:** [[04 SOP/Enterprise IT Operations Manual/13 - ITSM (GLPI)/09. Monitoring/Cron]]
