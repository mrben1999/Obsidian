# HƯỚNG DẪN TRIỂN KHAI ENTERPRISE: WINDOWS LAPS (LOCAL ADMINISTRATOR PASSWORD SOLUTION)

| Thông Tin Tài Liệu | Chi Tiết |
| :--- | :--- |
| **Chủ đề** | Quản lý Mật khẩu Local Administrator Tự động & Mã hóa |
| **Chuẩn áp dụng** | CIS Benchmark, NIST SP 800-63B, MITRE ATT&CK (T1078.003 / T1550.002) |
| **Phiên bản LAPS** | Windows LAPS (Tích hợp sẵn OS - Windows Server 2022 / Windows 10/11) |
| **Tác giả** | Senior Enterprise Infrastructure & Cyber Security Architect |
| **Trạng thái** | Production Ready / Enterprise Standard |

---

## 1. PHÂN TÍCH KIẾN TRÚC & NGUYÊN LÝ AN NINH (WHY FIRST)

### 1.1 Thách Thức & Lỗ Hổng An Ninh Truyền Thống
Trong nhiều môi trường doanh nghiệp, đội ngũ IT thường duy trì một tài khẩu Administrator cục bộ (Local Admin) với **cùng một mật khẩu tĩnh (static password)** trên toàn bộ các máy trạm (Workstations) để thuận tiện cho công tác hỗ trợ kỹ thuật (IT Helpdesk). 

Đây là một trong những **lỗ hổng kiến trúc nghiêm trọng nhất**, trực tiếp dẫn đến nguy cơ sụp đổ toàn bộ hạ tầng Active Directory thông qua chuỗi tấn công:

```
[Máy trạm A bị lây nhiễm Malware]
                 │
                 ▼
 [Trích xuất NTLM Hash từ LSASS]
 (Mimikatz / LSASS Dump / Sekurlsa)
                 │
                 ▼
  [Tấn công Pass-the-Hash (PtH)]
 (MITRE ATT&CK T1550.002 / T1078.003)
                 │
  ┌──────────────┼──────────────┐
  ▼              ▼              ▼
[Máy B]        [Máy C]     [Server / DC]
(Chiếm quyền)  (Chiếm quyền) (Mở rộng phạm vi)
```

1. **Lateral Movement (Di chuyển ngang):** Kẻ tấn công chỉ cần chiếm quyền điều khiển 1 máy trạm, dump NTLM Hash của Local Admin từ bộ nhớ RAM (`lsass.exe`), sau đó dùng NTLM Hash đó để đăng nhập từ xa vào **100% máy trạm còn lại trong hệ thống** mà không cần giải mã mật khẩu gốc.
2. **Ransomware Bùng Phát Diện Rộng:** Các chủng ransomware hiện đại (LockBit, BlackCat, Akira) tích hợp sẵn module tự động quét mạng và thử NTLM Hash thu được để mã hóa toàn bộ máy trạm trong vài phút.
3. **Mất Khả Năng Kiểm Toán (Auditing & Accountability):** Dùng chung một tài khoản/mật khẩu khiến hệ thống SIEM/SOC không thể định danh chính xác cá nhân IT nào đang thực hiện thao tác trên máy trạm.

---

### 1.2 Giải Pháp: Windows LAPS (Local Administrator Password Solution)

**Windows LAPS** giải quyết triệt để rủi ro trên bằng cách:
* **Mỗi máy 1 mật khẩu riêng biệt (Unique Passwords):** Mỗi máy trạm tự sinh mật khẩu ngẫu nhiên theo độ dài và độ phức tạp cấu hình trước.
* **Tự động xoay vòng mật khẩu (Password Rotation):** Mật khẩu tự động hết hạn và thay đổi định kỳ (VD: 30 ngày) hoặc thay đổi lập tức sau khi IT Support xong.
* **Mã hóa & Lưu trữ Tập trung:** Mật khẩu được mã hóa và gửi về Active Directory (hoặc Azure Active Directory / Entra ID) lưu dưới dạng thuộc tính bảo mật của đối tượng máy tính (Computer Object).
* **Phân quyền truy cập dựa trên vai trò (RBAC):** Chỉ những tài khoản/nhóm kỹ thuật được chỉ định mới có quyền đọc mật khẩu của máy trạm.

```
+-----------------------------------------------------------------------+
|                       Active Directory Services                       |
|  - Stores Encrypted Password in Computer Object Attribute            |
|  - Enforces Access Control Lists (ACLs / RBAC)                        |
+-----------------------------------------------------------------------+
                                   ▲
                                   │  Encrypted Password Sync (RPC/LDAP)
                                   │  & ACL Authorization
                                   ▼
+-----------------------------------------------------------------------+
|                    Domain Controller / GPO Engine                     |
|  - Pushes Windows LAPS Policy Settings via Central Store              |
+-----------------------------------------------------------------------+
                                   │
                                   │  GPO Enforcement
                                   ▼
+-----------------------------------------------------------------------+
|                          Domain Workstations                          |
|  - Generates Complex Random Password locally                          |
|  - Updates Local SAM Database                                         |
|  - Reports Encrypted Password & Expiration Time to AD                 |
+-----------------------------------------------------------------------+
```

---

## 2. MA TRẬN SO SÁNH GIẢI PHÁP QUẢN LÝ LOCAL ADMIN

| Tiêu chí đánh giá | Mật khẩu Tĩnh (Static Password) | GPP / Password via GPO | Windows LAPS (Khuyến nghị) |
| :--- | :--- | :--- | :--- |
| **Độ độc nhất mật khẩu** | 🔴 1 Mật khẩu cho toàn mạng | 🔴 1 Mật khẩu cho toàn mạng | 🟢 100% Unique per Computer |
| **Khả năng chống Pass-the-Hash** | 🔴 Không có | 🔴 Không có | 🟢 Tuyệt đối |
| **Cơ chế lưu trữ** | 🔴 Ghi sổ / File Excel / Nhớ | 🔴 XML trong SYSVOL (MS14-025) | 🟢 Mã hóa trong AD Schema (Confidential) |
| **Tự động xoay vòng** | 🔴 Thủ công (Rất tốn sức) | 🔴 Không tự động | 🟢 Tự động theo lịch / Theo yêu cầu |
| **Phân quyền RBAC** | 🔴 Không có | 🔴 Mọi Domain User đều đọc được | 🟢 Phân quyền chi tiết tới từng OU |
| **Đánh giá chuẩn An ninh** | ❌ **VI PHẠM NGIÊM TRỌNG** | ❌ **ĐÃ BỊ DEPRECATED** | 🔐 **ENTEPRISE STANDARD** |

---

## 3. LỘ TRÌNH TRIỂN KHAI (IMPLEMENTATION ROADMAP)

```
[Giai đoạn 1: Chuẩn bị Schema & AD] ──► [Giai đoạn 2: Phân quyền RBAC] ──► [Giai đoạn 3: Cấu hình GPO] ──► [Giai đoạn 4: Kiểm thử & Khai thác]
```

---

## 4. HƯỚNG DẪN CHI TIẾT CÁC BƯỚC TRIỂN KHAI

### BƯỚC 1: Mở Rộng Active Directory Schema Cho Windows LAPS

*Lưu ý: Windows Server 2022 (Update April 2023 trở về sau) đã tích hợp sẵn module Windows LAPS PowerShell. Bạn chỉ cần mở rộng Schema để tạo các thuộc tính lưu trữ.*

1. Đăng nhập vào **Domain Controller** bằng tài khoản thuộc nhóm **Schema Admins** và **Domain Admins**.
2. Mở **PowerShell với quyền Administrator**.
3. Chạy lệnh cập nhật Schema:

```powershell
# ==============================================================================
# Lệnh: Update-LapsADSchema
# Mục đích: Thêm các thuộc tính msLAPS-* vào Active Directory Schema
# Quyền yêu cầu: Schema Admins
# ==============================================================================
Update-LapsADSchema -Verbose
```

**Các thuộc tính mới được thêm vào Schema:**
* `msLAPS-Password`: Lưu mật khẩu đã mã hóa hoặc plain text (tùy cấu hình).
* `msLAPS-PasswordExpirationTime`: Lưu thời điểm hết hạn mật khẩu.
* `msLAPS-EncryptedPassword`: Mật khẩu được mã hóa bằng DAPI-NG.
* `msLAPS-EncryptedPasswordHistory`: Lịch sử mật khẩu.

---

### BƯỚC 2: Cấp Quyền Cho Máy Trạm Tự Ghi Mật Khẩu Vào AD (Self-Write)

Máy trạm cần có quyền ghi dữ liệu mật khẩu do chính nó sinh ra vào thuộc tính của nó trong Active Directory.

```powershell
# ==============================================================================
# Lệnh: Set-LapsADComputerSelfRegistrationPermission
# Mục đích: Cấp quyền cho đối tượng Computer tự cập nhật thuộc tính LAPS của chính nó
# ==============================================================================
Set-LapsADComputerSelfRegistrationPermission -Identity "OU=Workstations,DC=enterprise,DC=local"
```

---

### BƯỚC 3: Phân Quyền Truy Cập Mật Khẩu (RBAC - Least Privilege)

Mặc định, mật khẩu LAPS là **Confidential Attribute**. Chỉ những tài khoản/nhóm được chỉ định rõ ràng mới có quyền đọc.

#### 3.1 Cấp quyền ĐỌC mật khẩu cho nhóm IT Helpdesk:

```powershell
# ==============================================================================
# Lệnh: Set-LapsADReadPasswordPermission
# Mục đích: Cấp quyền đọc mật khẩu LAPS cho nhóm Helpdesk
# ==============================================================================
Set-LapsADReadPasswordPermission `
    -Identity "OU=Workstations,DC=enterprise,DC=local" `
    -AllowedPrincipals "ENTERPRISE\GG_IT_Helpdesk", "ENTERPRISE\Domain Admins"
```

#### 3.2 Cấp quyền YÊU CẦU ĐỔI MẬT KHẨU NGAY (Reset Expiration) cho IT Helpdesk:

```powershell
# ==============================================================================
# Lệnh: Set-LapsADResetPasswordPermission
# Mục đích: Cho phép Helpdesk đặt lịch force change password ngay lập tức
# ==============================================================================
Set-LapsADResetPasswordPermission `
    -Identity "OU=Workstations,DC=enterprise,DC=local" `
    -AllowedPrincipals "ENTERPRISE\GG_IT_Helpdesk"
```

---

### BƯỚC 4: Cấu Hình Group Policy Object (GPO)

1. Mở **Group Policy Management Console** (`gpmc.msc`).
2. Tạo GPO mới có tên: `GPO_Computer_Security_Windows_LAPS`.
3. Link GPO vào **OU chứa các máy trạm** (VD: `OU=Workstations,DC=enterprise,DC=local`).
4. Chuột phải vào GPO ➔ Chọn **Edit**.

```
Group Policy Management Editor
├── Computer Configuration
│   ├── Policies
│   │   ├── Windows Settings
│   │   │   └── Security Settings
│   │   │       └── Local Policies
│   │   │           └── Security Options
│   │   │               ├── Accounts: Enable Administrator account status --> Enabled
│   │   │               └── Accounts: Rename administrator account ---------> local-admin
│   │   └── Administrative Templates
│   │       └── System
│   │           └── LAPS
│   │               ├── Configure password backup directory -------------> Enabled (Active Directory)
│   │               ├── Password Settings -------------------------------> Enabled (Length: 16+, Complexity)
│   │               └── Name of administrator account to manage ---------> Enabled (local-admin)
```

#### Chi Tiết Bảng Cấu Hình Policy LAPS:

| Đường dẫn Policy | Tên Policy | Thiết lập Khuyên dùng (Enterprise Standard) |
| :--- | :--- | :--- |
| `System/LAPS` | **Configure password backup directory** | **Enabled** ➔ Select `Active Directory` |
| `System/LAPS` | **Password Settings** | **Enabled**<br>• Password Complexity: `Large letters, small letters, numbers, special characters`<br>• Password Length: `16` đến `20` ký tự<br>• Password Age (Days): `30` ngày |
| `System/LAPS` | **Name of administrator account to manage** | **Enabled** ➔ Nhập tên tài khoản (VD: `local-admin`). *Nếu để trống, LAPS tự quản lý tài khoản Built-in Administrator (SID -500).* |
| `System/LAPS` | **Enable password encryption** | **Enabled** ➔ Mã hóa mật khẩu trước khi lưu vào AD bằng DAPI-NG. |

---

### BƯỚC 5: Ép Áp Dụng Chính Sách & Kiểm Tra Lỗi Trên Máy Trạm

 Mở Command Prompt / PowerShell với quyền Admin trên máy trạm Client:

```cmd
:: 1. Bắt buộc cập nhật Group Policy
gpupdate /force

:: 2. Kiểm tra sự kiện LAPS trong Event Viewer
eventvwr.msc
```
*Điều hướng trong Event Viewer:* `Applications and Services Logs` ➔ `Microsoft` ➔ `Windows` ➔ `LAPS` ➔ `Operational`.
* **Event ID 10003:** Cập nhật mật khẩu LAPS thành công lên Active Directory.

---

## 5. QUY TRÌNH THAO TÁC CHUẨN (SOP) CHO ĐỘI NGŨ IT HELPDESK

Khi kỹ thuật viên cần đăng nhập vào máy trạm `WORKSTATION-01` để xử lý sự cố:

### Phương Án 1: Tra cứu qua PowerShell (Nhanh & Khuyên dùng)

```powershell
# ==============================================================================
# Trích xuất Mật khẩu Local Admin hiện tại của máy WORKSTATION-01
# ==============================================================================
Get-LapsADPassword -Identity "WORKSTATION-01" -IncludePassword
```

**Kết quả mẫu:**
```text
ComputerName    AccountName  Password           ExpirationTime
------------    -----------  --------           --------------
WORKSTATION-01  local-admin  k#9P$mX2!vL8@qW1   8/28/2026 2:30:00 PM
```

### Phương Án 2: Tra cứu qua Active Directory Users and Computers (`dsa.msc`)

1. Mở `dsa.msc` ➔ Chọn **View** ➔ Tick vào **Advanced Features**.
2. Tìm đối tượng máy tính `WORKSTATION-01` ➔ Chuột phải chọn **Properties**.
3. Chuyển sang Tab **LAPS**:
   * Xem mật khẩu tại ô **Password**.
   * Xem thời gian hết hạn tại ô **Expiration Time**.

---

### Quy Trình Sau Khi Support Xong (Force Password Reset)

Để đảm bảo nguyên tắc Zero Trust, sau khi IT Support xong sự cố trên máy trạm, kỹ thuật viên phải kích hoạt lệnh đổi mật khẩu ngay lập tức:

```powershell
# ==============================================================================
# Đặt thời gian hết hạn mật khẩu về thời điểm hiện tại
# Máy trạm sẽ tự đổi mật khẩu mới trong lần kết nối mạng/khởi động tiếp theo
# ==============================================================================
Reset-LapsPassword -Identity "WORKSTATION-01"
```

---

## 6. XỬ LÝ SỰ CỐ THƯỜNG GẶP (TROUBLESHOOTING GUIDE)

### Lỗi 1: Máy trạm không ghi được mật khẩu vào AD (Event ID 10017)
* **Nguyên nhân:** Máy trạm chưa được cấp quyền Self-Registration trên OU.
* **Cách xử lý:** Chạy lại lệnh ở **Bước 2** cho đúng OU chứa máy trạm.

### Lỗi 2: IT Helpdesk không đọc được mật khẩu (Access Denied)
* **Nguyên nhân:** Thiếu quyền ACL trên thuộc tính Confidential Attribute `msLAPS-Password`.
* **Cách xử lý:** Kiểm tra lại phân quyền RBAC ở **Bước 3.1**.

### Lỗi 3: Event Log báo "LAPS policy is enabled but no custom account found"
* **Nguyên nhân:** Nhập sai tên tài khoản Local Admin trong Policy `Name of administrator account to manage`, hoặc tài khoản đó bị Disable.
* **Cách xử lý:** Kiểm tra lại chính xác tên tài khoản đã đổi ở Bước 4.

---

## 7. CHECKLIST KIỂM TRA ĐỊNH KỲ (MAINTENANCE CHECKLIST)

- [ ] **Hàng tuần:** Kiểm tra Event Log trên Domain Controller để phát hiện các máy trạm không đồng bộ được LAPS.
- [ ] **Hàng tháng:** Audit danh sách thành viên trong nhóm `GG_IT_Helpdesk` (Đảm bảo đúng nguyên tắc Least Privilege).
- [ ] **Hàng quý:** Kiểm tra tỉ lệ phủ của LAPS trên toàn bộ máy trạm bằng script PowerShell:

```powershell
# Script kiểm tra số lượng máy trạm đã có mật khẩu LAPS trong AD
Get-ADComputer -Filter * -SearchBase "OU=Workstations,DC=enterprise,DC=local" -Properties msLAPS-PasswordExpirationTime | 
Select-Object Name, @{N='LAPS_Active'; E={if($_.'msLAPS-PasswordExpirationTime'){ $true } else { $false }}} |
Group-Object LAPS_Active
```

---
*Tài liệu được thiết lập theo Tiêu chuẩn Kiến trúc Hạ tầng An ninh Thông tin Doanh nghiệp.*
