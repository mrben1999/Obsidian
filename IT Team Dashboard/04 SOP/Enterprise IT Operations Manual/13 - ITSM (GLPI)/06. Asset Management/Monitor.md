---
tags: [glpi, asset, monitor]
---

# Monitor — Quản lý màn hình

Liên quan: [[Computer]] · [[Asset]]

## Checklist
- [ ] Import tự động qua Agent (EDID) khi có thể
- [ ] Nhập thủ công cho màn hình rời không tự nhận diện được
- [ ] Liên kết Monitor với Computer đang sử dụng

## Command / Cấu hình GLPI
`Assets > Monitors > Add` — Serial, Model, Kích thước, người dùng, vị trí.
Liên kết: vào Computer tương ứng > tab "Thành phần" > thêm Monitor.

## Verify
Đối chiếu số lượng Monitor trong GLPI với số Computer đang hoạt động — chênh lệch lớn là dấu hiệu thiếu dữ liệu nhập tay.

## Troubleshooting
| Lỗi | Nguyên nhân | Cách xử lý |
|---|---|---|
| Monitor tự tạo bị trùng liên tục | EDID không đọc được Serial ổn định | Chuyển quản lý thủ công cho model đó |

**Tiếp theo:** [[04 SOP/Enterprise IT Operations Manual/13 - ITSM (GLPI)/06. Asset Management/Printer]]
