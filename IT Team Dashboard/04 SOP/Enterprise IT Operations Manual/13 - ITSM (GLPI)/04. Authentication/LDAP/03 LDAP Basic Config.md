---
tags: [glpi, authentication, ldap]
---

# 03 LDAP Basic Config — Cấu hình LDAP directory trong GLPI

Liên quan: [[02 Delegation]] · [[04 TLS]] · [[07 Sync]]

## Checklist
- [ ] Tạo LDAP directory trong GLPI
- [ ] Khai báo BaseDN, bind account
- [ ] Map thuộc tính (email, tên, điện thoại)
- [ ] Test import 5-10 user mẫu

## Command / Cấu hình GLPI
`Setup > Authentication > LDAP directories > Thêm mới`

| Trường | Giá trị |
|---|---|
| Tên | AD QuangViet |
| Máy chủ | `dc01.quangviet.local` |
| Cổng | 389 (chuyển 636 sau khi làm [[05 LDAPS]]) |
| BaseDN | `DC=quangviet,DC=local` |
| Tài khoản kết nối | `svc-glpi-ldap@quangviet.local` |
| Bộ lọc kết nối | `(&(objectClass=user)(!(objectClass=computer)))` |

Mapping (`Tab Thuộc tính LDAP`):
| GLPI | AD |
|---|---|
| login_field | sAMAccountName |
| email1_field | mail |
| realname | sn |
| firstname | givenName |
| phone | telephoneNumber |

## Verify
Nút **Test** trong màn hình cấu hình → phải trả "Kết nối thành công". Sau đó dùng **Import người dùng mới**, chọn 5-10 user thử.

```bash
apt install -y ldap-utils
ldapsearch -x -H ldap://dc01.quangviet.local -D "svc-glpi-ldap@quangviet.local" \
  -W -b "DC=quangviet,DC=local" "(sAMAccountName=itadmin)"
```

## Troubleshooting
| Lỗi | Nguyên nhân | Cách xử lý |
|---|---|---|
| "Kết nối thất bại" | Sai BaseDN hoặc bind account bị khóa | Test bằng `ldapsearch` trước khi cấu hình trên GLPI |
| Import 0 user dù filter đúng | Thiếu delegate quyền | Xem lại [[02 Delegation]] |
| Import thiếu email | Sai mapping | Kiểm tra thuộc tính thật bằng `ldapsearch -x` |

**Tiếp theo:** [[04 TLS]]
