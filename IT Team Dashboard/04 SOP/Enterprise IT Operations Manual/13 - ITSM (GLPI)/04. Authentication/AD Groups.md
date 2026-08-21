---
tags: [glpi, authentication, groups]
---

# AD Groups — Nhóm người dùng trong Active Directory

Liên quan: [[07 Sync]] · [[Group Mapping]] · [[Profiles]]

## Checklist
- [ ] Thống nhất danh sách nhóm phòng ban + nhóm chức năng GLPI với team AD
- [ ] Tạo nhóm chức năng GLPI riêng (không dùng chung nhóm phòng ban)
- [ ] Đồng bộ nhóm vào GLPI qua LDAP

## Danh sách nhóm tại Quảng Việt

**Nhóm phòng ban (đã có sẵn trên AD):**
```
HR
IT
QA
QC
PPIC
WH
KinhDoanh
KeToan
```

**Nhóm chức năng dành riêng cho GLPI (cần tạo mới):**
```
GLPI-Admins
GLPI-Technicians
GLPI-SelfService
GLPI-Managers
```

## Command
```powershell
New-ADGroup -Name "GLPI-Admins" -GroupScope Global -Path "OU=GLPI-Groups,DC=quangviet,DC=local"
New-ADGroup -Name "GLPI-Technicians" -GroupScope Global -Path "OU=GLPI-Groups,DC=quangviet,DC=local"
New-ADGroup -Name "GLPI-SelfService" -GroupScope Global -Path "OU=GLPI-Groups,DC=quangviet,DC=local"
New-ADGroup -Name "GLPI-Managers" -GroupScope Global -Path "OU=GLPI-Groups,DC=quangviet,DC=local"

Add-ADGroupMember -Identity "GLPI-Technicians" -Members "nguyenvana","tranthib"
```

## Verify
```powershell
Get-ADGroupMember -Identity "GLPI-Technicians"
```
Trong GLPI: `Setup > Authentication > LDAP directories > Tab Nhóm` → chạy đồng bộ, xác nhận nhóm xuất hiện đủ trong `Administration > Groups`.

## Troubleshooting
| Lỗi | Nguyên nhân | Cách xử lý |
|---|---|---|
| Nhóm sync về GLPI nhưng rỗng thành viên | Thiếu mapping thuộc tính `member` | Kiểm tra tab "Nhóm" trong cấu hình LDAP directory |
| Nhân viên đã vào nhóm AD nhưng GLPI chưa nhận | Chưa chạy lại sync | Chạy tay `cron.php` hoặc đợi chu kỳ 1 giờ |

**Tiếp theo:** [[Group Mapping]]
