---
tags: [glpi, troubleshooting, mail]
---

# Troubleshooting: Mail

Liên quan: [[Notification]] · [[Mail Collector]]

## Checklist chẩn đoán
- [ ] Test SMTP gửi thử trong `Setup > Notifications`
- [ ] Test IMAP kết nối trong cấu hình Mail Collector
- [ ] Kiểm tra SPF/DKIM cho domain gửi
- [ ] Kiểm tra log Apache/PHP tìm lỗi kết nối mail server

## Bảng lỗi nhanh
| Triệu chứng | Nguyên nhân | Xử lý |
|---|---|---|
| "Could not authenticate" | Basic auth bị chặn (M365) | Dùng App Password/OAuth2 |
| Mail vào Spam | Thiếu SPF/DKIM | Phối hợp team mail cấu hình |
| Không tạo ticket từ mail | Mailcollector lỗi/tần suất sai | Kiểm tra [[Mail Fetch]] |

**Xem tiếp:** [[Inventory Troubleshooting]]
