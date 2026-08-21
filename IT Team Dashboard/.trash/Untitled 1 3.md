---
type: sop
area:
owner:
version: 1
last_reviewed: 2026-07-27
tags:
  - sop
---

# 📋 SOP — Untitled 1

## Mục đích
>

## Phạm vi áp dụng
>

## Các bước thực hiện
1.
2.
3.

## Vai trò & trách nhiệm
| Vai trò | Trách nhiệm |
|---|---|
| | |

## Lưu ý / Cảnh báo an toàn
>

## Tài liệu tham chiếu
-

## Lịch sử cập nhật
| Version | Ngày | Người cập nhật | Nội dung thay đổi |
|---|---|---|---|
| 1.0 | | | Khởi tạo |
SOP — Thiết lập Database Replication (Master-Slave) cho DB qve
     Mục đích
     > Hướng dẫn quy trình thiết lập Database Replication (Master-Slave) từ Master Server (IP .48) sang Slave
     Server (IP .56) cho database qve. Đảm bảo tính nhất quán của dữ liệu, giảm thiểu rủi ro gián đoạn dịch vụ và
     tuân thủ quy định an toàn hệ thống.
     Phạm vi áp dụng
     > Áp dụng cho toàn bộ đội ngũ IT thực hiện bảo trì, triển khai hệ thống Database tại Server 48 và 56.
     Các bước thực hiện
     1. Chuẩn bị cấu hình: Kiểm tra và cấu hình my.cnf trên cả 2 server (Master: log-bin, server-id=1; Slave:
     server-id=2). Khởi động lại dịch vụ MySQL.
     2. Triển khai tự động: Thực hiện chạy script setup_replication.sh trên Master Server (.48) để tạo user
     replication, xuất dữ liệu và thiết lập kết nối Slave.
     3. Kiểm tra trạng thái: Đăng nhập vào Slave Server (.56), chạy lệnh SHOW SLAVE STATUS\G để xác nhận
     Slave_IO_Running: Yes và Slave_SQL_Running: Yes.
     Vai trò & trách nhiệm
     | Vai trò   | Trách nhiệm                                                                        |
     |-----------|------------------------------------------------------------------------------------|
     | IT Admin  | Trực tiếp chạy script, kiểm tra lỗi và xác nhận hệ thống chạy ổn định.             |
     | Tech Lead | Giám sát quy trình, phê duyệt thay đổi và hỗ trợ xử lý nếu gặp sự cố nghiêm trọng. |
     Lưu ý / Cảnh báo an toàn
     > 1. Quy tắc 30 giây: Luôn duy trì độ trễ tối thiểu 30 giây giữa các thao tác (Terminal/File/API) để ngăn chặn
     lỗi HTTP 429 Rate Limit.
     > 2. Backup: Bắt buộc có bản backup dữ liệu gốc trước khi bắt đầu quy trình.
     > 3. Firewall: Đảm bảo Server .56 có quyền truy cập Port 3306 của Server .48.
     > 4. Bảo mật: Không chia sẻ mật khẩu Root/Replication qua các kênh nhắn tin không an toàn.
     Tài liệu tham chiếu
     - File script: setup_replication.sh (được lưu trữ tại thư mục dự án)
     - Tài liệu cấu hình MySQL: [Tham chiếu tại đây]
     Lịch sử cập nhật
     | Version | Ngày       | Người cập nhật | Nội dung thay đổi                              |
     |---------|------------|----------------|------------------------------------------------|
     | 1.0     | 27/07/2026 | IT Team        | Khởi tạo quy trình thiết lập Replication chuẩn |