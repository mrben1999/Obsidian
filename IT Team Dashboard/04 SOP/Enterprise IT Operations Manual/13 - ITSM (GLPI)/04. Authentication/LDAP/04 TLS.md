---
tags: [glpi, authentication, ldap]
---

# 04 TLS — Mã hóa kết nối LDAP (StartTLS)

Liên quan: [[03 LDAP Basic Config]] · [[05 LDAPS]]

## Checklist
- [ ] Cài chứng chỉ CA nội bộ lên GLPI server
- [ ] Bật StartTLS trong cấu hình LDAP directory
- [ ] Test kết nối mã hóa

## Command
```bash
mkdir -p /etc/ldap/certs
cp ca-chain.crt /etc/ldap/certs/quangviet-ca.crt
echo "TLS_CACERT /etc/ldap/certs/quangviet-ca.crt" >> /etc/ldap/ldap.conf
```
Trong GLPI: `Setup > Authentication > LDAP directories > [chọn directory] > Tick "Sử dụng TLS"`.

## Verify
```bash
ldapsearch -x -ZZ -H ldap://dc01.quangviet.local -D "svc-glpi-ldap@quangviet.local" \
  -W -b "DC=quangviet,DC=local" "(sAMAccountName=itadmin)"
```
Lệnh chạy thành công với `-ZZ` (bắt buộc StartTLS) nghĩa là kết nối mã hóa hoạt động đúng.

## Troubleshooting
| Lỗi | Nguyên nhân | Cách xử lý |
|---|---|---|
| `ldap_start_tls: Connect error` | Thiếu/sai CA cert | Kiểm tra lại đường dẫn trong `ldap.conf` |
| GLPI vẫn kết nối được dù TLS lỗi | GLPI fallback về LDAP thường | Kiểm tra log Apache, xác nhận cổng và cờ TLS đúng |

**Tiếp theo:** [[05 LDAPS]]
