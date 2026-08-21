---
tags: [glpi, installation, cron]
---

# 09 Cron — Setup tác vụ định kỳ ban đầu

Liên quan: [[07 GLPI]] · [[04 SOP/Enterprise IT Operations Manual/13 - ITSM (GLPI)/08. Automation/Cron]]

> Đây là bước cài đặt cron **nền tảng** lúc dựng hệ thống. Cấu hình chi tiết vận hành từng tác vụ (mail, LDAP sync...) xem tại [[04 SOP/Enterprise IT Operations Manual/13 - ITSM (GLPI)/08. Automation/Cron]].

## Checklist
- [ ] Thêm crontab hệ thống gọi `cron.php`
- [ ] Chuyển toàn bộ tác vụ tự động trong GLPI sang chế độ CLI
- [ ] Kiểm tra log cron chạy đúng chu kỳ

## Command
```bash
crontab -u www-data -e
```
```
*/5 * * * * /usr/bin/php /var/www/html/glpi/front/cron.php >/dev/null 2>&1
```

## Verify
```bash
sudo -u www-data php /var/www/html/glpi/front/cron.php   # chạy tay 1 lần để test
crontab -u www-data -l | grep cron.php
```
Vào `Setup > Automatic actions`, xác nhận cột "Lần chạy cuối" cập nhật theo đúng chu kỳ 5 phút.

## Troubleshooting
| Lỗi | Nguyên nhân | Cách xử lý |
|---|---|---|
| Không tác vụ nào chạy | Sai đường dẫn PHP hoặc thiếu crontab | `which php`, kiểm tra lại crontab của `www-data` |
| Tác vụ chạy ở chế độ "Nội bộ" thay vì CLI | Chưa đổi thủ công trong giao diện | Vào từng tác vụ, đổi Chế độ = CLI |

**Tiếp theo:** [[10 Backup]]
