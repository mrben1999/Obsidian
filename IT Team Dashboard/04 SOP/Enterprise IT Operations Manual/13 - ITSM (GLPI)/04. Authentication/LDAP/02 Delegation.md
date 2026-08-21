---
tags: [glpi, authentication, ldap]
---

# 02 Delegation — Phân quyền đọc trên AD

Liên quan: [[01 Create Service Account]] · [[03 LDAP Basic Config]]

## Checklist
- [ ] Delegate quyền Read cho `svc-glpi-ldap` trên các OU nhân sự
- [ ] Không cấp quyền Write/Full Control
- [ ] Ghi lại phạm vi delegate để audit sau này

## Command
Dùng **Delegation of Control Wizard** trên `Active Directory Users and Computers`:
1. Chuột phải OU (`OU=QuangViet_HN`, `OU=QuangViet_HCM`) → **Delegate Control**
2. Chọn user `svc-glpi-ldap`
3. Chọn task tùy chỉnh: **Read all user information**

Hoặc bằng `dsacls`:
```powershell
dsacls "OU=QuangViet_HN,DC=quangviet,DC=local" /I:S /G "QUANGVIET\svc-glpi-ldap:GR"
```

## Verify
```powershell
dsacls "OU=QuangViet_HN,DC=quangviet,DC=local" | Select-String "svc-glpi-ldap"
```

## Troubleshooting
| Lỗi | Nguyên nhân | Cách xử lý |
|---|---|---|
| GLPI import 0 user dù bind thành công | Delegate thiếu quyền đọc thuộc tính cụ thể (vd `mail`) | Chọn lại "Read all user information" thay vì task hẹp |
| Đọc được OU này nhưng không đọc được OU khác | Delegate chỉ áp cho 1 OU, không kế thừa | Lặp lại delegate cho từng OU liên quan |

**Tiếp theo:** [[03 LDAP Basic Config]]
