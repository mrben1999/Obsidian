---
tags: [glpi, inventory, switch]
---

# Switch — Kiểm kê thiết bị chuyển mạch

Liên quan: [[SNMP Discovery]] · [[04 SOP/Enterprise IT Operations Manual/13 - ITSM (GLPI)/05. Inventory/Router]] · [[04 SOP/Enterprise IT Operations Manual/13 - ITSM (GLPI)/06. Asset Management/Switch]]

## Checklist
- [ ] Bật SNMP trên toàn bộ switch quản lý được (managed switch)
- [ ] Quét qua Network Discovery + Network Inventory
- [ ] Khai báo cổng kết nối (port mapping) thủ công lần đầu

## Command
```
snmp-server community QV_readonly RO
snmp-server contact "it@quangviet.com.vn"
```
Sau khi import, vào từng Switch trong GLPI > tab "Ports" để khai báo liên kết vật lý với switch khác/server.

## Verify
So sánh số lượng port active trên GLPI với thực tế (`show interface status` trên switch Cisco), đối chiếu VLAN gán đúng.

## Troubleshooting
| Lỗi | Nguyên nhân | Cách xử lý |
|---|---|---|
| Switch quét được nhưng thiếu cổng | Chưa chạy Network Inventory sau Discovery | Chạy bổ sung task Network Inventory |
| Switch đời cũ không hỗ trợ SNMPv2c | Thiết bị legacy | Cân nhắc thay thế hoặc quản lý thủ công |

**Tiếp theo:** [[04 SOP/Enterprise IT Operations Manual/13 - ITSM (GLPI)/05. Inventory/Router]]
