---
tags: [glpi, installation, marketplace]
---

# 08 Marketplace — Plugin GLPI

Liên quan: [[07 GLPI]] · [[14. Troubleshooting/Marketplace Troubleshooting]] · [[14. Troubleshooting/Plugin Troubleshooting]]

## Checklist
- [ ] Bật Marketplace trong cấu hình chung
- [ ] Xác định danh sách plugin bắt buộc cho Quảng Việt
- [ ] Cài từng plugin, kiểm tra tương thích version GLPI
- [ ] Backup trước khi cài plugin mới

## Plugin khuyến nghị cho Quảng Việt
| Plugin | Mục đích |
|---|---|
| Fusioninventory (nếu chưa chuyển hẳn Native Inventory) | Kiểm kê nâng cao |
| Data Injection | Import hàng loạt dữ liệu từ Excel |
| Order/Purchase | Quản lý mua sắm liên kết Asset |
| Barcode | Sinh mã vạch/QR cho kiểm kê vật lý |

## Command
```bash
# Marketplace cài qua giao diện web là chính, nhưng có thể cài tay:
cd /var/www/html/glpi/marketplace
wget https://github.com/pluginsGLPI/dataimport/releases/download/2.x/glpi-dataimport-2.x.tar.bz2
tar -xjf glpi-dataimport-2.x.tar.bz2
chown -R www-data:www-data dataimport
sudo -u www-data php /var/www/html/glpi/bin/console plugin:install dataimport
sudo -u www-data php /var/www/html/glpi/bin/console plugin:activate dataimport
```

## Verify
```bash
sudo -u www-data php /var/www/html/glpi/bin/console plugin:list
```
Vào `Setup > Plugins (Marketplace)` trên giao diện, xác nhận plugin hiện trạng thái "Đã kích hoạt".

## Troubleshooting
| Lỗi | Nguyên nhân | Cách xử lý |
|---|---|---|
| Plugin cài xong báo lỗi trang trắng | Plugin không tương thích version GLPI hiện tại | Kiểm tra bảng tương thích trên trang plugin trước khi cài |
| Plugin không xuất hiện trong danh sách | Sai quyền thư mục | `chown -R www-data:www-data` lại thư mục plugin |
| Sau update GLPI, plugin bị vô hiệu hóa | Bình thường — GLPI tự tắt plugin chưa xác nhận tương thích | Kiểm tra bản cập nhật plugin tương ứng rồi kích hoạt lại |

**Tiếp theo:** [[09 Cron]]
