---
tags: [glpi, inventory, macos]
---

# Mac Agent — Cài đặt trên macOS

Liên quan: [[Linux Agent]] · [[Rules]]

## Checklist
- [ ] Tải package `.pkg` phù hợp
- [ ] Cài qua Terminal hoặc MDM (Jamf/Kandji nếu công ty có)
- [ ] Cấp quyền Full Disk Access nếu cần quét chi tiết

## Command
```bash
sudo installer -pkg GLPI-Agent-1.10.pkg -target /
sudo /Applications/GLPI-Agent.app/Contents/MacOS/glpi-agent \
  --server=https://glpi.quangviet.local/front/inventory.php --tag=QV-Mac
```

## Verify
```bash
sudo launchctl list | grep glpi-agent
```
Xác nhận máy Mac xuất hiện trong GLPI với đúng model (MacBook Pro/Air...).

## Troubleshooting
| Lỗi | Nguyên nhân | Cách xử lý |
|---|---|---|
| Agent không tự chạy nền | LaunchDaemon chưa được load | `sudo launchctl load /Library/LaunchDaemons/glpi-agent.plist` |
| Thiếu thông tin serial | macOS chặn truy vấn hệ thống do bảo mật (SIP) | Cấp quyền Full Disk Access cho agent trong System Settings |

## Ghi chú thực tế
Quảng Việt hiện có số lượng máy Mac rất ít (chủ yếu team Marketing/Design) — ưu tiên cài thủ công thay vì đầu tư MDM riêng cho số lượng nhỏ này ở giai đoạn hiện tại.

**Tiếp theo:** [[Rules]]
