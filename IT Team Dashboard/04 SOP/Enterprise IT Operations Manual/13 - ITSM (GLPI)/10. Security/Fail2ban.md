---
tags: [glpi, security, fail2ban]
---

# Fail2ban — Chống brute-force đăng nhập

Liên quan: [[HTTPS]] · [[04 SOP/Enterprise IT Operations Manual/13 - ITSM (GLPI)/10. Security/Firewall]]

## Checklist
- [ ] Cài Fail2ban, tạo jail riêng cho GLPI login
- [ ] Đặt ngưỡng số lần thử sai hợp lý
- [ ] Test bằng cách cố tình đăng nhập sai nhiều lần

## Command
```bash
apt install -y fail2ban
cat > /etc/fail2ban/filter.d/glpi-auth.conf << 'CONF'
[Definition]
failregex = .*Failed login for .* from <HOST>
CONF

cat > /etc/fail2ban/jail.d/glpi.conf << 'CONF'
[glpi-auth]
enabled = true
port = http,https
filter = glpi-auth
logpath = /var/www/html/glpi/files/_log/php-errors.log
maxretry = 5
bantime = 1800
findtime = 600
CONF
systemctl restart fail2ban
```

## Verify
```bash
fail2ban-client status glpi-auth
```
Thử đăng nhập sai 5 lần liên tiếp, xác nhận IP bị ban trong danh sách.

## Troubleshooting
| Lỗi | Nguyên nhân | Cách xử lý |
|---|---|---|
| Fail2ban không ban dù đăng nhập sai nhiều lần | Regex không khớp định dạng log thực tế | Kiểm tra lại nội dung log GLPI thực tế và chỉnh `failregex` |

**Tiếp theo:** [[04 SOP/Enterprise IT Operations Manual/13 - ITSM (GLPI)/10. Security/Firewall]]
