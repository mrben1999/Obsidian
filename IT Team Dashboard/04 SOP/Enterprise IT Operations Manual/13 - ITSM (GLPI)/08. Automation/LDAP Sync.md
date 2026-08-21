---
tags: [glpi, automation, ldap-sync]
---

# LDAP Sync — Đồng bộ định kỳ với Active Directory

Liên quan: [[04 SOP/Enterprise IT Operations Manual/13 - ITSM (GLPI)/08. Automation/Cron]] · [[07 Sync]]

## Checklist
- [ ] Tác vụ "user" (LDAP) chạy mỗi 1 giờ
- [ ] Đồng bộ khóa tài khoản khi bị disable trên AD
- [ ] Giám sát log đồng bộ, số user cập nhật mỗi lần chạy

## Command
```bash
sudo -u www-data php /var/www/html/glpi/front/cron.php
```
Cấu hình chi tiết bind account/mapping xem [[03 LDAP Basic Config]].

## Verify
`Administration > Logs` — lọc theo tác vụ "user", xác nhận chạy thành công đúng chu kỳ 1 giờ.

## Troubleshooting
Xem bảng lỗi chi tiết tại [[08 Troubleshooting]].

**Tiếp theo:** [[Mail Fetch]]
