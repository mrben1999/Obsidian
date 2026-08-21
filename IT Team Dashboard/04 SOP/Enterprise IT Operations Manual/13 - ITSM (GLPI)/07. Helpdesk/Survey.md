---
tags: [glpi, helpdesk, survey]
---

# Survey — Khảo sát hài lòng sau xử lý ticket

Liên quan: [[04 SOP/Enterprise IT Operations Manual/13 - ITSM (GLPI)/12. Reports/KPI]]

## Checklist
- [ ] Bật khảo sát tự động khi ticket chuyển "Đã đóng"
- [ ] Thiết kế bộ câu hỏi ngắn gọn (điểm hài lòng 1-5 + góp ý tự do)
- [ ] Đưa kết quả khảo sát vào báo cáo KPI hàng tháng

## Command / Cấu hình GLPI
`Setup > Service Levels > Satisfaction survey` — bật cho toàn bộ Entity, tần suất gửi ngay khi ticket đóng, hoặc gộp gửi 1 lần/tuần để tránh làm phiền.

## Verify
Đóng thử 1 ticket, xác nhận email khảo sát gửi tới người tạo ticket, kết quả ghi nhận đúng vào `Tools > Reports / Statistics`.

## Troubleshooting
| Lỗi | Nguyên nhân | Cách xử lý |
|---|---|---|
| Tỷ lệ phản hồi khảo sát rất thấp | Khảo sát quá dài hoặc gửi quá thường xuyên | Rút gọn còn 1-2 câu hỏi, gộp tần suất gửi |

---
**Hoàn tất chương Helpdesk.** Tiếp theo: [[04 SOP/Enterprise IT Operations Manual/13 - ITSM (GLPI)/08. Automation/Cron]]
