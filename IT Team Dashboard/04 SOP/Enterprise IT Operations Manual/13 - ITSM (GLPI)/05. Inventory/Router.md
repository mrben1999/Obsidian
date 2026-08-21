---
tags: [glpi, inventory, router]
---

# Router — Kiểm kê thiết bị định tuyến

Liên quan: [[04 SOP/Enterprise IT Operations Manual/13 - ITSM (GLPI)/05. Inventory/Switch]] · [[04 SOP/Enterprise IT Operations Manual/13 - ITSM (GLPI)/10. Security/Firewall]]

## Checklist
- [ ] Bật SNMP read-only trên router (nếu chính sách bảo mật cho phép)
- [ ] Với router biên (edge) nhạy cảm, cân nhắc chỉ nhập tay thay vì SNMP public
- [ ] Ghi chú rõ vai trò (WAN/LAN/VPN) trong trường mô tả

## Command
```
! Nếu bật SNMP (chỉ nội bộ, không áp dụng cho router biên internet-facing)
snmp-server community QV_readonly RO
access-list 10 permit 10.10.10.14
snmp-server community QV_readonly RO 10
```

## Verify
Xác nhận router xuất hiện trong `Assets > Network Equipment`, đúng model, đúng vai trò ghi trong mô tả.

## Troubleshooting
| Lỗi | Nguyên nhân | Cách xử lý |
|---|---|---|
| Không dám bật SNMP trên router biên vì lo bảo mật | Đúng, đây là rủi ro thật | Nhập tay thông tin router biên, chỉ bật SNMP cho router/switch nội bộ |

## Ghi chú thực tế
Với Quảng Việt, router kết nối trực tiếp Internet (edge router) **không nên bật SNMP** dù chỉ read-only — nhập thủ công thông tin thiết bị này vào GLPI để đảm bảo tính đầy đủ dữ liệu mà không tăng bề mặt tấn công.

**Tiếp theo:** [[Network Discovery]]
