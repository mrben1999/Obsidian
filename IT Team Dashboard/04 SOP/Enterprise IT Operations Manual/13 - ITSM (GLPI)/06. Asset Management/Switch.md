---
tags: [glpi, asset, switch]
---

# Switch — Quản lý nghiệp vụ thiết bị chuyển mạch

Liên quan: [[04 SOP/Enterprise IT Operations Manual/13 - ITSM (GLPI)/05. Inventory/Switch]] · [[04 SOP/Enterprise IT Operations Manual/13 - ITSM (GLPI)/06. Asset Management/Router]]

## Checklist
- [ ] Gán vị trí rack cụ thể (module Racks/Datacenter của GLPI)
- [ ] Ghi chú vai trò (core/access/distribution)
- [ ] Liên kết hợp đồng bảo hành phần cứng mạng

## Command / Cấu hình GLPI
`Assets > Racks (Data center management)` — mô phỏng tủ mạng, gán switch vào đúng vị trí U.
Trường "Ghi chú" ghi rõ: `Core Switch - Tầng 1 - Assets VLAN 10/20/30/99`.

## Verify
Đối chiếu số lượng switch trong GLPI với sơ đồ mạng vật lý thực tế của từng chi nhánh.

## Troubleshooting
Xem chi tiết kỹ thuật SNMP/port mapping tại [[04 SOP/Enterprise IT Operations Manual/13 - ITSM (GLPI)/05. Inventory/Switch]].

**Tiếp theo:** [[04 SOP/Enterprise IT Operations Manual/13 - ITSM (GLPI)/06. Asset Management/Router]]
