---
tags: [glpi, inventory, linux]
---

# Linux Agent — Cài đặt trên máy chủ/máy trạm Linux

Liên quan: [[GLPI Agent]] · [[Mac Agent]]

## Checklist
- [ ] Cài agent trên các server Linux nội bộ (không chỉ máy trạm Windows)
- [ ] Cấu hình chạy qua cron thay vì daemon nếu server hạn chế tài nguyên
- [ ] Đảm bảo agent có quyền đọc thông tin phần cứng

## Command
```bash
# Debian/Ubuntu
wget https://github.com/glpi-project/glpi-agent/releases/download/1.10/glpi-agent_1.10-1_amd64.deb
dpkg -i glpi-agent_1.10-1_amd64.deb

# RHEL/CentOS
rpm -ivh glpi-agent-1.10-1.x86_64.rpm

glpi-agent --server=https://glpi.quangviet.local/front/inventory.php --tag=QV-Linux-Server
systemctl enable --now glpi-agent
```

## Verify
```bash
systemctl status glpi-agent
journalctl -u glpi-agent -f
```
Kiểm tra server Linux xuất hiện trong `Assets > Computers` trên GLPI với hệ điều hành đúng.

## Troubleshooting
| Lỗi | Nguyên nhân | Cách xử lý |
|---|---|---|
| Thiếu thông tin phần cứng (dmidecode) | Agent chạy không đủ quyền | Chạy agent với quyền root hoặc cấp `sudo` cho lệnh `dmidecode` |
| Agent không tự khởi động sau reboot | Chưa `enable` service | `systemctl enable glpi-agent` |

**Tiếp theo:** [[Mac Agent]]
