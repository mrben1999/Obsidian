---
type: sop
area:
owner:
version: 1
last_reviewed: 2026-07-08
tags:
  - sop
---

# 📋 SOP — Thêm user vào toàn bộ switch Cisco CBS350

## Mục đích
>- Thêm user `svc_cbd` vào **toàn bộ switch Cisco CBS350**
- Đổi mật khẩu đồng loạt khi cần
- Lưu log
- Báo thành công/thất bại
- Có thể mở rộng cho 100-500 switch

## Phạm vi áp dụng
>

## Các bước thực hiện
# Bước 1. Cài Python

Cài Python 3.11 hoặc mới hơn.

Kiểm tra:

```
python --version
```

---

# Bước 2. Cài Netmiko

```
pip install netmiko
```

Kiểm tra

```
pip show netmiko
```

---

# Bước 3. Tạo file danh sách Switch

`switches.csv`

```
ip,hostname192.168.1.10,SW-Office192.168.1.11,SW-Factory192.168.1.12,SW-Warehouse192.168.1.13,SW-IT
```

---

# Bước 4. Tạo file Python

`add_user.py`

```python
from netmiko import ConnectHandler
import csv
from datetime import datetime

# Tài khoản hiện có để SSH vào switch
USERNAME = "admin"
PASSWORD = "OldPassword"

# Tài khoản mới sẽ tạo
NEW_USER = "svc_cbd"
NEW_PASS = "QVN#CBD2026!Mgmt"

LOG = open("result.log","a",encoding="utf8")

with open("switches.csv") as f:

    reader = csv.DictReader(f)

    for row in reader:

        ip = row["ip"]

        print(f"Connecting {ip}")

        device = {
            "device_type":"cisco_ios",
            "host":ip,
            "username":USERNAME,
            "password":PASSWORD,
        }

        try:

            net = ConnectHandler(**device)

            output = net.send_config_set([
                f"username {NEW_USER} password {NEW_PASS} privilege 15",
            ])

            save = net.save_config()

            LOG.write(f"{datetime.now()} {ip} SUCCESS\n")

            print(output)

            net.disconnect()

        except Exception as e:

            LOG.write(f"{datetime.now()} {ip} FAILED {e}\n")

            print(e)

LOG.close()
```

---

# Bước 5. Chạy

```
python add_user.py
```

Ví dụ

```
Connecting 192.168.1.10SuccessConnecting 192.168.1.11SuccessConnecting 192.168.1.12Failed
```

---

# Bước 6. Kiểm tra

SSH vào một switch

```
ssh svc_cbd@192.168.1.10
```

Hoặc

```
show running-config | include username
```

Sẽ thấy

```
username svc_cbd password ******** privilege 15
```

---

# Bước 7. Kiểm tra log

`result.log`

```
2026-07-08 08:20:10192.168.1.10 SUCCESS2026-07-08 08:20:14192.168.1.11 SUCCESS2026-07-08 08:20:17192.168.1.12 FAILED Authentication failed
```

---

# Nếu muốn xóa user

Chỉ cần sửa thành

```python
output = net.send_config_set([
    f"no username {NEW_USER}",
])
```

---

# Nếu muốn đổi password

```python
output = net.send_config_set([
    f"username {NEW_USER} password NewPassword@2026 privilege 15",
])
```

## Vai trò & trách nhiệm
| Vai trò | Trách nhiệm |
|---|---|
| | |

## Lưu ý / Cảnh báo an toàn
>Đoạn script trên hoạt động được ngay, nhưng nếu áp dụng cho khoảng 50–100 switch CBS350, anh nên nâng cấp thêm:

- ✅ Đọc thông tin đăng nhập từ file `.env` thay vì ghi cứng trong mã nguồn.
- ✅ Mã hóa hoặc bảo vệ mật khẩu quản trị.
- ✅ Chạy đa luồng (`ThreadPoolExecutor`) để cấu hình nhiều switch cùng lúc, giảm thời gian triển khai.
- ✅ Xuất báo cáo kết quả ra file Excel/CSV.
- ✅ Ghi log chi tiết theo từng switch.
- ✅ Kiểm tra xem tài khoản đã tồn tại trước khi tạo để tránh cấu hình lặp.
- ✅ Kiểm tra và xác nhận `save_config()` thành công.
- ✅ Có chế độ **Dry Run** để kiểm tra trước khi áp dụng.
- ✅ Hỗ trợ `rollback` nếu có lỗi.

Đây là những cải tiến thường được sử dụng trong các hệ thống quản lý hàng chục đến hàng trăm thiết bị mạng và sẽ giúp việc triển khai an toàn, dễ kiểm soát hơn.

## Tài liệu tham chiếu
-

## Lịch sử cập nhật
| Version | Ngày | Người cập nhật | Nội dung thay đổi |
|---|---|---|---|
| 1.0 | | | Khởi tạo |
