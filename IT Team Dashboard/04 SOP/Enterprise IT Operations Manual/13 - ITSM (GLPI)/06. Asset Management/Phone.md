---
tags: [glpi, asset, phone]
---

# Phone — Quản lý điện thoại/thiết bị di động

Liên quan: [[SIM]] · [[Asset]]

## Checklist
- [ ] Nhập điện thoại công ty cấp (sale, giao hàng, quản lý)
- [ ] Gán IMEI, số thuê bao liên kết ([[SIM]])
- [ ] Quy trình thu hồi khi nghỉ việc

## Command / Cấu hình GLPI
`Assets > Phones > Add` — IMEI, Model, Người sử dụng, Nhà mạng.
Import hàng loạt từ Excel qua `Administration > Data Injection > Phones (plugin) or manual CSV import` nếu đã có danh sách cũ (định dạng cột IMEI là Text để tránh lỗi số khoa học).

## Verify
Đối chiếu IMEI trong GLPI với danh sách bảo hiểm thiết bị (nếu công ty có mua bảo hiểm mất/vỡ máy).

## Troubleshooting
| Lỗi | Nguyên nhân | Cách xử lý |
|---|---|---|
| Không rõ điện thoại đang ai giữ | Bàn giao ngang hàng không qua IT | Bắt buộc qua Ticket, xem [[../07. Helpdesk/Ticket]] |

**Tiếp theo:** [[UPS]]
