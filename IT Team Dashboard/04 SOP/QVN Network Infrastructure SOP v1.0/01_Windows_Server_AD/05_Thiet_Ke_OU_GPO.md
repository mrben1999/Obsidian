# 🗂️ Phần 1.5 — Thiết kế OU & Group Policy

## 1. Nguyên tắc thiết kế OU (Organizational Unit)
- OU phản ánh **cơ cấu quản lý** (để áp GPO/phân quyền dễ dàng), không nhất thiết giống sơ đồ tổ chức công ty 100%.
- Tách riêng OU cho **User**, **Computer**, **Group**, **Service Account** — không gộp chung để dễ áp GPO có chọn lọc.

## 2. Cấu trúc OU khuyến nghị cho nhà máy may mặc

```
qvn.local
├── OU=QVN-Users
│   ├── OU=BanGiamDoc
│   ├── OU=VanPhong (Kế toán, Nhân sự, Kinh doanh...)
│   ├── OU=SanXuat (Quản lý chuyền, tổ trưởng, QA...)
│   └── OU=IT
├── OU=QVN-Computers
│   ├── OU=PC-VanPhong
│   ├── OU=PC-SanXuat (kiosk, máy trạm xưởng)
│   └── OU=Servers
├── OU=QVN-Groups
│   ├── OU=SecurityGroups (nhóm phân quyền)
│   └── OU=DistributionGroups (nếu dùng email nội bộ)
└── OU=QVN-ServiceAccounts
```

## 3. Tạo cấu trúc OU bằng PowerShell (script mẫu, chạy 1 lần)
```powershell
$domainDN = "DC=qvn,DC=local"

New-ADOrganizationalUnit -Name "QVN-Users" -Path $domainDN
New-ADOrganizationalUnit -Name "BanGiamDoc" -Path "OU=QVN-Users,$domainDN"
New-ADOrganizationalUnit -Name "VanPhong" -Path "OU=QVN-Users,$domainDN"
New-ADOrganizationalUnit -Name "SanXuat" -Path "OU=QVN-Users,$domainDN"
New-ADOrganizationalUnit -Name "IT" -Path "OU=QVN-Users,$domainDN"

New-ADOrganizationalUnit -Name "QVN-Computers" -Path $domainDN
New-ADOrganizationalUnit -Name "PC-VanPhong" -Path "OU=QVN-Computers,$domainDN"
New-ADOrganizationalUnit -Name "PC-SanXuat" -Path "OU=QVN-Computers,$domainDN"
New-ADOrganizationalUnit -Name "Servers" -Path "OU=QVN-Computers,$domainDN"

New-ADOrganizationalUnit -Name "QVN-Groups" -Path $domainDN
New-ADOrganizationalUnit -Name "SecurityGroups" -Path "OU=QVN-Groups,$domainDN"

New-ADOrganizationalUnit -Name "QVN-ServiceAccounts" -Path $domainDN
```
📌 Mặc định `New-ADOrganizationalUnit` bật **Protect from accidental deletion** — đây là hành vi đúng, không nên tắt để tránh xoá nhầm OU chứa hàng trăm user.

## 4. Security Group chuẩn dùng cho phân quyền RADIUS/VLAN
| Tên Group | Mục đích | Dùng ở |
|---|---|---|
| `GG-Wifi-VanPhong` | Nhân viên văn phòng được phép dùng Wi-Fi VLAN 40 | NPS Network Policy, xem [[../02_NPS_RADIUS/06_Tich_Hop_AD_Groups_VLAN]] |
| `GG-Wifi-SanXuat` | Nhân viên xưởng dùng Wi-Fi (nếu có) | NPS Network Policy |
| `GG-Mang-Day-SanXuat` | Máy/thiết bị kết nối mạng dây khu xưởng qua 802.1X | NPS + CBS350 |
| `GG-IT-Admin` | Quản trị viên IT — toàn quyền quản lý thiết bị mạng | FortiGate/CBS350 admin login |
| `GG-VPN-Users` | Người dùng được phép VPN vào mạng nội bộ (nếu có) | FortiGate |

```powershell
New-ADGroup -Name "GG-Wifi-VanPhong" -GroupScope Global -GroupCategory Security -Path "OU=SecurityGroups,OU=QVN-Groups,DC=qvn,DC=local"
New-ADGroup -Name "GG-Mang-Day-SanXuat" -GroupScope Global -GroupCategory Security -Path "OU=SecurityGroups,OU=QVN-Groups,DC=qvn,DC=local"
New-ADGroup -Name "GG-IT-Admin" -GroupScope Global -GroupCategory Security -Path "OU=SecurityGroups,OU=QVN-Groups,DC=qvn,DC=local"
```

## 5. GPO khuyến nghị triển khai cơ bản

| Tên GPO | Áp dụng cho OU | Nội dung chính |
|---|---|---|
| `GPO-Password-Policy` | Toàn domain (Default Domain Policy) | Độ dài mật khẩu, độ phức tạp, khoá tài khoản sau N lần sai — xem [[08_Hardening_AD]] |
| `GPO-PC-SanXuat-Kiosk` | `OU=PC-SanXuat` | Khoá màn hình chờ dài hơn bình thường (kiosk luôn hiển thị), ẩn Control Panel, chặn USB (nếu cần) |
| `GPO-PC-VanPhong-Baseline` | `OU=PC-VanPhong` | Screen lock timeout, Windows Update tự động, chặn cài phần mềm ngoài danh sách |
| `GPO-Wireless-8021X` | `OU=PC-VanPhong`, `OU=SanXuat` (máy có Wi-Fi) | Đẩy cấu hình profile Wi-Fi PEAP-MSCHAPv2 tự động — xem [[../02_NPS_RADIUS/04_Cau_Hinh_Network_Policy_PEAP]] |

### Tạo GPO mẫu (qua Group Policy Management Console)
1. **Server Manager** → **Tools** → **Group Policy Management**.
2. Chuột phải OU đích (VD: `PC-SanXuat`) → **Create a GPO in this domain, and Link it here...**
3. Đặt tên `GPO-PC-SanXuat-Kiosk` → OK.
4. Chuột phải GPO vừa tạo → **Edit** → cấu hình theo nhu cầu (VD: `Computer Configuration → Policies → Windows Settings → Security Settings → Local Policies → Security Options`).

## 6. Kiểm tra GPO đã áp dụng đúng
```powershell
# Trên máy trạm, kiểm tra GPO đã nhận
gpresult /r

# Ép áp dụng GPO ngay (không chờ chu kỳ refresh mặc định ~90 phút)
gpupdate /force
```
- [ ] ✅ `gpresult /r` hiển thị đúng GPO mong đợi trong danh sách "Applied Group Policy Objects".
- [ ] ✅ Không có GPO nào bị "Denied" ngoài ý muốn (kiểm tra Security Filtering/WMI Filtering nếu có).

➡️ Tiếp theo: [[06_Quan_Ly_User_Group]]
