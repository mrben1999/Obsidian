---
tags: [glpi, asset, router]
---

# Router — Quản lý nghiệp vụ thiết bị định tuyến

Liên quan: [[04 SOP/Enterprise IT Operations Manual/13 - ITSM (GLPI)/05. Inventory/Router]] · [[04 SOP/Enterprise IT Operations Manual/13 - ITSM (GLPI)/10. Security/Firewall]]

## Checklist
- [ ] Ghi rõ vai trò (WAN Router/VPN Gateway) trong mô tả
- [ ] Liên kết hợp đồng ISP nếu router do nhà mạng cấp
- [ ] Không lẫn lộn giữa Router và Firewall vật lý riêng biệt (xem [[04 SOP/Enterprise IT Operations Manual/13 - ITSM (GLPI)/06. Asset Management/Firewall]])

## Command / Cấu hình GLPI
`Assets > Network Equipment > Add > Type = Router`, ghi rõ nhà cung cấp dịch vụ, số hợp đồng.

## Verify
Đối chiếu thông tin router trong GLPI với hợp đồng ISP hiện có của Quảng Việt.

## Troubleshooting
Xem [[04 SOP/Enterprise IT Operations Manual/13 - ITSM (GLPI)/05. Inventory/Router]] cho lưu ý bảo mật SNMP trên router biên.

**Tiếp theo:** [[04 SOP/Enterprise IT Operations Manual/13 - ITSM (GLPI)/06. Asset Management/Firewall]]
