---
tags: [glpi, backup, restore]
---

# Restore — Quy trình khôi phục dữ liệu

Liên quan: [[MariaDB Backup]] · [[Disaster Recovery]]

## Checklist
- [ ] Test restore trên môi trường staging (không phải production)
- [ ] Restore DB trước, sau đó file, sau đó plugin
- [ ] Xác nhận GLPI hoạt động bình thường sau restore

## Command
```bash
# 1. Restore Database
gunzip < /data/backup/glpi/glpidb_20260701_0200.sql.gz | mysql -u glpiuser -p glpidb

# 2. Restore Files
tar -xzf /data/backup/glpi/glpifiles_20260701_0200.tar.gz -C /

# 3. Restore Plugins (nếu cần)
tar -xzf /data/backup/glpi/plugins_20260701.tar.gz -C /

chown -R www-data:www-data /var/www/html/glpi
systemctl restart apache2 mariadb
```

## Verify
```bash
curl -Ik https://glpi.quangviet.local
sudo -u www-data php /var/www/html/glpi/bin/console glpi:system:status
```
Đăng nhập thử, kiểm tra ticket/asset gần thời điểm backup xuất hiện đầy đủ.

## Troubleshooting
| Lỗi | Nguyên nhân | Cách xử lý |
|---|---|---|
| Restore xong báo lỗi version mismatch | Backup từ version GLPI khác version hiện tại | Luôn ghi rõ version GLPI trong tên file backup, restore đúng version tương ứng trước khi upgrade |
| Trang trắng sau restore | Sai quyền thư mục sau khi giải nén | Chạy lại `chown -R www-data:www-data` |

**Tiếp theo:** [[Disaster Recovery]]
