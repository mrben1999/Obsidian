---
tags: [glpi, automation, certificate]
---

# Certificate — Tự động gia hạn chứng chỉ

Liên quan: [[06 SSL]] · [[Certificates Monitoring]]

## Checklist
- [ ] Nếu dùng Let's Encrypt, bật auto-renew qua certbot timer
- [ ] Nếu dùng CA nội bộ, đặt nhắc nhở thủ công trước hạn 30 ngày
- [ ] Test renew thử trước khi hết hạn thật

## Command
```bash
# Với Let's Encrypt
systemctl status certbot.timer
certbot renew --dry-run
```
Với chứng chỉ CA nội bộ (AD CS), không có auto-renew — cần lịch nhắc thủ công, xem thêm cấu hình gốc tại [[06 SSL]].

## Verify
```bash
openssl x509 -in /etc/ssl/certs/glpi.crt -noout -enddate
```

## Troubleshooting
| Lỗi | Nguyên nhân | Cách xử lý |
|---|---|---|
| Certbot renew thất bại | Port 80 bị chiếm bởi VirtualHost khác | Đảm bảo webroot challenge truy cập được |
| Quên gia hạn CA nội bộ, GLPI ngừng hoạt động HTTPS | Không có cảnh báo trước hạn | Thêm vào [[Certificates Monitoring]] |

**Tiếp theo:** [[04 SOP/Enterprise IT Operations Manual/13 - ITSM (GLPI)/08. Automation/Backup]]
