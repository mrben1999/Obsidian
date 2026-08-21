---
tags: [glpi, asset, firewall]
---

# Firewall — Quản lý thiết bị tường lửa

Liên quan: [[04 SOP/Enterprise IT Operations Manual/13 - ITSM (GLPI)/06. Asset Management/Router]] · [[04 SOP/Enterprise IT Operations Manual/13 - ITSM (GLPI)/10. Security/Firewall]]

## Checklist
- [ ] Nhập thủ công thông tin thiết bị (không bật SNMP vì lý do bảo mật)
- [ ] Ghi rõ license/subscription (nếu firewall dạng NGFW có gói bản quyền)
- [ ] Theo dõi ngày hết hạn license

## Command / Cấu hình GLPI
`Assets > Network Equipment > Add > Type = Firewall`
Tab "Tài chính": ghi ngày hết hạn license (ví dụ Fortinet FortiGuard, Sophos...).

## Verify
Đối chiếu ngày hết hạn license trong GLPI với cổng quản trị firewall thực tế, đảm bảo khớp trước khi license hết hạn.

## Troubleshooting
| Lỗi | Nguyên nhân | Cách xử lý |
|---|---|---|
| Quên gia hạn license gây gián đoạn bảo vệ | Không có cảnh báo trước hạn | Setup cảnh báo tại [[Warranty]] |

**Tiếp theo:** [[Access Point]]
