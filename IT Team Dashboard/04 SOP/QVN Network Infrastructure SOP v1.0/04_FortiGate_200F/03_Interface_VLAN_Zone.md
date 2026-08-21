# 🧩 Phần 4.3 — Interface, VLAN, Zone

## 1. Tạo VLAN Sub-interface (tương ứng bảng VLAN chuẩn)

```
config system interface
    edit "vlan10-server"
        set vdom "root"
        set ip 10.10.10.1 255.255.255.0
        set interface "internal"
        set vlanid 10
        set allowaccess ping https ssh
    next
    edit "vlan20-office"
        set vdom "root"
        set ip 10.10.20.1 255.255.255.0
        set interface "internal"
        set vlanid 20
        set allowaccess ping
    next
    edit "vlan30-production"
        set vdom "root"
        set ip 10.10.30.1 255.255.255.0
        set interface "internal"
        set vlanid 30
        set allowaccess ping
    next
    edit "vlan40-wifistaff"
        set vdom "root"
        set ip 10.10.40.1 255.255.255.0
        set interface "internal"
        set vlanid 40
        set allowaccess ping
    next
    edit "vlan50-guest"
        set vdom "root"
        set ip 10.10.50.1 255.255.255.0
        set interface "internal"
        set vlanid 50
        set allowaccess ping
    next
    edit "vlan99-mgmt"
        set vdom "root"
        set ip 10.10.99.1 255.255.255.0
        set interface "internal"
        set vlanid 99
        set allowaccess ping https ssh
    next
end
```
🔒 Chỉ `vlan10-server`, `vlan99-mgmt` cho phép `https ssh` (quản trị) — các VLAN còn lại chỉ `ping` để kiểm tra kết nối, không mở giao diện quản trị.

## 2. Tạo Zone gom nhóm Interface theo mức tin cậy
📌 Zone giúp viết Firewall Policy gọn hơn khi có nhiều interface cùng mức chính sách — trong kiến trúc này mỗi VLAN đã là 1 zone riêng biệt cho kiểm soát chặt, nhưng vẫn có thể gom nếu cần:
```
config system zone
    edit "zone-server"
        set interface "vlan10-server"
    next
    edit "zone-office"
        set interface "vlan20-office"
    next
    edit "zone-production"
        set interface "vlan30-production"
    next
    edit "zone-wifi-staff"
        set interface "vlan40-wifistaff"
    next
    edit "zone-guest"
        set interface "vlan50-guest"
    next
    edit "zone-mgmt"
        set interface "vlan99-mgmt"
    next
end
```

## 3. Cấu hình DHCP Server trên từng VLAN (nếu FortiGate đảm nhiệm việc cấp DHCP thay vì thiết bị khác)
```
config system dhcp server
    edit 1
        set interface "vlan20-office"
        set default-gateway 10.10.20.1
        set netmask 255.255.255.0
        set dns-service default
        config ip-range
            edit 1
                set start-ip 10.10.20.50
                set end-ip 10.10.20.200
            next
        end
    next
end
```
📌 Lặp lại tương tự cho `vlan30-production`, `vlan40-wifistaff`, `vlan50-guest` theo dải DHCP đã định nghĩa tại [[../00_Tong_Quan/02_Bang_Dia_Chi_IP_VLAN]] mục 3. Với `vlan50-guest`, đặt `set dns-service specify` và trỏ DNS ra ngoài (không dùng DNS nội bộ 10.10.10.10).

## 4. Kiểm tra
```
get system interface
diagnose ip address list
```
- [ ] ✅ Toàn bộ 6 VLAN sub-interface xuất hiện đúng IP.
- [ ] ✅ Ping từ FortiGate tới gateway của switch Core (`10.10.99.2`) thành công.
- [ ] ✅ DHCP hoạt động — client trong VLAN Office/Production nhận đúng IP dải đã định nghĩa.

➡️ Tiếp theo: [[04_Tich_Hop_LDAP_AD]]
