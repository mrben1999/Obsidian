---
tags: [glpi, helpdesk, mail-collector]
---

# Mail Collector — Tạo ticket tự động từ email

Liên quan: [[Notification]] · [[Mail Fetch]]

## Checklist
- [ ] Tạo hộp thư dùng chung `helpdesk@quangviet.com.vn`
- [ ] Cấu hình kết nối IMAP trong GLPI
- [ ] Setup rule lọc chống spam/email rác

## Command / Cấu hình GLPI
`Setup > Receivers`:
| Trường | Giá trị |
|---|---|
| Máy chủ | `imap.office365.com` |
| Kết nối | `imap/ssl` |
| Tài khoản | helpdesk@quangviet.com.vn |

## Verify
Gửi thử 1 email tới `helpdesk@quangviet.com.vn`, đợi tối đa 5 phút (chu kỳ cron), xác nhận ticket được tạo với đúng tiêu đề/nội dung/người yêu cầu.

## Troubleshooting
| Lỗi | Nguyên nhân | Cách xử lý |
|---|---|---|
| Không tạo ticket dù có mail mới | Sai chuỗi kết nối IMAP | Test bằng nút "Test" trong cấu hình |
| Ticket tạo với người yêu cầu "Anonymous" | Email gửi không khớp email user nào trong GLPI | Đảm bảo `email1_field` đồng bộ đúng từ [[03 LDAP Basic Config]] |

**Tiếp theo:** [[Knowledge Base]]
