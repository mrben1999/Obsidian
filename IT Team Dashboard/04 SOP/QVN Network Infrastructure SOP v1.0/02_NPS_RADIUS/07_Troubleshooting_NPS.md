# 🧯 Phần 2.7 — Troubleshooting NPS

## 1. Công cụ chẩn đoán chính
| Công cụ | Mục đích |
|---|---|
| **Event Viewer** → Custom Views → Server Roles → Network Policy and Access Services | Log chi tiết từng lần Access-Accept/Reject, kèm lý do |
| `netsh nps show` | Xem cấu hình NPS hiện tại qua CLI |
| NPS log file (`C:\Windows\System32\LogFiles`) | Log định dạng IAS/ODBC nếu bật logging chi tiết |

## 2. Bảng sự cố thường gặp

| Triệu chứng | Nguyên nhân khả dĩ | Cách xử lý |
|---|---|---|
| Switch/AP không gửi được request đến NPS | Shared Secret sai giữa 2 bên | Đối chiếu lại secret trên NPS ([[03_Cau_Hinh_RADIUS_Clients]]) và trên thiết bị, đảm bảo khớp 100% ký tự |
| NPS nhận request nhưng luôn Reject | User không thuộc AD Group được cấu hình trong Network Policy | Kiểm tra `Get-ADGroupMember`, xác nhận user đã ở đúng group |
| NPS nhận request nhưng luôn Reject dù đúng group | Sai thứ tự Processing Order — policy khác (Deny) xử lý trước | Kiểm tra lại thứ tự policy, xem [[04_Cau_Hinh_Network_Policy_PEAP]] mục 4 |
| Client báo lỗi certificate không tin cậy khi kết nối PEAP | Root CA chưa được trust trên client | Kiểm tra GPO auto-enrollment, xem [[05_Trien_Khai_Certificate]] mục 6 |
| 802.1X timeout, không có phản hồi | Firewall NPS chặn UDP 1812/1813 | Kiểm tra `Get-NetFirewallRule`, đảm bảo rule cho phép đúng port/nguồn |
| User đổi mật khẩu AD nhưng vẫn không đăng nhập được Wi-Fi | Cache thông tin đăng nhập cũ trên client (Windows lưu Wi-Fi profile cũ) | Xoá và tạo lại Wi-Fi profile trên máy trạm, hoặc `netsh wlan delete profile` |
| Một số thiết bị (máy in, IP Camera không hỗ trợ 802.1X) không kết nối được | Thiết bị không có 802.1X Supplicant | Cân nhắc dùng MAC-based Authentication (xem [[../03_Cisco_CBS350/05_8021X_RADIUS]] mục MAB) thay vì 802.1X thuần |

## 3. Đọc log Event Viewer để xác định lỗi cụ thể
1. Mở **Event Viewer** → **Custom Views** → **Server Roles** → **Network Policy and Access Services**.
2. Tìm Event ID:
   - **6272** — Network Policy Server granted access to a user (thành công).
   - **6273** — Network Policy Server denied access to a user (thất bại — xem chi tiết **Reason Code** trong nội dung event).
3. Trong nội dung Event 6273, mục **Reason Code** cho biết lý do cụ thể (VD: không đúng thời gian truy cập, không thuộc group, phương thức xác thực không khớp...).

## 4. Bật NPS Accounting Log chi tiết (khi cần điều tra sâu)
```powershell
# Bật ghi log vào file text
netsh nps set nas name="localhost" logfileformat="IAS"
```
Qua GUI: **NPS console** → **Accounting** → **Configure Accounting** → chọn **Log to a text file on the local computer** → **Change Log File Properties** để bật log chi tiết Authentication + Accounting.

## 5. Test thủ công RADIUS bằng công cụ (nếu cần xác nhận độc lập với thiết bị mạng)
📌 Có thể dùng công cụ RADIUS test client bên thứ 3 (VD: NTRadPing) chạy từ máy trong VLAN quản trị để gửi thử Access-Request tới NPS trực tiếp, giúp cô lập vấn đề: lỗi do NPS hay lỗi do thiết bị mạng (switch/AP) không gửi đúng request.

## 6. Quy trình xử lý sự cố NPS ngừng hoạt động toàn bộ (Critical)
1. ⚠️ Xác nhận đây là sự cố NPS (không phải AD/DNS) — kiểm tra `Get-Service IAS`.
2. Nếu service `IAS` dừng → khởi động lại: `Start-Service IAS`.
3. Nếu service không khởi động được → kiểm tra Event Log tìm lỗi cụ thể (thường liên quan certificate hết hạn hoặc lỗi cấu hình).
4. 📌 Trong lúc khắc phục, người dùng mạng dây/Wi-Fi sẽ **không đăng nhập được** — cân nhắc kích hoạt tạm phương án dự phòng nếu có (VD: mở tạm Guest VLAN có kiểm soát) theo quyết định của IT Manager, ghi nhận vào [[../06_Van_Hanh_Chuan/04_Xu_Ly_Su_Co]].
5. Sau khi khắc phục, thông báo người dùng và theo dõi log 30-60 phút để xác nhận ổn định.

➡️ Tiếp theo: [[08_Checklist_Van_Hanh_NPS]]
