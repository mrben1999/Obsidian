---
tags: [glpi, installation, core]
---

# 07 GLPI — Cài đặt ứng dụng GLPI

Liên quan: [[06 SSL]] · [[08 Marketplace]] · [[09 Cron]] · [[../01. Project Overview]]

## Checklist
- [ ] Tải đúng bản **GLPI 11.0.8** (bản vá bảo mật mới nhất trên nhánh 11.0.x tại thời điểm viết tài liệu này)
- [ ] Xác nhận môi trường đạt yêu cầu tối thiểu: **PHP ≥ 8.2** (khuyến nghị 8.3, xem [[03 PHP]]), **MariaDB ≥ 10.6** hoặc **MySQL ≥ 8.0** (xem [[04 MariaDB]])
- [ ] Giải nén, phân quyền đúng cho `www-data`
- [ ] Chạy `bin/console glpi:system:check_requirements` trước khi cài để tự kiểm tra môi trường
- [ ] Chạy installer qua web hoặc CLI
- [ ] Xóa/khóa thư mục `install/` sau khi hoàn tất
- [ ] Đổi mật khẩu tài khoản mặc định (glpi/glpi, tech/tech...)

## Command
```bash
cd /var/www/html
wget https://github.com/glpi-project/glpi/releases/download/11.0.8/glpi-11.0.8.tgz
tar -xzf glpi-11.0.8.tgz
chown -R www-data:www-data /var/www/html/glpi

# Kiểm tra môi trường trước khi cài (khuyến nghị GLPI 11)
sudo -u www-data php /var/www/html/glpi/bin/console glpi:system:check_requirements

# Cài qua CLI (khuyến nghị cho production, không lộ bước cài qua web)
sudo -u www-data php /var/www/html/glpi/bin/console db:install \
  --db-host=localhost --db-name=glpidb --db-user=glpiuser --db-password='MatKhauManh_QV2026!' \
  --no-interaction
```

Sau khi cài xong:
```bash
rm -rf /var/www/html/glpi/install
```

## Verify
```bash
curl -Ik https://glpi.quangviet.local   # phải trả 200
sudo -u www-data php /var/www/html/glpi/bin/console glpi:system:status
```
Đăng nhập lần đầu bằng `glpi/glpi` (Super-Admin) → đổi mật khẩu ngay → tắt/xóa các tài khoản demo mặc định khác (`tech`, `normal`, `post-only`).

## Troubleshooting
| Lỗi | Nguyên nhân | Cách xử lý |
|---|---|---|
| Trang cài đặt báo lỗi kết nối DB | Sai thông tin `--db-*` | Kiểm tra lại theo [[04 MariaDB]] |
| `check_requirements` báo lỗi "DB engine not supported" | MariaDB < 10.6 hoặc MySQL < 8.0 — GLPI 11 đã bỏ hỗ trợ bản cũ hơn | Nâng cấp MariaDB theo [[04 MariaDB]] |
| Sau cài, trang chủ vẫn hiện installer | Chưa xóa thư mục `install/` | Xóa theo lệnh trên |
| Không đăng nhập được `glpi/glpi` | Đã đổi mật khẩu trước đó hoặc cài lỗi giữa chừng | Reset qua CLI: `bin/console glpi:user:reset_password` |

## Ghi chú thực tế (GLPI 11 so với GLPI 10)
- **Network Discovery, SNMP scanning, kiểm kê VMware/Hyper-V** không còn native trong core từ GLPI 11 — bắt buộc cài thêm plugin **"GLPI Inventory"** qua Marketplace (`Setup > Plugins (Marketplace)`). Xem chi tiết tại [[../05. Inventory/SNMP Discovery]] và [[../05. Inventory/VMware]].
- Module **"Setup > Asset Definitions"** là tính năng mới của GLPI 11, cho phép định nghĩa loại tài sản tùy chỉnh (custom asset types) — hữu ích nếu Quảng Việt cần theo dõi loại thiết bị đặc thù ngoài danh sách mặc định (Computer, Monitor, Printer...).
- **Forms/Service catalog** (trước đây là plugin Formcreator) nay đã tích hợp sẵn vào core, truy cập tại `Administration > Forms`, hiển thị cho người dùng cuối tại `Assistance > Service catalog`.

**Tiếp theo:** [[08 Marketplace]]
