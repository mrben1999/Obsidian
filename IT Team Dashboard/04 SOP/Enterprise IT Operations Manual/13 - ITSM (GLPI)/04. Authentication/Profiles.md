---
tags: [glpi, authentication, profiles]
---

# Profiles — Phân quyền chi tiết

Liên quan: [[Group Mapping]] · [[Entities]]

## Checklist
- [ ] Cấu hình quyền chi tiết cho 4 Profile chính
- [ ] Đặt Profile mặc định = Self-Service
- [ ] Test từng Profile bằng tài khoản thật

## Ma trận quyền tóm tắt
| Module | Super Admin | Technician | Supervisor | Self-Service |
|---|---|---|---|---|
| Quản trị hệ thống | Toàn quyền | Không | Không | Không |
| Tài sản (xem) | Toàn quyền | Có | Có | Không |
| Tài sản (sửa) | Toàn quyền | Có | Không | Không |
| Ticket (tạo) | Có | Có | Có | Có (chỉ của mình) |
| Ticket (xử lý) | Có | Có | Có | Không |
| Dashboard/Báo cáo | Có | Hạn chế | Có | Không |

## Command / Cấu hình GLPI
`Administration > Profiles > [select Profile] > từng tab (Tài sản, Hỗ trợ, Administration...)` tick quyền theo bảng trên.

`Setup > Authentication > Setup` → Profile mặc định = `Self-Service`.

## Verify
Đăng nhập thử bằng 1 tài khoản mỗi Profile, xác nhận:
- Self-Service: chỉ thấy menu tạo/xem ticket của mình
- Technician: thấy ticket được gán, thấy tài sản, không thấy menu Administration
- Supervisor: thêm quyền xem Dashboard/báo cáo
- Super Admin: toàn quyền

## Troubleshooting
| Lỗi | Nguyên nhân | Cách xử lý |
|---|---|---|
| User thấy toàn bộ ticket công ty dù là Self-Service | Bật nhầm quyền "Xem tất cả" trong tab Hỗ trợ | Tắt lại quyền tương ứng |
| Technician không đổi được trạng thái ticket | Thiếu quyền Update trong tab Hỗ trợ | Bật lại quyền |

---
**Hoàn tất chương Authentication.** Tiếp theo: [[GLPI Agent]]
