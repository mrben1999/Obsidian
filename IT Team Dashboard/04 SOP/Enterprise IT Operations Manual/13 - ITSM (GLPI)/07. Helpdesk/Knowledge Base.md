---
tags: [glpi, helpdesk, knowledge-base]
---

# Knowledge Base — Cơ sở tri thức

Liên quan: [[Ticket|../07. Helpdesk/Templates]] · [[04 SOP/Enterprise IT Operations Manual/13 - ITSM (GLPI)/Templates/Knowledge]]

## Checklist
- [ ] Xây dựng bài viết cho các sự cố lặp lại nhiều nhất
- [ ] Phân loại bài viết theo Category giống Ticket
- [ ] Cho phép nhân viên tự tra cứu trước khi tạo ticket (giảm tải Level 1)

## Command / Cấu hình GLPI
`Tools > Knowledge base > New article` — dùng mẫu tại [[04 SOP/Enterprise IT Operations Manual/13 - ITSM (GLPI)/Templates/Knowledge]].
Bật hiển thị gợi ý bài KB liên quan ngay khi nhân viên gõ tiêu đề ticket trên Self-Service Portal (`Setup > General > Assistance`).

## Verify
Tạo ticket thử với tiêu đề trùng 1 bài KB đã có, xác nhận hệ thống gợi ý đúng bài viết trước khi submit.

## Troubleshooting
| Lỗi | Nguyên nhân | Cách xử lý |
|---|---|---|
| Gợi ý KB không xuất hiện | Tính năng gợi ý chưa bật trong cấu hình | Kiểm tra `Setup > General > Assistance` |
| KB quá cũ, không cập nhật theo hệ thống mới | Thiếu quy trình review định kỳ | Thêm task review KB hàng quý vào [[../13. SOP]] |

**Tiếp theo:** [[Survey]]
