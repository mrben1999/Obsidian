---
tags: [glpi, automation, actions]
---

# Actions — Hành động tự động nâng cao (Webhook/API)

Liên quan: [[API]] · [[Notifications]]

## Checklist
- [ ] Xác định kịch bản cần tích hợp ngoài (Slack/Teams thông báo ticket khẩn cấp)
- [ ] Bật GLPI REST API cho tích hợp
- [ ] Viết script/webhook nhận sự kiện và forward sang kênh khác

## Command
```bash
# Bật API trong GLPI: Setup > General > API
curl -X GET "https://glpi.quangviet.local/apirest.php/initSession" \
  -H "Authorization: user_token YOUR_TOKEN" \
  -H "App-Token: YOUR_APP_TOKEN"
```
Ví dụ script polling ticket ưu tiên "Rất cao" và gửi cảnh báo Microsoft Teams qua webhook:
```bash
curl -H "Content-Type: application/json" -d '{"text":"Ticket khẩn cấp mới!"}' \
  https://outlook.office.com/webhook/xxx
```

## Verify
Tạo ticket test với Priority = Rất cao, xác nhận webhook gửi cảnh báo tới kênh Teams trong vòng vài phút (theo chu kỳ polling script).

## Troubleshooting
| Lỗi | Nguyên nhân | Cách xử lý |
|---|---|---|
| API trả 401 Unauthorized | Token sai hoặc hết hạn | Tạo lại App-Token trong `Setup > General > API` |

**Tiếp theo:** [[Notifications]]
