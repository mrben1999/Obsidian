---
tags: [glpi, inventory, vmware]
---

# VMware — Kiểm kê hạ tầng ảo hóa VMware

Liên quan: [[SNMP Discovery]] · [[Hyper-V]]

> **GLPI 11:** Kiểm kê ESX/vCenter yêu cầu plugin **GLPI Inventory** (Marketplace) — không còn native trong core.

## Checklist
- [ ] Tạo tài khoản read-only trên vCenter cho GLPI
- [ ] Cấu hình ESX connector trong GLPI
- [ ] Test kết nối, import thử VM/host

## Command / Cấu hình GLPI
`Assets > Virtual Machines > ESX inventory (via GLPI Inventory plugin) > Add`
| Trường | Giá trị |
|---|---|
| Máy chủ | `vcenter.quangviet.local` |
| Loại | VMware vCenter/ESX |
| Tài khoản | `svc-glpi-vmware@vsphere.local` (quyền Read-only) |

## Verify
Chạy task đồng bộ thủ công lần đầu, kiểm tra `Assets > Virtual Machines` xuất hiện đủ danh sách VM đang chạy, đối chiếu số lượng với vCenter thực tế.

## Troubleshooting
| Lỗi | Nguyên nhân | Cách xử lý |
|---|---|---|
| Kết nối vCenter thất bại | Chứng chỉ SSL self-signed của vCenter không được tin cậy | Import chứng chỉ vCenter vào GLPI server hoặc bật bỏ qua xác minh SSL (chỉ nội bộ) |
| Danh sách VM không đầy đủ | Tài khoản thiếu quyền đọc trên 1 số cluster | Cấp quyền Read-only ở cấp vCenter root, không chỉ 1 cluster |

**Tiếp theo:** [[Hyper-V]]
