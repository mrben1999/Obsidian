---
type: task
status: done
priority: P3
team: infrastructure
assignee: "[[Tô Nguyễn Hải Đăng]]"
project:
created: 2026-07-22 09:46
due: 2026-07-28
resolved:
tags:
  - task
---

# ✅ Setup Inet DB Slave

## 🎯 Mục tiêu
>Tạo BD slaver cho Inet DB dùng cho các App cần truy xuất dữ liệu để báo cáo

---

# 📋 Mô tả
>Tạo thêm 1 DB mới trên

---

# ✅ Checklist công việc
- [ ] backup database từ SV cũ (48).
- [ ] restore qua SV mới (56).
- [ ] Cấu hình Master - Slaver. 

---

>Đây là bộ 2 script Bash (một cho Server Master, một cho Server Slave) được thiết kế theo yêu cầu của bạn: có
     log, thông báo theo từng bước và bắt buộc chờ 30 giây giữa các thao tác để đảm bảo an toàn như bạn đã yêu cầu.
     Cách sử dụng:
     1. Lưu script thành file (ví dụ: setup_master.sh và setup_slave.sh).
     2. Cấp quyền thực thi: chmod +x setup_*.sh.
     3. Chạy bằng sudo: sudo ./setup_master.sh.
     4. Script cho Master Server (IP .48)
     Chức năng: Cấu hình binlog, tạo user replication và export dữ liệu.

     bash
     #!/bin/bash
     File: setup_master.sh

     LOG_FILE="master_replication.log"
     SLEEP_TIME=30
     DB_NAME="qve"
     REPL_USER="repl_user"
     REPL_PASS="MatKhauManh123@" # THAY ĐỔI MẬT KHẨU CỦA BẠN
     SLAVE_IP="192.168.x.56" # THAY BẰNG IP CỦA SLAVE

     log() {
         echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOG_FILE"
     }

     run_step() {
         local step_name="$1"
         local cmd="$2"
         log ">>> BẮT ĐẦU: $step_name"

         # Thực thi lệnh
         eval "$cmd" >> "$LOG_FILE" 2>&1

         if [ $? -eq 0 ]; then
             log ">>> HOÀN TẤT: $step_name"
             sleep $SLEEP_TIME
         else
             log "!!! CẢNH BÁO: Lỗi tại bước [$step_name]. Dừng quy trình."
             exit 1
         fi
     }
     --- CÁC BƯỚC THỰC HIỆN ---
     log "Bắt đầu thiết lập Master Database..."

     run_step "Tạo user replication" \
     "mysql -u root -p -e \"CREATE USER IF NOT EXISTS '$REPL_USER'@'$SLAVE_IP' IDENTIFIED BY '$REPL_PASS'; GRANT
     REPLICATION SLAVE ON *.* TO '$REPL_USER'@'$SLAVE_IP'; FLUSH PRIVILEGES;\""

     run_step "Khóa bảng và lấy vị trí log" \
     "mysql -u root -p -e \"FLUSH TABLES WITH READ LOCK; SHOW MASTER STATUS;\" > master_status.txt"

     run_step "Xuất dữ liệu database $DB_NAME" \
     "mysqldump -u root -p --databases $DB_NAME > ${DB_NAME}_backup.sql"

     run_step "Mở khóa bảng" \
     "mysql -u root -p -e \"UNLOCK TABLES;\""

     log "Xong! File backup đã sẵn sàng tại ${DB_NAME}_backup.sql. Hãy copy file này sang Slave."

     5. Script cho Slave Server (IP .56)
     Chức năng: Import dữ liệu và kết nối tới Master.

     bash
     #!/bin/bash
     File: setup_slave.sh

     LOG_FILE="slave_replication.log"
     SLEEP_TIME=30
     DB_NAME="qve"
     MASTER_IP="192.168.x.48" # THAY BẰNG IP CỦA MASTER
     REPL_USER="repl_user"
     REPL_PASS="MatKhauManh123@" # MẬT KHẨU ĐÃ TẠO Ở MASTER

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
             log "!!! CẢNH BÁO: Lỗi tại bước [$step_name]. Dừng quy trình."
             exit 1
         fi
     }
     --- CÁC BƯỚC THỰC HIỆN ---
     log "Bắt đầu thiết lập Slave Database..."

     run_step "Import dữ liệu từ file backup" \
     "mysql -u root -p < ${DB_NAME}_backup.sql"
     LƯU Ý: Bạn cần điền file và pos đã lấy được từ lệnh SHOW MASTER STATUS bên Master
     run_step "Cấu hình kết nối tới Master" \
     "mysql -u root -p -e \"CHANGE MASTER TO MASTER_HOST='$MASTER_IP', MASTER_USER='$REPL_USER',
     MASTER_PASSWORD='$REPL_PASS', MASTER_LOG_FILE='mysql-bin.000001', MASTER_LOG_POS=154;\""

     run_step "Khởi động Slave" \
     "mysql -u root -p -e \"START SLAVE;\""

     run_step "Kiểm tra trạng thái" \
     "mysql -u root -p -e \"SHOW SLAVE STATUS\G\""

     log "Quy trình thiết lập Slave hoàn tất. Hãy kiểm tra trạng thái Slave_IO và Slave_SQL ở trên."

     Lưu ý quan trọng khi chạy:

     6.  Thông số MASTER_LOG_FILE và MASTER_LOG_POS: Trong script Slave, bạn bắt buộc phải thay thế
     'mysql-bin.000001' và 154 bằng giá trị thực tế mà lệnh SHOW MASTER STATUS đã xuất ra từ Server Master.
     7.  Mật khẩu: Script yêu cầu nhập mật khẩu MySQL của người dùng root khi chạy. Nếu bạn muốn tự động hóa hoàn
     toàn mà không cần nhập bằng tay, bạn cần sử dụng file .my.cnf để lưu mật khẩu (tuy nhiên cách làm thủ công như
     trên an toàn hơn cho người mới bắt đầu).
     8.  Quyền truy cập: Đảm bảo cả hai server đã mở port 3306 (MySQL) và cho phép IP của nhau kết nối.
     9.  Log File: Mọi lỗi sẽ được ghi vào file master_replication.log hoặc slave_replication.log trong thư mục
     hiện tại. Nếu bước nào bị LỖI, hãy mở file này ra xem dòng lỗi cuối cùng là gì.

---

# 📌 Kết quả
- [ ]
- [ ]

---

# 🔗 Liên kết
- Project::
- Incident/Change liên quan::
