---
type: asset-network
status: active
team: infrastructure
owner:
location:
ip_address:
device_type:
created: <% tp.date.now("YYYY-MM-DD") %>
tags: [asset, network]
---

# 🌐 Network Device — <% tp.file.title %>

## Thông tin thiết bị
- **Loại thiết bị:** ☐ Switch ☐ Router ☐ Access Point ☐ Firewall
- **Model:**
- **Vị trí:**

## Cấu hình mạng
- **IP quản lý:**
- **VLAN:**
- **Firmware version:**

## Bảo trì
- **Ngày lắp đặt:**
- **Lần bảo trì gần nhất:**

## Sự cố liên quan
```dataview
LIST
FROM #incident
WHERE contains(area, this.file.name)
```
