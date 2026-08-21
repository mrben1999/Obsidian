---
tags: [glpi, authentication, mapping]
---

# Group Mapping — Ánh xạ Nhóm AD → Profile GLPI

Liên quan: [[AD Groups]] · [[Profiles]] · [[Entities]]

## Checklist
- [ ] Tạo rule gán Profile tự động theo nhóm AD
- [ ] Sắp xếp thứ tự rule đúng ưu tiên
- [ ] Test bằng tài khoản mẫu từng nhóm

## Bảng ánh xạ

```
GLPI-Admins        →  Super Admin
GLPI-Technicians   →  Technician
GLPI-Managers      →  Supervisor
GLPI-SelfService   →  Self-Service (mặc định toàn công ty)
```

## Command / Cấu hình GLPI
`Administration > Rules > Rules for assigning authorizations to a user > Thêm mới`

| #                     | Điều kiện                          | Hành động              |
| --------------------- | ---------------------------------- | ---------------------- |
| 1                     | Thành viên nhóm `GLPI-Admins`      | Profile = Super Admin  |
| 2                     | Thành viên nhóm `GLPI-Technicians` | Profile = Technician   |
| 3                     | Thành viên nhóm `GLPI-Managers`    | Profile = Supervisor   |
| 4 (mặc định, để cuối) | (không điều kiện)                  | Profile = Self-Service |

## Verify
Dùng chức năng "Kiểm tra" (Simulate) của rule engine, nhập user mẫu từ mỗi nhóm, xác nhận Profile gán đúng dự kiến trước khi lưu chính thức.

## Troubleshooting
| Lỗi | Nguyên nhân | Cách xử lý |
|---|---|---|
| Tất cả user đều nhận Self-Service dù thuộc nhóm Technician | Rule mặc định nằm sai vị trí (lên trên) | Kéo rule mặc định xuống cuối danh sách |
| User thuộc 2 nhóm cùng lúc bị gán sai Profile | Rule dừng ở match đầu tiên | Sắp xếp lại thứ tự ưu tiên theo cấp quyền cao → thấp |

**Tiếp theo:** [[Entities]]
