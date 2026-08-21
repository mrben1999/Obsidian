---
category: "3.2 Infrastructure & Server"
visibility: Technician / Supervisor / Super-Admin only
tags: [backup, restore, server, technician]
---

# [Backup] Quy trình backup/restore dữ liệu Server

## 1. Tóm tắt hiện tượng (Symptom)
Cần thực hiện backup định kỳ hoặc khôi phục dữ liệu Server (đặc biệt GLPI Server) sau sự cố/trước khi nâng cấp.

## 2. Nguyên nhân (Root Cause)
Đây là quy trình vận hành chuẩn — tham chiếu đầy đủ tại chương `11. Backup & Disaster Recovery` trong bộ **GLPI Deployment Manual**. Bài KB này tóm tắt nhanh cho Technician tra cứu khi trực xử lý sự cố.

## 3. Các bước xử lý (Resolution)
**Backup nhanh (chạy tay ngoài lịch tự động):**
```bash
mysqldump -u glpiuser -p'<password>' --single-transaction glpidb | gzip > /data/backup/glpi/glpidb_$(date +%Y%m%d_%H%M).sql.gz
tar -czf /data/backup/glpi/glpifiles_$(date +%Y%m%d_%H%M).tar.gz /var/www/html/glpi/files
```

**Restore khẩn cấp:**
```bash
gunzip < /data/backup/glpi/glpidb_<timestamp>.sql.gz | mysql -u glpiuser -p glpidb
tar -xzf /data/backup/glpi/glpifiles_<timestamp>.tar.gz -C /
chown -R www-data:www-data /var/www/html/glpi
systemctl restart apache2 mariadb
```

**Verify sau restore:**
```bash
curl -Ik https://glpi.qve.com
sudo -u www-data php /var/www/html/glpi/bin/console glpi:system:status
```

## 4. Thông tin bổ sung (Notes)
- Luôn backup **trước** mọi thao tác rủi ro (upgrade GLPI, cài plugin mới, sửa cấu hình lớn) — không có ngoại lệ.
- Tài liệu đầy đủ về chiến lược 3-2-1, RTO/RPO: xem chương `11. Backup & Disaster Recovery` trong bộ Deployment Manual.
- Diễn tập restore thử tối thiểu mỗi 6 tháng trên môi trường staging, không test trực tiếp production.
