# ✅ Phần 4.10 — Checklist vận hành FortiGate

## Checklist triển khai ban đầu (one-time)
- [ ] Mật khẩu admin mặc định đã đổi, tài khoản AD đã tích hợp qua LDAP.
- [ ] Toàn bộ VLAN sub-interface đã tạo đúng IP theo bảng chuẩn.
- [ ] LDAP bind AD thành công, User Group ánh xạ đúng.
- [ ] FSSO Collector Agent đã cài và nhận diện user thành công.
- [ ] Firewall Policy đầy đủ theo nguyên tắc Default Deny, đã test Guest bị cô lập.
- [ ] Quản trị WAN đã tắt hoàn toàn, chỉ VLAN 99 truy cập quản trị.
- [ ] 2FA đã bật cho tài khoản super_admin.
- [ ] Đã backup cấu hình lần đầu, lưu ngoài thiết bị.

## Checklist hàng ngày
- [ ] Kiểm tra nhanh Dashboard FortiGate — CPU/Memory/Session trong ngưỡng bình thường.
- [ ] Không có cảnh báo bảo mật nghiêm trọng mới (IPS/Antivirus blocked events).

## Checklist hàng tuần
- [ ] Rà soát Forward Traffic log — không có traffic bất thường đáng ngờ.
- [ ] Kiểm tra FortiGuard đã cập nhật signature mới nhất (`get system fortiguard status` hoặc qua GUI).
- [ ] Backup cấu hình mới nhất nếu có thay đổi trong tuần.

## Checklist hàng tháng
- [ ] Rà soát Firewall Policy — không có rule thừa/không dùng đến (dọn dẹp policy "shadow" bị policy khác che khuất phía trên).
- [ ] Rà soát tài khoản quản trị — không có tài khoản thừa/không rõ nguồn gốc.
- [ ] Kiểm tra license/FortiCare còn hạn.
- [ ] Diễn tập thử quy trình Lockout Recovery (xem [[09_Troubleshooting_FortiGate]] mục 4) — đảm bảo vẫn còn nhớ/thực hiện được khi cần.

## Bảng chỉ số cần theo dõi (Health Metrics)
| Chỉ số | Ngưỡng cảnh báo | Hành động |
|---|---|---|
| CPU Utilization | > 80% kéo dài | Kiểm tra UTM tải nặng, khả năng tấn công |
| Memory Utilization | > 85% | Kiểm tra session table, khởi động lại ngoài giờ nếu cần |
| Session Count | Gần giới hạn model (tham khảo datasheet FortiGate 200F) | Kiểm tra traffic bất thường/DDoS |
| Số lần đăng nhập quản trị thất bại | > 5 lần/giờ | Nghi ngờ brute-force, kiểm tra Trusted Hosts |
| FortiGuard signature age | > 7 ngày chưa cập nhật | Kiểm tra kết nối FortiGuard, license còn hạn |

## Liên kết nhanh
- [[06_Firewall_Policy_Chuan|Chi tiết Firewall Policy]]
- [[09_Troubleshooting_FortiGate|Chi tiết xử lý sự cố]]
- [[../06_Van_Hanh_Chuan/03_Kiem_Tra_Dinh_Ky|Lịch kiểm tra định kỳ tổng thể]]
