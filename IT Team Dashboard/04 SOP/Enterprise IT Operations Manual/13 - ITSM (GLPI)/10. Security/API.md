---
tags: [glpi, security, api]
---

# API — Bảo mật REST API

Liên quan: [[Actions]] · [[Audit]]

## Checklist
- [ ] Chỉ bật API cho các IP/ứng dụng cần thiết
- [ ] Dùng App-Token + User-Token, không dùng basic auth cho production
- [ ] Rà soát định kỳ danh sách token đang hoạt động

## Command / Cấu hình GLPI
`Setup > General > API` → bật API, tạo App-Token riêng cho từng ứng dụng tích hợp (không dùng chung 1 token cho mọi thứ).
```bash
curl -X GET "https://glpi.quangviet.local/apirest.php/initSession" \
  -H "Authorization: user_token YOUR_TOKEN" -H "App-Token: YOUR_APP_TOKEN"
```

## Verify
```bash
curl -X GET "https://glpi.quangviet.local/apirest.php/initSession" -H "App-Token: SAI_TOKEN"
```
Phải trả lỗi 400/401 khi dùng token sai.

## Troubleshooting
| Lỗi | Nguyên nhân | Cách xử lý |
|---|---|---|
| API bị lạm dụng gọi quá nhiều request | Không có rate limit | Cân nhắc đặt reverse proxy giới hạn rate cho endpoint `/apirest.php` |

**Tiếp theo:** [[Audit]]
