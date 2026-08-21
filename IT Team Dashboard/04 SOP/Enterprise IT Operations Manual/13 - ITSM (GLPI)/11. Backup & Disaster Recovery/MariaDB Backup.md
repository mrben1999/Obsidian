---
tags: [glpi, backup, mariadb]
---

# MariaDB Backup — Sao lưu cơ sở dữ liệu

Liên quan: [[04 MariaDB]] · [[Restore]]

## Checklist
- [ ] Backup full DB hàng ngày
- [ ] Nén và đặt tên file có timestamp rõ ràng
- [ ] Xóa backup cũ theo chính sách retention (30 ngày)

## Command
```bash
mysqldump -u glpiuser -p'MatKhauManh_QV2026!' --single-transaction glpidb \
  | gzip > /data/backup/glpi/glpidb_$(date +%Y%m%d_%H%M).sql.gz
find /data/backup/glpi -name "glpidb_*.sql.gz" -mtime +30 -delete
```

## Verify
```bash
gunzip -t /data/backup/glpi/glpidb_*.sql.gz   # test tính toàn vẹn file nén
ls -lh /data/backup/glpi/ | tail -5
```

## Troubleshooting
| Lỗi | Nguyên nhân | Cách xử lý |
|---|---|---|
| Backup lỗi giữa chừng với DB lớn | Thiếu `--single-transaction`, khóa bảng gây timeout | Luôn dùng `--single-transaction` cho InnoDB |
| File .gz báo lỗi khi giải nén | Backup bị ngắt giữa chừng (hết dung lượng) | Kiểm tra dung lượng đĩa trước khi backup, xem [[Disk]] |

**Tiếp theo:** [[Files Backup]]
