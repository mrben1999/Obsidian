# Network Knowledge Base

## Mục đích

Knowledge về mạng: Switch, Router, AP, Firewall, VLAN, VPN.

## Khi nào sử dụng

- Sự cố mạng
- Cấu hình thiết bị mạng
- Xử lý sự cố kết nối
- Bảo trì hạ tầng mạng

## Liên kết SOP

- [[QVN Network Infrastructure SOP v1.0]]

## Asset Mapping

| Loại | GLPI Type | Số lượng (B001) |
|------|-----------|-----------------|
| Switch | NetworkEquipment | 127 |
| AP | NetworkEquipment | (chung với Switch) |
| Router | NetworkEquipment | (chung với Switch) |

## Ticket Mapping

| Loại ticket | Số lượng | Ghi chú |
|-------------|----------|---------|
| Network Down | Đang cập nhật | |
| Slow Network | Đang cập nhật | |
| WiFi Issue | Đang cập nhật | |

## Checklist

- [ ] Kiểm tra physical connection trước
- [ ] Ping test từ nhiều vị trí
- [ ] Kiểm tra switch port status
- [ ] Xem log thiết bị mạng
- [ ] Backup config trước khi thay đổi

## Related Documents

- [[05 Knowledge Base/README]] — Knowledge Base chính
- [[00-Knowledge-Index]] — Danh sách bài viết
- [[04 SOP/QVN Network Infrastructure SOP v1.0]] — SOP hạ tầng mạng
