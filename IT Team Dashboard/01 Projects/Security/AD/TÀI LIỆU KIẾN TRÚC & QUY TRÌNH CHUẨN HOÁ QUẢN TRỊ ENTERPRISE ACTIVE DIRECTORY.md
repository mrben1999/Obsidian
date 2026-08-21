---
type: Project
status: todo
priority: P3
team: infrastructure
assignee: "[[Tô Nguyễn Hải Đăng]]"
project: Chuẩn hóa Kiến trúc Bảo mật & Tối ưu hóa Vận hành Active Directory Domain Services (AD DS)
created: 2026-07-21 14:58
due: 2026-07-24
resolved:
tags:
  - task
---

# ✅ TÀI LIỆU KIẾN TRÚC & QUY TRÌNH CHUẨN TÀI KHOẢN QUẢN TRỊ ENTERPRISE ACTIVE DIRECTORY

## 🎯 Mục tiêu
>Nền tảng: Nâng cấp lên Windows Server 2012 R2 | Tích hợp Quản lý Tài sản GLPI 11
>Việc nâng cấp hạ tầng Domain từ Windows Server 2008 R2 lên Windows Server 2012 R2 kết hợp đưa hệ thống GLPI 11 vào vận hành đòi hỏi một sự dịch chuyển căn bản về tư duy quản trị: **Chuyển từ mô hình quản trị tập trung flat-rights (dùng chung Domain Admin) sang Mô hình Phân tầng Đặc quyền (Tiered Administrative Model)** theo tiêu chuẩn Security Baseline của Microsoft.

---

# 📋 Mô tả
>**Mô hình Kiến trúc:** Enterprise Tiered Administration Model (Tier 0 / Tier 1 / Tier 2) + AGDLP + Least Privilege + Zero Trust

---

# ✅ Checklist công việc

### Mối quan hệ giữa các thành phần trong Kiến trúc Mới:

Code snippet

```
graph TD
    subgraph TIER_0 ["TIER 0 - Control Plane (Bảo vệ Tối cao)"]
        DC1[Domain Controller 1 - WS2012R2]
        DC2[Domain Controller 2 - WS2012R2]
        PKI[Enterprise CA / ADFS]
        T0_Admin[Tài khoản: adm0.username]
        T0_Admin -->|Chỉ RDP / Admin| DC1
        T0_Admin -->|Chỉ RDP / Admin| DC2
        T0_Admin -->|Chỉ RDP / Admin| PKI
    end

    subgraph TIER_1 ["TIER 1 - Server & Application Plane"]
        GLPI[GLPI 11 Asset Server]
        SQL[Database / App Servers]
        FS[File / Backup Servers]
        T1_Admin[Tài khoản: adm1.username]
        T1_Admin -->|Chỉ Admin| GLPI
        T1_Admin -->|Chỉ Admin| SQL
        T1_Admin -->|Chỉ Admin| FS
    end

    subgraph TIER_2 ["TIER 2 - Workstation & User Plane"]
        PC1[IT / Finance PCs]
        PC2[Factory / Production PCs]
        T2_Admin[Tài khoản: adm2.username]
        T2_Admin -->|Chỉ Helpdesk / Remote| PC1
        T2_Admin -->|Chỉ Helpdesk / Remote| PC2
    end

    %% Báo cáo tài sản & Đồng bộ
    GLPI <--->|WMI / Active Directory Sync| DC1
    
    %% Rào cản Cách ly (Isolation)
    T0_Admin -.-x|CẤM ĐĂNG NHẬP| TIER_1
    T0_Admin -.-x|CẤM ĐĂNG NHẬP| TIER_2
    T1_Admin -.-x|CẤM ĐĂNG NHẬP| TIER_0
    T1_Admin -.-x|CẤM ĐĂNG NHẬP| TIER_2
    T2_Admin -.-x|CẤM ĐĂNG NHẬP| TIER_0
    T2_Admin -.-x|CẤM ĐĂNG NHẬP| TIER_1
```

## PHASE 1: CHUẨN HOÁ TÀI KHOẢN QUẢN TRỊ (ADMIN ACCOUNT HARDENING)

### 1. Vô hiệu hóa và Chuyển đổi tài khoản Built-in Administrator

Tài khoản `RID 500` (Built-in Administrator) là mục tiêu tấn công hàng đầu qua các kỹ thuật Password Spraying và Pass-the-Hash (PtH).

- **Vô hiệu hóa đăng nhập mặc định:** Khóa tài khoản Built-in Administrator trên toàn miền.
    
- **Chuyển đổi thành Tài khoản Break-Glass (Emergency Access):**
    
    - **Tên mới:** `ADM-BreakGlass` (hoặc tên ngẫu nhiên theo quy chuẩn nội bộ).
        
    - **Mật khẩu:** Khởi tạo chuỗi ngẫu nhiên 30+ ký tự (Bao gồm chữ hoa, chữ thường, chữ số, ký tự đặc biệt).
        
    - **Lưu trữ:** Chia đôi mật khẩu niêm phong trong hai phong bì độc lập cất két sắt bảo mật của Công ty, hoặc lưu trong Trình quản lý Mật khẩu Doanh nghiệp (Enterprise Password Vault / PAM) có xác thực MFA.
        
    - **Quy trình sử dụng:** Chỉ kích hoạt khi **toàn bộ hệ thống xác thực (KDC/AD) gặp sự cố thảm họa** hoặc mất kết nối mạng toàn bộ. Mọi thao tác unlock tài khoản này bắt buộc phải ghi **Incident Log**.
        

### 2. Định danh Cặp Tài khoản cho Kỹ sư IT (Dual-Account Matrix)

Mỗi nhân viên thuộc phòng IT bắt buộc phải sở hữu **ít nhất 2 tài khoản riêng biệt** để tách biệt hoàn toàn giữa tác vụ người dùng thông thường và tác vụ quản trị.

|**Họ và Tên IT**|**Tài khoản User Thường (Tier 2 User)**|**Tài khoản Admin Tier 2 (Helpdesk)**|**Tài khoản Admin Tier 1 (Server Admin)**|**Tài khoản Admin Tier 0 (Domain Admin)**|
|---|---|---|---|---|
|**Nguyễn Văn A**|`nva`|`adm2.nva`|`adm1.nva`|`adm0.nva` _(Chỉ cấp cho Lead)_|
|**Trần Văn B**|`tvb`|`adm2.tvb`|`adm1.tvb`|_Không cấp_|
|**Lê Văn C**|`lvc`|`adm2.lvc`|_Không cấp_|_Không cấp_|

#### Nguyên tắc vận hành tài khoản:

1. **Tài khoản thường (`nva`):**
    
    - Mục đích: Đọc/Gửi Email (Outlook), họp trực tuyến (Teams/Zoom), làm việc văn phòng, truy cập mạng Internet, đăng nhập tài khoản GLPI 11 để xử lý Ticket.
        
    - **Rào cản:** KHÔNG thuộc bất kỳ nhóm Admin nào (Local Admin hay Domain Admin).
        
2. **Tài khoản Admin (`admX.nva`):**
    
    - Mục đích: Chỉ dùng qua lệnh `Run as administrator`, công cụ RSAT, RDP vào máy chủ/máy trạm được phép, chạy PowerShell Remoting.
        
    - **Rào cản Bắt buộc:** Cấm tuyệt đối mở Browser duyệt Web, cấm mở Outlook/Teams, **chặn toàn bộ lưu lượng truy cập Internet Outbound** thông qua Firewall/GPO.
        

## PHASE 2: CẤU TRÚC ORGANIZATIONAL UNIT (OU) CHUẨN ENTERPRISE

Thiết kế lại toàn bộ sơ đồ cây OU để phục vụ việc gán GPO Security Baseline và ủy quyền (Delegation) chính xác.

Plaintext

```
dc=qve,dc=com (Domain Root)
│
├── 📁 _Company_Root
│   ├── 📁 00_Tier0_Control
│   │   ├── 📁 Tier0_Computers (DC, PKI, ADFS)
│   │   ├── 📁 Tier0_ServiceAccounts
│   │   └── 📁 Tier0_Admins
│   │
│   ├── 📁 01_Tier1_Servers
│   │   ├── 📁 Application_Servers (GLPI, ERP, CRM)
│   │   ├── 📁 Database_Servers (SQL, Oracle)
│   │   ├── 📁 Infrastructure_Servers (File, Print, Backup)
│   │   ├── 📁 Tier1_ServiceAccounts
│   │   └── 📁 Tier1_Admins
│   │
│   ├── 📁 02_Tier2_Workstations
│   │   ├── 📁 Corporate_Laptops
│   │   ├── 📁 Corporate_Desktops
│   │   ├── 📁 Factory_Production_PCs
│   │   └── 📁 Tier2_Admins (Helpdesk Accounts)
│   │
│   ├── 📁 03_Users & Departments
│   │   ├── 📁 Executive
│   │   ├── 📁 IT_Department
│   │   ├── 📁 HR_Finance
│   │   ├── 📁 Production_Factory
│   │   └── 📁 SupplyChain_Logistics
│   │
│   ├── 📁 04_Groups
│   │   ├── 📁 Security_Groups
│   │   └── 📁 Distribution_Groups
│   │
│   ├── 📁 05_Service_Accounts
│   │   ├── 📁 gMSA_Accounts
│   │   └── 📁 Service_Accounts_Static
│   │
│   └── 📁 99_Quarantine_Disabled
│       ├── 📁 Disabled_Users
│       └── 📁 Disabled_Computers
```

## PHASE 3: NGUYÊN TẮC QUẢN LÝ NHÓM BẢO MẬT (AGDLP FRAMEWORK)

Tuyệt đối **KHÔNG** gán quyền (Access Control Entry - ACE) trực tiếp cho tài khoản cá nhân. Tất cả việc phân quyền phải tuân thủ chuẩn **AGDLP**:

**A**ccount $\rightarrow$ **G**lobal Group $\rightarrow$ **D**omain **L**ocal Group $\rightarrow$ **P**ermission.

### Ma trận Nhóm Bảo mật Quản trị (Security Group Matrix):

|**Tên Global Group (AG)**|**Tên Domain Local Group (DL)**|**Quyền Hạn Hợp Lệ (Permission - P)**|**Thành viên Mẫu**|
|---|---|---|---|
|`GG_IT_Tier0_Admins`|`DL_Tier0_DC_FullControl`|Quản trị tối cao Domain Controller, Schema, GPO Root|`adm0.nva`|
|`GG_IT_Tier1_Admins`|`DL_Tier1_Server_LocalAdmin`|Local Administrator trên toàn bộ Member Servers|`adm1.nva`, `adm1.tvb`|
|`GG_IT_Tier2_Helpdesk`|`DL_Tier2_Workstation_LocalAdmin`|Local Administrator trên toàn bộ End-user PCs|`adm2.nva`, `adm2.tvb`, `adm2.lvc`|
|`GG_IT_Helpdesk_Operators`|`DL_User_Password_Reset`|Quyền Reset Password & Unlock User trên OU `03_Users`|`adm2.lvc`|

PowerShell

```
# Script tạo cấu trúc Nhóm AGDLP mẫu qua PowerShell
Import-Module ActiveDirectory

$OU_Groups = "OU=04_Groups,OU=_Company_Root,DC=qve,DC=com"

# 1. Tạo Global Groups (Chứa Accounts)
New-ADGroup -Name "GG_IT_Tier2_Helpdesk" -GroupScope Global -GroupCategory Security -Path $OU_Groups
New-ADGroup -Name "GG_IT_Tier1_ServerAdmins" -GroupScope Global -GroupCategory Security -Path $OU_Groups

# 2. Tạo Domain Local Groups (Gán vào Tài nguyên/Quyền)
New-ADGroup -Name "DL_Workstation_Management" -GroupScope DomainLocal -GroupCategory Security -Path $OU_Groups
New-ADGroup -Name "DL_Server_Management" -GroupScope DomainLocal -GroupCategory Security -Path $OU_Groups

# 3. Lồng Nhóm: Global Group -> Domain Local Group
Add-ADGroupMember -Identity "DL_Workstation_Management" -Members "GG_IT_Tier2_Helpdesk"
Add-ADGroupMember -Identity "DL_Server_Management" -Members "GG_IT_Tier1_ServerAdmins"
```

## PHASE 4: PHÂN QUYỀN VÀ QUẢN LÝ TÀI KHOẢN DỊCH VỤ (SERVICE ACCOUNTS)

Tài khoản Dịch vụ (Service Account) là nguyên nhân gây lộ cờ xác thực (Kerberoasting Attack) nếu bị gán quyền `Domain Admin` hoặc dùng mật khẩu yếu.

### 1. Chuẩn hóa Tài khoản Dịch vụ cho GLPI 11 và Hệ thống Phụ trợ

|**Tên Service Account**|**Dịch vụ Sử dụng**|**Quyền tối thiểu được gán (Least Privilege)**|**Loại Tài khoản**|
|---|---|---|---|
|`svc_glpi_ldap`|GLPI 11 LDAP Read/Sync|**ReadOnly** trên OU `03_Users` và `02_Workstations`|Standard Service Account|
|`svc_glpi_inventory`|GLPI Network Agent Scan|Read WMI / WinRM trên OU `02_Workstations`|**gMSA** (Khuyên dùng)|
|`svc_sql_engine`|Microsoft SQL Server Service|Log on as a service, Read/Write SQL Data folder|**gMSA**|
|`svc_veeam_backup`|Veeam Backup & Replication|Backup Operator trên VMWare/Hyper-V & VSS Writer|Dedicated Service Account|

### 2. Khai báo Group Managed Service Accounts (gMSA) trên Windows Server 2012 R2

gMSA giúp hệ thống tự động đổi mật khẩu 128-bit định kỳ 30 ngày mà không cần sự can thiệp của con người, loại bỏ hoàn toàn nguy cơ lộ mật khẩu.

PowerShell

```
# Bước 1: Tạo KDS Root Key (Chỉ thực hiện 1 lần duy nhất trên Domain Controller)
Add-KdsRootKey -EffectiveImmediately

# Bước 2: Tạo gMSA Account cho dịch vụ GLPI Inventory Scan
New-ADServiceAccount -Name "gMSA_GLPI_Scan" `
    -DNSHostName "gMSA_GLPI_Scan.qve.com" `
    -PrincipalsAllowedToRetrieveManagedPassword "GG_IT_Tier1_Admins" `
    -Path "OU=05_Service_Accounts,OU=_Company_Root,DC=qve,DC=com"

# Bước 3: Cài đặt gMSA trên Server chạy GLPI Agent (Chạy trên Server Target)
Install-ADServiceAccount -Identity "gMSA_GLPI_Scan"
Test-ADServiceAccount -Identity "gMSA_GLPI_Scan" # Trả về True là thành công
```

## PHASE 5: TIERED ADMINISTRATION ARCHITECTURE (MÔ HÌNH PHÂN TẦNG QUẢN TRỊ)

Mục tiêu tối thượng: **Ngăn chặn triệt để kỹ thuật đánh cắp Credential (Pass-the-Hash / Token Manipulation)** bằng cách chặn không cho tài khoản thuộc Tier cao hơn đăng nhập vào máy tính thuộc Tier thấp hơn.

### Ma trận Cho phép & Cấm Đăng nhập (Authentication Control Matrix):

|**Tài khoản thuộc Nhóm**|**Đăng nhập Tier 0 (DC/PKI)**|**Đăng nhập Tier 1 (Servers/GLPI)**|**Đăng nhập Tier 2 (Client PCs)**|
|---|---|---|---|
|**Tier 0 Admins** (`GG_IT_Tier0_Admins`)|**CHO PHÉP**|**CẤM**|**CẤM**|
|**Tier 1 Admins** (`GG_IT_Tier1_Admins`)|**CẤM**|**CHO PHÉP**|**CẤM**|
|**Tier 2 Admins** (`GG_IT_Tier2_Helpdesk`)|**CẤM**|**CẤM**|**CHO PHÉP**|
|**User Thông Thường**|**CẤM**|**CẤM**|**CHO PHÉP**|

### Phương pháp Khóa Đăng nhập Bằng User Rights Assignment trong GPO:

Tạo 3 GPO tương ứng và liên kết (Link) vào các OU tầng tương ứng:

1. **`GPO_Tier0_Cap_RestrictionPolicy`** (Link tới OU `Tier0_Computers`):
    
    - `User Rights Assignment` $\rightarrow$ **Deny log on through Remote Desktop Services**: `GG_IT_Tier1_Admins`, `GG_IT_Tier2_Helpdesk`, `Domain Users`.
        
    - `User Rights Assignment` $\rightarrow$ **Deny log on locally**: `GG_IT_Tier1_Admins`, `GG_IT_Tier2_Helpdesk`, `Domain Users`.
        
2. **`GPO_Tier1_Server_RestrictionPolicy`** (Link tới OU `01_Tier1_Servers`):
    
    - `User Rights Assignment` $\rightarrow$ **Deny log on through Remote Desktop Services**: `GG_IT_Tier0_Admins`, `GG_IT_Tier2_Helpdesk`, `Domain Users`.
        
    - `User Rights Assignment` $\rightarrow$ **Deny log on locally**: `GG_IT_Tier0_Admins`, `GG_IT_Tier2_Helpdesk`.
        
3. **`GPO_Tier2_Workstation_RestrictionPolicy`** (Link tới OU `02_Tier2_Workstations`):
    
    - `User Rights Assignment` $\rightarrow$ **Deny log on through Remote Desktop Services**: `GG_IT_Tier0_Admins`, `GG_IT_Tier1_Admins`.
        
    - `User Rights Assignment` $\rightarrow$ **Deny log on locally**: `GG_IT_Tier0_Admins`, `GG_IT_Tier1_Admins`.
        

## PHASE 6: PHÂN QUYỀN ỦY QUYỀN (DELEGATION CONTROL)

Ủy quyền chính xác giúp đội ngũ IT Helpdesk xử lý công việc hàng ngày mà **không cần cấp quyền Domain Admin**.

### 1. Ủy quyền trên OU `03_Users` cho Nhóm Helpdesk (`GG_IT_Tier2_Helpdesk`):

- Reset User Passwords & Force Password Change at Next Logon.
    
- Unlock User Accounts.
    
- Modify User Account Attributes (Telephone, Office, Title).
    

### 2. Ủy quyền trên OU `02_Workstations` cho Nhóm Helpdesk:

- Create & Delete Computer Accounts (Phục vụ việc Join/Re-join PC vào Domain).
    
- Read/Write Account Restrictions.
    

PowerShell

```
# Script Ủy quyền Reset Password cho Helpdesk trên OU Users
$OUDN = "OU=03_Users,OU=_Company_Root,DC=qve,DC=com"
$GroupDN = "qve\GG_IT_Tier2_Helpdesk"

# Mở Delegation Wizard bằng PowerShell lệnh chuyên sâu
$acl = Get-Acl -Path "AD:\$OUDN"
$identity = [System.Security.Principal.NTAccount]$GroupDN

# Quyền Reset Password (User-Force-Change-Password Extended Right)
$adRight = [System.DirectoryServices.ActiveDirectoryRights]::ExtendedRight
$type = [System.Security.Principal.AccessControlType]::Allow
$extendedRightGuid = [Guid]"00293829-0000-0000-c000-000000000046" # Reset Password GUID

$rule = New-Object System.DirectoryServices.ActiveDirectoryAccessRule($identity, $adRight, $type, $extendedRightGuid)
$acl.AddAccessRule($rule)
Set-Acl -Path "AD:\$OUDN" -AclObject $acl
```

## PHASE 7: CHÍNH SÁCH MẬT KHẨU NÂNG CAO (FINE-GRAINED PASSWORD POLICY)

Trong Active Directory Windows Server 2012 R2, áp dụng **Fine-Grained Password Policy (FGPP)** để thiết lập độ phức tạp mật khẩu khác nhau giữa User thường và tài khoản Admin mà không cần tạo thêm Domain mới.

Code snippet

```
graph LR
    DomainDefault["Default Domain Policy\n(Dành cho User thường)\n- Độ dài: >= 10 ký tự\n- Thời hạn: 90 ngày"] 
    
    PSO_Admin["PSO_Admin_Policy (Priority 1)\n(Áp dụng cho Tier0/Tier1/Tier2 Admins)\n- Độ dài: >= 16 ký tự\n- Lockout: 3 lần sai -> Khóa 30 phút\n- Thời hạn: 60 ngày"]
    
    PSO_Service["PSO_Service_Policy (Priority 2)\n(Áp dụng cho Service Accounts)\n- Độ dài: >= 30 ký tự\n- Lockout: Disabled\n- Non-expiring"]

    PSO_Admin -->|Ghi đè| DomainDefault
    PSO_Service -->|Ghi đè| DomainDefault
```

PowerShell

```
# Tạo Password Settings Object (PSO) cho nhóm Admin
New-ADFineGrainedPasswordPolicy -Name "PSO_Admin_Security_Policy" `
    -Precedence 1 `
    -ComplexityEnabled $true `
    -Description "Chinh sach mat khau phuc tap cho Tai khoản Quan tri" `
    -LockoutDuration (New-TimeSpan -Minutes 30) `
    -LockoutObservationWindow (New-TimeSpan -Minutes 15) `
    -LockoutThreshold 3 `
    -MaxPasswordAge (New-TimeSpan -Days 60) `
    -MinPasswordAge (New-TimeSpan -Days 1) `
    -MinPasswordLength 16 `
    -PasswordHistoryCount 24

# Gán PSO cho các Nhóm Admin
Add-ADFineGrainedPasswordPolicySubject -Identity "PSO_Admin_Security_Policy" -Subjects "GG_IT_Tier0_Admins", "GG_IT_Tier1_Admins", "GG_IT_Tier2_Helpdesk"
```

## PHASE 8: CẤU HÌNH GPO SECURITY BASELINE & SYSTEM HARDENING

Áp dụng thiết lập bảo mật chuẩn của Microsoft (Microsoft Security Baseline) thông qua Group Policy Object.

### Các mục cấu hình bắt buộc trong GPO Baseline:

1. **Vô hiệu hóa các Giao thức Cũ & Độc hại:**
    
    - **Disable SMBv1:** Ngăn chặn tuyệt đầu các dòng Mã độc Lây truyền qua mạng (WannaCry, EternalBlue).
        
    - **Disable NTLMv1:** Ép buộc hệ thống sử dụng NTLMv2 hoặc Kerberos v5.
        
    - **Disable LLMNR / NBT-NS:** Chống tấn công giả mạo đầu vô Poisoning (Responder Tool).
        
2. **Cấu hình An toàn Hệ thống Client & Server:**
    
    - **Enable Windows Firewall:** Bật cả 3 Profile (Domain, Private, Public). Chỉ mở các Port dịch vụ được duyệt.
        
    - **User Account Control (UAC):** Cấu hình `Always Notify` và bật `Admin Approval Mode for the Built-in Administrator account`.
        
    - **Restrict Anonymous Access:** Khóa toàn bộ tính năng duyệt danh sách User/Share ẩn danh (`RestrictAnonymous = 1`).
        

## PHASE 9: NẬT KÝ VÀ GIÁM SÁT BẢO MẬT (AUDITING & LOG INTEGRATION)

### 1. Bật Advanced Audit Policy via Group Policy

Đường dẫn GPO: `Computer Configuration` $\rightarrow$ `Policies` $\rightarrow$ `Windows Settings` $\rightarrow$ `Security Settings` $\rightarrow$ `Advanced Audit Policy Configuration`.

- **Account Management:** Audit User Account Management $\rightarrow$ `Success & Failure`.
    
- **Directory Services:** Audit Directory Service Changes $\rightarrow$ `Success & Failure`.
    
- **Logon/Logoff:** Audit Account Logon / Audit Logon $\rightarrow$ `Success & Failure`.
    
- **Privilege Use:** Audit Sensitive Privilege Use $\rightarrow$ `Success & Failure`.
    

### 2. Sơ đồ Tích hợp Nhật ký Sự kiện (Event Log Pipeline):

Plaintext

```
[ Windows Client / Servers ] 
         │ (Windows Event Forwarding - WEF / WinRM)
         ▼
[ Centralized WEF Collector Server ]
         │ (Syslog Forwarder Agent)
         ▼
[ SIEM / Graylog / ELK Platform ] 
         │ 
         ├──> Alerting Engine (Gửi Email/Telegram khi có ID 4728)
         └──> API Dashboard Integration (Hiển thị Status lên GLPI 11)
```

## PHASE 10: QUẢN LÝ QUYỀN ĐẶC QUYỀN (PRIVILEGED ACCESS MANAGEMENT - PAM)

Rà soát và áp dụng quy trình kiểm soát gắt gao các Nhóm Đặc Quyền Cao Nhất (Privileged Groups):

1. **Enterprise Admins (EA):** Chỉ có tác vụ thay đổi Schema hoặc cấu hình Forest-wide mới được thêm tạm thời tài khoản vào nhóm này. Xử lý xong phải **xóa ngay lập tức**.
    
2. **Domain Admins (DA):** Số lượng thành viên duy trì **tối đa từ 2 - 3 tài khoản** (Các tài khoản `adm0.username` của Lead IT).
    
3. **Schema Admins:** Duy trì **0 thành viên** ở trạng thái tĩnh. Khi cần Update Schema (như Nâng cấp OS Server), mới cấp quyền và thu hồi ngay trong ngày.
    
4. **Quy trình Phê duyệt (Approval Workflow):** Mọi thao tác thêm người vào nhóm `Domain Admins` bắt buộc phải tạo Ticket trên **GLPI 11**, được **IT Director / CIO** phê duyệt trước khi thực hiện.
    

## PHASE 11: BỘ TÀI LIỆU CHUẨN HÓA VẬN HÀNH (SOP DOCUMENTATION)

Để hệ thống vận hành bền vững, bàn giao dễ dàng, bộ tài liệu SOP (Standard Operating Procedure) sau đây cần được ban hành:

### 1. Bảng Cấu trúc Tài liệu SOP Cần Ban Hành:

|**Mã SOP**|**Tên Quy Trình SOP**|**Mục Đích & Phạm Vi Áp Dụng**|
|---|---|---|
|**SOP-IT-01**|**User Onboarding & Provisioning**|Quy trình tạo Mới tài khoản, cấp Email, gán Nhóm AGDLP, đồng bộ sang GLPI 11.|
|**SOP-IT-02**|**Offboarding & Account Deprovisioning**|Quy trình vô hiệu hóa, thu hồi quyền, chuyển dữ liệu và xóa Tài khoản khi nhân viên nghỉ việc.|
|**SOP-IT-03**|**Emergency Access (Break-Glass SOP)**|Quy trình niêm phong, mở khóa và hoàn trả Mật khẩu tài khoản `ADM-BreakGlass`.|
|**SOP-IT-04**|**Privileged Access Change Control**|Quy trình đăng ký Ticket GLPI phê duyệt cấp quyền Admin tạm thời.|
|**SOP-IT-05**|**AD Backup & Disaster Recovery**|Quy trình Backup System State hàng ngày và diễn tập Restore Domain Controller.|

### 2. Mẫu SOP Chi Tiết: SOP-IT-03 - Emergency Access (Break-Glass Procedure)

#### **1. Scope & Purpose**

Quy trình này quy định các bước kích hoạt tài khoản Quản trị Tối cao `ADM-BreakGlass` trong các tình huống sự cố thảm họa (Tất cả Domain Controller mất kết nối, hệ thống xác thực trung tâm bị khóa, hoặc cuộc tấn công Ransomware quy mô lớn).

#### **2. Responsibilities**

- **CIO / IT Director:** Phê duyệt cấp lệnh mở két lấy mật khẩu.
    
- **Lead System Administrator:** Người trực tiếp mở phong bì mật khẩu và thực thi đăng nhập xử lý sự cố.
    
- **IT Auditor / Security Officer:** Giám sát toàn bộ quá trình và ghi chép nhật ký sự cố.
    

#### **3. Step-by-Step Procedure**

Code snippet

```
sequenceDiagram
    autonumber
    actor LeadIT as Lead System Admin
    actor CIO as CIO / IT Director
    participant Vault as Physical Safe / Vault
    participant DC as Domain Controller
    participant GLPI as GLPI 11 Ticketing

    LeadIT->>CIO: Yêu cầu kích hoạt khẩn cấp Break-Glass Account
    CIO-->>LeadIT: Xác nhận & Đồng ý phê duyệt
    LeadIT->>Vault: Mở Két lấy Phong bì chứa Mật khẩu Break-Glass
    Note over LeadIT,Vault: Xé niêm phong phong bì mật khẩu trước sự chứng kiến của 2 bên
    LeadIT->>DC: Đăng nhập Console DC bằng 'ADM-BreakGlass'
    LeadIT->>DC: Khắc phục Sự cố Hạ tầng
    LeadIT->>DC: Đổi Mật khẩu Mới 30+ Ký tự cho 'ADM-BreakGlass'
    LeadIT->>Vault: Niêm phong Mật khẩu Mới vào Phong bì, Cất vào Két
    LeadIT->>GLPI: Tạo Post-Incident Ticket & Báo cáo chi tiết Log thao tác
```

#### **4. Verification & Audit**

- Sau khi hoàn tất khắc phục sự cố, kiểm tra Security Event Log trên DC để xác minh Event ID **`4624`** (Successful Logon) của tài khoản `ADM-BreakGlass`.
    
- Đảm bảo mật khẩu mới đã được niêm phong cẩn thận.
    
- Thực hiện audit toàn bộ lệnh đã thực thi trong phiên làm việc khẩn cấp.
    

## KẾ HOẠCH BÀN GIAO & TỔ CHỨC THỰC HIỆN

|**Tuần thực hiện**|**Hạng mục công việc (Phase)**|**Đầu ra dự án (Deliverables)**|
|---|---|---|
|**Tuần 1**|Phase 1 + Phase 2 + Phase 3|- Tạo tài khoản Admin riêng cho IT (`adm0`, `adm1`, `adm2`).<br><br>  <br><br>- Re-structure lại cây OU `_Company_Root`.<br><br>  <br><br>- Khởi tạo nhóm AGDLP.|
|**Tuần 2**|Phase 4 + Phase 5 + Phase 6|- Tạo gMSA cho GLPI 11 & SQL Services.<br><br>  <br><br>- Triển khai GPO Khóa đăng nhập Chéo Tier (Tiered Restrictions).<br><br>  <br><br>- Delegate quyền Reset Password cho Helpdesk.|
|**Tuần 3**|Phase 7 + Phase 8 + Phase 9|- Đổi Password Policy (FGPP).<br><br>  <br><br>- Tối ưu hóa GPO Baseline (Tắt SMBv1, NTLMv1).<br><br>  <br><br>- Bật Advanced Audit Policy & Forwarding.|
|**Tuần 4**|Phase 10 + Phase 11|- Rà soát Nhóm Domain Admins.<br><br>  <br><br>- Ban hành Bộ Văn bản SOP (SOP-IT-01 đến 05).<br><br>  <br><br>- Nghiệm thu và Đào tạo Chuyển giao.|

---

# 📝 Ghi chú
>

---

# 📌 Kết quả
- [ ]
- [ ]

---

# 🔗 Liên kết
- Project::
- Incident/Change liên quan::
