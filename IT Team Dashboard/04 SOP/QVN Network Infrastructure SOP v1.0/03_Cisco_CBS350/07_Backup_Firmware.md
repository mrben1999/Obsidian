# 💾 Phần 3.7 — Backup cấu hình & Firmware Upgrade

## 1. Backup cấu hình (Running-config → Startup-config → File ngoài)

### Bước 1 — Lưu running vào startup (luôn làm sau mỗi thay đổi)
```
SW-CORE-01# copy running-config startup-config
```

### Bước 2 — Xuất file cấu hình ra bên ngoài (TFTP/SFTP) để lưu trữ lâu dài
```
SW-CORE-01# copy startup-config tftp://10.10.10.50/backup/sw-core-01-2026-07-08.cfg
```
📌 Cần 1 TFTP/SFTP server nội bộ (có thể chạy trên chính máy quản trị IT hoặc NAS) để nhận file backup — CBS350 hỗ trợ TFTP native qua CLI.

Qua Web GUI (thay thế): **Administration → File Management → Backup/Restore** → chọn **Configuration** → **Backup** → tải file `.cfg` về máy quản trị.

## 2. Lịch backup định kỳ khuyến nghị
| Tần suất | Khi nào |
|---|---|
| Sau mỗi thay đổi cấu hình quan trọng | Ngay lập tức (thủ công) |
| Định kỳ hàng tuần | Tự động (nếu có script/công cụ hỗ trợ) hoặc nhắc thủ công |
| Trước khi nâng cấp firmware | Bắt buộc |

📌 CBS350 không có tính năng lập lịch backup tự động tích hợp sẵn mạnh như thiết bị Enterprise cao cấp — khuyến nghị dùng script PowerShell/cron chạy trên server quản trị để tự động SSH vào switch và chạy lệnh backup định kỳ, hoặc nhắc lịch thủ công trong [[../06_Van_Hanh_Chuan/01_Quy_Trinh_Backup_Tong_The]].

## 3. Khôi phục cấu hình từ file backup
```
SW-CORE-01# copy tftp://10.10.10.50/backup/sw-core-01-2026-07-08.cfg startup-config
SW-CORE-01# reload
```
⚠️ Lệnh `reload` sẽ khởi động lại switch — thực hiện ngoài giờ sản xuất, thông báo trước nếu ảnh hưởng khu vực đang hoạt động.

## 4. Kiểm tra phiên bản Firmware hiện tại
```
SW-CORE-01# show version
```
✅ Xác nhận phiên bản hiện tại đúng **3.5.3.3** (theo phạm vi tài liệu này) hoặc phiên bản mới hơn nếu đã nâng cấp — nếu khác, đối chiếu lại các lệnh CLI trong toàn bộ Phần 3 vì cú pháp có thể thay đổi giữa các phiên bản firmware.

## 5. Quy trình nâng cấp Firmware

⚠️ **Rủi ro cao** — nâng cấp sai cách có thể khiến switch không boot được (brick), luôn thực hiện đúng trình tự và có kế hoạch dự phòng.

### Bước 1 — Chuẩn bị
- [ ] 💾 Backup cấu hình đầy đủ (mục 1).
- [ ] Tải đúng file firmware từ trang Cisco chính thức (Cisco.com → Software Download → CBS350) — xác nhận đúng model, đúng file `.bin`/`.img` theo hướng dẫn Cisco.
- [ ] Kiểm tra nguồn điện ổn định (UPS) trong suốt quá trình nâng cấp — **mất điện giữa chừng khi flash firmware là nguyên nhân phổ biến nhất gây brick thiết bị**.
- [ ] Lên lịch nâng cấp ngoài giờ sản xuất.

### Bước 2 — Upload firmware mới (không active ngay)
```
SW-CORE-01# copy tftp://10.10.10.50/firmware/cbs350-3.5.3.3.bin flash://image2
```
📌 CBS350 hỗ trợ **Dual Image** (2 phân vùng firmware) — cho phép upload bản mới vào `image2` trong khi `image1` (bản đang chạy) vẫn hoạt động bình thường, giảm rủi ro downtime khi upload.

### Bước 3 — Kiểm tra firmware đã upload
```
SW-CORE-01# show bootvar
```

### Bước 4 — Đặt firmware mới làm active và khởi động lại
```
SW-CORE-01# boot system image2
SW-CORE-01# reload
```

### Bước 5 — Kiểm tra sau nâng cấp
```
SW-CORE-01# show version
SW-CORE-01# show running-config
```
- [ ] ✅ Phiên bản firmware đúng như mong đợi.
- [ ] ✅ Cấu hình VLAN/802.1X/Port Security vẫn giữ nguyên đúng (thường được giữ lại qua nâng cấp, nhưng luôn kiểm tra kỹ).
- [ ] ✅ Test lại kết nối 802.1X trên vài port mẫu — xác nhận RADIUS vẫn hoạt động bình thường sau nâng cấp.

### Bước 6 — Rollback nếu firmware mới gây lỗi
```
SW-CORE-01# boot system image1
SW-CORE-01# reload
```
📌 Đây chính là lợi ích của Dual Image — quay lại bản cũ (`image1`) gần như ngay lập tức nếu bản mới có vấn đề, không cần cài lại từ đầu.

➡️ Tiếp theo: [[08_Troubleshooting_CBS350]]
