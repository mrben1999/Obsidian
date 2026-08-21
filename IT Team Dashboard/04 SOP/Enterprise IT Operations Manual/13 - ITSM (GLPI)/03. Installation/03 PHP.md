---
tags: [glpi, installation, php]
---

# 03 PHP — Cấu hình PHP 8.3

Liên quan: [[02 Apache]] · [[04 MariaDB]] · [[07 GLPI]]

## Checklist
- [ ] Cài PHP 8.3 + extension bắt buộc của GLPI
- [ ] Cấu hình `php.ini` theo khuyến nghị
- [ ] Bật OPcache
- [ ] Kiểm tra requirement qua installer GLPI

## Command
```bash
apt install -y php8.3 php8.3-fpm php8.3-mysql php8.3-curl php8.3-gd \
  php8.3-intl php8.3-mbstring php8.3-xml php8.3-zip php8.3-bz2 \
  php8.3-ldap php8.3-apcu php8.3-cli php8.3-opcache php8.3-redis libapache2-mod-php8.3

cat >> /etc/php/8.3/apache2/php.ini << 'INI'
memory_limit = 256M
upload_max_filesize = 50M
post_max_size = 50M
max_execution_time = 60
date.timezone = Asia/Ho_Chi_Minh
session.cookie_httponly = 1
opcache.enable=1
opcache.memory_consumption=128
opcache.max_accelerated_files=20000
INI

systemctl restart apache2
```

## Verify
```bash
php -v   # phải hiện 8.3.x
php -m | grep -E "ldap|intl|mbstring|redis|opcache"
echo "<?php phpinfo();" > /var/www/html/glpi/public/info.php
curl -s http://glpi.quangviet.local/info.php | grep "PHP Version"
rm /var/www/html/glpi/public/info.php   # xóa ngay sau khi kiểm tra, tránh lộ thông tin
```

## Troubleshooting
| Lỗi | Nguyên nhân | Cách xử lý |
|---|---|---|
| Installer GLPI báo thiếu `intl` | Quên cài `php8.3-intl` | Cài bổ sung, restart Apache |
| Upload đính kèm ticket fail | `upload_max_filesize` quá nhỏ | Tăng trong `php.ini` |
| Trang trắng, không log | `display_errors=Off` | Bật tạm trên môi trường test để debug |

**Tiếp theo:** [[04 MariaDB]]
