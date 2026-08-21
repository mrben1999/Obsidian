---
type: sop
area:
owner: Tô Nguyễn Hải Đăng
version: 1
last_reviewed: 2026-07-27
tags:
  - sop
---

# 📋 SOP — Thiết lập Database Replication (Master-Slave) cho DB qve

## Mục đích
>Hướng dẫn quy trình thiết lập Database Replication (Master-Slave) từ Master Server (IP .48) sang Slave Server (IP .56) cho database qve. Đảm bảo tính nhất quán của dữ liệu, giảm thiểu rủi ro gián đoạn dịch vụ và tuân thủ quy định an toàn hệ thống.

## Phạm vi áp dụng
>Áp dụng cho toàn bộ đội ngũ IT thực hiện bảo trì, triển khai hệ thống Database tại Server 48 và 56

## Các bước thực hiện
1. Chuẩn bị cấu hình: Kiểm tra và cấu hình my.cnf trên cả 2 server (Master: log-bin, server-id=1; Slave: server-id=2). Khởi động lại dịch vụ MySQL.
2.  Triển khai tự động: Thực hiện chạy script setup_replication.sh trên Master Server (.48) để tạo user replication, xuất dữ liệu và thiết lập kết nối Slave.
3. Kiểm tra trạng thái: Đăng nhập vào Slave Server (.56), chạy lệnh SHOW SLAVE STATUS\G để xác nhận Slave_IO_Running: Yes và Slave_SQL_Running: Yes.

Đây là kịch bản (script) "tất cả trong một" để anh chạy trên Server Master (.48). Script này sẽ thực hiện mọi thứ từ tạo user, dump dữ liệu, đẩy sang Slave và thiết lập Replication.

     TÀI LIỆU THAM CHIẾU: TỰ ĐỘNG HÓA REPLICATION MYSQL
     Phạm vi: Server Master (.48) sang Server Slave (.56)
     Database: qve
     1. Yêu cầu trước khi chạy
     2.  Cấu hình Server: Anh cần đảm bảo file /etc/mysql/my.cnf (hoặc /etc/mysql/mysql.conf.d/mysqld.cnf) trên cả
     2 server đã được thêm các dòng sau và khởi động lại:
         *   Master (.48):
             ini
             server-id = 1
             log_bin = /var/log/mysql/mysql-bin.log
             binlog_do_db = qve

         *   Slave (.56):
             ini
             server-id = 2

     3.  SSH: Đảm bảo Server Master (.48) có thể SSH không cần mật khẩu (SSH Key) tới Server Slave (.56) với quyền
     root. Nếu không, script sẽ hỏi mật khẩu SSH.
     4. Script Tự động hóa (setup_replication.sh)

     Anh hãy lưu đoạn code dưới đây thành file setup_replication.sh, cấp quyền (chmod +x setup_replication.sh) và
     chạy bằng sudo.

     bash
     #!/bin/bash
     Script: setup_replication.sh
     Mô tả: Tự động hóa thiết lập Master-Slave Replication
     Chạy trên: Master Server (.48)

     LOG_FILE="replication_setup.log"
     SLEEP_TIME=30
     MASTER_IP="192.168.x.48"
     SLAVE_IP="192.168.x.56"
     DB_NAME="qve"
     REPL_USER="repl_user"
     REPL_PASS="MatKhauManh123@" # CẦN ĐỔI MẬT KHẨU

     log() {
         echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOG_FILE"
     }

     run_step() {
         local step_name="$1"
         local cmd="$2"
         log ">>> BẮT ĐẦU: $step_name"
         eval "$cmd" >> "$LOG_FILE" 2>&1
         if [ $? -eq 0 ]; then
             log ">>> HOÀN TẤT: $step_name"
             sleep $SLEEP_TIME
         else
             log "!!! CẢNH BÁO: Lỗi tại bước [$step_name]. Kiểm tra file $LOG_FILE"
             exit 1
         fi
     }

     log "--- BẮT ĐẦU QUY TRÌNH REPLICATION ---"
     5. Tạo User Replication trên Master
     run_step "Tạo user replication trên Master" \
     "mysql -u root -p -e \"CREATE USER IF NOT EXISTS '$REPL_USER'@'$SLAVE_IP' IDENTIFIED BY '$REPL_PASS'; GRANT
     REPLICATION SLAVE ON *.* TO '$REPL_USER'@'$SLAVE_IP'; FLUSH PRIVILEGES;\""
     6. Khóa Master và lấy vị trí Log
     log ">>> BẮT ĐẦU: Khóa Master và lấy vị trí Log"
     LOCK_INFO=$(mysql -u root -p -e "FLUSH TABLES WITH READ LOCK; SHOW MASTER STATUS\G")
     FILE_NAME=$(echo "$LOCK_INFO" | grep "File:" | awk '{print $2}')
     POS=$(echo "$LOCK_INFO" | grep "Position:" | awk '{print $2}')
     log "Log File: $FILE_NAME, Position: $POS"
     sleep $SLEEP_TIME
     7. Dump trực tiếp sang Slave (Pipe)
     run_step "Dump và chuyển dữ liệu sang Slave" \
     "mysqldump -u root -p --databases $DB_NAME | ssh root@$SLAVE_IP \"mysql -u root -p\""
     8. Mở khóa Master
     run_step "Mở khóa Master" \
     "mysql -u root -p -e \"UNLOCK TABLES;\""
     9. Cấu hình Slave từ xa
     log ">>> BẮT ĐẦU: Cấu hình Slave qua SSH"
     ssh root@$SLAVE_IP <<EOF
     mysql -u root -p -e "STOP SLAVE; RESET SLAVE; CHANGE MASTER TO MASTER_HOST='$MASTER_IP',
     MASTER_USER='$REPL_USER', MASTER_PASSWORD='$REPL_PASS', MASTER_LOG_FILE='$FILE_NAME', MASTER_LOG_POS=$POS;
     START SLAVE;"
     EOF

     if [ $? -eq 0 ]; then
         log ">>> HOÀN TẤT: Cấu hình Slave"
     else
         log "!!! CẢNH BÁO: Lỗi cấu hình Slave. Kiểm tra kết nối!"
         exit 1
     fi

     log "--- QUY TRÌNH HOÀN TẤT ---"
     log "Hãy chạy lệnh 'SHOW SLAVE STATUS\G' trên Slave (.56) để xác nhận Replication đang chạy."

     10. Các lưu ý vận hành

     11.  Nhập mật khẩu: Khi chạy script, hệ thống sẽ hỏi mật khẩu của root (lần đầu cho Master, lần 2 cho Slave,
     lần 3 cho SSH). Hãy chú ý theo dõi màn hình terminal.
     12.  Trạng thái Replication: Sau khi chạy xong, hãy SSH vào Server Slave (.56) và chạy lệnh:
         sql
         mysql -u root -p -e "SHOW SLAVE STATUS\G"

         Hãy đảm bảo:
         *   Slave_IO_Running: Yes
         *   Slave_SQL_Running: Yes
     13.  Khắc phục lỗi: Nếu Slave_SQL_Running hiện No, hãy đọc dòng Last_SQL_Error trong cùng lệnh SHOW SLAVE
     STATUS để biết nguyên nhân (thường là do trùng lặp dữ liệu hoặc sai thông số Log).

## Vai trò & trách nhiệm
| Vai trò   | Trách nhiệm                                                                        |
| --------- | ---------------------------------------------------------------------------------- |
| IT Admin  | Trực tiếp chạy script, kiểm tra lỗi và xác nhận hệ thống chạy ổn định.             |
| Tech Lead | Giám sát quy trình, phê duyệt thay đổi và hỗ trợ xử lý nếu gặp sự cố nghiêm trọng. |

## Lưu ý / Cảnh báo an toàn
>1. Backup: Bắt buộc có bản backup dữ liệu gốc trước khi bắt đầu quy trình.
>2. Firewall: Đảm bảo Server .56 có quyền truy cập Port 3306 của Server .48.
>3. Bảo mật: Không chia sẻ mật khẩu Root/Replication qua các kênh nhắn tin không an toàn.

## Tài liệu tham chiếu
- File script: setup_replication.sh (được lưu trữ tại thư mục dự án)
- Tài liệu cấu hình MySQL: [Tham chiếu tại đây]

## Lịch sử cập nhật
| Version | Ngày       | Người cập nhật | Nội dung thay đổi                               |
| ------- | ---------- | -------------- | ----------------------------------------------- |
| 1.0     | 27/07/2026 | IT Team        | Khởi tạo quy trình thiết lập Replication chuẩn  |
