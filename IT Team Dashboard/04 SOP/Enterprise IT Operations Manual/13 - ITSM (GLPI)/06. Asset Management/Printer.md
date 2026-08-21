---
tags: [glpi, asset, printer]
---

# Printer — Quản lý nghiệp vụ máy in (tài chính/hợp đồng)

Liên quan: [[04 SOP/Enterprise IT Operations Manual/13 - ITSM (GLPI)/05. Inventory/Printer]] · [[../07. Helpdesk/Ticket]]

## Checklist
- [ ] Với máy in thuê, ghi rõ định mức trang/tháng trong tab Tài chính
- [ ] Setup cảnh báo khi counter gần vượt định mức
- [ ] Gán vị trí theo khu vực dùng chung

## Command / Cấu hình GLPI
Tab "Tài chính": nhà cung cấp (Fuji/Ricoh...), định mức trang/tháng, ngày quyết toán.
Kết hợp [[Reports Automation]] để tự động cảnh báo khi counter gần vượt định mức.

## Verify
Đối chiếu counter GLPI ghi nhận với báo cáo quyết toán từ nhà cung cấp cuối tháng.

## Troubleshooting
Xem chi tiết kỹ thuật quét SNMP tại [[04 SOP/Enterprise IT Operations Manual/13 - ITSM (GLPI)/05. Inventory/Printer]].

**Tiếp theo:** [[04 SOP/Enterprise IT Operations Manual/13 - ITSM (GLPI)/06. Asset Management/Switch]]
