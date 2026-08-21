# ✅ Phần 2.8 — Checklist vận hành NPS

## Checklist triển khai ban đầu (one-time)
- [ ] NPS Role đã cài, đăng ký với AD (`RAS and IAS Servers`).
- [ ] Tất cả RADIUS Client (CBS350, UniFi) đã khai báo đúng IP + Shared Secret riêng biệt.
- [ ] Certificate PEAP đã cấp, còn hạn, đúng hostname.
- [ ] Network Policy đã tạo cho từng nhóm truy cập (Wired-SanXuat, Wireless-Staff...), đúng thứ tự Processing Order.
- [ ] RADIUS Attributes (VLAN động) đã cấu hình đúng cho từng policy.
- [ ] Đã test thực tế ít nhất 1 lần mỗi loại kết nối (dây + Wi-Fi) trước khi triển khai đại trà.
- [ ] Windows Firewall đã giới hạn nguồn kết nối RADIUS chỉ từ IP thiết bị mạng đã biết.

## Checklist hàng ngày
- [ ] Dịch vụ `IAS` đang **Running**.
- [ ] Không có cảnh báo bất thường trong Event Viewer (nhiều lần Reject liên tục từ 1 nguồn — dấu hiệu tấn công hoặc cấu hình sai).

## Checklist hàng tuần
- [ ] Rà soát log Access-Reject — xác nhận không có pattern bất thường (brute-force, thiết bị lạ cố gắng kết nối).
- [ ] Kiểm tra hạn Certificate PEAP còn > 30 ngày.

## Checklist hàng tháng
- [ ] Rà soát danh sách RADIUS Client — không có thiết bị thừa/không rõ nguồn gốc.
- [ ] Rà soát AD Group liên kết Network Policy — đảm bảo khớp đúng nhu cầu thực tế (nhân sự thay đổi phòng ban).
- [ ] Diễn tập thử: tạm dừng service `IAS`, xác nhận quy trình khôi phục (mục 6, [[07_Troubleshooting_NPS]]) vẫn hoạt động đúng.

## Checklist trước khi thay đổi cấu hình lớn
- [ ] 💾 Export cấu hình NPS hiện tại trước khi sửa: 
```powershell
Export-NpsConfiguration -Path "D:\NPSBackup\nps-config-$(Get-Date -Format yyyyMMdd).xml"
```
- [ ] Đã test thay đổi trên 1 port/AP thử nghiệm trước khi áp dụng toàn bộ.
- [ ] Đã ghi nhận vào [[../06_Van_Hanh_Chuan/05_Change_Management]].

## Backup & Restore cấu hình NPS
```powershell
# Backup
Export-NpsConfiguration -Path "D:\NPSBackup\nps-config-$(Get-Date -Format yyyyMMdd).xml"

# Restore (khi cần khôi phục)
Import-NpsConfiguration -Path "D:\NPSBackup\nps-config-20260101.xml"
```
📌 Vì NPS thường cài chung server với AD DS, backup System State ([[../01_Windows_Server_AD/07_Backup_Restore_AD]]) cũng đã bao gồm cấu hình NPS — nhưng vẫn nên export riêng file XML này để khôi phục nhanh mà không cần restore toàn bộ System State cho các sự cố nhỏ chỉ liên quan NPS.

## Liên kết nhanh
- [[07_Troubleshooting_NPS|Chi tiết xử lý sự cố NPS]]
- [[06_Tich_Hop_AD_Groups_VLAN|Chi tiết gán VLAN động]]
- [[../06_Van_Hanh_Chuan/03_Kiem_Tra_Dinh_Ky|Lịch kiểm tra định kỳ tổng thể]]
