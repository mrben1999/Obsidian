# 🚀 Phần 4.2 — Khởi tạo ban đầu FortiGate 200F

## 1. Kết nối lần đầu
1. Nối cáp từ máy tính quản trị tới cổng **MGMT** hoặc **port1** (mặc định thường có IP `192.168.1.99`).
2. Đặt IP máy tính cùng dải (VD: `192.168.1.100/24`).
3. Truy cập `https://192.168.1.99` bằng trình duyệt.
4. Đăng nhập mặc định: `admin` / (trống, hoặc theo tem dán thiết bị) — ⚠️ **bắt buộc đổi ngay** khi đăng nhập lần đầu.

## 2. Đổi mật khẩu Admin mặc định

**Qua Web GUI:** Menu góc trên phải → **Change Password** → nhập mật khẩu mới đủ mạnh.

**Qua CLI:**
```
config system admin
    edit "admin"
        set password MatKhauFortiGateManh!2026#
    next
end
```
🔒 Sau này (theo [[04_Tich_Hop_LDAP_AD]]), tài khoản quản trị hàng ngày nên dùng tài khoản AD riêng qua LDAP thay vì dùng chung tài khoản `admin` cục bộ.

## 3. Đặt Hostname
```
config system global
    set hostname "FGT-200F-01"
end
```

## 4. Cấu hình Interface WAN (kết nối ISP)
📌 Thông số cụ thể tuỳ nhà cung cấp dịch vụ Internet — ví dụ dùng IP tĩnh từ ISP:
```
config system interface
    edit "wan1"
        set mode static
        set ip 203.0.113.10 255.255.255.248
        set allowaccess ping
    next
end

config router static
    edit 1
        set gateway 203.0.113.9
        set device "wan1"
    next
end
```
📌 Nếu ISP cấp qua PPPoE hoặc DHCP, dùng `set mode pppoe` hoặc `set mode dhcp` tương ứng theo hướng dẫn từ nhà cung cấp dịch vụ.

## 5. Cấu hình Interface nội bộ (kết nối tới CBS350 Core)
📌 Interface nội bộ cấu hình dạng **Trunk (802.1Q VLAN)** để nhận toàn bộ VLAN từ switch Core — chi tiết VLAN sub-interface xem [[03_Interface_VLAN_Zone]].
```
config system interface
    edit "internal"
        set mode static
        set ip 10.10.10.1 255.255.255.0
        set allowaccess ping https ssh
    next
end
```

## 6. Đặt thời gian hệ thống (NTP)
```
config system ntp
    set ntpsync enable
    set server-mode enable
    set source-ip 10.10.10.1
    config ntpserver
        edit 1
            set server "10.10.10.10"
        next
    end
end
```
📌 Đồng bộ với DC01 hoặc dùng NTP public (`pool.ntp.org`) nếu DC01 chưa sẵn sàng ở giai đoạn khởi tạo FortiGate trước AD.

## 7. Đặt DNS
```
config system dns
    set primary 10.10.10.10
    set secondary 8.8.8.8
end
```

## 8. Đăng ký thiết bị & License (khuyến nghị)
- [ ] Đăng ký thiết bị trên **Fortinet Support Portal** (support.fortinet.com) để nhận cập nhật FortiGuard (chống virus, IPS signature, web filtering database).
- [ ] Kiểm tra license đang có (FortiCare, UTM Bundle...) — ảnh hưởng tính năng bảo mật nâng cao có thể dùng.

## 9. Kiểm tra sau khởi tạo
```
get system status
get system interface physical
```
- [ ] ✅ Hostname đúng.
- [ ] ✅ Interface WAN/Internal đã lên, ping ra Internet thành công (`execute ping 8.8.8.8`).
- [ ] ✅ Mật khẩu admin mặc định đã đổi.
- [ ] ✅ Thời gian hệ thống đồng bộ đúng múi giờ Việt Nam.

➡️ Tiếp theo: [[03_Interface_VLAN_Zone]]
