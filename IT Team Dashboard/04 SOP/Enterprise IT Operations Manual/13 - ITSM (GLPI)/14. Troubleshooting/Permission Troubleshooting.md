---
tags: [glpi, troubleshooting, permission]
---

# Troubleshooting: Permission (phân quyền hệ thống file & GLPI)

Liên quan: [[07 GLPI]] · [[Profiles]]

## Checklist chẩn đoán
- [ ] Kiểm tra quyền thư mục `chown -R www-data:www-data`
- [ ] Kiểm tra Profile GLPI của user đang gặp vấn đề
- [ ] Kiểm tra Entity user có quyền truy cập dữ liệu tương ứng không

## Bảng lỗi nhanh
| Triệu chứng | Nguyên nhân | Xử lý |
|---|---|---|
| Trang trắng sau khi chỉnh file | Sai quyền thư mục | `chown -R www-data:www-data /var/www/html/glpi` |
| User không thấy asset dù đúng Profile | Sai Entity/thiếu quyền đệ quy Entity con | Kiểm tra `Administration > Profiles > Entities` |
| Không upload được file/plugin | Thư mục `files/`, `marketplace/` sai quyền ghi | Cấp lại quyền ghi cho `www-data` |

**Xem tiếp:** [[Marketplace Troubleshooting]]
