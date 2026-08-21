---
tags: [glpi, inventory, rules]
---

# Rules — Bộ quy tắc xử lý dữ liệu Inventory

Liên quan: [[GLPI Agent]] · [[Tags]] · [[Computer]]

## Checklist
- [ ] Cấu hình rule tránh trùng lặp thiết bị
- [ ] Cấu hình rule gán Entity theo IP/TAG
- [ ] Test rule bằng công cụ Simulate trước khi áp dụng

## Command / Cấu hình GLPI
`Administration > Rules > Rules for import and link of computers` — thứ tự ưu tiên nhận diện: Serial number → MAC address → Hostname.

Rule gán Entity theo dải IP:
| Điều kiện | Hành động |
|---|---|
| IP trong `10.10.10.0/24` | Entity = Chi nhánh Hà Nội |
| IP trong `10.20.20.0/24` | Entity = Chi nhánh Hồ Chí Minh |

## Verify
Dùng nút **"Kiểm tra"** trong màn hình Rule, nhập dữ liệu mẫu (XML inventory hoặc field giá trị) để xem preview kết quả trước khi lưu.

## Troubleshooting
| Lỗi | Nguyên nhân | Cách xử lý |
|---|---|---|
| 1 máy bị tạo thành 2 asset trùng | Đổi card mạng làm MAC thay đổi | Ưu tiên nhận diện theo Serial number |
| Máy laptop di chuyển bị đổi Entity liên tục | Rule theo IP không hợp với thiết bị di động | Chuyển sang gán theo [[Tags]] cố định |

**Tiếp theo:** [[Tags]]
