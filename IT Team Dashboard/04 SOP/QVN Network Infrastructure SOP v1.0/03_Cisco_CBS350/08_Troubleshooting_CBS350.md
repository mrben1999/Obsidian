# 🧯 Phần 3.8 — Troubleshooting CBS350

## 1. Bảng sự cố thường gặp

| Triệu chứng | Nguyên nhân khả dĩ | Lệnh chẩn đoán | Cách xử lý |
|---|---|---|---|
| Port không lên link | Cáp lỗi, port shutdown, sai VLAN | `show interfaces status` | Kiểm tra cáp, `no shutdown`, kiểm tra VLAN gán |
| Thiết bị 802.1X không xác thực được | RADIUS không phản hồi, sai Shared Secret | `show dot1x interface <port>`, `show radius server rejected users` | Kiểm tra kết nối tới NPS (`ping 10.10.10.10`), đối chiếu Shared Secret |
| VLAN không được gán đúng theo RADIUS | Chưa bật `dot1x radius-attributes vlan` trên port | `show dot1x interface <port>` | Bật lại lệnh, xem [[05_8021X_RADIUS]] mục 5 |
| Mạng chậm/nghẽn bất thường | Broadcast storm, loop chưa được STP chặn kịp | `show spanning-tree`, `show storm-control` | Kiểm tra STP status port, xác nhận storm-control đã bật |
| Không SSH được vào switch | Sai IP quản trị, firewall FortiGate chặn VLAN 99 | `show ip interface vlan 99` trên switch, kiểm tra policy FortiGate | Xác nhận IP đúng, kiểm tra Firewall Policy giữa VLAN nguồn và VLAN 99 |
| Switch khởi động lại bất thường (reload không rõ nguyên nhân) | Lỗi nguồn điện, lỗi phần cứng, hoặc watchdog do lỗi phần mềm | `show logging`, `show version` (uptime) | Kiểm tra nguồn UPS, log trước thời điểm reload, liên hệ Cisco support nếu lặp lại |
| Port bị BPDU Guard tắt (err-disabled) | Có thiết bị gửi BPDU cắm nhầm vào port Access | `show interfaces status err-disabled` | Xác định + gỡ thiết bị gây loop, sau đó `shutdown` rồi `no shutdown` để khôi phục port |

## 2. Khôi phục port bị Err-Disabled
```
SW-ACC-XUONG-01# show interfaces status err-disabled
SW-ACC-XUONG-01(config)# interface gi1/0/5
SW-ACC-XUONG-01(config-if)# shutdown
SW-ACC-XUONG-01(config-if)# no shutdown
SW-ACC-XUONG-01(config-if)# exit
```
📌 Trước khi khôi phục port, **phải xác định và loại bỏ nguyên nhân gây err-disabled** (VD: rút thiết bị gây loop) — nếu không, port sẽ bị disable lại ngay sau khi bật lên.

## 3. Kiểm tra kết nối tới RADIUS Server từ switch
```
SW-ACC-XUONG-01# ping 10.10.10.10
```
- Nếu ping không thành công: kiểm tra routing giữa VLAN switch và VLAN 10 (Server) qua FortiGate, kiểm tra Firewall Policy (xem [[../04_FortiGate_200F/06_Firewall_Policy_Chuan]]).
- Nếu ping thành công nhưng 802.1X vẫn lỗi: khả năng cao là sai Shared Secret hoặc NPS chưa nhận đúng RADIUS Client — đối chiếu với [[../02_NPS_RADIUS/07_Troubleshooting_NPS]].

## 4. Xem log hệ thống trên switch
```
SW-ACC-XUONG-01# show logging
```
📌 Log lưu trong bộ nhớ tạm, sẽ mất khi switch khởi động lại — nếu cần lưu log lâu dài, cấu hình gửi log ra Syslog server:
```
SW-ACC-XUONG-01(config)# logging 10.10.10.50
SW-ACC-XUONG-01(config)# logging trap informational
```

## 5. Quy trình xử lý sự cố "Toàn bộ khu xưởng mất kết nối mạng"
1. ⚠️ Xác định phạm vi: 1 port, 1 switch, hay toàn bộ hạ tầng (kiểm tra switch Core, FortiGate có đang gặp sự cố không — xem [[../06_Van_Hanh_Chuan/04_Xu_Ly_Su_Co]]).
2. Kiểm tra trạng thái vật lý: đèn LED port, đèn nguồn switch.
3. Kiểm tra `show interfaces status` trên switch nghi vấn — port nào down bất thường.
4. Nếu liên quan 802.1X hàng loạt: cân nhắc dùng `dot1x port-control force-authorized` tạm thời trên các port bị ảnh hưởng để khôi phục kết nối khẩn cấp (xem [[05_8021X_RADIUS]] mục 11), trong lúc điều tra nguyên nhân gốc (thường là NPS/RADIUS).
5. Ghi nhận toàn bộ sự cố và cách xử lý vào biểu mẫu sự cố ([[../07_Phu_Luc/01_Bieu_Mau]]).

## 6. Reset switch về cấu hình gốc (Factory Reset) — biện pháp cuối cùng
⚠️ **Chỉ dùng khi không còn cách nào khác** — xoá toàn bộ cấu hình hiện tại.
```
SW-ACC-XUONG-01# delete startup-config
SW-ACC-XUONG-01# reload
```
Sau khi reset, phải cấu hình lại từ đầu theo [[02_Khoi_Tao_Ban_Dau]] → [[03_Cau_Hinh_VLAN]] → ... — có thể khôi phục nhanh hơn bằng cách restore file backup đã lưu (mục 3, [[07_Backup_Firmware]]) thay vì cấu hình lại thủ công toàn bộ.

➡️ Tiếp theo: [[09_Checklist_Van_Hanh_CBS350]]
