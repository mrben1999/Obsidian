# ✅ Phần 3.9 — Checklist vận hành CBS350

## Checklist triển khai ban đầu (one-time, mỗi switch mới)
- [ ] Tài khoản mặc định `cisco` đã xoá, tạo tài khoản quản trị riêng.
- [ ] Hostname đặt đúng quy ước.
- [ ] IP quản trị VLAN 99 đã cấu hình, ping/SSH được từ máy quản trị.
- [ ] SSH bật, Telnet tắt.
- [ ] NTP đồng bộ đúng với DC01.
- [ ] VLAN đầy đủ theo bảng chuẩn, port Access/Trunk gán đúng khu vực.
- [ ] Port Security + BPDU Guard bật trên port Access khu nhạy cảm.
- [ ] STP Root Bridge đúng là switch Core.
- [ ] 802.1X + RADIUS đã test thành công ít nhất 1 port mẫu trước khi mở rộng.
- [ ] Đã backup cấu hình lần đầu ra file ngoài (TFTP/SFTP).

## Checklist hàng ngày
- [ ] Kiểm tra nhanh trạng thái port qua Web GUI/CLI — không có port lỗi/err-disabled bất thường.
- [ ] Không có cảnh báo SNMP/log bất thường (nếu có hệ thống giám sát).

## Checklist hàng tuần
- [ ] `show interfaces status err-disabled` — không có port bị khoá chưa xử lý.
- [ ] `show radius server rejected users` — rà soát các lần đăng nhập thất bại bất thường.
- [ ] Backup cấu hình mới nhất ra file ngoài (nếu có thay đổi trong tuần).

## Checklist hàng tháng
- [ ] Kiểm tra phiên bản firmware — theo dõi thông báo bảo mật (security advisory) mới từ Cisco cho dòng CBS350.
- [ ] Rà soát danh sách port Access — đối chiếu port đang dùng thực tế với sơ đồ tài liệu, cập nhật nếu có thay đổi (thêm/bớt kiosk, di chuyển vị trí).
- [ ] Kiểm tra dung lượng/tình trạng SNMP community string, đổi định kỳ nếu dùng SNMPv2.

## Checklist trước khi nâng cấp firmware
- [ ] 💾 Backup cấu hình đầy đủ.
- [ ] Xác nhận firmware tải từ nguồn chính thức Cisco.
- [ ] Có UPS/nguồn điện ổn định trong suốt quá trình.
- [ ] Lên lịch ngoài giờ sản xuất, đã thông báo trước.
- [ ] Đã đọc kỹ [[07_Backup_Firmware]] mục Quy trình nâng cấp.

## Bảng chỉ số cần theo dõi (Health Metrics)
| Chỉ số | Ngưỡng cảnh báo | Hành động |
|---|---|---|
| CPU Utilization | > 80% kéo dài | Kiểm tra loop/broadcast storm, xem log |
| Số port err-disabled | > 0 | Điều tra nguyên nhân ngay, không để kéo dài |
| Số lần RADIUS Reject/giờ | Tăng đột biến | Nghi ngờ cấu hình sai hoặc tấn công — xem [[08_Troubleshooting_CBS350]] |
| Nhiệt độ thiết bị (nếu có sensor) | Vượt ngưỡng nhà sản xuất | Kiểm tra thông gió phòng máy chủ/tủ mạng |

## Liên kết nhanh
- [[05_8021X_RADIUS|Chi tiết 802.1X RADIUS]]
- [[08_Troubleshooting_CBS350|Chi tiết xử lý sự cố]]
- [[../06_Van_Hanh_Chuan/03_Kiem_Tra_Dinh_Ky|Lịch kiểm tra định kỳ tổng thể]]
