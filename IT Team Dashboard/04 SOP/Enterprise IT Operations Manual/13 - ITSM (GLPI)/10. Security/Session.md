---
tags: [glpi, security, session]
---

# Session — Quản lý phiên đăng nhập

Liên quan: [[Password Policy]] · [[03 PHP]]

## Checklist
- [ ] Đặt thời gian timeout session hợp lý
- [ ] Bật `session.cookie_secure` sau khi có HTTPS
- [ ] Giới hạn số phiên đồng thời nếu cần (tùy chính sách)

## Command
`/etc/php/8.3/apache2/php.ini`:
```ini
session.cookie_httponly = 1
session.cookie_secure = 1
session.gc_maxlifetime = 1800
```
`Setup > General > Security > Session` = 30 phút không hoạt động.

## Verify
Đăng nhập, không thao tác trong 30 phút, thử thao tác lại — hệ thống phải yêu cầu đăng nhập lại.

## Troubleshooting
| Lỗi | Nguyên nhân | Cách xử lý |
|---|---|---|
| Session hết hạn quá nhanh gây phiền | `gc_maxlifetime` đặt quá ngắn | Tăng lên hợp lý (30-60 phút) theo khẩu vị rủi ro công ty |

**Tiếp theo:** [[API]]
