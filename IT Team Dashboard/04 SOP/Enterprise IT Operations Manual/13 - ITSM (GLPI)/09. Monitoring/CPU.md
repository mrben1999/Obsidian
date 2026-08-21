---
tags: [glpi, monitoring, cpu]
---

# CPU — Giám sát tải xử lý

Liên quan: [[RAM]] · [[Apache]]

## Checklist
- [ ] Theo dõi CPU load trung bình
- [ ] Xác định thời điểm tải cao (thường trùng giờ chạy Discovery/backup)
- [ ] Cảnh báo khi load vượt ngưỡng kéo dài

## Command
```bash
uptime
top -bn1 | head -15
mpstat 1 5   # cần cài sysstat
```

## Verify
So sánh load average với số CPU core (`nproc`) — load > số core kéo dài là dấu hiệu quá tải cần nâng cấp hoặc giãn lịch tác vụ nặng.

## Troubleshooting
| Lỗi | Nguyên nhân | Cách xử lý |
|---|---|---|
| CPU tăng đột biến định kỳ | Trùng lịch Network Discovery + Backup cùng giờ | Giãn lịch các tác vụ nặng ra các khung giờ khác nhau |

**Tiếp theo:** [[RAM]]
