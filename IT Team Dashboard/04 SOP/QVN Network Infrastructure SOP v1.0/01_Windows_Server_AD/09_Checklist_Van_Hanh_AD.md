# ✅ Phần 1.9 — Checklist vận hành AD (tổng hợp)

## Checklist hàng ngày
- [ ] Kiểm tra dịch vụ `NTDS`, `DNS`, `Netlogon`, `NPS` đang chạy (`Get-Service`).
- [ ] Kiểm tra backup System State đêm qua đã chạy thành công (`wbadmin get versions`).
- [ ] Kiểm tra nhanh Event Viewer — không có lỗi nghiêm trọng (Critical/Error) mới trong nhóm Directory Service, DNS Server.

## Checklist hàng tuần
- [ ] Chạy `dcdiag /v` — xác nhận không có FAIL.
- [ ] Rà soát `Search-ADAccount -LockedOut` — kiểm tra có bất thường brute-force không.
- [ ] Copy bản backup System State ra vị trí lưu trữ ngoài server (theo quy tắc 3-2-1, xem [[../06_Van_Hanh_Chuan/01_Quy_Trinh_Backup_Tong_The]]).
- [ ] Kiểm tra dung lượng ổ đĩa DC còn đủ (>20% trống).

## Checklist hàng tháng
- [ ] Rà soát tài khoản không đăng nhập > 60 ngày (theo [[06_Quan_Ly_User_Group]] mục 6).
- [ ] Rà soát thành viên nhóm `Domain Admins`, `GG-IT-Admin` — không có thành viên bất thường.
- [ ] Kiểm tra Windows Update — đã áp dụng bản vá mới nhất có thể (lưu ý rủi ro EOL, xem [[08_Hardening_AD]] mục 1).
- [ ] Test thử khôi phục 1 object từ AD Recycle Bin (diễn tập, không phải sự cố thật) để đảm bảo quy trình restore vẫn hoạt động.
- [ ] Rà soát mật khẩu tài khoản dịch vụ (`svc-*`) — đổi định kỳ 6-12 tháng theo chính sách.

## Checklist khi có thay đổi lớn (trước khi thực hiện)
- [ ] 💾 Đã backup/snapshot trước khi thay đổi cấu trúc OU/GPO lớn.
- [ ] Đã ghi nhận thay đổi vào [[../06_Van_Hanh_Chuan/05_Change_Management]].
- [ ] Đã thông báo trước cho người dùng nếu thay đổi ảnh hưởng đăng nhập/truy cập (VD: đổi Password Policy).

## Bảng chỉ số cần theo dõi (Health Metrics)
| Chỉ số | Ngưỡng cảnh báo | Hành động khi vượt ngưỡng |
|---|---|---|
| Thời gian phản hồi LDAP query | > 2 giây | Kiểm tra tải CPU/RAM server, kiểm tra DNS |
| Số lần đăng nhập thất bại/giờ | > 20 lần | Nghi ngờ brute-force — kiểm tra Event ID 4625 |
| Dung lượng ổ đĩa còn trống | < 20% | Dọn log cũ, mở rộng ổ đĩa, kiểm tra lại dung lượng backup |
| Độ trễ đồng bộ (nếu có 2 DC) | > 15 phút | Chạy `repadmin /replsummary`, kiểm tra kết nối mạng giữa DC |

## Liên kết nhanh
- [[07_Backup_Restore_AD|Quy trình Backup/Restore chi tiết]]
- [[08_Hardening_AD|Chi tiết Hardening]]
- [[../06_Van_Hanh_Chuan/04_Xu_Ly_Su_Co|Quy trình xử lý sự cố tổng thể]]
