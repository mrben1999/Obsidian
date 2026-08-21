---
tags: [glpi, automation, notifications]
---

# Notifications — Vận hành & tối ưu hệ thống thông báo

Liên quan: [[Notification]] · [[Actions]]

## Checklist
- [ ] Rà soát định kỳ sự kiện thông báo nào gây spam
- [ ] Gộp thông báo theo digest (tổng hợp) cho các sự kiện tần suất cao
- [ ] Giám sát tỷ lệ mail bounce/failed

## Command
```bash
grep "notification" /var/log/apache2/glpi_error.log | tail -50
```
Cấu hình gốc xem [[Notification]].

## Verify
Theo dõi phản hồi từ nhân viên (khảo sát nội bộ nhanh) xem có phàn nàn về việc nhận quá nhiều/quá ít thông báo hay không, điều chỉnh lại danh sách sự kiện bật.

## Troubleshooting
| Lỗi | Nguyên nhân | Cách xử lý |
|---|---|---|
| Nhân viên báo nhận trùng nhiều mail cho 1 sự kiện | Bật trùng nhiều rule notification cho cùng sự kiện | Rà soát và gộp lại |

---
**Hoàn tất chương Automation.** Tiếp theo: [[Logs]]
