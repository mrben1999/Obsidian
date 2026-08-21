---
type: sop
area:
owner:
version: 1
last_reviewed: 2026-07-28
tags:
  - sop
---
hướng dẫn chi tiết từng bước để **Ủy quyền (Delegate)** cho nhóm HelpDesk (`GG_HelpDesk-WorkstationAdmins`) có toàn quyền tạo, xóa và Join/Unjoin máy tính vào Domain trong OU `Computers_QVE` mà **hoàn toàn không cần cấp quyền Domain Admin**.

### Cách 1: Thực hiện qua giao diện Active Directory Users and Computers (GUI) - Khuyên dùng

#### Bước 1: Mở công cụ Delegation Wizard

1. Trên Server Controller, mở **Active Directory Users and Computers** (`dsa.msc`).
    
2. Vào menu **View** ➔ Tích chọn **Advanced Features** (để hiển thị đầy đủ các thuộc tính ẩn).
    
3. Tìm đến OU **`Computers_QVE`** (hoặc OU quản lý máy trạm của anh).
    
4. Chuột phải vào OU **`Computers_QVE`** ➔ Chọn **Delegate Control...**
    
5. Cửa sổ _Delegation of Control Wizard_ xuất hiện ➔ Bấm **Next**.
    

#### Bước 2: Chọn nhóm nhận ủy quyền (HelpDesk)

1. Tại màn hình **Users or Groups**, bấm **Add...**
    
2. Nhập tên nhóm: `GG_HelpDesk-WorkstationAdmins` ➔ Bấm **Check Names** để xác nhận ➔ Bấm **OK**.
    
3. Bấm **Next**.
    

#### Bước 3: Cấu hình đối tượng ủy quyền (Custom Task)

1. Tại màn hình **Tasks to Delegate**, tích chọn **Create a custom task to delegate** ➔ Bấm **Next**.
    
2. Tại màn hình **Active Directory Object Type**:
    
    - Tích chọn mục thứ 2: **Only the following objects in the folder:**
        
    - Cuộn xuống danh sách bên dưới và tích chọn: **Computer objects**.
        
    - Tích chọn 2 ô ở cuối bảng:
        
        - `Create selected objects in this folder` _(Tạo máy tính trong OU này)_
            
        - `Delete selected objects in this folder` _(Xóa máy tính trong OU này)_
            
3. Bấm **Next**.
    

#### Bước 4: Cấp quyền chi tiết (Permissions)

1. Tại màn hình **Permissions**, tích chọn các ô sau:
    
    - **General**
        
    - **Property-specific**
        
2. Trong danh sách **Permissions** bên dưới, cuộn và tích chọn các quyền quan trọng sau:
    
    - **Reset Password** _(Rất quan trọng: Giúp HelpDesk reset lại trust relationship khi PC bị mất kết nối với Domain)_
        
    - **Read All Properties**
        
    - **Write All Properties**
        
3. Bấm **Next** ➔ Bấm **Finish** để hoàn tất.
    

### Cách 2: Thực hiện nhanh bằng 1 lệnh PowerShell (Khuyên dùng cho Admin)

Nếu anh muốn thực hiện chính xác 100% trong vòng vài giây mà không cần bấm Wizard nhiều bước, hãy chạy lệnh PowerShell dưới đây trên Domain Controller:

PowerShell

```PowerShell
# 1. Khai báo thông tin OU và Group HelpDesk
$OUDN = "OU=Computers_QVE,DC=qve,DC=com"
$GroupIdentity = "GG_HelpDesk-WorkstationAdmins"

# 2. Ủy quyền Create/Delete Computer Objects và Full Access trên Computer Objects trong OU
$Group = Get-ADGroup -Identity $GroupIdentity
$SID = New-Object System.Security.Principal.SecurityIdentifier ($Group.SID)

# GUID của Computer Object trong AD Schema
$ComputerGUID = [GUID]"bf967a86-0de6-11d0-a285-00aa003049e2"

# Thiết lập Access Control Entry (ACE)
$Acl = Get-Acl -Path "AD:\$OUDN"

# Quyền tạo và xóa Computer Objects
$AceCreateDelete = New-Object System.DirectoryServices.ActiveDirectoryAccessRule(
    $SID, 
    "CreateChild, DeleteChild", 
    "Allow", 
    $ComputerGUID, 
    "All"
)

$Acl.AddAccessRule($AceCreateDelete)
Set-Acl -Path "AD:\$OUDN" -AclObject $Acl

Write-Host "Da Delegate thanh cong quyen Join/Create/Delete PC cho nhom $GroupIdentity tren OU $OUDN!" -ForegroundColor Green
```

### Bước bổ sung: Bỏ giới hạn Join 10 máy mặc định (Khuyên làm)

Mặc định, Active Directory khống chế mỗi tài khoản không phải Domain Admin chỉ được Join tối đa **10 máy tính** (`ms-DS-MachineAccountQuota = 10`). Để nhóm HelpDesk có thể Join máy thoải mái cho 500 PC:

1. Trong **Active Directory Users and Computers**, chuột phải vào tên Domain **`qve.com`** ➔ Chọn **Properties**.
    
2. Chuyển sang tab **Attribute Editor**.
    
3. Cuộn tìm thuộc tính **`ms-DS-MachineAccountQuota`**.
    
4. Bấm **Edit** ➔ Đổi giá trị từ `10` thành **`0`** (nghĩa là bỏ khống chế mặc định cấp domain, bắt buộc phải dùng quyền Delegate trên OU ở bước trên) **hoặc** đổi thành **`9999`**.
    
5. Bấm **OK** ➔ **Apply**.
    

### Kiểm tra thử nghiệm (Testing):

1. Đăng nhập vào 1 máy PC trắng (Workgroup).
    
2. Khi Join Domain `qve.com`, nhập credential tài khoản Admin HelpDesk (ví dụ: `qve\adm.hd.vtb`).
    
3. Máy tính sẽ Join thành công và tự động tạo Computer Object nằm đúng trong OU `Computers_QVE`.

## 1. Ủy Quyền Cho Nhóm INFRA (`GG_Infra-DomainAdmins`)

### Bản chất & Mục tiêu:

Nhóm Infra chịu trách nhiệm chính về Hạ tầng lõi (Core Infrastructure). Thay vì cho phép tài khoản Admin Infra đăng nhập tràn lan trên các PC end-user, ta ủy quyền cho nhóm này có **toàn quyền trên các OU Hạ tầng** và **quản trị toàn bộ Server**.

### Các bước thực hiện:

#### Bước 1: Ủy quyền Full Control trên OU Sever & OU Admin Accounts (GUI)

1. Mở **Active Directory Users and Computers** (`dsa.msc`).
    
2. Chuột phải vào OU **`Servers`** (hoặc OU chứa các Server hệ thống) ➔ Chọn **Delegate Control...**
    
3. Bấm **Next** ➔ Add nhóm **`GG_Infra-DomainAdmins`** ➔ Bấm **Next**.
    
4. Chọn **Create a custom task to delegate** ➔ Bấm **Next**.
    
5. Chọn **This folder, existing objects in this folder, and creation of new objects in this folder** ➔ Bấm **Next**.
    
6. Tích chọn **Full Control** ➔ Bấm **Next** ➔ **Finish**.
    
7. _(Thực hiện tương tự bước trên cho OU `Admin Accounts`)_.
    

#### Bước 2: Ủy quyền Quản trị DNS & DHCP via Local Groups (PowerShell)

Chạy lệnh PowerShell trên Domain Controller để gán nhóm Infra vào các nhóm quản trị dịch vụ mạng tích hợp của Windows Server:

PowerShell

```PowerShell
# Gán nhóm Infra vào nhóm Quản trị DNS Server & DHCP Server
Add-ADGroupMember -Identity "DNSAdmins" -Members "GG_Infra-DomainAdmins"
Add-ADGroupMember -Identity "DHCP Administrators" -Members "GG_Infra-DomainAdmins"
```

## 2. Ủy Quyền Cho Nhóm SECURITY (`GG_Security-SecOpsAdmins`)

### Bản chất & Mục tiêu:

Nhóm Security cần quyền **Đọc / Audit toàn bộ cấu hình AD** và **Đọc Event Logs** từ tất cả Server/Domain Controller để phân tích sự cố (SecOps/SIEM) mà **KHÔNG CÓ QUYỀN sửa/xóa/thay đổi mật khẩu** của User/Admin khác.

### Các bước thực hiện:

#### Bước 1: Ủy quyền Read-Only trên toàn Domain via GUI

1. Mở `dsa.msc` ➔ Chuột phải trực tiếp vào **Gốc Domain `qve.com`** ➔ Chọn **Delegate Control...**
    
2. Add nhóm **`GG_Security-SecOpsAdmins`** ➔ Bấm **Next**.
    
3. Tại màn hình _Tasks to Delegate_, tích chọn:
    
    - **Read all user information**
        
4. Bấm **Next** ➔ **Finish**.
    

#### Bước 2: Cấp quyền đọc Event Log trên Domain Controller via GPO

Để tài khoản `adm.sec.*` hoặc công cụ SIEM/EDR đọc được Security Logs từ Domain Controller:

1. Mở `gpmc.msc`, chọn **Default Domain Controllers Policy** (hoặc tạo GPO mới link vào OU `Domain Controllers`) ➔ Chuột phải chọn **Edit**.
    
2. Tìm đến đường dẫn:
    
    `Computer Configuration` ➔ `Policies` ➔ `Windows Settings` ➔ `Security Settings` ➔ `Restricted Groups`.
    
3. Chuột phải chọn **Add Group...** ➔ Bấm Browse tìm nhóm **`Event Log Readers`** (nhóm mặc định của Windows) ➔ Bấm **OK**.
    
4. Tại ô **Members of this group**, bấm **Add...** ➔ Chọn nhóm **`QVE\GG_Security-SecOpsAdmins`**.
    
5. Bấm **Apply** ➔ **OK**.
    

## 3. Ủy Quyền Cho Nhóm DEVELOPER (`GG_Developer-DevAdmins`)

### Bản chất & Mục tiêu:

Nhóm Dev chỉ được phép làm Admin trên các **Server Môi trường Dev/Test/Database** thuộc quản lý của họ. **Tuyệt đối không có bất kỳ quyền nào** trên Active Directory Core, Server Production hay PC End-User.

### Các bước thực hiện:

#### Bước 1: Ủy quyền Full Control riêng trên OU Dev-Servers (GUI)

1. Mở `dsa.msc` ➔ Tạo 1 OU chuyên biệt tên **`Dev-Servers`** (ví dụ: `OU=Dev-Servers,DC=qve,DC=com`).
    
2. Chuột phải vào OU **`Dev-Servers`** ➔ Chọn **Delegate Control...**
    
3. Add nhóm **`GG_Developer-DevAdmins`** ➔ Bấm **Next**.
    
4. Chọn **Create a custom task to delegate** ➔ Bấm **Next**.
    
5. Chọn **This folder, existing objects in this folder, and creation of new objects in this folder**.
    
6. Tích chọn:
    
    - **Reset Password**
        
    - **Read all user information**
        
    - **Modify the membership of a group** _(chỉ trong phạm vi OU này)_
        
7. Bấm **Next** ➔ **Finish**.
    

#### Bước 2: Cấp quyền Local Admin trên Server Dev via GPO

Để các thành viên nhóm Dev tự động có quyền Local Admin khi RDP vào các Server Dev/Staging/DB:

1. Tạo GPO tên: **`GPO_DevServers_LocalAdmins`**, Link trực tiếp vào OU **`Dev-Servers`**.
    
2. Chuột phải Edit GPO ➔ Tìm đến đường dẫn:
    
    `Computer Configuration` ➔ `Preferences` ➔ `Control Panel Settings` ➔ `Local Users and Groups`.
    
3. Chuột phải vùng trống ➔ **New** ➔ **Local Group**:
    
    - **Action:** `Update`
        
    - **Group name:** Chọn `Administrators (built-in)`
        
    - **Members:** Bấm **Add...** ➔ Tìm nhóm **`QVE\GG_Developer-DevAdmins`**.
        
4. Bấm **Apply** ➔ **OK**.
    

## 📊 Ma Trận Tổng Kết Ủy Quyền (Delegation Matrix)

|Nhóm IT|OU Được Ủy Quyền|Phạm vi Quyền Được Cấp (Permissions)|Phương thức Cấu hình|
|---|---|---|---|
|**HelpDesk**|`OU=Computers_QVE`|Create/Delete Computer Objects, Reset Machine Password, Local Admin 500 PC|Delegation Wizard + GPO (`Computers_QVE`)|
|**Infra**|`OU=Servers`, `OU=Admin Accounts`|Full Control OU Server/Admin, DNS Admins, DHCP Admins, Domain Admins|Delegation Wizard + AD Built-in Groups|
|**Security**|`Gốc Domain (qve.com)`|Read-All Properties, Event Log Readers (DC & Servers)|Delegation Wizard + GPO Restricted Groups|
|**Developer**|`OU=Dev-Servers`|Local Admin trên các Dev/Test Servers, Full control trong OU Dev|Delegation Wizard + GPO (`Dev-Servers`)|
## 2. Hướng dẫn Triển khai Chi tiết từng Bước

### Bước 1: Tạo cấu trúc OU & Security Groups

1. Mở **Active Directory Users and Computers** (`dsa.msc`).
    
2. Tạo cấu trúc cây OU như sơ đồ của bạn.
    
3. Trong từng OU Admin, tạo nhóm Security tương ứng:
    
    - Trong `OU=Tier0-DomainAdmins` $\rightarrow$ Tạo **`GG_Tier0_Admins`**
        
    - Trong `OU=Tier1-InfraAdmins` $\rightarrow$ Tạo **`GG_Tier1_InfraAdmins`**
        
    - Trong `OU=Tier2-WorkstationAdmins` $\rightarrow$ Tạo **`GG_Tier2_WorkstationAdmins`**
        
    - Trong `OU=SecOps-DevAdmins` $\rightarrow$ Tạo **`GG_SecOps_Admins`**
        
4. Tạo tài khoản cá nhân cho từng Admin và đưa vào đúng OU/Group tương ứng (Ví dụ: `adm_t1_nam` đưa vào `OU=Tier1-InfraAdmins`).
    

### Bước 2: Phân quyền Local Admin qua GPO (Group Policy Preferences)

Mở **Group Policy Management Console** (`gpmc.msc`):

#### 1. Cấu hình cho Tier 1 (Infra Admin):

- Tạo GPO: `GPO_Tier1_LocalAdmins` $\rightarrow$ Link vào **OU chứa Member Servers**.
    
- Truy cập: `Computer Configuration` $\rightarrow$ `Preferences` $\rightarrow$ `Control Panel Settings` $\rightarrow$ `Local Users and Groups`.
    
- New Local Group:
    
    - Action: `Update` | Group Name: `Administrators (built-in)`
        
    - Members: Add `company\GG_Tier1_InfraAdmins`.
        

#### 2. Cấu hình cho Tier 2 (HelpDesk Admin):

- Tạo GPO: `GPO_Tier2_LocalAdmins` $\rightarrow$ Link vào **OU chứa 600 Máy trạm Client**.
    
- Cấu hình tương tự: Add `company\GG_Tier2_WorkstationAdmins` vào Local `Administrators`.
    

#### 3. Cấu hình cho SecOps (Chỉ xem / Audit):

- Thêm nhóm `GG_SecOps_Admins` vào nhóm mặc định **`DHCP Users`** và gán quyền Read trên DNS Zones (như đã thảo luận).
    

### Bước 3: Thiết lập Chính sách Chặn Log On chéo tầng (User Rights Assignment)

Đây là bước quan trọng nhất để bảo vệ môi trường, tránh lộ NTLM/Kerberos Hash giữa các tầng.

#### 1. Bảo vệ Tier 0 (Domain Controller):

- Mở **Default Domain Controllers Policy**:
    
    - `Computer Configuration` $\rightarrow$ `Policies` $\rightarrow$ `Windows Settings` $\rightarrow$ `Security Settings` $\rightarrow$ `Local Policies` $\rightarrow$ `User Rights Assignment`.
        
- Cấu hình **Deny log on locally** & **Deny log on through Remote Desktop Services**:
    
    - Add: `GG_Tier1_InfraAdmins`, `GG_Tier2_WorkstationAdmins`, `GG_SecOps_Admins`.
        

#### 2. Bảo vệ Tier 1 (Member Servers):

- Trong GPO `GPO_Tier1_LocalAdmins`:
    
- Cấu hình **Deny log on locally** & **Deny log on through Remote Desktop Services**:
    
    - Add: `GG_Tier0_Admins` _(Tránh lấy tài khoản T0 RDP vào máy T1)_, `GG_Tier2_WorkstationAdmins`.
        

#### 3. Bảo vệ Tier 2 (Workstations):

- Trong GPO `GPO_Tier2_LocalAdmins`:
    
- Cấu hình **Deny log on locally** & **Deny log on through Remote Desktop Services**:
    
    - Add: `GG_Tier0_Admins`, `GG_Tier1_InfraAdmins`.
        

### Bước 4: Áp dụng AppLocker siết chặt bảo mật trên máy Admin

Như bạn đã cấu hình ở các bước trước:

1. Áp dụng AppLocker GPO lên các máy trạm PAW (Privileged Access Workstations) mà các Admin đăng nhập.
    
2. Tạo **Deny Rule** đối với các file executable của Browser (Edge, Chrome, Firefox) và Mail/Office (Outlook, Word, Excel) dành cho tất cả các nhóm Admin (`GG_Tier0_Admins`, `GG_Tier1_InfraAdmins`, `GG_Tier2_WorkstationAdmins`).
    

## 🔒 Quy tắc vận hành hàng ngày (Operational Rules)

1. **Một người – Nhiều tài khoản:**
    
    - Nhân viên tên Nam làm cả Infra lẫn Helpdesk sẽ có 3 tài khoản:
        
        - `nam.nguyen` (User thường nằm trong `OU=Company Users` $\rightarrow$ Dùng lướt web, họp, làm Office).
            
        - `adm_t1_nam` (Nằm trong `OU=Tier1-InfraAdmins` $\rightarrow$ Chỉ dùng quản trị Server).
            
        - `adm_t2_nam` (Nằm trong `OU=Tier2-WorkstationAdmins` $\rightarrow$ Chỉ dùng hỗ trợ PC 600 user).