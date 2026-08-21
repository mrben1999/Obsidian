---
tags: [glpi, troubleshooting, marketplace]
---

# Troubleshooting: Marketplace

Liên quan: [[08 Marketplace]]

## Checklist chẩn đoán
- [ ] `bin/console plugin:list` — trạng thái plugin
- [ ] Kiểm tra bảng tương thích version plugin ↔ version GLPI
- [ ] Kiểm tra quyền thư mục `marketplace/`

## Bảng lỗi nhanh
| Triệu chứng | Nguyên nhân | Xử lý |
|---|---|---|
| Cài xong trang trắng | Plugin không tương thích version | Kiểm tra bảng tương thích trước khi cài |
| Plugin không hiện trong danh sách | Sai quyền thư mục | `chown -R www-data:www-data` |
| Plugin tự tắt sau update GLPI | Hành vi mặc định khi chưa xác nhận tương thích | Cập nhật plugin version mới rồi kích hoạt lại |

**Xem tiếp:** [[Plugin Troubleshooting]]
