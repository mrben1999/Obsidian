---
tags: [glpi, inventory, tags]
---

# Tags — Gắn thẻ phân loại lúc cài Agent

Liên quan: [[GLPI Agent]] · [[Rules]]

## Checklist
- [ ] Chuẩn hóa quy ước đặt tên TAG cho toàn công ty
- [ ] Áp dụng TAG nhất quán khi deploy (GPO/PDQ/Intune)
- [ ] Dùng TAG làm điều kiện gán Entity trong Rules

## Quy ước TAG tại Quảng Việt
```
QV-HN         Máy trạm chi nhánh Hà Nội
QV-HCM        Máy trạm chi nhánh Hồ Chí Minh
QV-Server     Máy chủ (bất kể vị trí)
QV-Remote     Laptop làm việc từ xa
QV-Mac        Thiết bị macOS
```

## Command
```bash
glpi-agent --server=https://glpi.quangviet.local/front/inventory.php --tag=QV-HCM
```

## Verify
Kiểm tra `Assets > Computers > [select device] > Inventory tab` — trường Tag phải khớp quy ước.

## Troubleshooting
| Lỗi | Nguyên nhân | Cách xử lý |
|---|---|---|
| Tag không nhất quán giữa các đội deploy | Thiếu tài liệu hóa quy ước | Dùng chính file này làm chuẩn tham chiếu bắt buộc |
| Tag đúng nhưng rule không match | Rule dùng sai tên field hoặc phân biệt hoa/thường | Kiểm tra chính xác giá trị TAG trong GLPI, so khớp case-sensitive |

**Tiếp theo:** [[Fusion Inventory Migration]]
