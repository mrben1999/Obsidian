---
tags: [glpi, troubleshooting, ldap]
---

# Troubleshooting: LDAP

Liên quan: [[08 Troubleshooting]]

> Bài này là phiên bản tóm tắt tra cứu nhanh. Chi tiết đầy đủ tại [[08 Troubleshooting]].

## Checklist chẩn đoán nhanh
- [ ] `telnet dc01.quangviet.local 636` — kiểm tra port
- [ ] `ldapwhoami` — kiểm tra bind account
- [ ] Kiểm tra BaseDN/filter trong cấu hình
- [ ] Kiểm tra chứng chỉ TLS/LDAPS còn hạn

## Bảng lỗi nhanh
| Triệu chứng | Xử lý nhanh |
|---|---|
| Không kết nối được | Kiểm tra firewall/port, xem [[04 SOP/Enterprise IT Operations Manual/13 - ITSM (GLPI)/10. Security/Firewall]] |
| Bind OK, import 0 user | Kiểm tra delegate quyền + filter |
| Thiếu thông tin sau import | Kiểm tra mapping thuộc tính |
| LDAPS lỗi định kỳ | Chứng chỉ DC hết hạn, xem [[Certificates Monitoring]] |

**Xem tiếp:** [[Cron Troubleshooting]]
