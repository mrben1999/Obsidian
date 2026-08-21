# ⚙️ Phần 2.2 — Cài đặt NPS Role

## 1. Điều kiện tiên quyết
- [ ] AD DS đã hoạt động ổn định (theo [[../01_Windows_Server_AD/03_Trien_Khai_AD_DS]]).
- [ ] Đã xác định server sẽ cài NPS — khuyến nghị cài **chung trên DC01** cho quy mô nhà máy vừa/nhỏ (giảm số lượng server cần quản lý, phù hợp mô hình 1 IT Manager).

📌 Cài NPS chung với DC là hợp lệ và phổ biến ở quy mô nhỏ, dù Microsoft khuyến nghị tách riêng ở quy mô lớn hơn vì lý do hiệu năng/bảo mật phân lớp — nếu nhà máy mở rộng sau này, cân nhắc tách NPS ra server riêng.

## 2. Cài đặt Role qua PowerShell
```powershell
Install-WindowsFeature -Name NPAS -IncludeManagementTools
```
`NPAS` = Network Policy and Access Services (bao gồm NPS).

## 3. Cài đặt qua GUI (thay thế)
1. **Server Manager** → **Add roles and features**.
2. **Server Roles** → tích **Network Policy and Access Services**.
3. Khi được hỏi thêm feature → **Add Features** → Next → Next → **Install**.

## 4. Đăng ký NPS với Active Directory
🔒 Bước bắt buộc để NPS có quyền đọc thuộc tính dial-in/RADIUS của user trong AD.

**Qua PowerShell:**
```powershell
netsh nps add registeredserver
```

**Qua GUI:** Mở **Network Policy Server** console → chuột phải **NPS (Local)** → **Register server in Active Directory** → OK.

✅ Xác nhận: Server NPS xuất hiện trong nhóm AD `RAS and IAS Servers`:
```powershell
Get-ADGroupMember -Identity "RAS and IAS Servers"
```

## 5. Kiểm tra dịch vụ NPS đã chạy
```powershell
Get-Service IAS
```
📌 Dịch vụ Windows đứng sau NPS có tên nội bộ là `IAS` (Internet Authentication Service — tên lịch sử, chức năng chính là NPS/RADIUS).

- [ ] ✅ Service `IAS` ở trạng thái **Running**, Startup Type **Automatic**.

## 6. Mở Windows Firewall cho RADIUS
```powershell
New-NetFirewallRule -DisplayName "RADIUS-Auth-1812" -Direction Inbound -Protocol UDP -LocalPort 1812 -Action Allow
New-NetFirewallRule -DisplayName "RADIUS-Acct-1813" -Direction Inbound -Protocol UDP -LocalPort 1813 -Action Allow
```
🔒 Khuyến nghị giới hạn rule theo `-RemoteAddress` chỉ cho phép IP các RADIUS Client đã biết (switch, AP), thay vì mở cho toàn mạng — xem [[08_Checklist_Van_Hanh_NPS]].

➡️ Tiếp theo: [[03_Cau_Hinh_RADIUS_Clients]]
