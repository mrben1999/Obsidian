---
tags: [glpi, reports, monthly]
---

# Monthly Reports — Báo cáo tổng hợp hàng tháng

Liên quan: [[04 SOP/Enterprise IT Operations Manual/13 - ITSM (GLPI)/12. Reports/KPI]] · [[Reports Automation]]

## Checklist
- [ ] Gộp toàn bộ báo cáo (Ticket, Asset, License, Warranty, KPI) vào 1 file gửi Ban Giám đốc
- [ ] Tự động hóa qua script + cron
- [ ] Lưu trữ báo cáo cũ để so sánh xu hướng theo thời gian

## Command
Kết hợp các query từ [[Tickets Reports]], [[Assets Reports]], [[Licenses Reports]], [[Warranty]], [[04 SOP/Enterprise IT Operations Manual/13 - ITSM (GLPI)/12. Reports/KPI]] vào 1 script tổng hợp — xem cấu trúc script mẫu tại [[Reports Automation]].

## Verify
Đầu mỗi tháng, xác nhận file báo cáo tổng hợp được gửi tự động, đối chiếu số liệu với dashboard trực tiếp trên GLPI.

## Troubleshooting
| Lỗi | Nguyên nhân | Cách xử lý |
|---|---|---|
| Báo cáo tháng thiếu 1 phần dữ liệu | 1 trong các script con lỗi | Kiểm tra log riêng từng script, không gộp lỗi chung |

---
**Hoàn tất chương Reports.** Tiếp theo: [[Tiếp nhận máy mới]]
