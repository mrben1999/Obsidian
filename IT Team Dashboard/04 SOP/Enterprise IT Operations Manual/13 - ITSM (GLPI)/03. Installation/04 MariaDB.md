---
tags: [glpi, installation, mariadb]
---

# 04 MariaDB — Cơ sở dữ liệu

Liên quan: [[03 PHP]] · [[05 Redis]] · [[11. Backup & Disaster Recovery/MariaDB Backup]]

## Checklist
- [ ] Cài MariaDB 10.11
- [ ] Chạy `mysql_secure_installation`
- [ ] Tạo database + user riêng cho GLPI
- [ ] Charset `utf8mb4`, import timezone table

## Command
```bash
apt install -y mariadb-server mariadb-client
mysql_secure_installation
mariadb-tzinfo-to-sql /usr/share/zoneinfo | mysql -u root -p mysql

mysql -u root -p << 'SQL'
CREATE DATABASE glpidb CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER 'glpiuser'@'localhost' IDENTIFIED BY 'MatKhauManh_QV2026!';
GRANT ALL PRIVILEGES ON glpidb.* TO 'glpiuser'@'localhost';
FLUSH PRIVILEGES;
SQL

cat >> /etc/mysql/mariadb.conf.d/50-server.cnf << 'INI'
innodb_buffer_pool_size = 512M
max_connections = 200
INI
systemctl restart mariadb
```

## Verify
```bash
systemctl status mariadb | grep active
mysql -u glpiuser -p -e "SHOW DATABASES;" | grep glpidb
mysql -u root -p -e "SELECT COUNT(*) FROM mysql.time_zone_name;"   # phải > 0
```

## Troubleshooting
| Lỗi | Nguyên nhân | Cách xử lý |
|---|---|---|
| `Unknown collation utf8mb4_unicode_ci` | MariaDB quá cũ | Nâng cấp ≥10.6 |
| "Time zone database not populated" | Chưa import tzinfo | Chạy lại lệnh `mariadb-tzinfo-to-sql` |
| Kết nối bị timeout lúc import inventory lớn | `max_connections` thấp | Tăng trong `50-server.cnf` |

**Tiếp theo:** [[05 Redis]]
