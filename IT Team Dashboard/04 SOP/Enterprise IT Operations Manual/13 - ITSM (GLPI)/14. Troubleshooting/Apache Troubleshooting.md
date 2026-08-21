---
tags: [glpi, troubleshooting, apache]
---

# Troubleshooting: Apache

Liên quan: [[02 Apache]] · [[Apache]]

## Checklist chẩn đoán
- [ ] `apachectl configtest` — cú pháp cấu hình đúng?
- [ ] `systemctl status apache2` — service chạy?
- [ ] `tail -f /var/log/apache2/glpi_error.log`
- [ ] Kiểm tra DocumentRoot trỏ đúng `public/`

## Bảng lỗi nhanh
| Triệu chứng | Nguyên nhân | Xử lý |
|---|---|---|
| 403 Forbidden | Thiếu `Require all granted` | Sửa `<Directory>` |
| 404 trên `/front/...` | Thiếu `mod_rewrite` | `a2enmod rewrite` |
| Hiện danh sách thư mục | DocumentRoot sai | Trỏ đúng vào `glpi/public` |

**Xem tiếp:** [[PHP Troubleshooting]]
