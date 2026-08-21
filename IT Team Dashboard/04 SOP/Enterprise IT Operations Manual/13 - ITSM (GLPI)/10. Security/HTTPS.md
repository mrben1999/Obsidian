---
tags: [glpi, security, https]
---

# HTTPS — Chuẩn hóa bảo mật tầng vận chuyển

Liên quan: [[06 SSL]] · [[SSL Monitoring]]

## Checklist
- [ ] Bắt buộc HTTPS toàn bộ, không cho phép HTTP thuần
- [ ] Tắt TLS 1.0/1.1, chỉ cho phép TLS 1.2+
- [ ] Bật HSTS

## Command
```apacheconf
SSLProtocol -all +TLSv1.2 +TLSv1.3
SSLCipherSuite HIGH:!aNULL:!MD5:!3DES
Header always set Strict-Transport-Security "max-age=63072000; includeSubDomains"
```
```bash
apachectl configtest && systemctl reload apache2
```

## Verify
```bash
nmap --script ssl-enum-ciphers -p 443 glpi.quangviet.local
```
Không được liệt kê TLSv1.0/1.1 trong kết quả.

## Troubleshooting
| Lỗi | Nguyên nhân | Cách xử lý |
|---|---|---|
| Trình duyệt cũ không kết nối được | Đã tắt TLS 1.0/1.1 | Chấp nhận đánh đổi bảo mật, nâng cấp trình duyệt thay vì hạ chuẩn |

**Tiếp theo:** [[Fail2ban]]
