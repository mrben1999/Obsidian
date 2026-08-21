---
tags: [glpi, backup, marketplace]
---

# Marketplace Backup — Lưu trữ bản cài đặt gốc plugin

Liên quan: [[Plugins Backup]]

## Checklist
- [ ] Lưu trữ file cài đặt gốc (.tar.bz2/.zip) của từng plugin đã dùng
- [ ] Đặt tên rõ version để tái sử dụng khi cần cài lại server mới
- [ ] Đồng bộ kho lưu trữ này ra NAS

## Command
```bash
mkdir -p /data/glpi-plugin-archive
cp /tmp/glpi-dataimport-2.x.tar.bz2 /data/glpi-plugin-archive/
rsync -avz /data/glpi-plugin-archive/ backup-svc@nas.quangviet.local:/backup/glpi-plugins/
```

## Verify
```bash
ls -lh /data/glpi-plugin-archive/
```
Đối chiếu với danh sách plugin đang active trên production (`plugin:list`), đảm bảo mọi plugin đều có file gốc lưu trữ.

## Troubleshooting
| Lỗi | Nguyên nhân | Cách xử lý |
|---|---|---|
| Cần dựng lại server nhưng không tìm được bản cài plugin cũ | Không lưu trữ file gốc, chỉ tải trực tiếp từ Marketplace lúc cài | Từ nay lưu trữ theo quy trình này, không phụ thuộc link tải ngoài còn tồn tại hay không |

**Tiếp theo:** [[Backup Cron]]
