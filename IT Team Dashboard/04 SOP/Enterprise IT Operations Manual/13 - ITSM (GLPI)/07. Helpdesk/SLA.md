---
tags: [glpi, helpdesk, sla]
---

# SLA — Thỏa thuận mức độ dịch vụ

Liên quan: [[Business Rules]] · [[OLA]] · [[Escalation]]

## Checklist
- [ ] Định nghĩa mức ưu tiên + thời gian phản hồi/giải quyết
- [ ] Gán lịch làm việc (Calendar) đúng giờ hành chính Quảng Việt
- [ ] Gán SLA tự động theo Category/Entity

## Bảng SLA
| Mức ưu tiên | TTO | TTR |
|---|---|---|
| Rất cao | 15 phút | 2 giờ |
| Cao | 30 phút | 4 giờ |
| Trung bình | 2 giờ | 1 ngày làm việc |
| Thấp | 4 giờ | 3 ngày làm việc |

## Command / Cấu hình GLPI
`Setup > Service Levels > SLA > Thêm mới`, gán Calendar "QuangViet-GioHanhChinh" (8:00-17:30, T2-T6, trừ ngày lễ VN).

## Verify
Tạo ticket test ngoài giờ hành chính, xác nhận đồng hồ SLA không chạy trong giờ nghỉ.

## Troubleshooting
| Lỗi | Nguyên nhân | Cách xử lý |
|---|---|---|
| SLA tính cả giờ nghỉ trưa/đêm | Sai Calendar gán | Kiểm tra lại tab "Lịch làm việc" |
| Ticket không có SLA nào áp dụng | Thiếu rule gán mặc định | Bổ sung rule catch-all trong [[Business Rules]] |

**Tiếp theo:** [[OLA]]
