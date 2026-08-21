---
tags: [glpi, inventory, printer]
---

# Printer — Quét & kiểm kê máy in

Liên quan: [[SNMP Discovery]] · [[04 SOP/Enterprise IT Operations Manual/13 - ITSM (GLPI)/06. Asset Management/Printer]]

## Checklist
- [ ] Quét máy in qua SNMP Discovery
- [ ] Bật Network Inventory task để lấy chi tiết counter/mực
- [ ] Đối chiếu với danh sách máy in thực tế

## Command
Xem thiết lập SNMP tại [[SNMP Discovery]]. Sau khi Discovery tìm ra thiết bị, tạo tiếp:
`GLPI Inventory plugin (Marketplace) > Agents > Tasks > Network Inventory` chọn đúng dải IP máy in.

## Verify
`Assets > Printers` — kiểm tra model, counter hiển thị đúng, so khớp với số trang thực tế trên màn hình máy in.

## Troubleshooting
| Lỗi | Nguyên nhân | Cách xử lý |
|---|---|---|
| Không đọc được counter | Máy in không hỗ trợ OID chuẩn Printer-MIB | Theo dõi thủ công qua ticket nếu máy quá cũ |
| Máy in trùng bản ghi sau đổi IP | Nhận diện theo IP thay vì Serial | Ưu tiên Serial trong [[Rules]] |

**Chi tiết nghiệp vụ quản lý máy in (tài chính, hợp đồng thuê):** xem [[04 SOP/Enterprise IT Operations Manual/13 - ITSM (GLPI)/06. Asset Management/Printer]]

**Tiếp theo:** [[04 SOP/Enterprise IT Operations Manual/13 - ITSM (GLPI)/05. Inventory/Switch]]
