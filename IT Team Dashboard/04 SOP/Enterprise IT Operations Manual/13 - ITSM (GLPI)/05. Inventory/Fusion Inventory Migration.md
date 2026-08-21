---
tags: [glpi, inventory, migration]
---

# Fusion Inventory Migration — Chuyển từ FusionInventory sang Native Inventory

Liên quan: [[GLPI Agent]] · [[Inventory Troubleshooting]]

## Checklist
- [ ] Xác nhận version GLPI hỗ trợ Native Inventory (≥9.5)
- [ ] Backup dữ liệu trước khi migrate
- [ ] Gỡ plugin FusionInventory, bật Native Inventory
- [ ] Cập nhật lại endpoint trên toàn bộ agent đã deploy

## Command
```bash
# Trên GLPI server, vô hiệu hóa plugin cũ
sudo -u www-data php /var/www/html/glpi/bin/console plugin:deactivate fusioninventory
```
Bật Native Inventory: `Setup > General > Inventory tab (Enable inventory)` → bật "Kích hoạt inventory tự nhiên".

Cập nhật agent hiện có trỏ về endpoint mới (có thể qua GPO cập nhật lại tham số `SERVER`):
```
https://glpi.quangviet.local/front/inventory.php
```

## Verify
So sánh số lượng asset trước/sau migrate (`Assets > Computers`), đảm bảo không mất dữ liệu. Kiểm tra agent gửi log thành công vào endpoint mới.

## Troubleshooting
| Lỗi | Nguyên nhân | Cách xử lý |
|---|---|---|
| Asset bị nhân đôi sau migrate | Rule nhận diện không khớp giữa 2 nguồn dữ liệu cũ/mới | Dùng chức năng "Hợp nhất" (Merge) thủ công |
| Agent cũ vẫn gửi vào endpoint FusionInventory cũ | Chưa cập nhật tham số SERVER trên agent | Redeploy cấu hình qua [[Deploy GPO]] |

**Tiếp theo:** [[SNMP Discovery]]
