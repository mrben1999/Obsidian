---
tags: [glpi, automation, mail]
---

# Mail Fetch — Vận hành tác vụ thu email tự động

Liên quan: [[Mail Collector]] · [[04 SOP/Enterprise IT Operations Manual/13 - ITSM (GLPI)/08. Automation/Cron]]

## Checklist
- [ ] Tác vụ "mailcollector" chạy mỗi 5 phút
- [ ] Giám sát log lỗi kết nối IMAP
- [ ] Xử lý email không tạo được ticket (mailbox lỗi)

## Command
Cấu hình kết nối chi tiết xem [[Mail Collector]].
```bash
# Kiểm tra log tác vụ mailcollector gần nhất
sudo -u www-data php /var/www/html/glpi/front/cron.php
```

## Verify
`Setup > Receivers > [chọn mailbox] > Nhật ký` — không có lỗi "connection failed" liên tục.

## Troubleshooting
| Lỗi | Nguyên nhân | Cách xử lý |
|---|---|---|
| Email tồn đọng không xử lý | Tác vụ mailcollector bị disable hoặc lỗi auth | Kiểm tra lại App Password/OAuth2 của mailbox |
| Ticket tạo trùng từ 1 mail | Lỗi đánh dấu "đã đọc" trên IMAP | Kiểm tra quyền ghi của tài khoản IMAP |

**Tiếp theo:** [[Certificate]]
