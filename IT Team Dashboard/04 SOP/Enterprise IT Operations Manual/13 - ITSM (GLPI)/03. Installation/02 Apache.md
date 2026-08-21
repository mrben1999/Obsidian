---
tags: [glpi, installation, apache]
---

# 02 Apache — Web Server

Liên quan: [[01 Debian]] · [[03 PHP]] · [[06 SSL]]

## Checklist
- [ ] Cài Apache2 + module cần thiết
- [ ] Tạo VirtualHost cho GLPI
- [ ] Chặn thư mục nhạy cảm (`config/`, `files/`)
- [ ] Kiểm tra log access/error

## Command
```bash
apt install -y apache2
a2enmod rewrite headers ssl expires proxy_fcgi setenvif
systemctl enable --now apache2

cat > /etc/apache2/sites-available/glpi.conf << 'CONF'
<VirtualHost *:80>
    ServerName glpi.quangviet.local
    DocumentRoot /var/www/html/glpi/public
    <Directory /var/www/html/glpi/public>
        Require all granted
        RewriteEngine On
        RewriteCond %{REQUEST_FILENAME} !-f
        RewriteRule ^(.*)$ index.php [QSA,L]
    </Directory>
    <DirectoryMatch "/var/www/html/glpi/(config|files|marketplace)/">
        Require all denied
    </DirectoryMatch>
    ErrorLog ${APACHE_LOG_DIR}/glpi_error.log
    CustomLog ${APACHE_LOG_DIR}/glpi_access.log combined
</VirtualHost>
CONF

a2ensite glpi.conf && a2dissite 000-default.conf
apachectl configtest && systemctl reload apache2
```

## Verify
```bash
systemctl status apache2 | grep active
curl -I http://glpi.quangviet.local
tail -f /var/log/apache2/glpi_error.log
curl -I http://glpi.quangviet.local/config/config_db.php   # phải trả 403
```

## Troubleshooting
| Lỗi | Nguyên nhân | Cách xử lý |
|---|---|---|
| 403 Forbidden toàn trang | Thiếu `Require all granted` | Kiểm tra lại `<Directory>` |
| 404 khi vào `/front/...` | Chưa bật `mod_rewrite` | `a2enmod rewrite`, reload |
| Hiện danh sách thư mục thay vì app | DocumentRoot sai, chưa trỏ vào `public/` | Sửa `DocumentRoot` |

**Tiếp theo:** [[03 PHP]]
