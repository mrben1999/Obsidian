# 🔒 Phần 4.8 — Hardening FortiGate

## 1. Giới hạn truy cập quản trị chỉ từ VLAN 99
```
config system interface
    edit "vlan99-mgmt"
        set allowaccess ping https ssh
    next
    edit "vlan10-server"
        set allowaccess ping
    next
    edit "vlan20-office"
        set allowaccess ping
    next
end
```
🔒 Chỉ `vlan99-mgmt` cho phép `https`/`ssh` — toàn bộ VLAN khác **không** được phép truy cập giao diện quản trị FortiGate trực tiếp.

## 2. Vô hiệu hoá truy cập quản trị từ WAN
```
config system interface
    edit "wan1"
        unset allowaccess
    next
end
```
⚠️ **Không bao giờ** để `allowaccess https/ssh` bật trên interface WAN — đây là một trong những nguyên nhân phổ biến nhất khiến firewall bị tấn công từ Internet.

## 3. Đổi port quản trị mặc định (giảm bị dò quét tự động)
```
config system global
    set admin-sport 8443
    set admin-ssh-port 2222
end
```
📌 Đây là biện pháp "security by obscurity" bổ sung, không thay thế các biện pháp chính (giới hạn nguồn IP, xác thực mạnh) — vẫn hữu ích để giảm nhiễu từ bot quét cổng mặc định.

## 4. Giới hạn địa chỉ IP được phép quản trị (Trusted Hosts)
```
config system admin
    edit "it-manager"
        set trusthost1 10.10.99.0 255.255.255.0
    next
end
```
🔒 Chỉ định rõ dải IP được phép đăng nhập tài khoản quản trị — dù ai đó có đúng mật khẩu nhưng không từ IP trong danh sách này vẫn bị từ chối.

## 5. Bật xác thực 2 lớp (2FA) cho tài khoản quản trị
```
config system admin
    edit "it-manager"
        set two-factor fortitoken
        set fortitoken "FTKMOB1234567890"
    next
end
```
📌 Yêu cầu FortiToken (app di động hoặc token cứng) — khuyến nghị bật cho tất cả tài khoản quản trị có quyền `super_admin`, đặc biệt tài khoản dùng khi không có AD/LDAP hỗ trợ.

## 6. Vô hiệu hoá dịch vụ không cần thiết
```
config system interface
    edit "wan1"
        set allowaccess ping
    next
end
```
🔒 Chỉ giữ lại `ping` trên WAN nếu cần chẩn đoán kết nối từ ngoài — cân nhắc tắt hẳn nếu không cần thiết (giảm khả năng bị dò quét/định vị thiết bị từ Internet).

## 7. Cấu hình Log tập trung (gửi log ra ngoài thiết bị)
```
config log syslogd setting
    set status enable
    set server "10.10.10.50"
    set port 514
end
```
📌 Gửi log ra Syslog server nội bộ (không chỉ lưu log local trên FortiGate) — đảm bảo vẫn có log để điều tra ngay cả khi thiết bị gặp sự cố nghiêm trọng mất log local.

## 8. Cập nhật FortiGuard định kỳ (Antivirus, IPS, Web Filter database)
```
execute update-now
```
📌 Cấu hình tự động cập nhật:
```
config system autoupdate schedule
    set status enable
    set frequency every
    set time 02:00
end
```

## 9. Giới hạn Session Timeout cho quản trị
```
config system global
    set admintimeout 15
end
```
🔒 Tự động đăng xuất sau 15 phút không hoạt động — giảm rủi ro nếu quên đăng xuất trên máy quản trị.

## 10. Checklist Hardening tổng hợp
- [ ] Quản trị WAN đã tắt hoàn toàn (`allowaccess` rỗng trên wan1).
- [ ] Chỉ VLAN 99 truy cập được HTTPS/SSH quản trị.
- [ ] Trusted Hosts đã giới hạn đúng dải IP quản trị.
- [ ] 2FA đã bật cho tài khoản `super_admin`.
- [ ] Port quản trị mặc định đã đổi (tuỳ chọn, không bắt buộc).
- [ ] Log đã gửi ra Syslog server tập trung.
- [ ] FortiGuard cập nhật tự động đã bật.
- [ ] Admin Session Timeout đã giới hạn ≤ 15 phút.
- [ ] Tài khoản `admin` cục bộ mặc định đã đổi mật khẩu mạnh, chỉ dùng dự phòng.

➡️ Tiếp theo: [[09_Troubleshooting_FortiGate]]
