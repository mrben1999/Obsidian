---
tags: [glpi, asset, laptop]
---

# Laptop — Quản lý máy tính xách tay

Liên quan: [[Computer]] · [[Cấp laptop]]

## Checklist
- [ ] Quản lý riêng biệt Laptop với Computer để bàn (khác chu kỳ khấu hao, dễ mất/hỏng hơn)
- [ ] Gán vị trí "di động" thay vì cố định
- [ ] Theo dõi tình trạng bảo hành/pin riêng

## Command / Cấu hình GLPI
GLPI dùng chung loại "Computer" nhưng phân biệt qua **Loại (Type)** = "Laptop" trong dropdown, giúp lọc báo cáo riêng.
`Assets > Computers > Add > Type = Laptop`

## Verify
Lọc `Assets > Computers` theo Loại = Laptop, đối chiếu số lượng với thực tế cấp phát cho nhân viên kinh doanh/quản lý.

## Troubleshooting
| Lỗi | Nguyên nhân | Cách xử lý |
|---|---|---|
| Laptop bị gán sai Entity liên tục | Rule Entity theo IP không phù hợp thiết bị di động | Chuyển sang gán theo TAG cố định, xem [[Tags]] |
| Không rõ laptop đang ở đâu | Thiếu cập nhật vị trí khi nhân viên di chuyển chi nhánh | Bắt buộc qua quy trình [[Đổi máy]] |

**Tiếp theo:** [[Monitor]]
