---
tags: [glpi, inventory, hyperv]
---

# Hyper-V — Kiểm kê hạ tầng ảo hóa Microsoft

Liên quan: [[VMware]]

> **GLPI 11:** Agent gửi dữ liệu qua Native Inventory (core) vẫn hoạt động bình thường cho host cài trực tiếp agent. Nếu cần quét tập trung nhiều host Hyper-V từ xa (không cài agent trên từng host), cần plugin **GLPI Inventory** (Marketplace).

## Checklist
- [ ] Cài GLPI Agent trực tiếp trên Hyper-V host (agent tự nhận diện VM con)
- [ ] Hoặc dùng plugin/connector riêng nếu không muốn cài agent trên host
- [ ] Verify danh sách VM khớp với Hyper-V Manager

## Command
```powershell
# Cài agent ngay trên Hyper-V host, agent sẽ tự động quét VM con qua WMI
msiexec /i GLPI-Agent-1.10-x64.msi /qn SERVER=https://glpi.quangviet.local/front/inventory.php TAG=QV-HyperV-Host
```

## Verify
Trong GLPI, host Hyper-V xuất hiện dưới dạng Computer, các VM con liên kết trong tab "Máy ảo" của host đó. Đối chiếu số lượng với `Get-VM` trên PowerShell:
```powershell
Get-VM | Select Name, State
```

## Troubleshooting
| Lỗi | Nguyên nhân | Cách xử lý |
|---|---|---|
| Agent không thấy VM con | Thiếu quyền WMI hoặc Hyper-V module | Chạy PowerShell với quyền Administrator, kiểm tra `Get-VM` chạy được trước |
| VM hiển thị trùng với Computer đã có (do cài agent riêng trong VM) | Nhận diện trùng giữa quét từ host và agent trong guest | Chuẩn hóa: chỉ dùng 1 nguồn — hoặc quét từ host hoặc agent trong guest, không cả hai |

**Tiếp theo:** [[04 SOP/Enterprise IT Operations Manual/13 - ITSM (GLPI)/05. Inventory/Printer]]
