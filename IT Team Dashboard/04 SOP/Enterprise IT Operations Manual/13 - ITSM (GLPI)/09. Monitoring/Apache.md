---
tags: [glpi, monitoring, apache]
---

# Apache — Giám sát Web Server

Liên quan: [[Logs]] · [[CPU]] · [[RAM]]

## Checklist
- [ ] Giám sát mã lỗi HTTP 5xx bất thường
- [ ] Theo dõi số connection đồng thời
- [ ] Cảnh báo khi Apache service down

## Command
```bash
apachectl status   # cần bật mod_status trước
grep " 50[0-9] " /var/log/apache2/glpi_access.log | tail -20
systemctl is-active apache2
```

## Verify
Setup script kiểm tra định kỳ (cron mỗi 5 phút) gọi `systemctl is-active apache2`, nếu không phải "active" thì gửi cảnh báo qua [[Actions]].

## Troubleshooting
| Lỗi | Nguyên nhân | Cách xử lý |
|---|---|---|
| Nhiều lỗi 502/504 | PHP-FPM quá tải hoặc timeout | Tăng `max_execution_time`, xem [[03 PHP]] |
| Apache tự crash định kỳ | Thiếu RAM | Xem [[RAM]] |

**Tiếp theo:** [[MariaDB]]
