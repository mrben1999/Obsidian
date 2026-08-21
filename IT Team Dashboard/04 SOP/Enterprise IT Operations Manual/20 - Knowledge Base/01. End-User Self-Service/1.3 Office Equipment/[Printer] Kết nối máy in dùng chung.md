---
category: "1.3 Office Equipment"
visibility: Public (toàn công ty)
tags: [printer, office, self-service]
---

# [Printer] Hướng dẫn kết nối máy in dùng chung

## 1. Tóm tắt hiện tượng (Symptom)
Máy tính chưa thấy máy in dùng chung của phòng ban/tầng làm việc trong danh sách máy in, hoặc cần cài thêm máy in mới khi chuyển chỗ ngồi/chi nhánh.

## 2. Nguyên nhân (Root Cause)
Máy in dùng chung tại Quảng Việt được chia sẻ qua Print Server nội bộ — máy tính cần được cài driver và trỏ đúng tới print queue trên server, không tự động xuất hiện như thiết bị cắm trực tiếp.

## 3. Các bước xử lý (Resolution)
1. Trên Windows, mở **Settings > Bluetooth & devices > Printers & scanners > Add device**.
2. Chọn **"Add a printer using a hostname or IP address"** hoặc tìm theo tên máy chủ in: `\\printserver\<tên-máy-in-tầng>` (ví dụ `\\printserver\HN-T3-HP-M428`).
3. Windows tự tải driver từ Print Server — đợi hoàn tất (khoảng 1-2 phút).
4. In thử 1 trang test để xác nhận kết nối thành công.

## 4. Thông tin bổ sung (Notes)
- Không rõ tên máy in đúng của khu vực mình ngồi → hỏi đồng nghiệp cùng phòng hoặc xem nhãn dán trên thân máy in.
- Với máy Mac, vào **System Settings > Printers & Scanners > Add Printer**, chọn tab "Windows" và nhập đường dẫn Print Server tương tự.
- Nếu đã làm đúng bước trên nhưng vẫn không thấy máy in / báo lỗi driver, tạo Ticket danh mục "Phần cứng > Máy in" kèm tên máy in cần kết nối.
