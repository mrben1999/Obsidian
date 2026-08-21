---
type: sop
area:
owner:
version: 1
last_reviewed: 2026-07-28
tags:
  - sop
---

Dưới đây là giải thích chi tiết và **hướng dẫn triển khai thực tế** được tùy biến riêng cho mô hình tổ chức của anh.

## I. Tổng Quan & Ý Nghĩa Phase 1 Cho Quy Mô 600 Users / 10 IT

### 1. Bản chất mô hình 2 tài khoản (Dual-Account Model)

Mỗi kỹ sư IT sẽ sở hữu **2 tài khoản tách biệt hoàn toàn**:

- **Tài khoản Daily (`nva`)**: Chỉ có quyền User thường. Dùng để đăng nhập máy tính cá nhân, duyệt Web, check Mail, Teams/Zalo, ERP.
    
- **Tài khoản Admin (`adm.nva` hoặc `adm.hd.nva`)**: Dùng cho tác vụ quản trị (Run as administrator, RDP vào Server, mở MMC console). **Tuyệt đối không có Mailbox, không duyệt Web**.
    

### 2. Tách quyền theo 4 nhóm IT (Tối quan trọng)

Rất nhiều doanh nghiệp mắc sai lầm là: _Tạo tài khoản `adm.*` cho cả 10 người và ném tất cả vào nhóm `Domain Admins`_. Điều này triệt tiêu nguyên tắc **Least Privilege** (Quyền tối thiểu).

Phân định quyền hạn cụ thể cho Phase 1:

|**Nhóm IT**|**Số lượng (dự kiến)**|**Tài khoản Daily**|**Tài khoản Admin**|**Quyền hạn cấp (Phase 1)**|
|---|---|---|---|---|
|**Infra**|2 - 3|`nva`|`adm.nva`|`Domain Admins` (Tạm thời ở Phase 1 trước khi sang Tiered Admin Phase 5)|
|**HelpDesk**|3 - 4|`vtb`|`adm.hd.vtb`|**Local Admin trên 500 PC** (KHÔNG cấp Domain Admin)|
|**Security**|1 - 2|`lvc`|`adm.sec.lvc`|Audit / Read-Only AD + SecOps tools (KHÔNG cấp Domain Admin hàng ngày)|
|**Develop**|2 - 3|`pqv`|`adm.dev.pqv`|Admin trên môi trường Dev/Test/DB (KHÔNG có quyền Admin trên AD/Production)|

## II. Hướng Dẫn Thực Hiện Từng Nhóm Đối Tượng

### 1. Đối với User Thường (600 Users)

#### Impact (Ảnh hưởng):

- **Gần như ZERO-IMPACT** đến công việc hàng ngày của 600 người dùng cuối.
    
- Họ vẫn dùng tài khoản Domain User hiện tại (`Domain Users`).
    

#### Tác vụ cần chuẩn hóa trên 500 PC:

- Rà soát và **xóa bỏ toàn bộ User thường ra khỏi nhóm Local Administrators** trên 500 máy trạm (Workstations). User thường tuyệt đối không được tự cài phần mềm bừa bãi.
    
- Mọi yêu cầu cài đặt phần mềm sẽ do nhóm **HelpDesk** hỗ trợ bằng tài khoản `adm.hd.*`.
    

### 2. Đối với Đội Ngũ IT (10 Nhân Sư)

### 💡 Hiểu đúng bản chất trước khi cấu hình lại

| **Tier**   | **Tên phân tầng**         | **Đối tượng quản lý**                                         | **Tài khoản trong Tier**                             |
| ---------- | ------------------------- | ------------------------------------------------------------- | ---------------------------------------------------- |
| **Tier 0** | Control Plane (Domain)    | Domain Controllers, Active Directory, PKI, ADFS, Identity     | `Domain Admins`, `Enterprise Admins`, `Tier0-Admins` |
| **Tier 1** | Enterprise Apps & Servers | Server hạ tầng (File Server, Web, DB, Hyper-V, vSphere), SCCM | `Tier1-InfraAdmins`, `Server Admins`                 |
| **Tier 2** | User Access & Devices     | Máy trạm Client, Laptop, Máy in                               | `Tier2-Helpdesk`, `Workstation Admins`               |

### Bảng Phân Quyền & Vai Trò (Matrix)

| **Cấu trúc OU**                  | **Nhóm Security đề xuất**    | **Phạm vi quản lý (Target Assets)**               | **Quyền hạn & Giới hạn cốt lõi**                                                                                 |
| -------------------------------- | ---------------------------- | ------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------- |
| **`OU=Tier0-DomainAdmins`**      | `GG_Tier0_Admins`            | Domain Controllers, PKI, ADFS, Identity           | • Domain Admins, Enterprise Admins.<br><br>  <br><br>• Quản trị toàn bộ Active Directory.                        |
| **`OU=Tier1-InfraAdmins`**       | `GG_Tier1_InfraAdmins`       | Server hạ tầng (File Server, Web, DB, Hyper-V...) | • Local Admin trên các Member Server.<br><br>  <br><br>• **Cấm:** Log on/RDP vào Domain Controller.              |
| **`OU=Tier2-WorkstationAdmins`** | `GG_Tier2_WorkstationAdmins` | 600 Máy trạm (PC/Laptop User)                     | • Local Admin trên các máy PC/Laptop client.<br><br>  <br><br>• **Cấm:** Log on/RDP vào tất cả Server (T0 & T1). |
| **`OU=SecOps-DevAdmins`**        | `GG_SecOps_Admins`           | Hệ thống SOC, SIEM, Dev/Staging Environment       | • Read-Only AD, Audit Logs, DNS/DHCP Read.<br><br>  <br><br>• Local Admin trên môi trường Dev/Test.              |

#### Bước 1: Quy hoạch cấu trúc OU & Nhóm trên Active Directory

Trước khi tạo tài khoản, anh cần dựng cấu trúc OU chuẩn để phục vụ gán Policy (GPO/AppLocker) và Fine-Grained Password Policy sau này.

Plaintext

```
company.local
 ├── OU=Company Users (600 Users thường)
 └── OU=Admin Accounts
      ├── OU=Tier0-DomainAdmins  (Dành cho AdminDomain)
	  ├── OU=Tier1-InfraAdmins  (Dành cho Infra)
      ├── OU=Tier2-WorkstationAdmins (Dành cho HelpDesk)
      └── OU=SecOps-DevAdmins    (Dành cho Security & Dev)
```

Tạo các Group Quản trị tương ứng bằng PowerShell:

PowerShell

```powershell
# Tạo các Security Group quản trị phân cấp
# 1. Tạo nhóm cho Infra
New-ADGroup -Name "GG_Infra-DomainAdmins" -GroupScope Global -GroupCategory Security -Path "OU=Tier0-DomainAdmins,OU=Admin Accounts,DC=qve,DC=com"

# 2. Tạo nhóm cho HelpDesk
New-ADGroup -Name "GG_HelpDesk-WorkstationAdmins" -GroupScope Global -GroupCategory Security -Path "OU=Tier2-WorkstationAdmins,OU=Admin Accounts,DC=qve,DC=com"

# 3. Tạo nhóm chung All-Admins
New-ADGroup -Name "GG_All-Tier-Admins" -GroupScope Global -GroupCategory Security -Path "OU=Admin Accounts,DC=qve,DC=com"
```

#### Bước 2: Tạo tài khoản Admin riêng biệt cho 10 kỹ sư IT

##### A. Nhóm Infra (Ví dụ: Nguyễn Văn A - `nva`)

PowerShell

```PowerShell
# 1. Tạo tài khoản Admin cho Infra
New-ADUser -Name "ADM - Nguyen Van A" -SamAccountName "adm.nva" `
  -UserPrincipalName "adm.nva@company.local" `
  -Path "OU=Tier0-DomainAdmins,OU=Admin Accounts,DC=company,DC=local" `
  -Enabled $true -AccountPassword (Read-Host -AsSecureString "Nhap Mat Khau Admin Infra") `
  -PasswordNeverExpires $false -ChangePasswordAtLogon $true `
  -Description "Admin Account cho Infra - Domain Admin"

# 2. Add vào nhóm Admin Infra & Nhóm Chung All-Admins
Add-ADGroupMember -Identity "GG_Infra-DomainAdmins" -Members "adm.nva"
Add-ADGroupMember -Identity "GG_All-Tier-Admins" -Members "adm.nva"
```

##### B. Nhóm HelpDesk (Ví dụ: Vũ Tiến B - `vtb`)

PowerShell

```PowerShell
# 1. Tạo tài khoản Admin cho HelpDesk (Quản trị Máy trạm)
New-ADUser -Name "ADM - Vu Tien B" -SamAccountName "adm.hd.vtb" `
  -UserPrincipalName "adm.hd.vtb@company.local" `
  -Path "OU=Tier2-WorkstationAdmins,OU=Admin Accounts,DC=company,DC=local" `
  -Enabled $true -AccountPassword (Read-Host -AsSecureString "Nhap Mat Khau Admin HelpDesk") `
  -PasswordNeverExpires $false -ChangePasswordAtLogon $true `
  -Description "Admin Account cho HelpDesk - Local Admin Workstations"

# 2. Add vào nhóm HelpDesk & Nhóm Chung All-Admins
Add-ADGroupMember -Identity "GG_HelpDesk-WorkstationAdmins" -Members "adm.hd.vtb"
Add-ADGroupMember -Identity "GG_All-Tier-Admins" -Members "adm.hd.vtb"
```

##### C. Nhóm Security (Ví dụ: Vũ Tiến B - `vtb`)

PowerShell

```PowerShell
# 1. Tạo tài khoản Admin cho Security
New-ADUser -Name "ADM - Huynh Dai Phu" -SamAccountName "adm.sec.hdp" `
  -UserPrincipalName "adm.sec.hdp@qve.com" `
  -Path "OU=SecOps-DevAdmins,OU=Admin Accounts,DC=qve,DC=com" `
  -Enabled $true -AccountPassword (Read-Host -AsSecureString "@dm1nSecurity") `
  -PasswordNeverExpires $false -ChangePasswordAtLogon $true `
  -Description "Admin Account cho Security - SecOps & Audit Tools, KHONG dung Internet/Mail"

# 2. Add vào nhóm Admin Security & Nhóm Chung All-Admins
Add-ADGroupMember -Identity "GG_Security-SecOpsAdmins" -Members "adm.sec.hdp"
Add-ADGroupMember -Identity "GG_All-Tier-Admins" -Members "adm.sec.hdp"
```

##### D. Nhóm Developer (Ví dụ: Vũ Tiến B - `vtb`)
PowerShell
```PowerShell
# 1. Tạo tài khoản Admin cho Developer
New-ADUser -Name "ADM - Nguyen Quoc Vinh" -SamAccountName "adm.dev.nqv" `
  -UserPrincipalName "adm.dev.nqv@qve.com" `
  -Path "OU=SecOps-DevAdmins,OU=Admin Accounts,DC=qve,DC=com" `
  -Enabled $true -AccountPassword (Read-Host -AsSecureString "Nhap Mat Khau Admin Developer (adm.dev.nqv)") `
  -PasswordNeverExpires $false -ChangePasswordAtLogon $true `
  -Description "Admin Account cho Developer - Dev/Test & DB Servers, KHONG dung Internet/Mail"

# 2. Add vào nhóm Admin Developer & Nhóm Chung All-Admins
Add-ADGroupMember -Identity "GG_Developer-DevAdmins" -Members "adm.dev.nqv"
Add-ADGroupMember -Identity "GG_All-Tier-Admins" -Members "adm.dev.nqv"
```

##### E. Kiểm tra lại danh sách vừa tạo:
PowerShell
```PowerShell
# 1. Tạo tài khoản Admin cho Developer
Get-ADUser -Filter 'SamAccountName -like "adm*"' -SearchBase "OU=Admin Accounts,DC=qve,DC=com" | 
  Select-Object Name, SamAccountName, UserPrincipalName, Enabled, Description | 
  Format-Table -AutoSize
```

   
| Name                      | SamAccountName | UserPrincipalName    | Enabled | Description |
| ------------------------- | -------------- | -------------------- | ------- | ----------- |
| ADM - Lieu Tran Hieu Hoai | adm.dev.lthh   | adm.dev.lthh@qve.com | TRUE    |             |
| ADM - Le Thanh Tu         | adm.dev.ltt    | adm.dev.ltt@qve.com  | TRUE    |             |
| ADM - Nguyen Quoc Vinh    | adm.dev.nqv    | adm.dev.nqv@qve.com  | TRUE    |             |
| ADM - Tran Thi Nhu Ngoc   | adm.dev.ttnn   | adm.dev.ttnn@qve.com | TRUE    |             |
| ADM - Huynh Tuan Anh      | adm.hd.hta     | adm.hd.hta@qve.com   | TRUE    |             |
| ADM - Vo Thanh Tam        | adm.hd.vtt     | adm.hd.vtt@qve.com   | TRUE    |             |
| ADM - Le Minh Luan        | adm.lml        | adm.lml@qve.com      | TRUE    |             |
| ADM - Huynh Dai Phu       | adm.sec.hdp    | adm.sec.hdp@qve.com  | TRUE    |             |
| ADM - Tran Khanh Luan     | adm.tkl        | adm.tkl@qve.com      | TRUE    |             |
| ADM - To Nguyen Hai Dang  | adm.tnhd       | adm.tnhd@qve.com     | TRUE    |             |

## 💡 Giải pháp Tối ưu: Mô hình 2 Tài khoản + Phân quyền qua Group (Group Membership)

Quản lý vẫn áp dụng nguyên tắc **1 Người = 2 Tài khoản**, nhưng tài khoản Admin của Quản lý sẽ được **ủy quyền đa năng** thông qua Security Group.

### 1. Cấu trúc Cặp tài khoản cho Quản lý

- **Tài khoản Daily (`nva`)**: Dùng cho tác vụ người dùng thông thường (Email, Teams, ERP, Duyệt Web).
    
- **Tài khoản Admin duy nhất (`adm.nva`)**: Dùng cho **TẤT CẢ** các tác vụ quản trị (Infra, HD, Sec, Dev).
    

### 2. Cách Phân quyền (Thực hiện bằng PowerShell)

Thay vì tạo nhiều user, anh chỉ cần **add tài khoản `adm.nva` vào tất cả các Group Quản trị chuyên trách** đã tạo ở bước trước:

PowerShell

```PowerShell
# 1. Tạo 1 tài khoản Admin duy nhất cho Quản lý IT (Đặt trong OU Tier 0 vì có quyền cao nhất)
New-ADUser -Name "ADM - Nguyen Van Manager" -SamAccountName "adm.nva" `
  -UserPrincipalName "adm.nva@qve.com" `
  -Path "OU=Tier0-DomainAdmins,OU=Admin Accounts,DC=qve,DC=com" `
  -Enabled $true -AccountPassword (Read-Host -AsSecureString "Nhap Mat Khau Admin Manager") `
  -PasswordNeverExpires $false -ChangePasswordAtLogon $true `
  -Description "Admin Account duy nhat cho IT Manager - Full permissions"

# 2. Gán tài khoản adm.nva vào TẤT CẢ các nhóm quản trị chuyên trách
Add-ADGroupMember -Identity "GG_Infra-DomainAdmins" -Members "adm.nva"
Add-ADGroupMember -Identity "GG_HelpDesk-WorkstationAdmins" -Members "adm.nva"
Add-ADGroupMember -Identity "GG_Security-SecOpsAdmins" -Members "adm.nva"
Add-ADGroupMember -Identity "GG_Developer-DevAdmins" -Members "adm.nva"

# 3. Add vào nhóm chung kiểm soát Policy/AppLocker
Add-ADGroupMember -Identity "GG_All-Tier-Admins" -Members "adm.nva"
```

## 🎯 Ưu điểm của giải pháp này

1. **Trải nghiệm tối ưu:** Quản lý chỉ cần nhớ **đúng 1 mật khẩu admin** (`adm.nva`). Khi cần làm việc ở bất kỳ mảng nào (RDP vào Server Dev, Remote vào PC End-user, cấu hình Domain Controller, Check Security Log), họ chỉ cần dùng duy nhất 1 account `adm.nva`.
    
2. **Audit & Log chính xác:** Mọi hành động thao tác trên hệ thống đều ghi nhận đúng danh tính cá nhân (`qve\adm.nva`), đáp ứng hoàn hảo tiêu chuẩn kiểm toán bảo mật.
    
3. **Dễ dàng quản lý (RBAC):** Khi có sự thay đổi về vai trò (ví dụ: Quản lý bàn giao lại mảng HelpDesk cho người khác), anh chỉ cần xóa `adm.nva` ra khỏi group `GG_HelpDesk-WorkstationAdmins` là xong, không cần xóa hay vô hiệu hóa tài khoản.
    
4. **Đồng bộ Bảo mật:** Tài khoản `adm.nva` vẫn thuộc nhóm `GG_All-Tier-Admins` nên vẫn chịu sự kiểm soát của AppLocker (không duyệt Web/Mail) và chính sách mật khẩu mạnh (FGPP).

#### Bước 3: Phân quyền Local Admin trên 500 PC cho nhóm HelpDesk via GPO

Để nhóm HelpDesk (`adm.hd.*`) có quyền cài đặt/sửa lỗi trên 500 PC mà **không cần quyền Domain Admin**:

1. Mở `gpmc.msc`, tạo GPO tên: **`GPO_Workstation_LocalAdmins`**.
    
2. Link GPO này vào OU chứa **500 PC Workstations**.
    
3. Đến đường dẫn: `Computer Configuration` -> `Preferences` -> `Control Panel Settings` -> `Local Users and Groups`.
    
4. Chuột phải -> `New` -> `Local Group`:
    
    - **Action**: Update
        
    - **Group Name**: `Administrators (built-in)`
        
    - **Members**: Bấm **Add** -> Chọn nhóm `company\GG_HelpDesk-WorkstationAdmins`.
        

> **Kết quả**: Nhóm HelpDesk chỉ cần nhập credential `adm.hd.vtb` khi bấm "Run as administrator" trên máy end-user là xử lý được ticket, hoàn toàn cách ly với Domain Controller/Server.

### 📋 Checklist sau khi Phân quyền Local Admin :

1. [ ] Đã **Link** GPO vào OU chứa máy tính.
    
2. [ ] Trong tab Settings, phần **Computer Configuration** đã hiển thị policy `Local Users and Groups` cấu hình cho nhóm `GG_HelpDesk-WorkstationAdmins`.
    
3. [ ] Chạy lệnh testing trên 1 máy trạm đại diện:
    
    DOS
    
    ```
    gpupdate /force
    ```
    
4. [ ] Kiểm tra trên máy trạm bằng lệnh: `net localgroup administrators` xem đã xuất hiện nhóm `QVE\GG_HelpDesk-WorkstationAdmins` chưa.
#### Bước 4: Tạo tài khoản Break-Glass & Xử lý tài khoản Administrator mặc định

Thực hiện đúng như Kịch bản tài liệu của anh:

PowerShell

```
# 1. Đổi tên Administrator mặc định thành ADM-BreakGlass
Get-ADUser -Identity "Administrator" | Rename-ADObject -NewName "ADM-BreakGlass"
Set-ADUser -Identity "ADM-BreakGlass" -SamAccountName "ADM-BreakGlass" -UserPrincipalName "ADM-BreakGlass@company.local"

# 2. Sinh mật khẩu ngẫu nhiên 30 ký tự siêu phức tạp
$RandomPassword = ConvertTo-SecureString (
  -join ((48..57)+(65..90)+(97..122)+(33,35,36,37,38,42) | Get-Random -Count 30 | ForEach-Object {[char]$_})
) -AsPlainText -Force

Set-ADAccountPassword -Identity "ADM-BreakGlass" -NewPassword $RandomPassword -Reset

# 3. LƯU MẬT KHẨU VÀO KÉT SẮT / PASSWORD VAULT NGAY LẬP TỨC!
```

#### Bước 5: Xiết chặt Bảo mật & Triển khai AppLocker chặn duyệt Web/Mail trên Admin Accounts

Áp dụng GPO chặn mở trình duyệt và ứng dụng văn phòng khi đăng nhập bằng tài khoản Admin (`GG_All-Tier-Admins`):

1. **Exchange/Mailbox**: Chắc chắn rằng trên Exchange Manager / Microsoft 365 **KHÔNG tạo Mailbox** cho các tài khoản `adm.*`, `adm.hd.*`.
    
2. **AppLocker GPO**:
    
    - Tạo GPO **`GPO_Block_Apps_On_Admin_Accounts`**.
        
    - Áp dụng AppLocker Publisher Rules deny execution đối với các file: `chrome.exe`, `msedge.exe`, `firefox.exe`, `outlook.exe`, `teams.exe`.
        
    - **User/Group enforcement**: Chỉ áp dụng cho Security Group **`GG_All-Tier-Admins`**.
        

#### Bước 6: Nghiệm thu & Disable Administrator mặc định

Sau 3 - 5 ngày vận hành thử nghiệm, 10 kỹ sư IT đã quen với việc dùng tài khoản `adm.*` qua tính năng `Run as different user` hoặc RDP:

PowerShell

```Powershell
# Disable tài khoản Break-Glass mặc định
Disable-ADAccount -Identity "ADM-BreakGlass"

# Kiểm tra lại trạng thái toàn bộ tài khoản Admin
Get-ADUser -Filter 'SamAccountName -like "adm*"' -SearchBase "OU=Admin Accounts,DC=company,DC=local" | 
  Select-Object Name, SamAccountName, Enabled, Description | Format-Table -AutoSize
```

## III. Bảng Tóm Tắt Luồng Vận Hành Hàng Ngày Cho IT (SOP)

Plaintext

```
[Mở máy sáng ra] ──> Đăng nhập Windows PC bằng user thường (nva, vtb)
                       │
                       ├── Duyệt Web, Check Mail, Chat Teams, Học tập, Làm báo cáo
                       │
                       └── Cần làm tác vụ Quản trị?
                             │
                             ├── Sửa máy PC cho User ──> Shift + Chuột phải ứng dụng ──> Run as different user ──> Nhập "adm.hd.vtb"
                             │
                             └── Quản trị Server/AD  ──> Mở Remote Desktop (RDP) / PowerShell ──> Nhập "adm.nva"
```

## IV. Đánh Giá Rủi Ro & Khuyến Nghị Tiếp Theo

1. **Rủi ro quên mật khẩu Break-Glass**: Cần có biên bản bàn giao két sắt vật lý giữa Trưởng phòng IT và Bộ phận Security/Giám đốc.
    
2. **Thói quen IT**: Mấy ngày đầu đội HelpDesk và Infra sẽ cảm thấy "vướng víu" vì phải gõ password 2 lần. Cần quán triệt đây là tiêu chuẩn bảo mật bắt buộc (Compliance) để bảo vệ chính họ khỏi trách nhiệm khi có sự cố lộ mã độc.