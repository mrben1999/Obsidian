---
category: "1.2 Network & Connectivity"
visibility: Public (toàn công ty)
tags: [vpn, remote-work, self-service]
---

# [VPN] Hướng dẫn cấu hình VPN làm việc từ xa

## 1. Tóm tắt hiện tượng (Symptom)
Cần truy cập tài nguyên nội bộ công ty (file chia sẻ, phần mềm ERP/CRM, GLPI) khi làm việc tại nhà hoặc chi nhánh khác không cùng mạng LAN.

## 2. Nguyên nhân (Root Cause)
Các hệ thống nội bộ Quảng Việt chỉ mở trong mạng LAN công ty vì lý do bảo mật, không public ra Internet trực tiếp — VPN tạo một "đường hầm" mã hóa để máy bạn coi như đang ở trong mạng LAN công ty dù đang ở bất kỳ đâu.

## 3. Các bước xử lý (Resolution)
1. Yêu cầu cấp quyền VPN qua Ticket (danh mục "Mạng > VPN") nếu chưa từng dùng — IT sẽ cấp tài khoản VPN riêng.
2. Cài phần mềm VPN Client theo hướng dẫn IT gửi kèm khi cấp quyền (thường là FortiClient hoặc OpenVPN Client tùy hạ tầng công ty).
3. Mở phần mềm VPN, nhập:
   - Server: `vpn.quangviet.com.vn`
   - Username/Password: tài khoản AD của bạn
4. Nhấn **Connect**, đợi trạng thái chuyển sang "Connected".
5. Sau khi kết nối, truy cập các tài nguyên nội bộ như đang ở văn phòng (ví dụ `\\fileserver\Kinhdoanh`, `https://glpi.qve.com`).

## 4. Thông tin bổ sung (Notes)
- Luôn **Disconnect VPN** khi không sử dụng để tiết kiệm băng thông công ty và tăng bảo mật.
- Nếu đổi mật khẩu AD, cần cập nhật lại mật khẩu trong VPN Client (một số client không tự đồng bộ).
- Kết nối VPN xong nhưng vẫn không truy cập được tài nguyên nội bộ → tạo Ticket kèm mô tả cụ thể tài nguyên nào không truy cập được.
