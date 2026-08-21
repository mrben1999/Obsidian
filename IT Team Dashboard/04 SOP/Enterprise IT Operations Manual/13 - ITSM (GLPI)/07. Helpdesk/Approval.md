---
tags: [glpi, helpdesk, approval]
---

# Approval — Quy trình phê duyệt

Liên quan: [[Business Rules]] · [[Notification]] · [[Change]]

## Checklist
- [ ] Xác định loại yêu cầu cần phê duyệt (cấp thiết bị, mua sắm, thay đổi hệ thống)
- [ ] Setup người phê duyệt theo Entity/phòng ban
- [ ] Cấu hình workflow phê duyệt nhiều cấp nếu cần

## Command / Cấu hình GLPI
Trong Ticket/Change, tab "Phê duyệt" — thêm Validator (người cụ thể hoặc nhóm).
Ví dụ workflow "Cấp thiết bị mới": `Nhân viên tạo ticket → Trưởng phòng duyệt → IT Manager duyệt ngân sách → IT xử lý`.

## Verify
Tạo ticket test loại "Cấp thiết bị", xác nhận Validator nhận được thông báo chờ duyệt và trạng thái ticket đứng yên cho tới khi duyệt xong.

## Troubleshooting
| Lỗi | Nguyên nhân | Cách xử lý |
|---|---|---|
| Ticket treo mãi ở trạng thái chờ duyệt | Validator không nhận mail | Kiểm tra [[Notification]] cho sự kiện "validation waiting" |
| Duyệt xong ticket không tự chuyển trạng thái | Thiếu Business Rule xử lý sau duyệt | Bổ sung rule trong [[Business Rules]] |

**Tiếp theo:** [[SLA]]
