---
tags: [glpi, inventory, snmp]
---

# SNMP Discovery — Quét thiết bị không cài được Agent

Liên quan: [[Network Discovery]] · [[04 SOP/Enterprise IT Operations Manual/13 - ITSM (GLPI)/05. Inventory/Printer]] · [[04 SOP/Enterprise IT Operations Manual/13 - ITSM (GLPI)/05. Inventory/Switch]]

> **Quan trọng (GLPI 11):** Native Inventory (core GLPI) chỉ nhận dữ liệu do GLPI Agent gửi lên. Network Discovery/SNMP scanning **không còn nằm trong core** — bắt buộc cài plugin chính thức **"GLPI Inventory"** từ Marketplace (`Setup > Plugins (Marketplace)`) trước khi thực hiện các bước dưới đây. Toàn bộ menu Discovery/SNMP nằm trong plugin này, không phải menu gốc của GLPI.

## Checklist
- [ ] Cài plugin **GLPI Inventory** từ Marketplace, kích hoạt
- [ ] Cấu hình SNMP community trên thiết bị mạng
- [ ] Khai báo SNMP credential trong plugin GLPI Inventory
- [ ] Tạo Task Discovery + Network Inventory (trong plugin)

## Command
```
! Trên switch Cisco
snmp-server community QV_readonly RO
snmp-server location "Quang Viet - Tang 3"
```
`Administration > Rules > SNMP credentials (via GLPI Inventory plugin) > Thêm cấu hình` — community `QV_readonly`, SNMPv2c.

```bash
apt install -y snmp
snmpwalk -v2c -c QV_readonly 10.10.10.254
```

## Verify
`GLPI Inventory plugin (Marketplace) > Agents > Tasks > Discovery` — chạy task, kiểm tra kết quả tìm thấy thiết bị đúng dải IP khai báo.

## Troubleshooting
| Lỗi                   | Nguyên nhân                              | Cách xử lý                 |
| --------------------- | ---------------------------------------- | -------------------------- |
| Task chạy 0 kết quả   | Local agent không cùng VLAN với dải quét | Đặt agent quét cùng subnet |
| Thiếu thông tin model | SNMP community sai/quyền giới hạn        | Test lại bằng `snmpwalk`   |

**Tiếp theo:** [[VMware]]
