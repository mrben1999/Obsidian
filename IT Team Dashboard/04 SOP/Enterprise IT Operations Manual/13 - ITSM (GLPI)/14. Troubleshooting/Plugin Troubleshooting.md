---
tags: [glpi, troubleshooting, plugin]
---

# Troubleshooting: Plugin (chuyên sâu từng plugin)

Liên quan: [[Marketplace Troubleshooting]] · [[Plugins Backup]]

## Checklist chẩn đoán
- [ ] Backup trước khi thao tác (xem [[Plugins Backup]])
- [ ] Kiểm tra log riêng của plugin (nếu có)
- [ ] Thử tắt/bật lại (deactivate → activate) trước khi gỡ hẳn

## Bảng lỗi nhanh
| Triệu chứng | Nguyên nhân | Xử lý |
|---|---|---|
| Plugin gây lỗi trang trắng toàn hệ thống | Xung đột với plugin khác hoặc core | Deactivate qua CLI: `bin/console plugin:deactivate <name>` |
| Dữ liệu plugin biến mất sau update | Migration DB của plugin lỗi | Restore từ backup, báo lỗi cho nhà phát triển plugin |
| Menu plugin không hiện dù đã activate | Cache chưa refresh | Xóa cache GLPI (`Setup > General > Performance > Xóa cache`) |

---
**Hoàn tất chương Troubleshooting.** Tiếp theo: [[Server Build]]
