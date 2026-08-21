---
type: sop
area:
owner:
version: 1
last_reviewed: 2026-08-17
tags:
  - sop
---
# 📋 TÀI LIỆU CẤU HÌNH HELPDESK GLPI - TOÀN CÔNG TY

## 🎯 Mục Lục  

- 1. [Tổng Quan Dự Án](#tổng-quan-dự-án)
- 2. [Chuẩn Bị & Planning](#chuẩn-bị--planning)
- 3. [Cài Đặt & Khởi Tạo](#cài-đặt--khởi-tạo)
- 4. [Cấu Hình Entities & Departments](#cấu-hình-entities--departments)
- 5. [Quản Lý Users & Groups](#quản-lý-users--groups)
- 6. [Cấu Hình Categories & Types](#cấu-hình-categories--types)
- 7. [Quản Lý Assets (Thiết Bị)](#quản-lý-assets-thiết-bị)
- 8. [Cấu Hình SLA & Urgency](#cấu-hình-sla--urgency)
- 9. [Email & Notifications](#email--notifications)
- 10. [Workflows & Rules](#workflows--rules)
- 11. [Knowledge Base](#knowledge-base)
- 12. [Testing & Deployment](#testing--deployment)

---

## 🎯 TỔNG QUAN DỰ ÁN

### Thông Tin Dự Án

```  
PROJECT: GLPI Helpdesk Deployment  
Company: Công Ty Dệt May [Tên Công Ty]  
Scale: 500+ PC + Equipment  
Duration: 4-6 tuần  
Go-live: [Ngày dự kiến]

THÀNH PHẦN HỆ THỐNG:  
├─ 500 máy tính đầu cuối (Workstations)  
├─ 50 máy chủ (Servers)  
├─ 100+ máy in ấn  
├─ 200+ thiết bị ngành may (Máy cắt, máy khâu, máy chế biến...)  
├─ 150+ thiết bị mạng (Router, Switch, Wifi APs)  
├─ Các vật tư IT khác (Ram, SSD, Camera...)  
└─ Total: ~1000+ assets

SCOPE OF HELPDESK:  
├─ PC/Laptop Issues  
├─ Software Support  
├─ Network Issues  
├─ Printer Support  
├─ Equipment Maintenance (Thiết bị sản xuất)  
├─ Asset Tracking  
└─ Change Management  
```

### Mục Tiêu & KPI

```  
PRIMARY GOALS:  
✓ Centralized ticket management  
✓ SLA compliance > 95%  
✓ Asset tracking & inventory  
✓ Reduce response time by 50%  
✓ Knowledge base self-service reduction

TARGET METRICS:  
├─ Response Time: < 2 hours (High priority)  
├─ Resolution Time: < 8 hours (Urgent)  
├─ User Satisfaction: > 4/5 stars  
├─ First Contact Resolution: > 60%  
├─ Ticket Backlog: < 20  
└─ System Uptime: 99.5%  
```

---

## 🛠️ CHUẨN BỊ & PLANNING

### Phase 1: Tìm Hiểu Nhu Cầu (1-2 Tuần)

#### 1.1 Khảo Sát Hiện Trạng

```  
CHECKLIST KHẢO SÁT:

☐ IT Infrastructure  
☐ Danh sách tất cả thiết bị (Inventory)  
☐ Danh sách users/employees  
☐ Orgchart & departments  
☐ Locations (Địa điểm)  
☐ Current support process  
  
☐ Common Issues (Vấn đề thường gặp)  
Liên hệ với các phòng ban để biết:  
☐ Top 10 issues gặp phải  
☐ Tần suất & severity  
☐ Current workarounds  
☐ Equipment types causing issues  
  
☐ Staffing  
☐ IT team size & skills  
☐ Support hours (24/7? 8am-6pm?)  
☐ Locations of IT staff  
☐ On-call policy  
  
☐ Business Requirements  
☐ Peak hours (Khi nào support bị tải cao)  
☐ Critical systems (Máy sản xuất quan trọng)  
☐ Downtime tolerance (Chấp nhận ngưng giờ bao lâu)  
☐ Compliance requirements (ISO, audit...)  
```

#### 1.2 Tạo User Scenarios

```  
VD USER SCENARIOS CHO NGÀNH MAY:

SCENARIO 1: Machine Operator (Công nhân)  
├─ Issue: Máy khâu không khởi động  
├─ Impact: Production line stopped  
├─ Priority: URGENT (Phải xử lý trong 1 giờ)  
├─ Location: Factory floor  
├─ Language: Vietnamese  
├─ Device: Sewing Machine (IoT/Smart device)  
└─ Expected Resolution: On-site technician

SCENARIO 2: Quality Control (QC)  
├─ Issue: Laptop camera không hoạt động  
├─ Impact: Cannot take photos of defects  
├─ Priority: HIGH (Phải xử lý cùng ngày)  
├─ Location: QC Office  
├─ Device: Laptop Dell  
└─ Expected Resolution: Remote support or replacement

SCENARIO 3: Finance Department  
├─ Issue: Cannot access accounting software  
├─ Impact: Cannot process payments  
├─ Priority: URGENT (Phải xử lý 30 phút)  
├─ Location: Office  
├─ Device: Desktop  
└─ Expected Resolution: Check permissions, VPN, DB

SCENARIO 4: Production Manager  
├─ Issue: Network printer offline  
├─ Impact: Cannot print production labels  
├─ Priority: HIGH (1 hour)  
├─ Device: Network Printer  
└─ Expected Resolution: Network diagnostics  
```

#### 1.3 Tạo Requirement Document

```  
TEMPLATE REQUIREMENTS:

SERVICE HOURS:  
├─ Monday-Friday: 07:00 - 18:00  
├─ Saturday: 08:00 - 12:00  
├─ Sunday: Off (Emergency only)  
└─ Holidays: Off

SUPPORT LEVELS:  
├─ Level 1: Help Desk (Hỗ trợ cơ bản)  
├─ Level 2: Specialists (Chuyên gia)  
├─ Level 3: Vendors/Partners  
└─ Level 4: External consultants

LANGUAGES:  
├─ Vietnamese (Primary)  
├─ English (For technical terms)  
└─ French (If needed)

LOCATIONS:  
├─ Factory 1 (Sài Gòn) - 300 employees  
├─ Factory 2 (Hà Nội) - 150 employees  
├─ Headquarters (HCM) - 50 employees  
└─ Remote offices - 20 employees

INTEGRATION NEEDS:  
├─ Active Directory (AD)  
├─ Email System (Outlook/Gmail)  
├─ Ticketing from Email  
├─ Asset Management System (If exists)  
└─ Reporting to Management  
```

---

### Phase 2: Infrastructure Planning (1 Tuần)

#### 2.1 Chọn Deployment Model

```  
3 TUỲ CHỌN:

1️⃣ ON-PREMISE (Recommended cho VN)  
PROS:  
✓ Full control  
✓ Data security (sensitive data)  
✓ Can integrate with local systems  
✓ No internet dependency  
  
CONS:  
✗ Need server hardware  
✗ Requires IT maintenance  
✗ Higher upfront cost  
  
REQUIREMENT:  
• Server: Dell PowerEdge R640 hoặc tương đương  
• CPU: Intel Xeon 8+ cores  
• RAM: 32 GB  
• Storage: 500 GB SSD (for initial)  
• OS: Ubuntu 20.04 LTS / CentOS 8  
• Database: MySQL 8.0 / MariaDB 10.5  
• Web Server: Apache/Nginx  
  
NETWORK:  
• Fixed IP for server  
• Backup internet connection  
• Firewall rules (Port 80, 443)

2️⃣ CLOUD (AWS/Azure/Google Cloud)  
PROS:  
✓ No hardware to manage  
✓ Scalable  
✓ Automatic backups  
✗ Internet dependency  
✗ Monthly costs  
✗ Data sovereignty concerns

3️⃣ HYBRID  
✓ On-premise for critical  
✓ Cloud for redundancy  
(More complex)

RECOMMENDATION FOR YOUR CASE:  
→ ON-PREMISE + Cloud Backup  
Vì: Data security quan trọng, VN networking ổn định  
```

#### 2.2 Hardware & Network Planning

```  
HARDWARE REQUIREMENTS:

🖥️ SERVER SPECIFICATIONS:  
┌──────────────────────────┐  
│ For 500-1000 users │  
├──────────────────────────┤  
│ CPU: Intel Xeon 8 cores+ │  
│ RAM: 32 GB (minimum) │  
│ Storage: │  
│ ├─ OS: 50 GB SSD │  
│ ├─ MySQL: 250 GB │  
│ ├─ Backup: 1 TB │  
│ └─ Log files: 100 GB │  
│ │  
│ Total Storage: 2 TB │  
│ (Recommended: 3-4 TB) │  
│ │  
│ Network: 1Gbps Ethernet │  
│ (Bonded for redundancy) │  
│ │  
│ UPS: 10kVA minimum │  
│ (To handle sudden power) │  
│ │  
│ Backup solution: │  
│ ├─ Daily backups (7 days)│  
│ ├─ Weekly backups (4 weeks)  
│ └─ Monthly backups (1 year)  
└──────────────────────────┘

DATABASE REQUIREMENTS:  
• MySQL 8.0 or MariaDB 10.5+  
• Charset: UTF-8 (for Vietnamese)  
• Max connections: 500+  
• Max allowed packet: 64MB

WEB SERVER:  
• Apache 2.4+ or Nginx 1.18+  
• PHP 7.4+ or 8.0+  
• PHP Extensions:  
✓ mysqli / mysqlnd  
✓ curl, json, xml  
✓ gd (Image processing)  
✓ ldap (For AD integration)  
✓ imap (For email)  
✓ gzip, zlib  
```

#### 2.3 Network Architecture

```  
NETWORK DIAGRAM:

┌─────────────────┐  
│ Internet │  
│ (ISP 1Gbps) │  
└────────┬─────────┘  
│  
┌────────▼────────┐  
│ Firewall │  
│ (Port 80,443) │  
└────────┬────────┘  
│  
┌────────────────┼────────────────┐  
│ │ │  
┌────────▼────────┐ ┌───▼────┐ ┌─────▼──────┐  
│ GLPI Web Server │ │ MySQL │ │ Backup │  
│ (IP: 10.0.0.10)│ │ Server│ │ Server │  
└────────┬────────┘ └────────┘ └────────────┘  
│  
│ (Via LAN Switch)  
│  
┌───────┴─────────────────┐  
│ │  
┌───▼──────┐ ┌───────▼────┐  
│Factory 1 │ │Factory 2 │  
│(300 PCs) │ │(150 PCs) │  
└──────────┘ └────────────┘  
│ │  
┌───▼──────────────────────▼────┐  
│ GLPI Client Network │  
│ (All PCs, Printers, Devices) │  
│ (Subnet: 10.0.0.0/24) │  
└───────────────────────────────┘

NETWORK PLANNING:  
IP Scheme:  
├─ Management: 10.0.0.0/24  
│ ├─ GLPI Server: 10.0.0.10  
│ ├─ MySQL Server: 10.0.0.11  
│ └─ Backup: 10.0.0.12  
├─ Factory 1: 10.1.0.0/24  
├─ Factory 2: 10.2.0.0/24  
└─ Office: 10.3.0.0/24

DNS:  
├─ helpdesk.company.vn → 10.0.0.10  
├─ glpi-api.company.vn → 10.0.0.10  
└─ Internal DNS for assets

FIREWALL RULES:  
Inbound:  
├─ Port 80 (HTTP) → GLPI Web  
├─ Port 443 (HTTPS) → GLPI Web (Recommended)  
├─ Port 3306 (MySQL) → Only from App Server  
└─ Port 22 (SSH) → Only from Admin IPs

Outbound:  
├─ Email (SMTP 587/25)  
├─ LDAP (389/636) - If using AD  
├─ NTP (123) - For time sync  
└─ DNS (53)  
```

---

## 💾 CÀI ĐẶT & KHỞI TẠO

### Phase 3: Installation (1-2 Tuần)

#### 3.1 Cài Đặt GLPI

```  
PREREQUISITES CHECK:

☐ OS: Ubuntu 20.04 LTS  
☐ PHP 7.4+ installed  
☐ MySQL 8.0+ installed  
☐ Apache/Nginx running  
☐ Internet connection  
☐ Root/sudo access

INSTALLATION STEPS:

1️⃣ DOWNLOAD & EXTRACT

# Download GLPI  
wget https://github.com/glpi-project/glpi/releases/download/10.0.0/glpi-10.0.0.tgz

# Extract to web root  
tar -xzf glpi-10.0.0.tgz -C /var/www/  
cd /var/www/glpi

# Set permissions  
sudo chown -R www-data:www-data /var/www/glpi  
sudo chmod -R 755 /var/www/glpi

2️⃣ CREATE DATABASE

mysql -u root -p

CREATE DATABASE glpi_db  
CHARACTER SET utf8mb4  
COLLATE utf8mb4_unicode_ci;

CREATE USER 'glpi_user'@'localhost'  
IDENTIFIED BY 'strong_password_here';

GRANT ALL PRIVILEGES ON glpi_db.*  
TO 'glpi_user'@'localhost';

FLUSH PRIVILEGES;  
EXIT;

3️⃣ RUN WEB INSTALLER

Go to: https://your-server-ip/glpi/install/

Follow the installer:  
├─ Language: Vietnamese (Tiếng Việt)  
├─ License agreement: Accept  
├─ Database configuration:  
│ ├─ Host: localhost  
│ ├─ User: glpi_user  
│ ├─ Password: [your password]  
│ └─ Database: glpi_db  
├─ Create tables: Auto  
└─ Admin user: admin (Change password!)

⚠️ IMPORTANT: Change default admin password immediately!

4️⃣ POST-INSTALLATION

# Remove install folder  
sudo rm -rf /var/www/glpi/install

# Configure cron for automatic tasks  
sudo crontab -u www-data -e

# Add these lines:  
_/5_ * php -f /var/www/glpi/front/cron.php

# Verify installation  
https://your-server-ip/glpi/  
```

#### 3.2 Initial Configuration Wizard

```  
GLPI SETUP WIZARD:

Step 1: Entity Configuration  
├─ Create main entity: "Công Ty Dệt May [Name]"  
├─ Set as default  
└─ Administrator email: admin@company.vn

Step 2: Locations  
├─ Location 1: Factory 1 (Sài Gòn)  
├─ Location 2: Factory 2 (Hà Nội)  
├─ Location 3: Headquarters  
└─ Location 4: Remote

Step 3: Basic Settings  
├─ Language: Vietnamese  
├─ Date Format: DD/MM/YYYY  
├─ Time Zone: Asia/Ho_Chi_Minh  
└─ Currency: VND

Step 4: Email Configuration  
├─ From: support@company.vn  
├─ Sender name: IT Support  
├─ Reply-to: support@company.vn  
└─ Signature: [Company name]

Step 5: First Users  
├─ Create IT Manager account  
├─ Create IT Technician accounts (3-5)  
└─ Import users from CSV/LDAP (See section 4)  
```

---

## 🏢 CẤU HÌNH ENTITIES & DEPARTMENTS

### Phase 4: Organization Setup (1 Tuần)

#### 4.1 Tạo Entity Structure

```  
GLPI ENTITIES vs DEPARTMENTS:

Entity (Thực thể/Công ty):  
├─ Can have sub-entities  
├─ Separate configurations  
├─ Separate tickets & assets  
└─ Example: Main company, Branches

Department (Phòng ban):  
├─ Within an entity  
├─ Share entity settings  
├─ Organizational grouping only  
└─ Example: HR, Finance, Production

VD STRUCTURE NGÀNH MAY:

📦 MAIN ENTITY: "Công Ty Dệt May [Name]"  
│  
├── 🏭 ENTITY: "Factory 1 - Sài Gòn"  
│ ├── Department: Production Floor  
│ ├── Department: Quality Control  
│ ├── Department: Maintenance  
│ └── Department: Admin  
│  
├── 🏭 ENTITY: "Factory 2 - Hà Nội"  
│ ├── Department: Production Floor  
│ ├── Department: Packing  
│ └── Department: Admin  
│  
└── 🏢 ENTITY: "Headquarters - HCM"  
├── Department: Finance  
├── Department: HR  
├── Department: Sales  
├── Department: IT  
└── Department: Management  
```

#### 4.2 Tạo Entities Chi Tiết

```  
NAVIGATION: Administration → Entities

ENTITY 1: HEADQUARTERS

Name: Công Ty Dệt May [Full Name]  
Code: HQ  
Comments: Văn phòng chính, HCM  
Website: www.company.vn  
Phone: +84-28-xxxx-xxxx  
Fax: +84-28-xxxx-xxxx  
Address: [Full address]  
Postcode: 70000  
City: Hồ Chí Minh  
Country: Việt Nam  
State: Ho Chi Minh

Parent Entity: [None - This is main]  
Is_active: Yes  
Synchronize_ldap_field: [If using AD]

URL redirect method: Redirect to entity central

ENTITY 2: FACTORY 1

Name: Nhà Máy Số 1 - Sài Gòn  
Code: FAC1  
Comments: Nhà máy sản xuất chính  
Address: [Factory 1 address]  
City: Sài Gòn  
Country: Việt Nam

Parent Entity: Công Ty Dệt May [Main]  
Is_active: Yes

Logo: [Factory logo if needed]  
Default font: Arial  
Theme: [Default or custom]

Notification: Enable  
Email From: support-factory1@company.vn

ENTITY 3: FACTORY 2

Name: Nhà Máy Số 2 - Hà Nội  
Code: FAC2  
Comments: Nhà máy sản xuất phụ  
Address: [Factory 2 address]  
City: Hà Nội  
Country: Việt Nam

Parent Entity: Công Ty Dệt May [Main]  
Is_active: Yes

Email From: support-factory2@company.vn  
```

#### 4.3 Tạo Departments

```  
NAVIGATION: Administration → Entities → [Select Entity] → Departments Tab

DEPARTMENTS (FACTORY 1):

Dept 1: PRODUCTION FLOOR  
├─ Name: Phòng Sản Xuất  
├─ Comments: Khu vực máy khâu, cắt, chế biến  
├─ Manager: [Select person]  
├─ Location: Factory 1 Floor  
└─ Description: Main production area

Dept 2: QUALITY CONTROL  
├─ Name: Phòng Kiểm Chất  
├─ Comments: QC team  
├─ Manager: [QC Manager]  
├─ Location: Factory 1 QC Office  
└─ Description: Product quality inspection

Dept 3: MAINTENANCE  
├─ Name: Phòng Bảo Trì Thiết Bị  
├─ Comments: Maintenance team  
├─ Manager: [Maintenance Manager]  
├─ Focus: Preventive & corrective maintenance  
└─ Equipment types they maintain:  
- Sewing machines  
- Cutting machines  
- Pressing machines  
- Dyeing equipment

Dept 4: PACKAGING  
├─ Name: Phòng Đóng Gói  
├─ Comments: Final stage before shipping  
└─ Equipment: Labeling machines, presses

---

DEPARTMENTS (HEADQUARTERS):

Dept 1: IT SUPPORT  
├─ Name: Phòng IT Support  
├─ Manager: IT Manager  
├─ Focus: All IT issues  
└─ Team: 5-8 technicians

Dept 2: FINANCE  
├─ Name: Phòng Kế Toán  
├─ Manager: Finance Manager  
└─ Critical systems: Accounting software

Dept 3: HUMAN RESOURCES  
├─ Name: Phòng Nhân Sự  
├─ Manager: HR Manager  
└─ Focus: Recruitment, payroll systems

Dept 4: SALES & MARKETING  
├─ Name: Phòng Bán Hàng & Marketing  
├─ Manager: Sales Manager  
└─ Critical tools: CRM, Email  
```

#### 4.4 Cấu Hình Entity Settings

```  
NAVIGATION: Administration → Entities → [Select] → Tab: Settings

GENERAL SETTINGS:

Response/Resolve Times:  
├─ Response time urgency: 4 hours  
├─ Resolve time urgency: 8 hours  
├─ Response time high: 8 hours  
├─ Resolve time high: 24 hours  
├─ Response time medium: 24 hours  
├─ Resolve time medium: 48 hours  
└─ Etc...

Notification Settings:  
├─ Notification close: [Enable]  
├─ Notification refused: [Enable]  
├─ Default notification type: Email  
└─ Include documents in notification: Yes

Asset Depreciation:  
├─ Default deprecation period: 5 years (for equipment)  
├─ Depreciation method: Linear  
└─ Activate depreciation: Yes

Ticket Settings:  
├─ Auto-assign tickets: Yes (to groups)  
├─ Auto-close after: 7 days (no activity)  
├─ Auto-reassign tickets: Yes  
├─ Default priority: Medium  
└─ Notification on ticket creation: Yes

Logging/Audit:  
├─ Keep logs: 2 years  
├─ Log new ticket: Yes  
├─ Log ticket updates: Yes  
└─ Log sensitive operations: Yes  
```

---

## 👥 QUẢN LÝ USERS & GROUPS

### Phase 5: User Management

#### 5.1 Tạo User Groups

```  
NAVIGATION: Administration → Groups

GLPI GROUP STRUCTURE FOR TEXTILE:

GROUP 1: IT SUPPORT TEAM  
├─ Name: IT Support Team  
├─ Comments: Internal IT support staff  
├─ Visibility: Owner  
├─ Hierarchy: None (Top level)  
├─ Manager: IT Manager  
├─ Members:  
│ ├─ John Smith (Group Leader)  
│ ├─ Jane Doe (Technician - Hardware)  
│ ├─ Mike Johnson (Technician - Software)  
│ ├─ Sarah Lee (Technician - Network)  
│ └─ Tom Brown (Technician - Support)  
└─ Permissions:  
├─ Create tickets: Yes  
├─ View all tickets: Yes  
├─ Update all tickets: Yes  
├─ Close tickets: Yes  
└─ Assign tickets: Yes

GROUP 2: PRODUCTION FLOOR TEAM  
├─ Name: Phòng Sản Xuất  
├─ Description: Production floor operators  
├─ Members: All factory floor workers (~250 people)  
├─ Visibility: Users only  
└─ Permissions:  
├─ Create tickets: Yes (for their issues)  
├─ View own tickets: Yes  
├─ View team tickets: No  
└─ Close tickets: No

GROUP 3: QUALITY CONTROL TEAM  
├─ Name: Phòng Kiểm Chất  
├─ Description: QC staff  
├─ Members: QC team members  
└─ Permissions: Same as production

GROUP 4: MANAGEMENT/EXECUTIVES  
├─ Name: Executives  
├─ Description: Company management  
├─ Members: Manager, Directors  
└─ Permissions:  
├─ View all tickets: Yes  
├─ View reports: Yes  
├─ Create urgent tickets: Yes  
└─ Escalate tickets: Yes

GROUP 5: VENDORS/EXTERNAL  
├─ Name: External Vendors  
├─ Description: Third-party support  
├─ Members: Equipment vendors  
└─ Visibility: Public  
└─ Permissions: Limited (see assigned only)  
```

#### 5.2 Import Users From LDAP/AD

```  
NAVIGATION: Administration → Users → Links to LDAP

CONFIGURATION:

If your company uses Active Directory:

1️⃣ CONFIGURE LDAP CONNECTION

Server: ldap.company.vn (or IP: 10.x.x.x)  
Port: 389 (or 636 for LDAP/S)  
TLS: Yes (for security)  
Default domain: company.vn

Login: cn=admin,dc=company,dc=vn  
Password: [LDAP admin password]

Base DN: dc=company,dc=vn  
Filter: (&(objectClass=person)(mail=*))

2️⃣ MAP LDAP FIELDS TO GLPI

Login (userPrincipalName): John.Smith@company.vn  
Email (mail): john.smith@company.vn  
First Name (givenName): John  
Last Name (sn): Smith  
Phone (telephoneNumber): +84-28-xxxx-xxxx  
Mobile (mobile): +84-9xx-xxx-xxx  
Department: Department name

Entity: Based on OU structure  
Example:  
- OU=Factory1 → Entity: Factory 1  
- OU=Factory2 → Entity: Factory 2  
- OU=HQ → Entity: Headquarters

3️⃣ AUTOMATIC SYNC

Frequency: Daily at 2:00 AM  
Synchronization method: Full sync weekly, incremental daily

Enable:  
☑ Synchronize with directory  
☑ Deactivate users not found  
☑ Update user data from directory  
☑ Link to LDAP automatically

4️⃣ TEST CONNECTION

Click [TEST LDAP CONNECTION]

Result should show:  
✅ Connected to LDAP server  
✅ Found X users  
✅ Sample user data displayed  
```

#### 5.3 Manual User Creation (If no LDAP)

```  
NAVIGATION: Administration → Users → Add User

USER TEMPLATE 1: TECHNICIAN

Login: john.smith  
First Name: John  
Last Name: Smith  
Email: john.smith@company.vn  
Phone: +84-28-xxxx-xxxx  
Mobile: +84-9xx-xxx-xxx  
Title: IT Technician  
Language: Vietnamese  
Theme: [Default]  
Entity: [Factory 1]  
Default Entity: Factory 1  
Comments: Specialization - Hardware support

Groups:  
☑ IT Support Team  
☑ Hardware Support Group

Default Dashboard: Technician Dashboard  
Recursive groups: Yes  
Is_active: Yes  
Authentification type: GLPI Internal

USER TEMPLATE 2: MANAGER/OPERATOR (Non-IT)

Login: jane.doe  
First Name: Jane  
Last Name: Doe  
Email: jane.doe@company.vn  
Entity: Factory 1  
Default Entity: Factory 1  
Title: Production Manager  
Department: Production Floor  
Comments: Can create & track tickets

Groups:  
☑ Production Floor Team  
☑ Management

Is_active: Yes  
Can create tickets: Yes

USER TEMPLATE 3: VENDOR/EXTERNAL

Login: vendor.mechanic  
First Name: John  
Last Name: Mechanic (Vendor)  
Email: john@equipmentvendor.com  
Entity: [All]  
External: Yes

Groups:  
☑ External Vendors

Visibility: Limited (only assigned tickets)  
Is_active: Yes  
```

#### 5.4 Bulk User Import (CSV)

```  
NAVIGATION: Administration → Users → Import from CSV

CSV FORMAT:

login,firstname,lastname,email,phone,entity,groups,is_active  
john.smith,John,Smith,john.smith@company.vn,+84-28-xxxx-xxxx,Factory 1,IT Support Team,1  
jane.doe,Jane,Doe,jane.doe@company.vn,+84-28-xxxx-xxxx,Factory 1,Production Floor,1  
mike.jones,Mike,Jones,mike.jones@company.vn,+84-28-xxxx-xxxx,Factory 1,Quality Control,1  
sarah.lee,Sarah,Lee,sarah.lee@company.vn,+84-28-xxxx-xxxx,Factory 2,Production Floor,1  
tom.brown,Tom,Brown,tom.brown@company.vn,+84-28-xxxx-xxxx,HQ,Management,1  
...

IMPORT PROCESS:

- 1. Prepare CSV file with all users
- 2. Go to Users → [Import Button]
- 3. Select CSV file
- 4. Map columns:

  
├─ login → username  
├─ firstname → first_name  
├─ lastname → last_name  
├─ email → email  
├─ phone → phone  
├─ entity → entity_id  
├─ groups → group_id (comma-separated)  
└─ is_active → status  

- 5. Review preview
- 6. Click [IMPORT]

RESULT:  
✅ All users imported  
✅ Auto-send welcome emails  
✅ Initial password sent  
✅ Users can login next day

BEST PRACTICES:  
• Notify users before import  
• Prepare welcome guide  
• Set up FAQ about password reset  
• Configure auto-reply for support email  
• Test with 10 users first  
```

#### 5.5 Create Support Team Structure

```  
IT SUPPORT ORGANIZATION:

┌─────────────────────────────────────┐  
│ IT Manager (Level 3) │  
│ - Overall support oversight │  
│ - Reports to Director │  
│ - Available: 24/7 on-call │  
└──────────────┬──────────────────────┘  
│  
┌──────────┼──────────┐  
│ │ │  
┌───▼──┐ ┌───▼──┐ ┌───▼──┐  
│Tech 1│ │Tech 2│ │Tech 3│  
│Level 2│ │Level 2│ │Level 2│  
└───┬──┘ └───┬──┘ └───┬──┘  
│ │ │  
┌───▼──────┬──▼──────┬──▼──┐  
│Factory 1 │Factory 2│ HQ │  
│Support │Support │Support  
└──────────┴─────────┴─────┘

SKILLS MATRIX:

Tech John Smith:  
├─ Hardware: ⭐⭐⭐⭐⭐ (Expert)  
├─ Software: ⭐⭐⭐ (Intermediate)  
├─ Network: ⭐⭐ (Basic)  
├─ Equipment: ⭐⭐⭐ (Intermediate)  
└─ Location: Factory 1

Tech Jane Doe:  
├─ Hardware: ⭐⭐⭐ (Intermediate)  
├─ Software: ⭐⭐⭐⭐ (Advanced)  
├─ Network: ⭐⭐⭐⭐ (Advanced)  
├─ Equipment: ⭐ (Basic)  
└─ Location: Factory 1 (Remote support)

Tech Mike Johnson:  
├─ Hardware: ⭐⭐⭐ (Intermediate)  
├─ Software: ⭐⭐⭐⭐ (Advanced)  
├─ Network: ⭐⭐⭐ (Intermediate)  
├─ Equipment: ⭐⭐⭐⭐⭐ (Expert)  
└─ Location: Factory 2

Tech Sarah Lee:  
├─ Hardware: ⭐⭐ (Basic)  
├─ Software: ⭐⭐⭐ (Intermediate)  
├─ Network: ⭐⭐⭐⭐ (Advanced)  
├─ Equipment: ⭐⭐ (Basic)  
└─ Location: HQ/Remote

SCHEDULE:  
├─ Business Hours: Mon-Fri 08:00-17:00  
├─ Extended Hours: Sat 08:00-12:00  
├─ On-Call Rotation: After hours & Sunday  
├─ Shift:  
│ ├─ Shift 1: 07:00-15:00 (2 techs)  
│ ├─ Shift 2: 14:00-22:00 (2 techs)  
│ └─ Night: 22:00-07:00 (1 on-call)  
└─ Coverage: Always have 1 person for urgent  
```

---

## 📋 CẤU HÌNH CATEGORIES & TYPES

### Phase 6: Ticket Classification

#### 6.1 Tạo Ticket Types (Loại Ticket)

```  
NAVIGATION: Administration → Ticket Types

GLPI HAS 2 BUILT-IN TYPES:

Type 1: REQUEST (Yêu cầu dịch vụ)  
├─ Service request  
├─ Information request  
├─ Access request  
└─ SLA more relaxed

Type 2: INCIDENT (Sự cố)  
├─ System down  
├─ Critical issue  
├─ Urgent problem  
└─ Shorter SLA

CREATE ADDITIONAL TYPES (OPTIONAL):

Type 3: CHANGE REQUEST  
├─ Name: Change Request  
├─ Comments: Changes to systems/processes  
├─ Can be linked to: Change Management  
└─ SLA: 5 days

Type 4: MAINTENANCE REQUEST  
├─ Name: Equipment Maintenance  
├─ Comments: Preventive/Corrective maintenance  
├─ For equipment tracking  
└─ Used in Factory floor  
```

#### 6.2 Tạo Categories Chi Tiết (Ngành May)

```  
NAVIGATION: Administration → Ticket Categories

CATEGORY STRUCTURE:

Mục 1: HARDWARE (Phần Cứng Máy Tính)  
├─ Desktop Issues  
│ ├─ Power supply problems  
│ ├─ Screen issues  
│ ├─ Keyboard/Mouse problems  
│ ├─ RAM/Storage issues  
│ └─ Fan/Cooling problems  
├─ Laptop Issues  
│ ├─ Battery problems  
│ ├─ Screen issues  
│ ├─ Keyboard problems  
│ ├─ Storage issues  
│ └─ Overheating  
├─ Monitor Issues  
│ ├─ No display  
│ ├─ Resolution problems  
│ ├─ Color problems  
│ └─ Connectivity (HDMI/DP)  
└─ Peripheral Issues  
├─ USB devices  
├─ External drives  
├─ Cables  
└─ Adapters

Mục 2: SOFTWARE (Phần Mềm)  
├─ Windows/OS  
│ ├─ System crashes  
│ ├─ Boot issues  
│ ├─ Driver problems  
│ ├─ Updates  
│ └─ Licensing  
├─ Office Applications  
│ ├─ Word issues  
│ ├─ Excel crashes  
│ ├─ Outlook email  
│ └─ PowerPoint  
├─ Business Software  
│ ├─ ERP System  
│ ├─ Accounting software  
│ ├─ CRM issues  
│ └─ Database access  
├─ Web Browsers  
│ ├─ Chrome issues  
│ ├─ Firefox issues  
│ ├─ Internet Explorer  
│ └─ Browser extensions  
└─ Other Software  
├─ PDF readers  
├─ Video players  
├─ Antivirus  
└─ Backup software

Mục 3: NETWORK (Mạng)  
├─ Internet Connectivity  
│ ├─ No internet connection  
│ ├─ Slow internet  
│ ├─ Wi-Fi issues  
│ ├─ VPN problems  
│ └─ DNS issues  
├─ Local Network  
│ ├─ Network printer not found  
│ ├─ File server access  
│ ├─ Cannot access network drive  
│ ├─ Network cable issues  
│ └─ Switch/Router problems  
├─ Email & Communication  
│ ├─ Cannot send/receive email  
│ ├─ Outlook sync issues  
│ ├─ Team communication tools  
│ └─ Email configuration  
└─ VoIP & Phones  
├─ Cannot make calls  
├─ Sound quality issues  
├─ Phone configuration  
└─ Extension issues

Mục 4: PRINTER (Máy In)  
├─ Network Printer Issues  
│ ├─ Printer offline  
│ ├─ Not printing  
│ ├─ Paper jam  
│ ├─ Toner/Ink empty  
│ └─ Driver issues  
├─ Printer Connectivity  
│ ├─ Network connection lost  
│ ├─ IP address reset  
│ ├─ Configuration issues  
│ └─ Port problems  
└─ Printer Maintenance  
├─ Cleaning request  
├─ Toner/Ink replacement  
├─ Consumables order  
└─ Preventive maintenance

Mục 5: PRODUCTION EQUIPMENT (Thiết Bị Sản Xuất)  
└─ Critical for textile factory

├─ Sewing Machines (Máy Khâu)  
│ ├─ Needle breakage  
│ ├─ Thread tension problems  
│ ├─ Motor issues  
│ ├─ Speed control  
│ ├─ Stitch quality  
│ └─ Electrical problems  
├─ Cutting Equipment (Máy Cắt)  
│ ├─ Blade issues  
│ ├─ Alignment problems  
│ ├─ Motor issues  
│ ├─ Hydraulic problems  
│ └─ Precision issues  
├─ Pressing/Finishing Machines  
│ ├─ Temperature control  
│ ├─ Pressure issues  
│ ├─ Timer problems  
│ ├─ Heating element  
│ └─ Cooling system  
├─ Dyeing Equipment  
│ ├─ Temperature control  
│ ├─ Chemical pump issues  
│ ├─ Water supply  
│ ├─ Drain system  
│ └─ Color consistency  
├─ Packing Equipment  
│ ├─ Labeling issues  
│ ├─ Sealing problems  
│ ├─ Speed control  
│ └─ Sensor problems  
└─ Maintenance Related  
├─ Preventive maintenance schedule  
├─ Parts replacement  
├─ Calibration needed  
└─ Oil/Lubrication

Mục 6: FACILITIES (Hạ Tầng)  
├─ Power Supply  
│ ├─ Power outage  
│ ├─ Breaker tripped  
│ ├─ Surge protection  
│ └─ Generator issues  
├─ HVAC (Điều Hòa)  
│ ├─ Air conditioning  
│ ├─ Ventilation  
│ └─ Temperature control  
├─ Water Supply  
│ ├─ Water pressure  
│ ├─ Supply issues  
│ └─ Drainage  
└─ Backup Systems  
├─ UPS issues  
├─ Battery problems  
└─ Generator test

Mục 7: SECURITY (Bảo Mật)  
├─ Access Control  
│ ├─ Cannot login  
│ ├─ Forgot password  
│ ├─ Account locked  
│ └─ Permission issues  
├─ Data Security  
│ ├─ Suspicious activity  
│ ├─ Malware detected  
│ ├─ Data breach  
│ └─ Encryption issues  
└─ Physical Security  
├─ Key card issues  
├─ Door access  
├─ CCTV issues  
└─ Alarm system

Mục 8: TRAINING & DOCUMENTATION  
├─ Software training  
├─ Hardware training  
├─ Process documentation  
├─ System documentation  
└─ User guides

Mục 9: ASSET MANAGEMENT (Quản Lý Tài Sản)  
├─ Asset tracking  
├─ Asset depreciation  
├─ Asset relocation  
├─ Asset disposal  
└─ Inventory audit

Mục 10: OTHER (Khác)  
└─ General inquiries  
```

#### 6.3 Configure Category Properties

```  
NAVIGATION: Administration → Ticket Categories

DETAILED CONFIGURATION:

CATEGORY: Sewing Machine Issues

Name: Máy Khâu - Lỗi  
Comments: Issues with sewing machines in factory

Visibility: Public  
Is_active: Yes

Icon: [Machine icon]  
Color: [Red for equipment]

Type: INCIDENT (vì ảnh hưởng sản xuất)

Urgency Level (Default): HIGH  
Impact Level: HIGH

Groups Assigned:  
├─ IT Support Team (Level 1 diagnosis)  
├─ Equipment Maintenance Team (Level 2 fix)  
└─ Vendor Support (If warranty)

SLA Override:  
├─ Response SLA: 1 hour (critical)  
├─ Resolution SLA: 4 hours  
└─ Override priority: YES (always urgent)

Templates Associated:  
├─ Sewing Machine Diagnosis  
├─ Parts Replacement  
└─ Preventive Maintenance

Knowledge Base Links:  
├─ Sewing machine troubleshooting  
├─ Common issues & fixes  
├─ Spare parts list  
└─ Maintenance schedule

CATEGORY: Network Printer Issues

Name: Máy In - Vấn Đề Mạng  
Comments: Network printer connectivity & function issues

Type: REQUEST (not production-critical)

Visibility: Public  
Is_active: Yes

Default Priority: MEDIUM  
Default Urgency: MEDIUM

Groups Assigned:  
└─ IT Support Team (Hardware specialist)

SLA:  
├─ Response: 2 hours  
├─ Resolution: 8 hours (business hours)  
└─ Weekend: 4 hours

Templates:  
├─ Printer Offline  
├─ Cartridge Replacement  
└─ Network Configuration

CATEGORY: Software Issues

Name: Phần Mềm - Lỗi  
Comments: Software installation, update, compatibility

Type: INCIDENT

Visibility: Public

Default Priority: MEDIUM  
Default Urgency: MEDIUM

Groups:  
└─ IT Support Team (Software specialist)

SLA:  
├─ Response: 2 hours  
├─ Resolution: 8 hours  
└─ Critical app: 1 hour response

Templates:  
├─ Software Installation  
├─ Update Issues  
└─ Compatibility Check  
```

#### 6.4 Tạo Ticket Templates

```  
NAVIGATION: Administration → Ticket Templates

TEMPLATE 1: SEWING MACHINE MALFUNCTION

Name: Máy Khâu - Hỏng Hóc  
Type: INCIDENT  
Category: Sewing Machine Issues

TEMPLATE CONTENT:

TITLE (Pre-filled):  
"[Location] Máy khâu #[Machine_ID] - Lỗi"

DESCRIPTION (Pre-filled):  
"  
**Thông Tin Máy:**  

- • Machine ID:
- • Location:
- • Operator:

**Mô Tả Lỗi:**  

- • Triệu chứng (Symptoms):
- • Khi nào bắt đầu:
- • Sản lượng bị ảnh hưởng:
- • Đã thử gì chưa:

**Ảnh hưởng:**  

- • Số công nhân bị ảnh hưởng:
- • Sản lượng mất:
- • Deadline:

**Lịch sử:**  

- • Lần sửa trước:
- • Vấn đề tương tự:

  
"

DEFAULT FIELDS:  
├─ Priority: High  
├─ Urgency: High  
├─ Impact: High  
├─ Category: Sewing Machine Issues  
├─ Group: Equipment Maintenance  
└─ Type: Incident

TEMPLATE 2: NETWORK PRINTER OFFLINE

Name: Máy In Mạng - Offline  
Type: REQUEST  
Category: Printer Issues

TEMPLATE CONTENT:

TITLE:  
"[Department] Máy in #[Printer_ID] - Offline"

DESCRIPTION:  
"  
**Thông Tin Máy In:**  

- • Printer Name:
- • IP Address:
- • Department:
- • User:

**Vấn Đề:**  

- • Không thể in được
- • Máy offline trên mạng
- • Lỗi: [driver/network/hardware]

**Đã thử:**  

- • Restart máy in
- • Check cable
- • Restart computer
- • Check IP

**Cần hỗ trợ:**  

- • Network diagnosis
- • Driver reinstall
- • Hardware repair

  
"

DEFAULT FIELDS:  
├─ Priority: Medium  
├─ Category: Printer Issues  
├─ Group: IT Support Team  
└─ Type: Request

TEMPLATE 3: SOFTWARE INSTALLATION REQUEST

Name: Cài Đặt Phần Mềm  
Type: REQUEST  
Category: Software Issues

TEMPLATE CONTENT:

TITLE:  
"Yêu cầu cài đặt: [Software Name]"

DESCRIPTION:  
"  
**Thông Tin:**  

- • Software: [Name]
- • Version:
- • User: [Name]
- • Computer: [AssetTag]

**Lý Do:**  

- • Dự án:
- • Chức năng cần:
- • Ngày cần:

**Yêu Cầu Thêm:**  

- • License cần cấp: Có/Không
- • Training cần: Có/Không
- • Phiên bản cũ có xóa không: Có/Không

  
"

DEFAULT FIELDS:  
├─ Priority: Normal  
├─ Category: Software Issues  
├─ Group: IT Support (Software team)  
└─ Type: Request  
```

---

## 💾 QUẢN LÝ ASSETS (THIẾT BỊ)

### Phase 7: Asset Configuration

#### 7.1 Asset Types Configuration

```  
NAVIGATION: Administration → Assets Items Settings

VD ASSET TYPES CHO NGÀNH MAY:

ASSET TYPE 1: COMPUTERS  
├─ Subtypes:  
│ ├─ Desktop  
│ ├─ Laptop  
│ ├─ Server  
│ └─ Tablet  
│  
├─ Key Attributes:  
│ ├─ Serial Number (unique)  
│ ├─ Manufacturer  
│ ├─ Model  
│ ├─ CPU  
│ ├─ RAM  
│ ├─ Storage  
│ ├─ OS  
│ ├─ Purchase Date  
│ ├─ Warranty End  
│ ├─ Location  
│ ├─ User Assigned  
│ ├─ Department  
│ └─ Status (Active/Inactive/Broken)  
│  
├─ Custom Fields:  
│ ├─ Asset Tag (Company internal ID)  
│ ├─ Invoice Number  
│ ├─ Department Assigned  
│ └─ Cost Center  
│  
└─ Lifecycle:  
├─ New  
├─ Active (In use)  
├─ In maintenance (Sửa chữa)  
├─ Inactive (Not in use)  
└─ Retired (Hết đổi mới)

ASSET TYPE 2: PRINTERS  
├─ Subtypes:  
│ ├─ Network Printer  
│ ├─ Multifunction (máy in + scan + copy)  
│ └─ Label Printer  
│  
├─ Key Attributes:  
│ ├─ Model  
│ ├─ IP Address  
│ ├─ MAC Address  
│ ├─ Location  
│ ├─ Consumables (Cartridge type)  
│ ├─ Warranty  
│ ├─ Support Contract  
│ └─ Monthly Quota (if applicable)  
│  
└─ Related:  
├─ Maintenance Schedule  
├─ Consumable Orders  
└─ Cost per page

ASSET TYPE 3: NETWORK EQUIPMENT  
├─ Subtypes:  
│ ├─ WiFi Access Point  
│ ├─ Network Switch  
│ ├─ Router  
│ ├─ Network Camera  
│ └─ Firewall  
│  
└─ Attributes:  
├─ IP Address  
├─ MAC Address  
├─ VLAN Config  
├─ Bandwidth  
├─ Location  
└─ Support Contract

ASSET TYPE 4: PRODUCTION EQUIPMENT  
├─ Subtypes:  
│ ├─ Sewing Machine  
│ ├─ Cutting Machine  
│ ├─ Pressing Machine  
│ ├─ Dyeing Equipment  
│ ├─ Packing Equipment  
│ └─ Other Manufacturing  
│  
├─ Key Attributes:  
│ ├─ Equipment ID (Factory assigned)  
│ ├─ Manufacturer  
│ ├─ Model  
│ ├─ Serial Number  
│ ├─ Installation Date  
│ ├─ Location (Floor, Section)  
│ ├─ Operator (Responsible person)  
│ ├─ Last Maintenance  
│ ├─ Maintenance Interval  
│ ├─ Warranty Status  
│ ├─ Spare Parts List  
│ ├─ Maintenance History  
│ ├─ Error Codes  
│ └─ Critical: Yes/No  
│  
├─ Custom Fields:  
│ ├─ Machine Speed (RPM)  
│ ├─ Power Consumption  
│ ├─ Thread/Needle Type  
│ ├─ Thread Color Available  
│ └─ Production Capacity  
│  
└─ Links:  
├─ Vendor Support Contact  
├─ Documentation Files  
├─ Operation Manual  
└─ Spare Parts Supplier

ASSET TYPE 5: SUPPLIES & CONSUMABLES  
├─ Subtypes:  
│ ├─ Ink/Toner Cartridge  
│ ├─ Paper/Media  
│ ├─ Thread (For sewing)  
│ ├─ Needles  
│ ├─ RAM/Storage upgrades  
│ └─ Cables/Adapters  
│  
└─ Attributes:  
├─ Part Number  
├─ Manufacturer  
├─ Unit Cost  
├─ Stock Level  
├─ Reorder Point  
├─ Supplier  
└─ Expiry Date (if applicable)  
```

#### 7.2 Bulk Import Assets

```  
NAVIGATION: Assets → Import from CSV

CSV FORMAT FOR COMPUTERS:

name,serial,manufacturer,model,cpu,ram,storage,os,user,location,department,purchase_date,warranty_end,status  
"Desktop-001","SN20001","Dell","OptiPlex 5090","Intel i7-11700",16,512,"Windows 11","john.smith","Factory 1 - Office","Production",2021-01-15,2024-01-15,"Active"  
"Desktop-002","SN20002","Dell","OptiPlex 5090","Intel i7-11700",16,512,"Windows 11","jane.doe","Factory 1 - Office","QC",2021-02-20,2024-02-20,"Active"  
"Laptop-001","SN20003","HP","EliteBook 850","Intel i7-11700",8,256,"Windows 11","mike.johnson","Factory 1 - Mobile","Management",2021-03-10,2024-03-10,"Active"  
...

CSV FORMAT FOR PRODUCTION EQUIPMENT:

name,equipment_id,type,manufacturer,model,serial,location,operator,installation_date,maintenance_interval,status,critical  
"Sewing Machine-001","SM001","Sewing Machine","Brother","S7300","SM001SN0001","Factory 1 - Line A","Operator A","2020-01-15",30,"Active","Yes"  
"Cutting Machine-001","CM001","Cutting Machine","Gerber","CutMaster","CM001SN0001","Factory 1 - Line B","Operator B","2019-06-20",45,"Active","Yes"  
"Pressing Machine-001","PM001","Pressing Machine","Hoffman","3000","PM001SN0001","Factory 1 - Line C","Operator C","2021-01-10",60,"Active","No"  
...

CSV FORMAT FOR PRINTERS:

name,ip_address,mac_address,model,type,location,cartridge_type,warranty_end  
"Printer-Floor1","10.1.1.100","00:1A:2B:3C:4D:5E","HP LaserJet Pro","Network","Factory 1 - Production","HP CF287A",2024-06-30  
"Printer-Office1","10.3.1.50","00:1A:2B:3C:4D:5F","Canon imageRUNNER","Multifunction","HQ - Office","Canon NPG-73",2025-03-15  
...

IMPORT STEPS:

- 1. Prepare CSV file with all assets
- 2. Go to Assets → [Import Button]
- 3. Select asset type (Computer/Equipment/Printer/etc)
- 4. Upload CSV file
- 5. Map CSV columns to GLPI fields
- 6. Review preview (first 10 rows)
- 7. Click [IMPORT]

RESULT:  
✅ X assets imported  
✅ Inventory updated  
✅ Asset IDs assigned  
✅ Users notified (if applicable)  
✅ Reports updated

POST-IMPORT:  
• Verify all assets created  
• Check for missing data  
• Assign to correct departments  
• Set up maintenance schedules  
• Configure monitoring (if IoT enabled)  
```

#### 7.3 Asset Lifecycle Management

```  
NAVIGATION: Assets → [Select Asset] → Lifecycle Tab

ASSET STATUS WORKFLOW:

Creation → Ordering → Receiving → Active → Maintenance → Inactive → Retired

VD FOR SEWING MACHINE:

┌─────────────────────────────────────┐  
│ ASSET: Sewing Machine #SM001 │  
└─────────────────────────────────────┘  
│  
├─ Status: ACTIVE  
├─ Condition: Good  
├─ Location: Factory 1 - Line A  
├─ Operator: Ms. Linh  
├─ Purchase Date: 2020-01-15  
├─ Warranty End: 2023-01-15 (EXPIRED)  
├─ Last Maintenance: 2024-01-10  
├─ Next Maintenance: 2024-02-10  
│  
├─ DEPRECIATION:  
│ ├─ Original Cost: 50,000,000 VND  
│ ├─ Residual Value: 25,000,000 VND  
│ ├─ Depreciation Period: 5 years  
│ ├─ Depreciation Method: Linear  
│ ├─ Current Book Value: 30,000,000 VND  
│ ├─ Depreciation Expense (YTD): 20,000,000 VND  
│ └─ Depreciation Status: [Chart]  
│  
├─ MAINTENANCE HISTORY:  
│ ├─ 2024-01-10: Routine oil & lubrication  
│ │ - Duration: 1 hour  
│ │ - Cost: 500,000 VND  
│ │ - Technician: John Smith  
│ │ - Status: Completed  
│ │  
│ ├─ 2023-12-15: Needle replacement  
│ │ - Cost: 200,000 VND  
│ │ - Parts: New needle set  
│ │ - Status: Completed  
│ │  
│ └─ 2023-11-20: Thread tension adjustment  
│ - Status: Completed  
│  
├─ SPARE PARTS AVAILABLE:  
│ ├─ Needles: In stock (20 units)  
│ ├─ Thread spools: In stock (50 units)  
│ ├─ Belts: In stock (5 units)  
│ └─ Motor brushes: Need to order  
│  
├─ SUPPORT INFORMATION:  
│ ├─ Vendor: Brother Manufacturing  
│ ├─ Contact: +84-28-xxxx-xxxx  
│ ├─ Support Contract: EXPIRED (2023-01-15)  
│ ├─ Renewal Cost: 2,000,000 VND/year  
│ └─ [Renew Button]  
│  
└─ LINKED TICKETS:  
├─ #12456: Needle breakage (Resolved)  
├─ #12489: Thread tension issue (Resolved)  
├─ #12501: Routine maintenance (In Progress)  
└─ [View All Tickets]

ASSET RETIREMENT PROCESS:

When machine becomes too old/uneconomical:

- 1. Create "Retirement Request" Ticket
- 2. Document:

  
├─ Reason for retirement  
├─ Current condition  
├─ Last maintenance date  
├─ Cost of repair vs replacement  
└─ Replacement plan

- 3. Get approval from:

  
├─ Department manager  
├─ Finance  
└─ Procurement

- 4. Update Asset Status to "RETIRED"

  
├─ Reason: [Age/Damage/Obsolete]  
├─ Disposal method: [Scrap/Donate/Resale]  
├─ Disposal date: [Date]  
└─ Final value: [Amount]

- 5. Archive asset in GLPI

  
├─ Keep records for 7 years (accounting)  
├─ Deactivate in system  
└─ No longer shown in active inventory  
```

#### 7.4 Tạo Asset Groups & Dashboard

```  
ASSET DASHBOARD:

TOTAL ASSETS: 1,247  
├─ Computers: 550  
│ ├─ Desktop: 400  
│ ├─ Laptop: 150  
│ └─ Server: 5 (Not counted for users)  
├─ Printers: 100  
├─ Network Equipment: 150  
├─ Production Equipment: 200  
│ ├─ Sewing: 120  
│ ├─ Cutting: 30  
│ ├─ Pressing: 40  
│ ├─ Dyeing: 10  
│ └─ Packing: 5  
├─ Consumables: 247  
└─ Other: 50

ASSET STATUS BREAKDOWN:

Active: 950 (76%)  
├─ Working: 940  
└─ Minor issues: 10

Maintenance: 150 (12%)  
├─ Scheduled maintenance: 100  
└─ Under repair: 50

Inactive: 100 (8%)  
├─ Not in use: 80  
└─ Awaiting disposal: 20

Retired: 47 (archived)

ASSET BY LOCATION:

Factory 1:  
├─ Computers: 320  
├─ Printers: 60  
├─ Network: 80  
└─ Equipment: 150

Factory 2:  
├─ Computers