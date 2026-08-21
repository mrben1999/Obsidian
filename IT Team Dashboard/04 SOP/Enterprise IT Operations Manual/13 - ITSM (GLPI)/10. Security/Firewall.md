---
tags: [glpi, security, firewall]
---

# Firewall — Kiểm soát truy cập mạng

Liên quan: [[Fail2ban]] · [[02. Architecture]]

## Checklist
- [ ] Chỉ mở port cần thiết (80, 443, SSH)
- [ ] Giới hạn nguồn truy cập SSH theo IP dải quản trị
- [ ] Không public GLPI trực tiếp ra Internet nếu không cần thiết

## Command
```bash
ufw allow from 192.168.1.0/24 to any port 22 proto tcp
ufw deny 22/tcp
ufw allow 80/tcp
ufw allow 443/tcp
ufw enable
ufw status verbose
```

## Verify
```bash
nmap -p 22,80,443 glpi.quangviet.local
```
Từ mạng ngoài dải quản trị, SSH (22) phải bị từ chối; 80/443 vẫn mở.

## Troubleshooting
| Lỗi | Nguyên nhân | Cách xử lý |
|---|---|---|
| Tự khóa mất quyền SSH | Rule `deny` áp trước `allow` sai thứ tự | Luôn thêm rule `allow` cụ thể trước `deny` chung, hoặc sửa qua console VM |

**Tiếp theo:** [[2FA]]
