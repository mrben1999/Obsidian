---
tags: [glpi, asset, sim]
---

# SIM — Assets SIM/thuê bao di động

Liên quan: [[Phone]] · [[Cấp laptop]]

## Checklist
- [ ] Nhập danh sách SIM công ty cấp (data 4G/5G cho laptop, điện thoại)
- [ ] Gán người sử dụng + gói cước
- [ ] Theo dõi ngày gia hạn hợp đồng nhà mạng

## Command / Cấu hình GLPI
GLPI không có module SIM riêng mặc định — tạo dưới dạng "Line" (`Assets > Phones > Lines`):
`Assets > Phones > Lines > Add` — Số thuê bao, nhà mạng, gói cước, người sử dụng.

## Verify
Đối chiếu danh sách SIM trong GLPI với hóa đơn cước hàng tháng từ nhà mạng — phát hiện SIM không rõ người dùng cần thu hồi.

## Troubleshooting
| Lỗi | Nguyên nhân | Cách xử lý |
|---|---|---|
| SIM vẫn tính cước dù nhân viên đã nghỉ việc | Thiếu bước thu hồi SIM trong offboarding | Bổ sung vào SOP thu hồi tài sản, xem [[Thu hồi máy]] |

**Tiếp theo:** [[Phone]]
