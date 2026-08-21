---
tags: [glpi, helpdesk, notification]
---

# Notification — Thông báo tự động

Liên quan: [[Escalation]] · [[Mail Collector]] · [[Mail Fetch]]

## Checklist
- [ ] Cấu hình SMTP server gửi mail
- [ ] Bật các sự kiện thông báo cần thiết
- [ ] Tùy chỉnh template email theo thương hiệu Quảng Việt

## Command / Cấu hình GLPI
`Setup > Notifications > Setup`:
| Trường | Giá trị |
|---|---|
| SMTP Host | smtp.office365.com |
| Port | 587 (STARTTLS) |
| Tài khoản | noreply-glpi@quangviet.com.vn |

Bật tối thiểu: Ticket mới, Ticket có phản hồi, SLA sắp vi phạm, Yêu cầu chờ duyệt.

## Verify
`Setup > Notifications > Notification templates > gửi thử` — kiểm tra mail đến đúng hộp thư test trong vòng 1 phút.

## Troubleshooting
| Lỗi | Nguyên nhân | Cách xử lý |
|---|---|---|
| "SMTP Error: Could not authenticate" | Basic auth bị chặn (M365) | Dùng App Password hoặc OAuth2 relay |
| Mail vào Spam | Thiếu SPF/DKIM cho domain gửi | Phối hợp team mail cấu hình SPF cho `quangviet.com.vn` |

**Tiếp theo:** [[Mail Collector]]
