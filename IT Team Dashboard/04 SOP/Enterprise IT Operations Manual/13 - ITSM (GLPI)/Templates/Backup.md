---
tags: [glpi, template]
---

# Template: Nhật ký Backup thủ công (ngoài lịch tự động)

Liên quan: [[Backup Cron]]

## Thông tin
- **Lý do backup thủ công:** (VD: trước khi upgrade GLPI, trước khi cài plugin mới)
- **Người thực hiện:** ______________________
- **Thời gian:** ______________________

## Checklist
- [ ] Backup Database (xem [[MariaDB Backup]])
- [ ] Backup Files (xem [[Files Backup]])
- [ ] Backup Plugins nếu liên quan (xem [[Plugins Backup]])
- [ ] Verify file backup không lỗi (`gunzip -t`, `tar -tzf`)
- [ ] Ghi lại vị trí lưu trữ file backup này

## Vị trí lưu trữ
______________________

**Liên kết:** [[Restore]]
