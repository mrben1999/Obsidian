---
tags: [glpi, helpdesk, escalation]
---

# Escalation — Leo thang xử lý sự cố

Liên quan: [[SLA]] · [[Notification]] · [[../06. Asset Management/../07. Helpdesk/Approval|Approval]]

## Checklist
- [ ] Cấu hình escalation khi đạt 80% thời gian SLA
- [ ] Xác định người/nhóm nhận escalation (thường là Supervisor)
- [ ] Test escalation bằng ticket giả lập gần deadline

## Command / Cấu hình GLPI
Trong SLA ([[SLA]]), tab "Escalation" (hoặc "Cấp độ leo thang" — Escalation Level trong TTR):
| Ngưỡng | Hành động |
|---|---|
| 80% thời gian TTR | Gửi mail cảnh báo Supervisor |
| 100% thời gian TTR (vi phạm) | Gán lại ưu tiên "Rất cao", thông báo IT Manager |

## Verify
Tạo ticket test với SLA rút ngắn (ví dụ TTR = 10 phút cho mục đích test), xác nhận mail escalation gửi đúng người ở đúng ngưỡng % thời gian.

## Troubleshooting
| Lỗi | Nguyên nhân | Cách xử lý |
|---|---|---|
| Escalation không gửi mail | Notification chưa bật sự kiện tương ứng | Xem [[Notification]] |
| Escalation gửi quá nhiều lần gây phiền | Ngưỡng đặt trùng lặp nhiều cấp độ | Rà soát lại số cấp độ escalation, gộp bớt |

**Tiếp theo:** [[Notification]]
