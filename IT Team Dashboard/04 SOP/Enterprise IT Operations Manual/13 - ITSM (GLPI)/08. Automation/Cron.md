---
tags: [glpi, automation, cron]
---

# Cron — Vận hành tác vụ định kỳ

Liên quan: [[09 Cron]] · [[LDAP Sync]] · [[Mail Fetch]]

## Checklist
- [ ] Xác nhận crontab hệ thống đã chạy `cron.php` mỗi 5 phút
- [ ] Chuyển toàn bộ tác vụ sang chế độ CLI
- [ ] Giám sát log tác vụ lỗi/timeout định kỳ

## Command
```bash
crontab -u www-data -l   # xác nhận dòng gọi cron.php tồn tại
sudo -u www-data php /var/www/html/glpi/front/cron.php   # chạy tay để test
```

## Verify
`Setup > Automatic actions` — cột "Lần chạy cuối" phải cập nhật liên tục theo chu kỳ, không có tác vụ nào bị "Nội bộ" (nên toàn bộ là CLI).

## Troubleshooting
| Lỗi | Nguyên nhân | Cách xử lý |
|---|---|---|
| Tác vụ không chạy đúng giờ | System cron bị lỗi | `systemctl status cron`, kiểm tra `/var/log/syslog` |
| Một tác vụ luôn timeout | Dữ liệu quá lớn xử lý trong 1 lần | Giảm batch size của tác vụ đó |

**Tiếp theo:** [[LDAP Sync]]
