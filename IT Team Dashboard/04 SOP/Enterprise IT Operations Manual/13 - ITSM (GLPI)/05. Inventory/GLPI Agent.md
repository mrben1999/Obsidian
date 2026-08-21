---
tags: [glpi, inventory, agent]
---

# GLPI Agent — Kiểm kê tài sản tự động

Liên quan: [[Deploy GPO]] · [[Rules]] · [[Tags]] · [[Computer]]

## Checklist
- [ ] Bật Native Inventory API trên GLPI server
- [ ] Cài Agent thử nghiệm trên 1 máy
- [ ] Cấu hình tần suất gửi báo cáo
- [ ] Mở firewall cho endpoint inventory

## Command
Bật API trên server: `Setup > General > Inventory tab (Enable inventory)` → bật "Kích hoạt inventory tự nhiên".
Endpoint: `https://glpi.quangviet.local/front/inventory.php`

```powershell
# Windows silent install
GLPI-Agent-1.10-x64.exe /S /SERVER="https://glpi.quangviet.local/front/inventory.php" /TAG="QV-HN" /RUNNOW
```
```bash
# Linux
wget https://github.com/glpi-project/glpi-agent/releases/download/1.10/glpi-agent_1.10-1_amd64.deb
dpkg -i glpi-agent_1.10-1_amd64.deb
glpi-agent --server=https://glpi.quangviet.local/front/inventory.php --tag=QV-Server
```

## Verify
```bash
systemctl status glpi-agent    # Linux
glpi-agent --debug --server=https://glpi.quangviet.local/front/inventory.php   # xem log gửi chi tiết
```
Vào GLPI `Assets > Computers` — máy vừa cài agent phải xuất hiện trong vòng 1-2 phút sau khi chạy `/RUNNOW`.

## Troubleshooting
| Lỗi | Nguyên nhân | Cách xử lý |
|---|---|---|
| Agent chạy nhưng không thấy asset | Rule import chặn (duplicate serial) | Xem [[Rules]] |
| Lỗi SSL khi POST inventory | Máy trạm chưa tin cậy CA nội bộ | Xem [[HTTPS]] |
| Agent chạy rất chậm | Task quét software mất thời gian | Thêm cờ `--no-software` nếu không cần audit phần mềm |

**Tiếp theo:** [[Deploy GPO]]
