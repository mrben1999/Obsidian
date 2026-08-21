---
tags: [glpi, template]
---

# Template: Release (Triển khai phiên bản/cập nhật)

Liên quan: [[Change]] · [[Maintenance]]

## Thông tin Release
- **Tên/Version:** ______________________
- **Ngày dự kiến triển khai:** ______________________
- **Người phụ trách:** ______________________

## Nội dung thay đổi
______________________

## Kế hoạch kiểm thử trước khi release
- [ ] Test trên môi trường staging
- [ ] Backup production trước khi release (xem [[Backup Cron]])
- [ ] Thông báo người dùng trước thời gian bảo trì (xem [[Maintenance]])

## Checklist sau release
- [ ] Verify chức năng chính hoạt động bình thường
- [ ] Theo dõi log lỗi trong 24h đầu ([[Logs]])
- [ ] Sẵn sàng phương án rollback nếu phát sinh lỗi nghiêm trọng

**Liên kết:** [[Change]] · [[Maintenance]]
