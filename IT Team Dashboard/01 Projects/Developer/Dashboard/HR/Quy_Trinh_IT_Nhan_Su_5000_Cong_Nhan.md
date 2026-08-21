# QUY TRÌNH ỨNG DỤNG CÔNG NGHỆ THÔNG TIN TRONG QUẢN LÝ NHÂN SỰ
**Áp dụng cho quy mô sản xuất trên 5.000 công nhân**

---

## 1. QUY TRÌNH ĐĂNG KÝ NGHỈ PHÉP TRỰC TUYẾN (LEAVE MANAGEMENT SYSTEM - LMS)

### 1.1. Mục tiêu & Phạm vi áp dụng
* **Mục tiêu:** Tự động hóa 100% quy trình đăng ký, phê duyệt và chấm công nghỉ phép; giảm tỷ lệ sai sót dữ liệu xuống < 0.5%; giảm thời gian xử lý thủ tục từ 3 ngày xuống còn dưới 4 giờ làm việc.
* **Phạm vi:** Toàn bộ công nhân viên, tổ trưởng sản xuất, quản đốc phân xưởng và phòng Nhân sự.

### 1.2. Các Kênh Đăng Ký (Giao diện Người dùng)
Đối với quy mô > 5.000 công nhân, hệ thống phải đa nền tảng để đảm bảo mọi công nhân đều tiếp cận được:
1.  **Ứng dụng di động (Mobile App - iOS/Android):** Dành cho công nhân có điện thoại thông minh (Đăng nhập bằng mã công nhân + OTP/Sinh trắc học).
2.  **Kiosk thông tin (Touchscreen Kiosk):** Đặt tại các cửa ra vào nhà máy, căng tin dành cho công nhân không dùng smartphone (Quét thẻ từ/Vân tay để đăng nhập).
3.  **Zalo Mini App / Viber Chatbot:** Tích hợp trực tiếp vào nền tảng nhắn tin phổ biến để tối ưu hạ tầng mạng và dễ sử dụng.

### 1.3. Quy trình Chi tiết (Workflow)

```
[Công nhân] -> (Nhập đơn trên App/Kiosk) 
       |
       v
[Hệ thống Kiểm tra Tự động] 
       |---> (Nếu Sai quy định: Từ chối & Báo lỗi ngay)
       |---> (Nếu Hợp lệ: Gửi thông báo đến Tổ trưởng)
       |
       v
[Tổ trưởng Sản xuất] -> (Phê duyệt trên App Quản lý)
       |---> (Nếu Từ chối: Nhập lý do -> Trả về Công nhân)
       |---> (Nếu Duyệt: Chuyển tiếp Quản đốc nếu Nghỉ > 2 ngày)
       |
       v
[Quản đốc Phân xưởng] -> (Duyệt kế hoạch nhân sự tổng thể)
       |
       v
[Hệ thống ERP / Chấm công] -> (Tự động trừ phép, cập nhật bảng công) -> [HR Giám sát]
```

#### Bước 1: Khởi tạo và Kiểm tra Điều kiện Tự động (Hệ thống xử lý)
* Công nhân chọn loại phép (Phép năm, ốm, thai sản, không lương...) và chọn ngày nghỉ.
* **Hệ thống tự động kiểm tra (Validation Rules):**
    * *Số dư phép năm:* Nếu số ngày xin nghỉ > số phép còn lại, hệ thống cảnh báo và chuyển sang diện "Nghỉ không lương" (nếu được chọn).
    * *Giới hạn tỷ lệ nghỉ ca:* Hệ thống kiểm tra nếu số lượng công nhân trong cùng một tổ/chuyền xin nghỉ vào ngày đó đã vượt quá **10% tổng nhân sự ca**, hệ thống sẽ đưa ra cảnh báo "Vượt định biên an toàn sản xuất" để công nhân cân nhắc hoặc báo trước với Tổ trưởng.
    * *Thời gian báo trước:* Nghỉ 1 ngày phải báo trước 24h; nghỉ từ 3 ngày trở lên phải báo trước 5 ngày (trừ trường hợp đột xuất).

#### Bước 2: Phê duyệt từ Cấp quản lý trực tiếp (Tổ trưởng/Quản đốc)
* **Nghỉ ≤ 2 ngày:** Tổ trưởng sản xuất nhận thông báo (Push Notification) trên App Quản lý. Tổ trưởng xem xét tình hình sản xuất của chuyền và bấm **Duyệt** hoặc **Từ chối** (phải nhập lý do).
* **Nghỉ > 2 ngày:** Sau khi Tổ trưởng duyệt, đơn tự động luân chuyển lên Quản đốc phân xưởng phê duyệt vòng cuối để điều phối nhân sự liên chuyền.

#### Bước 3: Đồng bộ dữ liệu và Cập nhật Chấm công
* Ngay khi đơn được duyệt hoàn tất, hệ thống tự động:
    * Gửi thông báo kết quả (SMS/Zalo/App) cho công nhân.
    * Đồng bộ sang phần mềm Chấm công (Time Attendance) và ERP. Ngày đó công nhân sẽ được ghi nhận mã công tương ứng (ví dụ: AL - Annual Leave, SL - Sick Leave) thay vì lỗi vắng mặt (Absence).

---

## 2. QUY TRÌNH ĐĂNG KÝ LÀM THÊM GIỜ (OVERTIME - OT MANAGEMENT SYSTEM)

### 2.1. Nguyên tắc Cốt lõi của Quy mô Lớn
* **Không đăng ký đơn lẻ:** Để quản lý > 5.000 người, không để từng công nhân tự đăng ký OT. Quy trình phải đi từ **Nhu cầu sản xuất (Top-down)**: Bộ phận Kế hoạch sản xuất/Quản đốc đưa ra lệnh OT -> Tổ trưởng phân bổ -> Công nhân xác nhận.
* **Kiểm soát Tuân thủ Pháp luật:** Hệ thống tự động khóa (Block) nếu vi phạm Luật Lao động (quá giờ quy định/ngày, /tháng, /năm).

### 2.2. Quy trình Chi tiết (Workflow)

```
[Bộ phận Kế hoạch / Quản đốc] -> (Tạo Kế hoạch OT dựa trên đơn hàng)
       |
       v
[Hệ thống Kiểm tra Tuân thủ] 
       |---> (Vi phạm hạn mức luật định -> Khóa/Yêu cầu giải trình)
       |---> (Hợp lệ -> Gửi danh sách đề xuất về các Chuyền)
       |
       v
[Tổ trưởng Sản xuất] -> (Gán tên công nhân vào ca OT trên hệ thống)
       |
       v
[Công nhân] -> (Xác nhận "Đồng ý" hoặc "Từ chối" trên App/Kiosk trước 15:00)
       |
       v
[Hệ thống ERP / Chấm công] -> (Chốt danh sách OT tự động, đồng bộ máy quẹt thẻ)
```

#### Bước 1: Lập Kế hoạch OT và Kiểm soát Hạn mức (Quản đốc & Hệ thống)
* Quản đốc phân xưởng căn cứ vào tiến độ đơn hàng để nhập nhu cầu OT lên hệ thống (Ví dụ: Chuyền A cần 30 người OT 2 tiếng ca tối ngày DD/MM).
* **Bộ lọc kiểm soát của Hệ thống (Compliance Gate):** Hệ thống quét cơ sở dữ liệu của toàn bộ công nhân trong chuyền để kiểm tra:
    * Tổng số giờ OT trong tháng của từng người đã vượt quá 40 giờ chưa?
    * Tổng số giờ OT trong năm đã chạm ngưỡng 200 giờ (hoặc 300 giờ vùng đặc biệt) chưa?
    * Hệ thống sẽ **bôi đỏ hoặc loại trừ** các công nhân đã chạm trần pháp lý, không cho phép gán lịch OT.

#### Bước 2: Phân bổ và Xác nhận từ Công nhân (Tổ trưởng & Công nhân)
* Tổ trưởng sản xuất nhận danh sách hạn mức, chọn các công nhân đủ điều kiện và gửi lệnh "Mời làm thêm giờ" qua hệ thống.
* Công nhân nhận được thông báo trên App/Kiosk: *"Bạn có lịch mời OT từ 17:00 - 19:00 ngày hôm nay. Hãy xác nhận."*
* Công nhân bấm **Đồng ý** hoặc **Từ chối** (Hạn chót xác nhận là 15:00 hàng ngày để kịp sắp xếp suất ăn công nghiệp).

#### Bước 3: Đóng dữ liệu và Kiểm toán Chấm công (Đóng vòng Quy trình)
* Hệ thống tự động tổng hợp danh sách công nhân đã ký duyệt OT gửi xuống nhà bếp để chuẩn bị suất ăn ca.
* Dữ liệu OT được khóa và đẩy sang máy quẹt thẻ/nhận diện khuôn mặt ở cổng.
* **Cơ chế đối soát thông minh (Smart Matching):** Khi công nhân quẹt thẻ ra về, hệ thống sẽ đối soát: `Giờ quẹt thẻ thực tế` VS `Giờ OT được duyệt`. 
    * Nếu duyệt OT 2 tiếng nhưng công nhân về sớm hoặc ở lại muộn hơn mà không có lý do, hệ thống sẽ tính theo giờ duyệt tối đa hoặc ghi nhận cảnh báo để Tổ trưởng giải trình.

---

## 3. CHỈ SỐ ĐO LƯỜNG HIỆU QUẢ (KPIs) VÀ LƯU Ý TRIỂN KHAI

### 3.1. Chỉ số KPI đánh giá hệ thống
1.  **Tỷ lệ chấp nhận hệ thống (Adoption Rate):** > 98% công nhân sử dụng thành thạo App/Kiosk sau 2 tháng triển khai.
2.  **Thời gian phê duyệt trung bình (Lead Time):** < 2 giờ từ lúc tạo đơn đến khi có kết quả.
3.  **Tỷ lệ sai lệch chấm công (Error Rate):** < 0.1% dữ liệu phải điều chỉnh bằng tay vào cuối tháng.

### 3.2. Kinh nghiệm thực tế từ Chuyên gia (Giai đoạn chuyển đổi)
* **Giai đoạn đệm (Buffer Period):** Duy trì song song cả ký giấy và App trong 1 tháng đầu tiên. Thành lập "Biệt đội hỗ trợ công nghệ" (gồm các nhân sự HR và IT xuống trực tiếp xưởng tại các Kiosk vào giờ giao ca) để hướng dẫn công nhân thao tác.
* **Bài toán bảo mật và thiết bị:** Đối với quy mô 5.000 công nhân, tỷ lệ không có smartphone hoặc điện thoại cấu hình yếu chiếm khoảng 15-20%. Do đó, việc đầu tư ít nhất **2 - 3 Kiosk màn hình cảm ứng tại mỗi nhà xưởng lớn** là bắt buộc để tránh tình trạng nghẽn cổ chai khi đăng ký.
* **Phân quyền chặt chẽ:** Tổ trưởng chỉ được duyệt trong phạm vi tổ; HR giữ vai trò siêu quản trị (Admin) kiểm tra tính tuân thủ pháp lý và xử lý các ca lỗi hệ thống.
