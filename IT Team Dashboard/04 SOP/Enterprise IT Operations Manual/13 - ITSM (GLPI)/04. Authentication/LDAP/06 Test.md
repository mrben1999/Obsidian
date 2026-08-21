---
tags: [glpi, authentication, ldap]
---

# 06 Test — Kiểm thử toàn diện kết nối LDAP

Liên quan: [[05 LDAPS]] · [[07 Sync]] · [[08 Troubleshooting]]

## Checklist
- [ ] Test bind account từ CLI
- [ ] Test bind từ giao diện GLPI
- [ ] Test import user mẫu (5-10 người, nhiều OU khác nhau)
- [ ] Test đăng nhập thật bằng tài khoản AD của nhân viên

## Command
```bash
# Test 1: bind cơ bản
ldapsearch -x -H ldaps://dc01.quangviet.local:636 -D "svc-glpi-ldap@quangviet.local" -W \
  -b "DC=quangviet,DC=local" "(sAMAccountName=itadmin)"

# Test 2: đếm số user sẽ được import theo filter hiện tại
ldapsearch -x -H ldaps://dc01.quangviet.local:636 -D "svc-glpi-ldap@quangviet.local" -W \
  -b "DC=quangviet,DC=local" "(&(objectClass=user)(!(objectClass=computer)))" sAMAccountName | grep -c "sAMAccountName:"
```

## Verify
- Trong GLPI: `Setup > Authentication > LDAP directories > Test` → trạng thái xanh.
- `Import người dùng mới` → chọn thử 5 user ở OU HN, 5 user ở OU HCM → xác nhận đúng email/tên/phòng ban sau import.
- Nhờ 1 nhân viên thật đăng nhập thử vào `https://glpi.quangviet.local` bằng tài khoản AD của họ.

## Troubleshooting
Nếu bất kỳ bước nào ở trên fail, chuyển sang bài chuyên sâu: [[08 Troubleshooting]]

**Tiếp theo:** [[07 Sync]]
