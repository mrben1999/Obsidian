---
type: sop
area:
owner: Tô Nguyễn Hải Đăng
version: 1
last_reviewed: 2026-07-07
tags:
  - sop
---

# 📋 SOP — Triển khai Windows NPS + Active Directory + Cisco CBS350

## Chương 1. Kiến trúc hệ thống

Bao gồm sơ đồ

```
Administrator        │        ▼Cisco CBS350        │Radius        │Windows NPS        │Active Directory        │Domain Users
```

Giải thích

- Authentication Flow
- Authorization
- Accounting
- Failover
- Local Account

---

# Chương 2

## Chuẩn bị Active Directory

✔ Tạo OU

```
IT
```

✔ Tạo Security Group

```
QVN-Network-Admin
```

✔ Tạo User

```
DangITAdminNetworkAdmin
```

✔ Phân quyền

---

# Chương 3

## Cài đặt Windows NPS

Có hình từng bước

```
Server Manager↓Add Roles↓Network Policy Server
```

bao gồm

- Register in Active Directory
- Firewall
- Radius Port
- Certificate
- Event Viewer

---

# Chương 4

## Cấu hình NPS

Có hình

```
Radius Clients↓New
```

Sau đó

```
Network Policies↓Conditions↓Windows Group
```

Ví dụ

```
QVN-Network-Admin
```

Authentication

```
PAPMS-CHAPv2
```

Giải thích vì sao.

---

# Chương 5

## Cấu hình CBS350 bằng Web GUI

Ảnh từng màn hình

```
Security↓AAA↓Authentication
```

```
Security↓Radius
```

```
Security↓Users
```

```
Administration↓Management Access
```

Có đầy đủ

- Authentication Method
- Radius Server
- Timeout
- Retransmit
- Priority
- Dead Time
- Source Interface

---

# Chương 6

## Cấu hình CLI

Đúng Firmware 3.5

Ví dụ

```
radius-server host 192.168.1.10 \ auth-port 1812 \ acct-port 1813 \ key ******** \ usage login
```

Tiếp theo

```
aaa authentication login default radius local
```

Sau đó

```
ip ssh server
```

```
ip http secure-server
```

```
copy running-config startup-config
```

Mỗi lệnh đều giải thích.

---

# Chương 7

## Test Authentication

Ví dụ

SSH

↓

CBS350

↓

Radius

↓

NPS

↓

AD

↓

Accept

Có Wireshark

Có Event Viewer

Có Log Cisco

---

# Chương 8

## Phân quyền theo AD Group

Ví dụ

|AD Group|Quyền|
|---|---|
|Network Admin|Full|
|Helpdesk|Read Only|
|Security|Read + Audit|
|Manager|Read Only|

Có cách ánh xạ.

---

# Chương 9

## Local Account Backup

Nếu NPS chết

↓

Local Login

↓

Không bị lock out

Đây là Best Practice của Cisco.

---

# Chương 10

## Hardening

Bao gồm

✔ Disable Telnet

✔ Enable SSH Only

✔ HTTPS Only

✔ SNMPv3

✔ Password Policy

✔ Session Timeout

✔ Login Banner

✔ NTP

✔ Syslog

✔ Backup Config

✔ SCP

✔ Management VLAN

✔ ACL

✔ Disable HTTP

✔ Certificate

---

# Chương 11

## Troubleshooting

Ví dụ

### Access Reject

Nguyên nhân

Giải pháp

---

### Radius Timeout

Nguyên nhân

Firewall

DNS

Routing

---

### Authentication Failed

Nguyên nhân

Shared Secret

Group

Policy

---

### User Login được nhưng Privilege sai

Nguyên nhân

Radius Attribute

CLI

---

### AAA Reject

Ví dụ

```
AAA-W-REJECT
```

Giải thích.

---

# Chương 12

## Kiểm tra bằng CLI

Khoảng 40 lệnh

Ví dụ

```
show radius-serversshow running-configshow aaashow loggingshow usersshow sshshow ip interfaceshow interfaces statusshow clockshow ntpshow lldp neighborsshow spanning-treeshow mac address-table
```

Đều theo Firmware 3.5.3.3.

---

# Chương 13

## Checklist vận hành

Ví dụ

☐ Backup Config

☐ Backup Startup Config

☐ Test Radius

☐ Test Local Login

☐ Test SSH

☐ Test HTTPS

☐ Test Event Viewer

☐ Test NPS Log

☐ Test Failover

☐ Test Password Expire

---

# Phụ lục

✔ SOP

✔ Checklist

✔ Flowchart

✔ Visio

✔ CLI Cheat Sheet

✔ Windows NPS Cheat Sheet

✔ CBS350 Cheat Sheet

✔ Security Baseline

✔ Audit Checklist

✔ Incident SOP

✔ Backup SOP

✔ Password Policy
>

## Tài liệu tham chiếu
-

## Lịch sử cập nhật
| Version | Ngày | Người cập nhật | Nội dung thay đổi |
|---|---|---|---|
| 1.0 | | | Khởi tạo |
