---
tags: [glpi, helpdesk, categories]
---

# Categories — Danh mục phân loại Ticket

Liên quan: [[Templates]] · [[Business Rules]]

## Checklist
- [ ] Thiết kế cây danh mục ITIL phù hợp Quảng Việt
- [ ] Giới hạn số lượng danh mục (không quá 20 mục)
- [ ] Gán danh mục mặc định cho từng Template

## Command / Cấu hình GLPI
`Setup > Dropdowns > Danh mục ITIL`:
```
Phần cứng
  - Máy tính hỏng
  - Máy in
Phần mềm
  - Cài đặt/license
  - Lỗi ứng dụng nội bộ
Mạng
  - Mất kết nối
  - VPN
Tài khoản
  - Reset password
  - Cấp quyền mới
```

## Verify
Tạo thử 1 ticket cho mỗi danh mục cấp 2, xác nhận hiển thị đúng trên Self-Service Portal.

## Troubleshooting
| Lỗi | Nguyên nhân | Cách xử lý |
|---|---|---|
| Nhân viên chọn sai danh mục thường xuyên | Danh mục quá nhiều/không rõ nghĩa | Rút gọn, đặt tên theo ngôn ngữ người dùng cuối hiểu được (không dùng thuật ngữ IT) |

**Tiếp theo:** [[Templates]]
