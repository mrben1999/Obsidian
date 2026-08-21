---
type: project
status: in-progress
priority: P2
team:
owner:
start_date: 2026-07-23
due:
created: 2026-07-23
tags:
  - project
---
# Roadmap Phase 2

```
Phase 2 - Agent Deployment
│
├── Bước 1. Chuẩn hóa Host Naming
├── Bước 2. Chuẩn hóa Host Metadata
├── Bước 3. Cài Agent 2 trên Debian (Zabbix + GLPI)
├── Bước 4. Thêm Host vào Zabbix
├── Bước 5. Gán Template
├── Bước 6. Kiểm tra Metrics
├── Bước 7. Chuẩn hóa Macro
├── Bước 8. Baseline Monitoring
├── Bước 9. Trigger Test
└── Bước 10. Documentation
```
# Phase 2 đã hoàn thành

Checklist hiện tại:

- ✅ Cài Zabbix Server 7.4
- ✅ Cấu hình Apache :8080
- ✅ Cấu hình PHP
- ✅ Kết nối Database
- ✅ Đăng nhập Zabbix
- ✅ Chuẩn hóa User
- ✅ Chuẩn hóa Host Groups
- ✅ Chuẩn hóa Template Groups
- ✅ Cài Agent 2 trên Debian
- ✅ Host kết nối thành công

# Phase 3 (khuyến nghị)

Để phục vụ mục tiêu tích hợp **GLPI + Zabbix**, em đề xuất thứ tự tiếp theo như sau:

```
Phase 3 - Chuẩn hóa Template & Monitoring

1. Chuẩn hóa Linux by Zabbix agent 2
2. Chuẩn hóa Macros
3. Chuẩn hóa Tags
4. Chuẩn hóa Severity
5. Xây dựng Trigger theo chuẩn doanh nghiệp
6. Baseline CPU/RAM/Disk
7. Dashboard NOC
```

Sau khi hoàn tất Phase 3, chúng ta sẽ chuyển sang:

```
Phase 4 - Triển khai Zabbix Agent 2 trên Windows

→ Windows Server
→ Windows Client
→ Auto Registration
→ GPO triển khai hàng loạt
```

# Roadmap Phase 3

```
Phase 3 - Template & Monitoring Standardization

3.1 Chuẩn hóa Official Templates
3.2 Xây dựng QVN Monitoring Standards
3.3 Chuẩn hóa User Macros
3.4 Chuẩn hóa Tags
3.5 Chuẩn hóa Trigger Severity
3.6 Chuẩn hóa Inventory
3.7 Chuẩn hóa Discovery Rules
3.8 Baseline Monitoring
3.9 Dashboard NOC
3.10 Testing
```
