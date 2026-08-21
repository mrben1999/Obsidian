---
tags: [glpi, monitoring, certificates]
---

# Certificates Monitoring — Giám sát tổng thể chứng chỉ hệ thống

Liên quan: [[SSL Monitoring]] · [[05 LDAPS]] · [[Certificate]]

## Checklist
- [ ] Lập danh sách toàn bộ chứng chỉ cần theo dõi (GLPI web, LDAPS Domain Controller, Firewall)
- [ ] Script kiểm tra tự động định kỳ hàng tuần
- [ ] Gửi cảnh báo qua email/Teams khi gần hết hạn

## Command
```bash
cat > /usr/local/bin/check-certs.sh << 'SH'
#!/bin/bash
for HOST in "glpi.quangviet.local:443" "dc01.quangviet.local:636"; do
  HOSTNAME=${HOST%%:*}
  PORT=${HOST##*:}
  EXPIRE=$(echo | openssl s_client -connect $HOST -servername $HOSTNAME 2>/dev/null | openssl x509 -noout -enddate | cut -d= -f2)
  echo "$HOST hết hạn: $EXPIRE"
done
SH
chmod +x /usr/local/bin/check-certs.sh
(crontab -l 2>/dev/null; echo "0 8 * * 1 /usr/local/bin/check-certs.sh | mail -s 'Kiểm tra chứng chỉ GLPI' it@quangviet.com.vn") | crontab -
```

## Verify
```bash
/usr/local/bin/check-certs.sh
```
Chạy tay, xác nhận liệt kê đủ ngày hết hạn của cả 2 chứng chỉ (GLPI web + LDAPS).

## Troubleshooting
| Lỗi | Nguyên nhân | Cách xử lý |
|---|---|---|
| Script không kết nối được 1 host | Firewall chặn cổng kiểm tra | Xem [[04 SOP/Enterprise IT Operations Manual/13 - ITSM (GLPI)/10. Security/Firewall]] |

---
**Hoàn tất chương Monitoring.** Tiếp theo: [[HTTPS]]
