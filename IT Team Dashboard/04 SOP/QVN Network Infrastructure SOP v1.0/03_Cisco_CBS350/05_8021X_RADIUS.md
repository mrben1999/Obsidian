# 🔑 Phần 3.5 — 802.1X RADIUS Authentication

> Cú pháp lệnh trong phần này đối chiếu theo **Cisco Business 350 Series CLI Guide** (802-1x Commands, RADIUS Commands, AAA Commands) chính thức của Cisco.

## 1. Điều kiện tiên quyết
- [ ] NPS đã cấu hình xong RADIUS Client cho switch này ([[../02_NPS_RADIUS/03_Cau_Hinh_RADIUS_Clients]]).
- [ ] Network Policy PEAP đã sẵn sàng ([[../02_NPS_RADIUS/04_Cau_Hinh_Network_Policy_PEAP]]).
- [ ] VLAN đã tạo đầy đủ ([[03_Cau_Hinh_VLAN]]).

## 2. Khai báo RADIUS Server trên switch
```
SW-ACC-XUONG-01(config)# radius-server host 10.10.10.10 auth-port 1812 timeout 5 retransmit 3 key MatKhauSharedSecretManh123
SW-ACC-XUONG-01(config)# radius-server key MatKhauSharedSecretManh123
```
🔒 Giá trị `key` (Shared Secret) phải **khớp chính xác** với Shared Secret đã khai báo cho RADIUS Client `SW-ACC-XUONG-01` trên NPS ([[../02_NPS_RADIUS/03_Cau_Hinh_RADIUS_Clients]]).

📌 Theo tài liệu Cisco: nếu không chỉ định `auth-port`, mặc định là **1812**; `timeout`/`retransmit` nếu không chỉ định sẽ dùng giá trị global.

## 3. Bật AAA và 802.1X toàn cục
```
SW-ACC-XUONG-01(config)# aaa authentication dot1x default radius
SW-ACC-XUONG-01(config)# dot1x system-auth-control
```
- `aaa authentication dot1x default radius` — chỉ định phương thức xác thực 802.1X mặc định dùng RADIUS server đã khai báo.
- `dot1x system-auth-control` — bật 802.1X toàn cục trên switch (bắt buộc trước khi cấu hình từng port).

## 4. Cấu hình 802.1X trên từng port (Access Port khu xưởng)

```
SW-ACC-XUONG-01(config)# interface gi1/0/5
SW-ACC-XUONG-01(config-if)# dot1x port-control auto
SW-ACC-XUONG-01(config-if)# dot1x host-mode single-host
SW-ACC-XUONG-01(config-if)# exit
```

| Tham số | Ý nghĩa |
|---|---|
| `dot1x port-control auto` | Port yêu cầu xác thực 802.1X trước khi cho phép traffic (ngoài EAPoL) |
| `dot1x host-mode single-host` | Chỉ 1 thiết bị được xác thực trên port này (phù hợp port kiosk 1 máy/port) |

📌 Với port có thể cắm nhiều thiết bị qua switch nhỏ trung gian (không khuyến khích nhưng có thể xảy ra thực tế ở xưởng), cân nhắc `dot1x host-mode multi-host` hoặc `multi-sessions` tuỳ nhu cầu — tham khảo kỹ tài liệu CLI Guide mục 802-1x Commands trước khi đổi mode vì mỗi mode có hành vi khác nhau đáng kể về cách xử lý khi 1 thiết bị unauthorized.

## 5. Cho phép VLAN động từ RADIUS (Dynamic VLAN Assignment)
```
SW-ACC-XUONG-01(config)# interface gi1/0/5
SW-ACC-XUONG-01(config-if)# dot1x radius-attributes vlan
SW-ACC-XUONG-01(config-if)# exit
```
📌 Lệnh này cho phép port chấp nhận VLAN mà NPS trả về qua thuộc tính Tunnel-Pvt-Group-ID (xem [[../02_NPS_RADIUS/06_Tich_Hop_AD_Groups_VLAN]]) — nếu không bật, switch sẽ bỏ qua chỉ định VLAN từ RADIUS và chỉ dùng VLAN access tĩnh đã cấu hình.

## 6. Cấu hình Guest VLAN (cho thiết bị không hỗ trợ 802.1X)
📌 Một số thiết bị khu xưởng (máy in cũ, thiết bị IoT không có supplicant 802.1X) sẽ không bao giờ gửi được EAPoL — Guest VLAN cho phép các thiết bị này vẫn có kết nối hạn chế thay vì bị chặn hoàn toàn.

```
SW-ACC-XUONG-01(config)# interface gi1/0/10
SW-ACC-XUONG-01(config-if)# dot1x guest-vlan enable
SW-ACC-XUONG-01(config-if)# dot1x guest-vlan 50
SW-ACC-XUONG-01(config-if)# exit
```
⚠️ Không dùng VLAN 50 (Guest Internet) cho mục đích này nếu thiết bị đó cần truy cập tài nguyên nội bộ — cân nhắc tạo riêng 1 VLAN "Unauthenticated-Devices" cô lập, tách biệt cả VLAN Guest lẫn VLAN Production, tuỳ mức độ nhạy cảm.

## 7. MAC-based Authentication (MAB) — thay thế cho thiết bị không có Supplicant
📌 Đây là phương án khác Guest VLAN — thay vì cho vào VLAN khách hạn chế, MAB xác thực dựa trên **địa chỉ MAC** của thiết bị (đăng ký trước MAC hợp lệ trên RADIUS/AD), phù hợp cho máy in, camera IP cần vẫn nằm đúng VLAN nội bộ nhưng không hỗ trợ 802.1X thật.
```
SW-ACC-XUONG-01(config)# interface gi1/0/11
SW-ACC-XUONG-01(config-if)# dot1x port-control auto
SW-ACC-XUONG-01(config-if)# dot1x auth-not-req
SW-ACC-XUONG-01(config-if)# exit
```
📌 Cấu hình MAB đầy đủ (kể cả phía RADIUS/AD lưu MAC như username) khá phức tạp và cần đối chiếu kỹ theo Administration Guide mục Security — chỉ triển khai khi thực sự cần thiết cho thiết bị cụ thể, ưu tiên 802.1X chuẩn cho các port có thể.

## 8. Chế độ Open Access (giai đoạn thử nghiệm, không chặn traffic khi lỗi 802.1X)
📌 Hữu ích khi mới triển khai 802.1X lần đầu — giúp phát hiện thiết bị/cấu hình lỗi mà không làm gián đoạn kết nối đang có.
```
SW-ACC-XUONG-01(config)# interface gi1/0/5
SW-ACC-XUONG-01(config-if)# authentication open
SW-ACC-XUONG-01(config-if)# exit
```
⚠️ **Chỉ dùng tạm thời trong giai đoạn thử nghiệm** — sau khi xác nhận 802.1X hoạt động ổn định, phải **tắt** Open Access (`no authentication open`) để quay lại chế độ chặn traffic khi xác thực thất bại, đúng mục tiêu bảo mật ban đầu.

## 9. Bật Accounting (ghi log phiên đăng nhập)
```
SW-ACC-XUONG-01(config)# aaa accounting dot1x default start-stop group radius
```
📌 Cho phép NPS ghi nhận start/stop của từng phiên 802.1X — hữu ích khi cần tra cứu "ai đã kết nối port nào vào lúc nào".

## 10. Kiểm tra hoạt động 802.1X
```
SW-ACC-XUONG-01# show dot1x
SW-ACC-XUONG-01# show dot1x interface gi1/0/5
SW-ACC-XUONG-01# show radius server rejected users
```
- [ ] ✅ `show dot1x interface gi1/0/5` hiển thị trạng thái **Authorized** sau khi thiết bị test đăng nhập thành công.
- [ ] ✅ `show radius server rejected users` không có entry bất thường không rõ nguồn gốc.
- [ ] ✅ Đối chiếu chéo với Event Viewer trên NPS ([[../02_NPS_RADIUS/07_Troubleshooting_NPS]]) — log 2 phía khớp nhau.

## 11. Rollback khi triển khai gây gián đoạn diện rộng
⚠️ Nếu bật 802.1X toàn bộ port khu xưởng gây gián đoạn hàng loạt (VD: NPS lỗi, RADIUS không phản hồi):
```
SW-ACC-XUONG-01(config)# interface gi1/0/5
SW-ACC-XUONG-01(config-if)# dot1x port-control force-authorized
SW-ACC-XUONG-01(config-if)# exit
```
`force-authorized` tạm thời **tắt yêu cầu xác thực** trên port đó (cho phép traffic bình thường không cần 802.1X) — dùng làm biện pháp khẩn cấp khôi phục kết nối trong lúc xử lý sự cố NPS, sau đó chuyển lại `auto` khi đã khắc phục xong.

📌 Khuyến nghị triển khai theo từng cụm port nhỏ, xác nhận ổn định trước khi mở rộng ra toàn bộ khu xưởng — không bật 802.1X đồng loạt toàn bộ port trong 1 lần đối với môi trường sản xuất đang vận hành.

➡️ Tiếp theo: [[06_QoS_Nang_Cao]]
