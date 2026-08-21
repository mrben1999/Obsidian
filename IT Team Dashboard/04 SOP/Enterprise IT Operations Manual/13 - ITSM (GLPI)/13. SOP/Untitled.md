---
type: sop
area:
owner:
version: 1
last_reviewed: 2026-08-08
tags:
  - sop
---

# 📋 SOP — Untitled

## Mục đích
>

## Phạm vi áp dụng
>

User báo lỗi
     │
     ▼
Tạo Ticket
     │
     ├── Associated Asset → PC IT-leminh
     │
     ▼
Technician tiếp nhận
     │
     ▼
Kiểm tra / xác nhận cần thay SSD
     │
     ▼
Lấy SSD từ kho Spare Part
     │
     ▼
Gắn SSD vào PC
     │
     ├── Ghi nhận SSD mới
     ├── Ghi nhận SSD cũ
     └── Ghi nhận ngày thay
     │
     ▼
Test PC
     │
     ▼
SSD cũ → RMA / Hỏng / Thanh lý
     │
     ▼
Solution
     │
     ▼
Close Ticket
## Các bước thực hiện
1.
2.
3.
|Đối tượng|GLPI quản lý ở đâu|Khi hỏng|
|---|---|---|
|SSD nguyên bản theo PC|Computer → Component|Ghi nhận thay thế → RMA/Thanh lý|
|RAM nguyên bản theo PC|Computer → Component|Ghi nhận thay thế → RMA/Thanh lý|
|HDD nguyên bản theo PC|Computer → Component|Ghi nhận thay thế → RMA/Thanh lý|
|SSD mua dự phòng|**Spare Part**|Kho → Xuất → Gắn PC|
|SSD mua dự phòng nhưng chưa dùng|**Spare Part**|`Trong kho`|
|SSD dự phòng đã gắn PC|**Spare Part**|`Đang hoạt động`|
|SSD dự phòng hỏng sau khi sử dụng|**Spare Part**|RMA / Thanh lý|
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
