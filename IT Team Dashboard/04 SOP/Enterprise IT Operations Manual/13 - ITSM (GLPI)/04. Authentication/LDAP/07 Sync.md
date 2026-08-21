---
tags: [glpi, authentication, ldap]
---

# 07 Sync — Đồng bộ định kỳ

Liên quan: [[06 Test]] · [[../../08. Automation/LDAP Sync]]

## Checklist
- [ ] Bật tác vụ tự động "user" (LDAP sync) trong GLPI
- [ ] Đặt tần suất phù hợp (khuyến nghị 1 giờ)
- [ ] Bật đồng bộ khóa tài khoản khi bị disable trên AD

## Command / Cấu hình GLPI
`Setup > Automatic actions > "user"` → Chế độ = CLI, Tần suất = 3600s.
Trong LDAP directory, tab "Đồng bộ" → bật đồng bộ trường `userAccountControl` để tự khóa user khi bị disable trên AD.

> Cấu hình automation nâng cao (batch size, giám sát log) xem chi tiết tại [[../../08. Automation/LDAP Sync]].

## Verify
```bash
sudo -u www-data php /var/www/html/glpi/front/cron.php
```
Kiểm tra `Administration > Logs` → thấy log tác vụ "user" chạy thành công, số user cập nhật > 0 nếu có thay đổi trên AD.

## Troubleshooting
| Lỗi | Nguyên nhân | Cách xử lý |
|---|---|---|
| User bị disable trên AD vẫn login GLPI | Chưa bật đồng bộ trường khóa tài khoản | Kiểm tra lại tab "Đồng bộ" |
| Sync timeout với AD lớn | Batch size quá lớn | Giảm `user_limit` trong cấu hình tác vụ |

**Tiếp theo:** [[08 Troubleshooting]]
