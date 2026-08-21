---
tags: [glpi, helpdesk, ola]
---

# OLA — Thỏa thuận mức độ vận hành nội bộ

Liên quan: [[SLA]] · [[Escalation]]

## Checklist
- [ ] Phân biệt rõ SLA (cam kết với người dùng cuối) và OLA (cam kết nội bộ giữa các nhóm IT)
- [ ] Setup OLA cho các bước bàn giao giữa Level 1 → Level 2 → NetworkTeam
- [ ] Theo dõi tuân thủ OLA riêng với SLA

## Command / Cấu hình GLPI
GLPI không có module OLA tách biệt mặc định — mô phỏng bằng cách tạo SLA phụ áp dụng cho từng bước xử lý nội bộ, hoặc dùng trường "Thời gian nội bộ" (Internal time) trong Ticket, kết hợp Business Rule gán deadline riêng cho từng nhóm.

## Verify
Theo dõi thời gian ticket nằm ở mỗi nhóm (Level 1 → Level 2) qua lịch sử ticket, đối chiếu với OLA nội bộ đã thống nhất (ví dụ Level 1 phải chuyển Level 2 trong 30 phút nếu không xử lý được).

## Troubleshooting
| Lỗi | Nguyên nhân | Cách xử lý |
|---|---|---|
| Không đo được thời gian ticket "kẹt" ở từng nhóm | GLPI mặc định chỉ đo tổng thời gian, không đo từng chặng | Dùng [[../12. Reports/SQL|báo cáo SQL tùy chỉnh]] để tính khoảng thời gian giữa các lần đổi nhóm phụ trách |

**Tiếp theo:** [[Escalation]]
