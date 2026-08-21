---
tags: [glpi, monitoring, ssl]
---

# SSL Monitoring — Giám sát chứng chỉ HTTPS

Liên quan: [[06 SSL]] · [[Certificates Monitoring]]

## Checklist
- [ ] Kiểm tra ngày hết hạn chứng chỉ định kỳ
- [ ] Cảnh báo trước 30 ngày hết hạn
- [ ] Kiểm tra cấu hình cipher/protocol không dùng phiên bản cũ (TLS 1.0/1.1)

## Command
```bash
echo | openssl s_client -connect glpi.quangviet.local:443 -servername glpi.quangviet.local 2>/dev/null | openssl x509 -noout -enddate
nmap --script ssl-enum-ciphers -p 443 glpi.quangviet.local
```

## Verify
Ngày hết hạn phải còn > 30 ngày. Kết quả `nmap` không liệt kê TLSv1.0/1.1 là protocol được chấp nhận.

## Troubleshooting
| Lỗi | Nguyên nhân | Cách xử lý |
|---|---|---|
| Chứng chỉ hết hạn gây gián đoạn | Không có cảnh báo trước hạn | Setup script cron cảnh báo, xem [[Certificates Monitoring]] |

**Tiếp theo:** [[Certificates Monitoring]]
