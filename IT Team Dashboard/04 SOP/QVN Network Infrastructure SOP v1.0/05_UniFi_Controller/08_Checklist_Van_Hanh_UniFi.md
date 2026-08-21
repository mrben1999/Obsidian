# ✅ Phần 5.8 — Checklist vận hành UniFi

## Checklist triển khai ban đầu (one-time)
- [ ] Controller cài đặt thành công, IP đúng theo bảng chuẩn (`10.10.10.20`).
- [ ] Toàn bộ AP đã Adopt, đổi tên đúng quy ước vị trí.
- [ ] RADIUS Profile đã cấu hình, test kết nối SSID `QVN-Staff` thành công với tài khoản AD.
- [ ] RADIUS-assigned VLAN đã bật và test đúng với ít nhất 1 tài khoản mẫu.
- [ ] SSID Guest đã cô lập hoàn toàn khỏi mạng nội bộ (đã test ping thất bại tới DC01).
- [ ] Auto Backup đã bật, đã thử tải 1 bản backup thủ công để xác nhận hoạt động.

## Checklist hàng ngày
- [ ] Kiểm tra nhanh **Devices** — toàn bộ AP ở trạng thái **Connected**.
- [ ] Không có cảnh báo bất thường trong **Insights**.

## Checklist hàng tuần
- [ ] Kiểm tra **RF Environment** — không có nhiễu kênh nghiêm trọng mới phát sinh.
- [ ] Rà soát **Wireless Clients** — không có thiết bị lạ kết nối SSID nhân viên (dấu hiệu tài khoản bị lộ).
- [ ] Xác nhận Auto Backup tuần này đã chạy thành công.

## Checklist hàng tháng
- [ ] Kiểm tra firmware AP — cập nhật nếu có bản mới (qua Controller, ngoài giờ sản xuất).
- [ ] Đổi mật khẩu Guest Portal (nếu dùng Simple Password).
- [ ] Rà soát danh sách SSID/VLAN mapping — khớp đúng nhu cầu thực tế hiện tại.
- [ ] Copy backup UniFi ra vị trí lưu trữ ngoài Controller.

## Bảng chỉ số cần theo dõi (Health Metrics)
| Chỉ số | Ngưỡng cảnh báo | Hành động |
|---|---|---|
| Số AP Disconnected | > 0 kéo dài quá 15 phút | Kiểm tra theo [[07_Troubleshooting_UniFi]] |
| Tín hiệu RF trung bình | Nhiễu cao (nhiều mạng lân cận cùng kênh) | Đổi kênh/băng tần, cân nhắc giảm công suất phát nếu quá dày AP |
| Số client/AP | Vượt khuyến nghị nhà sản xuất cho model AP | Cân nhắc thêm AP, cân bằng tải giữa các AP |
| Băng thông Guest sử dụng | Gần chạm giới hạn liên tục | Đánh giá lại giới hạn băng thông, kiểm tra lạm dụng |

## Liên kết nhanh
- [[03_Tao_Wireless_Network_RADIUS|Chi tiết cấu hình RADIUS cho SSID]]
- [[07_Troubleshooting_UniFi|Chi tiết xử lý sự cố]]
- [[../06_Van_Hanh_Chuan/03_Kiem_Tra_Dinh_Ky|Lịch kiểm tra định kỳ tổng thể]]
