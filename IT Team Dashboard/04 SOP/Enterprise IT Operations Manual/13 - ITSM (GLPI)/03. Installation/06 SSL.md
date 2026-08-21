---
tags: [glpi, installation, ssl]
---

# 06 SSL — HTTPS nội bộ

Liên quan: [[02 Apache]] · [[10. Security/HTTPS]] · [[09. Monitoring/SSL Monitoring]]

## Checklist
- [ ] Tạo CSR, ký bằng CA nội bộ (AD CS) của Quảng Việt
- [ ] Cấu hình VirtualHost 443
- [ ] Redirect HTTP → HTTPS
- [ ] Bật HSTS
- [ ] Deploy root CA xuống máy trạm qua GPO

## Command
```bash
openssl req -new -newkey rsa:2048 -nodes \
  -keyout /etc/ssl/private/glpi.key \
  -out /etc/ssl/certs/glpi.csr \
  -subj "/C=VN/ST=HCM/O=Quang Viet/CN=glpi.quangviet.local"
# gửi glpi.csr cho AD CS ký, nhận lại glpi.crt + ca-chain.crt

cat > /etc/apache2/sites-available/glpi-ssl.conf << 'CONF'
<VirtualHost *:443>
    ServerName glpi.quangviet.local
    DocumentRoot /var/www/html/glpi/public
    SSLEngine on
    SSLCertificateFile /etc/ssl/certs/glpi.crt
    SSLCertificateKeyFile /etc/ssl/private/glpi.key
    SSLCertificateChainFile /etc/ssl/certs/ca-chain.crt
    Header always set Strict-Transport-Security "max-age=63072000; includeSubDomains"
</VirtualHost>
CONF
a2ensite glpi-ssl.conf
sed -i '/ServerName glpi.quangviet.local/a\    Redirect permanent / https://glpi.quangviet.local/' /etc/apache2/sites-available/glpi.conf
apachectl configtest && systemctl reload apache2
```

## Verify
```bash
curl -Ik https://glpi.quangviet.local
openssl s_client -connect glpi.quangviet.local:443 -servername glpi.quangviet.local </dev/null 2>/dev/null | openssl x509 -noout -dates
curl -I http://glpi.quangviet.local   # phải trả 301 redirect sang https
```

## Troubleshooting
| Lỗi | Nguyên nhân | Cách xử lý |
|---|---|---|
| `SSL_ERROR_RX_RECORD_TOO_LONG` | Cổng 443 chưa `Listen` đúng | Kiểm tra `ports.conf` |
| Trình duyệt báo "not trusted" | Root CA chưa cài trên máy trạm | Deploy CA qua GPO |
| Redirect loop | Redirect ở 2 tầng cùng lúc | Chỉ redirect ở Apache, không lặp ở proxy |

**Tiếp theo:** [[07 GLPI]]
