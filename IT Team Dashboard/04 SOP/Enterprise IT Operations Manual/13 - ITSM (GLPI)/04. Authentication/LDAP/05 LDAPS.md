---
tags: [glpi, authentication, ldap]
---

# 05 LDAPS — LDAP over SSL (port 636)

Liên quan: [[04 TLS]] · [[06 Test]]

## Checklist
- [ ] AD CS đã publish chứng chỉ LDAPS cho Domain Controller
- [ ] Đổi cổng kết nối GLPI sang 636
- [ ] Test kết nối LDAPS trước khi áp dụng production

## Command / Cấu hình GLPI
`Setup > Authentication > LDAP directories`:
| Trường | Giá trị mới |
|---|---|
| Cổng | 636 |
| Kết nối bảo mật | LDAPS |

```bash
openssl s_client -connect dc01.quangviet.local:636 -showcerts </dev/null
```

## Verify
```bash
ldapsearch -x -H ldaps://dc01.quangviet.local:636 -D "svc-glpi-ldap@quangviet.local" \
  -W -b "DC=quangviet,DC=local" "(sAMAccountName=itadmin)"
```
Trong GLPI, nút **Test** phải trả thành công với cổng 636.

## Troubleshooting
| Lỗi | Nguyên nhân | Cách xử lý |
|---|---|---|
| `Can't contact LDAP server` trên 636 | DC chưa có chứng chỉ LDAPS hợp lệ | Phối hợp team AD cấp chứng chỉ qua AD CS |
| Chứng chỉ hết hạn định kỳ gây gián đoạn | Không theo dõi ngày hết hạn | Thêm vào [[../../09. Monitoring/Certificates Monitoring]] |

**Tiếp theo:** [[06 Test]]
