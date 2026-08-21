---
tags: [glpi, installation, debian]
---

# 01 Debian — Cài đặt hệ điều hành nền

Liên quan: [[02. Architecture]] · [[02 Apache]] · [[10. Backup & Disaster Recovery/Disaster Recovery|Backup]]

## Checklist
- [ ] Cài Debian 12 (bookworm) minimal
- [ ] Đặt hostname `glpi.quangviet.local`, IP tĩnh `192.168.1.14`
- [ ] Update hệ thống, cài gói cơ bản
- [ ] Tạo user quản trị riêng, khóa root SSH
- [ ] Cấu hình UFW, NTP, swap

## Command
```bash
hostnamectl set-hostname glpi.quangviet.local
nano /etc/network/interfaces
```
```
auto ens18
iface ens18 inet static
    address 192.168.1.14
    netmask 255.255.255.0
    gateway 192.168.1.1
    dns-nameservers 192.168.1.2 8.8.8.8
```
```bash
systemctl restart networking
apt update && apt full-upgrade -y
apt install -y sudo curl wget vim htop unzip gnupg2 net-tools chrony
adduser itadmin && usermod -aG sudo itadmin
sed -i 's/^#PermitRootLogin.*/PermitRootLogin no/' /etc/ssh/sshd_config
systemctl restart sshd
ufw allow OpenSSH && ufw allow 80/tcp && ufw allow 443/tcp && ufw enable
timedatectl set-timezone Asia/Ho_Chi_Minh
fallocate -l 2G /swapfile && chmod 600 /swapfile && mkswap /swapfile && swapon /swapfile
echo '/swapfile none swap sw 0 0' >> /etc/fstab
```

## Verify
```bash
hostnamectl status | grep "glpi.quangviet.local"
ip a | grep 192.168.1.14
timedatectl | grep "Asia/Ho_Chi_Minh"
free -h | grep Swap
ufw status verbose
ssh itadmin@192.168.1.14   # test SSH bằng user thường, root phải bị từ chối
```

## Troubleshooting
| Lỗi | Nguyên nhân | Cách xử lý |
|---|---|---|
| Mất mạng sau khi đặt IP tĩnh | Sai cú pháp `/etc/network/interfaces` | Dùng console VM sửa lại, `systemctl restart networking` |
| `sudo: command not found` | Cài thiếu gói | Cài lại bằng root: `apt install sudo` |
| Bị khóa SSH ngoài ý muốn | Tắt `PermitRootLogin` trước khi tạo user sudo | Dùng console Proxmox/VMware để khôi phục |

**Tiếp theo:** [[02 Apache]]
