---
type: asset-server
status: active
team: infrastructure
owner:
location:
ip_address:
os:
warranty_expiry:
created: <% tp.date.now("YYYY-MM-DD") %>
tags: [asset, server]
---

# 🖥️ Server Asset — <% tp.file.title %>

## Thông tin phần cứng
- **Model:**
- **CPU/RAM/Storage:**
- **Vị trí đặt máy:**

## Thông tin phần mềm
- **Hệ điều hành:**
- **Ứng dụng đang chạy:**
- **Phiên bản:**

## Mạng
- **IP:**
- **VLAN:**

## Bảo trì
- **Ngày mua:**
- **Hết bảo hành:**
- **Lịch bảo trì định kỳ:**

## Lịch sử sự cố liên quan
```dataview
LIST
FROM #incident
WHERE contains(area, this.file.name)
```
