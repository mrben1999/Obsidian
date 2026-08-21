---
tags: [glpi, automation, inventory]
---

# Inventory Automation — Tự động hóa chu kỳ kiểm kê

Liên quan: [[GLPI Agent]] · [[Network Discovery]]

## Checklist
- [ ] Đặt tần suất agent gửi báo cáo hợp lý (khuyến nghị 24h)
- [ ] Lên lịch Network Discovery định kỳ hàng tuần
- [ ] Giám sát thiết bị lâu ngày không gửi inventory (nghi ngờ offline/gỡ agent)

## Command
Tần suất agent (file cấu hình agent, xem [[GLPI Agent]]):
```ini
delaytime = 86400
```
Query kiểm tra thiết bị lâu không cập nhật:
```sql
SELECT name, last_inventory_update FROM glpi_computers
WHERE last_inventory_update < NOW() - INTERVAL 30 DAY AND is_deleted = 0;
```

## Verify
Chạy query trên hàng tháng, đối chiếu danh sách máy "im lặng" với thực tế (máy đã thanh lý/nhân viên nghỉ việc hay thực sự lỗi agent).

## Troubleshooting
| Lỗi | Nguyên nhân | Cách xử lý |
|---|---|---|
| Nhiều máy không cập nhật inventory | Agent bị gỡ bởi antivirus hoặc user tự tắt | Kiểm tra qua [[Deploy GPO]], redeploy nếu cần |

**Tiếp theo:** [[Reports Automation]]
