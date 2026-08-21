# 💿 Phần 1.2 — Cài đặt Windows Server 2012 R2

## 1. Yêu cầu phần cứng tối thiểu (khuyến nghị cho DC nhà máy)

| Thành phần | Tối thiểu Microsoft | Khuyến nghị thực tế (DC + DNS + NPS) |
|---|---|---|
| CPU | 1.4 GHz 64-bit | 4 core trở lên |
| RAM | 512 MB | 8 GB trở lên |
| Ổ đĩa | 32 GB | 100 GB trở lên (SSD khuyến nghị) |
| NIC | 1 | 1 (khuyến nghị IP tĩnh ngay từ đầu) |

## 2. Chuẩn bị trước khi cài
- [ ] Chuẩn bị ISO Windows Server 2012 R2 (Standard/Datacenter tuỳ license nhà máy).
- [ ] Xác định IP tĩnh sẽ gán cho server (theo [[../00_Tong_Quan/02_Bang_Dia_Chi_IP_VLAN]]: `10.10.10.10/24`, Gateway `10.10.10.1`).
- [ ] Xác định hostname theo quy ước (`DC01`).
- [ ] Chuẩn bị license key (nếu không dùng KMS nội bộ).

## 3. Các bước cài đặt hệ điều hành

### Bước 1 — Boot từ ISO/USB cài đặt
1. Khởi động máy chủ, boot từ ISO/USB Windows Server 2012 R2.
2. Chọn ngôn ngữ, định dạng giờ, bàn phím → **Next**.
3. Chọn **Install now**.

### Bước 2 — Chọn phiên bản cài đặt
1. Chọn **Windows Server 2012 R2 Standard (Server with a GUI)** — khuyến nghị dùng bản có GUI cho môi trường 1 IT Manager vận hành (dễ thao tác hơn Server Core).
2. Chấp nhận điều khoản license → **Next**.

### Bước 3 — Phân vùng ổ đĩa
1. Chọn **Custom: Install Windows only (advanced)**.
2. Tạo phân vùng theo khuyến nghị: 1 phân vùng hệ thống (C:) tối thiểu 80GB, phần còn lại có thể tạo phân vùng D: riêng cho dữ liệu/backup AD.
3. Tiến hành cài đặt, máy sẽ khởi động lại tự động.

### Bước 4 — Cấu hình lần đầu (OOBE)
1. Đặt mật khẩu **Administrator** cục bộ — theo chuẩn mật khẩu mạnh (xem [[08_Hardening_AD]] mục Password Policy).
2. Đăng nhập lần đầu bằng tài khoản Administrator.

## 4. Cấu hình mạng ban đầu (đặt IP tĩnh)

**Qua GUI:**
1. **Server Manager** → **Local Server** → click vào tên NIC bên cạnh "Ethernet".
2. Click chuột phải NIC → **Properties** → chọn **Internet Protocol Version 4 (TCP/IPv4)** → **Properties**.
3. Nhập:
   - IP address: `10.10.10.10`
   - Subnet mask: `255.255.255.0`
   - Default gateway: `10.10.10.1`
   - Preferred DNS server: `127.0.0.1` (📌 vì server này sẽ tự làm DNS sau khi cài AD DS — trỏ về chính nó)
4. **OK** → **Close**.

**Qua PowerShell (khuyến nghị vì nhanh, có thể lưu lại làm script):**
```powershell
New-NetIPAddress -InterfaceAlias "Ethernet" -IPAddress 10.10.10.10 -PrefixLength 24 -DefaultGateway 10.10.10.1
Set-DnsClientServerAddress -InterfaceAlias "Ethernet" -ServerAddresses 127.0.0.1
```

## 5. Đổi tên máy chủ (Hostname)

```powershell
Rename-Computer -NewName "DC01" -Restart
```
✅ Sau khi khởi động lại, xác nhận bằng lệnh: `hostname`

## 6. Cập nhật Windows Update trước khi triển khai AD DS
🔒 Bắt buộc cập nhật đầy đủ bản vá bảo mật trước khi promote thành Domain Controller — tránh triển khai AD trên nền hệ điều hành có lỗ hổng đã biết.
```powershell
Install-WindowsUpdate -AcceptAll -AutoReboot
```
📌 Nếu server không có Internet trực tiếp (theo thiết kế phân vùng VLAN Server hạn chế ra ngoài), dùng WSUS nội bộ hoặc tải bản vá thủ công qua Microsoft Update Catalog rồi cài offline.

## 7. Kiểm tra sau khi cài đặt
- [ ] ✅ `ipconfig /all` — xác nhận đúng IP/Gateway/DNS.
- [ ] ✅ `hostname` — xác nhận đúng tên `DC01`.
- [ ] ✅ Windows Update đã áp dụng bản vá mới nhất có thể.
- [ ] ✅ Đã tắt các dịch vụ/role không cần thiết mặc định (giảm bề mặt tấn công).

➡️ Tiếp theo: [[03_Trien_Khai_AD_DS]]
