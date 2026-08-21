---
tags: [glpi, troubleshooting, php]
---

# Troubleshooting: PHP

Liên quan: [[03 PHP]]

## Checklist chẩn đoán
- [ ] `php -v` — đúng version yêu cầu?
- [ ] `php -m` — đủ extension bắt buộc?
- [ ] Bật tạm `display_errors=On` trên môi trường test
- [ ] Kiểm tra `memory_limit`, `upload_max_filesize`

## Bảng lỗi nhanh
| Triệu chứng | Nguyên nhân | Xử lý |
|---|---|---|
| Trang trắng không log | `display_errors=Off` | Bật tạm để debug |
| Installer báo thiếu extension | Thiếu gói `php-intl`/`php-ldap`... | Cài bổ sung, restart Apache |
| Upload đính kèm fail | `upload_max_filesize` nhỏ | Tăng trong `php.ini` |

**Xem tiếp:** [[SSL Troubleshooting]]
