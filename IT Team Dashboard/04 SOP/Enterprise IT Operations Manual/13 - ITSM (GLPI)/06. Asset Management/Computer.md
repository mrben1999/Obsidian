---
tags: [glpi, asset, computer]
---

# Computer — Quản lý máy tính để bàn/máy chủ

Liên quan: [[GLPI Agent]] · [[Laptop]] · [[Asset]]

## Checklist
- [ ] Xác nhận máy đã có Agent gửi inventory
- [ ] Cấu hình trạng thái vòng đời tài sản
- [ ] Gán người dùng + vị trí
- [ ] Liên kết hợp đồng mua hàng/bảo hành

## Command / Cấu hình GLPI
`Setup > Dropdowns > Trạng thái`: `Mới nhập kho → Đang sử dụng → Bảo trì → Chờ thanh lý → Đã thanh lý`
Vào từng Computer > tab "Chính" gán Người sử dụng + Vị trí (`Quảng Việt > Tầng 3 > Phòng Kinh doanh`).
Tab "Tài chính": số hóa đơn, nhà cung cấp, ngày mua, thời hạn bảo hành.

## Verify
`Assets > Inventory summary` — đối chiếu định kỳ danh sách GLPI với kiểm kê vật lý thực tế hàng năm.

## Troubleshooting
| Lỗi | Nguyên nhân | Cách xử lý |
|---|---|---|
| Máy hiện 2 bản ghi trùng | Rule import lỗi | Dùng "Hợp nhất" (Merge), xem [[Rules]] |
| Không thấy CPU/RAM | Agent chưa gửi đủ dữ liệu | Kiểm tra [[GLPI Agent]] |

**Tiếp theo:** [[Laptop]]
