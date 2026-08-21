# 🚀 Phần 3.2 — Khởi tạo ban đầu CBS350

## 1. Kết nối lần đầu qua Console
1. Dùng cáp Console (RJ45-to-USB hoặc Mini-USB tuỳ model) nối từ máy tính đến cổng Console trên switch.
2. Mở phần mềm Terminal (PuTTY/Tera Term) với thông số: **9600 baud, 8 data bits, no parity, 1 stop bit, no flow control**.
3. Bật nguồn switch (nếu chưa bật) → chờ boot xong, xuất hiện dấu nhắc đăng nhập.

## 2. Đăng nhập lần đầu
- Tài khoản mặc định: `cisco` / mật khẩu mặc định: `cisco` (⚠️ **bắt buộc đổi ngay** ở bước tiếp theo).
- Lần đăng nhập đầu tiên, switch thường yêu cầu đổi mật khẩu ngay lập tức.

```
User Name: cisco
Password: cisco
```

## 3. Đổi mật khẩu quản trị

```
switchxxxxxx> enable
switchxxxxxx# configure terminal
switchxxxxxx(config)# username admin privilege 15 password MatKhauSwitchManh!2026
switchxxxxxx(config)# no username cisco
```
🔒 Xoá tài khoản mặc định `cisco` sau khi đã tạo tài khoản quản trị riêng — không để tài khoản mặc định tồn tại (rủi ro bảo mật phổ biến nhất với thiết bị mạng).

## 4. Đặt hostname
```
switchxxxxxx(config)# hostname SW-ACC-XUONG-01
```

## 5. Cấu hình IP quản trị (Management VLAN)
📌 Theo thiết kế [[../00_Tong_Quan/02_Bang_Dia_Chi_IP_VLAN]], IP quản trị switch nằm ở VLAN 99.

```
SW-ACC-XUONG-01(config)# interface vlan 99
SW-ACC-XUONG-01(config-if)# ip address 10.10.99.4 255.255.255.0
SW-ACC-XUONG-01(config-if)# exit
SW-ACC-XUONG-01(config)# ip default-gateway 10.10.99.1
```
📌 VLAN 99 phải đã tồn tại trên switch trước khi gán IP — xem [[03_Cau_Hinh_VLAN]] nếu chưa tạo.

## 6. Bật SSH, tắt Telnet (bảo mật quản trị)
```
SW-ACC-XUONG-01(config)# crypto key generate rsa
SW-ACC-XUONG-01(config)# ip ssh server
SW-ACC-XUONG-01(config)# no ip telnet server
```
🔒 Telnet truyền dữ liệu (bao gồm mật khẩu) không mã hoá — luôn tắt, chỉ dùng SSH cho quản trị từ xa.

## 7. Đặt thời gian hệ thống (NTP) — quan trọng cho log chính xác
```
SW-ACC-XUONG-01(config)# sntp server 10.10.10.10
SW-ACC-XUONG-01(config)# sntp client enable
SW-ACC-XUONG-01(config)# clock timezone +7 Asia/Ho_Chi_Minh
```
📌 Đồng bộ giờ với chính DC01 (server AD) để log switch và log NPS khớp thời gian — hỗ trợ điều tra sự cố dễ dàng hơn nhiều.

## 8. Lưu cấu hình
⚠️ **Bước dễ quên nhất** — nếu không lưu, mọi cấu hình sẽ mất khi switch khởi động lại/mất điện.
```
SW-ACC-XUONG-01# copy running-config startup-config
```

## 9. Kiểm tra sau khởi tạo
```
SW-ACC-XUONG-01# show running-config
SW-ACC-XUONG-01# show ip interface vlan 99
SW-ACC-XUONG-01# show version
```
- [ ] ✅ Hostname đúng.
- [ ] ✅ IP quản trị VLAN 99 đúng, ping được từ máy quản trị.
- [ ] ✅ SSH hoạt động (`ssh admin@10.10.99.4` từ máy VLAN 99), Telnet đã tắt.
- [ ] ✅ Tài khoản `cisco` mặc định đã xoá.
- [ ] ✅ Đã `copy running-config startup-config`.

➡️ Tiếp theo: [[03_Cau_Hinh_VLAN]]
