---
tags: [glpi, security, audit]
---

# Audit — Kiểm toán hoạt động hệ thống

Liên quan: [[API]] · [[Software]]

## Checklist
- [ ] Bật ghi log lịch sử thay đổi (History) cho các đối tượng quan trọng
- [ ] Rà soát định kỳ tài khoản Super Admin (ai đang có quyền này)
- [ ] Rà soát phần mềm không rõ nguồn gốc theo [[Software]]

## Command / Cấu hình GLPI
`Setup > General > History` — bật ghi log cho Ticket, Computer, User.
Query rà soát tài khoản Super Admin:
```sql
SELECT u.name FROM glpi_profiles_users pu
JOIN glpi_profiles p ON pu.profiles_id = p.id
JOIN glpi_users u ON pu.users_id = u.id
WHERE p.name = 'Super-Admin';
```

## Verify
Chạy query trên hàng quý, đối chiếu danh sách với nhân sự IT hiện tại — phát hiện tài khoản dư thừa (nhân viên đã nghỉ việc/đổi vai trò).

## Troubleshooting
| Lỗi | Nguyên nhân | Cách xử lý |
|---|---|---|
| Tài khoản cũ vẫn còn quyền Super Admin | Thiếu quy trình rà soát định kỳ | Đưa vào lịch review bảo mật hàng quý |

---
**Hoàn tất chương Security.** Tiếp theo: [[MariaDB Backup]]
