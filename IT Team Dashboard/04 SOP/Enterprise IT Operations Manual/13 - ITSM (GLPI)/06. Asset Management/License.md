---
tags: [glpi, asset, license]
---

# License — Quản lý bản quyền phần mềm

Liên quan: [[Software]] · [[Licenses Reports]]

## Checklist
- [ ] Nhập toàn bộ license phần mềm công ty đang sở hữu (Windows, Office, Antivirus...)
- [ ] Gán số lượng license và theo dõi số đang sử dụng
- [ ] Setup cảnh báo license sắp hết hạn/sắp hết số lượng

## Command / Cấu hình GLPI
`Assets > Software > Licenses > Add` — nhập Loại phần mềm, số serial/product key, số lượng mua, ngày hết hạn (với license thuê bao).
Liên kết license với từng Computer sử dụng qua tab "Máy tính" của License.

## Verify
`Assets > Software > Licenses` — cột "Đã cài đặt/Tổng số" phải phản ánh đúng thực tế, không vượt quá số lượng đã mua (tránh vi phạm bản quyền).

## Troubleshooting
| Lỗi | Nguyên nhân | Cách xử lý |
|---|---|---|
| Số máy cài vượt số license mua | Cài đặt không qua kiểm soát IT | Rà soát qua [[Software]] (dữ liệu quét tự động từ Agent) đối chiếu License |
| License thuê bao hết hạn không ai biết | Thiếu cảnh báo | Xem [[Licenses Reports]] |

**Tiếp theo:** [[Software]]
