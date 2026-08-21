# BÁO CÁO PHÂN TÍCH HỆ THỐNG CƠ SỞ DỮ LIỆU GP8000C
## PHÂN TÍCH CẤU TRÚC, BIỂU ĐỒ LUỒNG DỮ LIỆU VÀ ĐỀ XUẤT KIẾN TRÚC TỐI ƯU
### Hệ thống Quản trị Nhân sự - Chấm công - Tính lương (HRM - Time Attendance - Payroll)

---

## 1. TÓM TẮT MỤC TIÊU & CHỈ SỐ (KPI) HỆ THỐNG

### Mục tiêu cốt lõi:
Hệ thống **GP8000C** là giải pháp phần mềm Quản lý Nhân sự (HRM), Chấm công (Time Attendance) và Tính lương (Payroll) quy mô doanh nghiệp lớn. Hệ thống quản lý toàn bộ vòng đời nhân sự: từ tuyển dụng, thông tin lý lịch, phòng ban, quá trình ký kết hợp đồng lao động, quản lý ca kíp, xử lý dữ liệu quẹt thẻ thô (raw swiping logs) thành dữ liệu chấm công ngày, và cuối cùng là tính toán lương tự động dựa trên cấu hình linh hoạt.

### Các chỉ số đo lường hiệu năng cốt lõi (KPI):
1. **Thời gian xử lý bảng công (Attendance Processing Time):** Thời gian hệ thống tổng hợp từ dữ liệu quẹt thẻ thô (`FILC01A`) sang bảng công ngày (`FILC06A`) và bảng công tháng cho quy mô >10.000 nhân viên phải < 10 phút.
2. **Độ chính xác tính toán lương (Payroll Accuracy Rate):** Đạt 100%, không xảy ra sai lệch số liệu giữa cấu hình định nghĩa lương (`FILD01A`) và kết quả tính lương chi tiết (`FILD02A`).
3. **Thời gian phản hồi API (API Response Time):** Các API lấy thông tin nhân sự (`FILB01A`) và tra cứu công phải đạt < 200ms đối với dữ liệu đã được tối ưu index.
4. **Tỷ lệ lỗi quẹt thẻ (Card Swiping Error Rate):** Nhận diện nhanh các trường hợp thiếu giờ quẹt (`ONN` / `OFF` bị trống) để gửi cảnh báo tự động cho nhân viên giải trình.

---

## 2. PHÂN TÍCH CHI TIẾT (CẤU TRÚC DATABASE & GIẢI THÍCH VIẾT TẮT)

Hệ thống GP8000C sử dụng quy tắc đặt tên bảng theo dạng phân hệ:
* **`FILA` (Tables Danh mục/Tham chiếu - Master Data Tables):** Công ty, phòng ban, chức vụ, học vấn, ca làm việc, loại nghỉ phép,...
* **`FILB` (Tables Nhân sự - Employee Core Data):** Sơ yếu lý lịch, hợp đồng lao động, thông tin bảo hiểm,...
* **`FILC` (Tables Chấm công - Time Attendance Data):** Dữ liệu quẹt thẻ thô, đăng ký phép, kết quả chấm công ngày,...
* **`FILD` / `FILE` / `FILF` (Tables Tiền lương & Phúc lợi - Payroll & Insurance Data):** Công thức cấu hình lương, bảng tính lương chi tiết,...
* **`SYS` / `GP_SYS` (Tables Hệ thống - System & Configurations):** Phân quyền, cấu hình máy quẹt thẻ, cấu hình ngôn ngữ,...

Dưới đây là chi tiết các bảng quan trọng nhất kèm giải nghĩa các cột viết tắt:

### 2.1. Phân hệ Danh mục (Master Data - Hệ FILA)

#### Bảng `FILA02A`: Danh mục Phòng ban (Department Master)
* **Khóa chính:** `DEP_ID` (Mã phòng ban)
* **Quan hệ:** Một phòng ban chứa nhiều nhân viên (`FILB01A`).

| Tên cột | Kiểu dữ liệu | Khóa | Ý nghĩa / Giải thích viết tắt | Ghi chú |
| :--- | :--- | :---: | :--- | :--- |
| **`DEP_ID`** | `NVARCHAR(10)` | PK | **Department ID** | Mã phòng ban / bộ phận |
| **`DEP_NM`** | `NVARCHAR(100)` | | **Department Name** | Tên phòng ban (Tiếng Việt) |
| **`DEP_N1`** | `NVARCHAR(100)` | | **Department Name 1** | Tên phòng ban bằng tiếng nước ngoài (Anh/Trung) |
| **`DEP_HG`** | `NVARCHAR(200)` | | **Department Hierarchy** | Phân cấp phòng ban (Cây sơ đồ tổ chức) |
| **`COL_NO`** | `NVARCHAR(20)` | | **Color Number** | Mã màu biểu diễn trên giao diện phần mềm |
| **`PEO_TT`** | `INT` | | **People Total** | Định biên nhân sự tối đa cho phép |
| **`SEG_HR`** | `INT` | | **Segment Hour** | Định giờ làm việc tiêu chuẩn của phòng ban |
| **`ROU_MN`** | `INT` | | **Round Minutes** | Làm tròn phút đi trễ/về sớm quy định |
| **`REM_DR`** | `NVARCHAR(50)` | | **Remarks Description** | Ghi chú thêm |

---

#### Bảng `FILA07A`: Danh mục Chức vụ (Position Master)
* **Khóa chính:** `POS_ID` (Mã chức vụ)

| Tên cột | Kiểu dữ liệu | Khóa | Ý nghĩa / Giải thích viết tắt | Ghi chú |
| :--- | :--- | :---: | :--- | :--- |
| **`POS_ID`** | `NVARCHAR(10)` | PK | **Position ID** | Mã chức vụ |
| **`POS_NM`** | `NVARCHAR(50)` | | **Position Name** | Tên chức vụ (Tiếng Việt) |
| **`POS_N1`** | `NVARCHAR(50)` | | **Position Name 1** | Tên chức vụ bằng tiếng nước ngoài |
| **`COL_NO`** | `NVARCHAR(20)` | | **Color Number** | Mã màu hiển thị |
| **`POS_DR`** | `NVARCHAR(3)` | | **Position Degree** | Cấp bậc / Trọng số chức vụ (Để tính thang phụ cấp) |

---

#### Bảng `FILA06A`: Danh mục Loại Nghỉ phép (Leave / Vacation Types)
* **Khóa chính:** `VAC_ID` (Mã loại phép)

| Tên cột | Kiểu dữ liệu | Khóa | Ý nghĩa / Giải thích viết tắt | Ghi chú |
| :--- | :--- | :---: | :--- | :--- |
| **`VAC_ID`** | `NVARCHAR(3)` | PK | **Vacation ID** | Mã loại phép (Phép năm, Ốm, Thai sản,...) |
| **`VAC_NM`** | `NVARCHAR(50)` | | **Vacation Name** | Tên loại phép |

---

### 2.2. Phân hệ Nhân sự (Employee Core - Hệ FILB)

#### Bảng `FILB01A`: Danh sách Nhân sự (Employee Profile)
* **Khóa chính:** `EMP_ID` (Mã nhân viên)
* **Khóa ngoại:** `DEP_ID` (Liên kết `FILA02A`), `POS_ID` (Liên kết `FILA07A`), `COU_ID` (Quốc tịch)

| Tên cột | Kiểu dữ liệu | Khóa | Ý nghĩa / Giải thích viết tắt | Ghi chú |
| :--- | :--- | :---: | :--- | :--- |
| **`EMP_ID`** | `NVARCHAR(20)` | PK | **Employee ID** | Mã số nhân viên (Duy nhất) |
| **`EMP_I1`** | `NVARCHAR(20)` | | **Employee Alternate ID** | Mã số phụ hoặc mã thẻ chấm công vật lý |
| **`EMP_NM`** | `NVARCHAR(50)` | | **Employee Name** | Họ và tên nhân viên |
| **`EMP_N1`** | `NVARCHAR(50)` | | **Employee Alternate Name** | Tên không dấu hoặc tên gọi nước ngoài |
| **`MST_DR`** | `NVARCHAR(13)` | | **Mã Số Thuế Description** | Mã số thuế cá nhân |
| **`BIR_DT`** | `NVARCHAR(10)` | | **Birth Date** | Ngày sinh (Định dạng chuỗi hoặc ngày) |
| **`SEX_BT`** | `BIT` | | **Sex Bit** | Giới tính (1: Nam, 0: Nữ) |
| **`MAR_BT`** | `BIT` | | **Marriage Bit** | Tình trạng hôn nhân (1: Đã kết hôn, 0: Độc thân) |
| **`DEP_ID`** | `NVARCHAR(10)` | FK | **Department ID** | Mã phòng ban nhân viên trực thuộc |
| **`COU_ID`** | `NVARCHAR(10)` | | **Country ID** | Quốc tịch nhân viên |
| **`CRD_NO`** | `NVARCHAR(20)` | | **Card Number** | Số Chứng minh nhân dân / CCCD / Hộ chiếu |
| **`POS_ID`** | `NVARCHAR(10)` | FK | **Position ID** | Mã chức vụ |
| **`ADD_DR`** | `NVARCHAR(255)` | | **Address Permanent** | Địa chỉ thường trú |
| **`ADD_D1`** | `NVARCHAR(255)` | | **Address Temporary** | Địa chỉ tạm trú |
| **`INH_DT`** | `DATETIME` | | **In-house Date** | Ngày vào làm chính thức |
| **`TER_DT`** | `DATETIME` | | **Termination Date** | Ngày nghỉ việc (Nếu có) |

---

### 2.3. Phân hệ Chấm công (Time Attendance - Hệ FILC)

#### Bảng `FILC01A`: Dữ liệu Quẹt thẻ Thô (Raw Swiping Logs)
* **Khóa chính:** `CRD_DT` (Thời điểm quẹt thẻ) kết hợp `EMP_ID`
* **Quan hệ:** Nhận dữ liệu trực tiếp từ các máy chấm công qua hệ thống TCP/IP hoặc tải file Excel.

| Tên cột | Kiểu dữ liệu | Khóa | Ý nghĩa / Giải thích viết tắt | Ghi chú |
| :--- | :--- | :---: | :--- | :--- |
| **`DAT_TM`** | `FLOAT` | | **Date Time Number** | Ngày quẹt dạng số thực để tối ưu tính toán khoảng |
| **`EMP_ID`** | `NVARCHAR(20)` | FK | **Employee ID** | Mã nhân viên quẹt thẻ |
| **`SWI_DT`** | `DATETIME` | | **Swipe Date Time** | Thời gian quẹt thẻ đầy đủ |
| **`USR_NM`** | `NVARCHAR(50)` | | **User Name** | Tên người dùng hoặc ID máy chấm công nhận dữ liệu |
| **`CRD_DT`** | `DATETIME` | PK | **Card Date Time** | Thời gian ghi nhận vào hệ thống (Mốc duy nhất) |

---

#### Bảng `FILC06A`: Kết quả Chấm công hàng ngày (Daily Attendance Details)
* **Khóa chính:** `EMP_ID` + `ATT_DT` (Mã nhân viên + Ngày chấm công)
* **Ý nghĩa:** Đây là bảng kết quả tổng hợp sau khi quét dữ liệu quẹt thẻ thô của từng ngày để ra ca, số giờ làm, đi trễ về sớm.

| Tên cột | Kiểu dữ liệu | Khóa | Ý nghĩa / Giải thích viết tắt | Ghi chú |
| :--- | :--- | :---: | :--- | :--- |
| **`EMP_ID`** | `NVARCHAR(20)` | PK, FK | **Employee ID** | Mã nhân viên |
| **`ATT_DT`** | `DATETIME` | PK | **Attendance Date** | Ngày chấm công |
| **`DEP_ID`** | `NVARCHAR(10)` | FK | **Department ID** | Phòng ban của nhân viên tại thời điểm chấm công |
| **`EMP_I1`** | `NVARCHAR(20)` | | **Employee Alt ID** | Mã số phụ/Mã thẻ |
| **`SHI_ID`** | `NVARCHAR(10)` | FK | **Shift ID** | Mã ca làm việc áp dụng cho ngày hôm đó |
| **`NIG_TM`** | `NVARCHAR(50)` | | **Night Time** | Số phút / giờ làm đêm |
| **`ONN_01`** | `FLOAT` | | **On Time 1** | Giờ quẹt thẻ vào lần 1 (Đã làm tròn số thập phân) |
| **`OFF_01`** | `FLOAT` | | **Off Time 1** | Giờ quẹt thẻ ra lần 1 |
| **`ONN_02`** | `FLOAT` | | **On Time 2** | Giờ quẹt thẻ vào lần 2 |
| **`OFF_02`** | `FLOAT` | | **Off Time 2** | Giờ quẹt thẻ ra lần 2 |
| **`ONN_03`** | `FLOAT` | | **On Time 3** | Giờ quẹt thẻ vào lần 3 |
| **`OFF_03`** | `FLOAT` | | **Off Time 3** | Giờ quẹt thẻ ra lần 3 |
| **`NOT_OR`** | `NVARCHAR(500)` | | **Note Original** | Ghi chú gốc của hệ thống tự động sinh |
| **`NOT_DR`** | `NVARCHAR(500)` | | **Note Description** | Ghi chú điều chỉnh của Admin nhân sự |

---

### 2.4. Phân hệ Tiền lương (Payroll - Hệ FILD)

#### Bảng `FILD01A`: Danh mục Thiết lập tham số Lương (Payroll Columns Config)
* **Khóa chính:** `COL_NM` (Tên cột tham số lương)

| Tên cột | Kiểu dữ liệu | Khóa | Ý nghĩa / Giải thích viết tắt | Ghi chú |
| :--- | :--- | :---: | :--- | :--- |
| **`COL_NM`** | `NVARCHAR(20)` | PK | **Column Name** | Tên cột trường lương trong hệ thống (e.g. `SAL_BASIC`) |
| **`SEQ_NO`** | `INT` | | **Sequence Number** | Thứ tự hiển thị trên bảng lương |
| **`COL_EN`** | `NVARCHAR(50)` | | **Column English** | Tên cột tiếng Anh |
| **`COL_VN`** | `NVARCHAR(50)` | | **Column Vietnamese** | Tên cột tiếng Việt |
| **`HUR_BT`** | `BIT` | | **Hourly Rate Bit** | Đánh dấu cột tính theo giờ hay không |
| **`ACC_BT`** | `BIT` | | **Accumulate Bit** | Có tích lũy lũy kế hay không |
| **`BAS_BT`** | `BIT` | | **Basic Salary Bit** | Xác định có phải lương cơ bản đóng bảo hiểm |
| **`LCK_BT`** | `BIT` | | **Lock Bit** | Khóa cột dữ liệu không cho phép sửa thủ công |

---

#### Bảng `FILD02A`: Bảng Lương chi tiết Hàng tháng (Monthly Payroll Details)
* **Khóa chính:** `EMP_ID` + `YYY_MM` + `SEQ_NO`

| Tên cột | Kiểu dữ liệu | Khóa | Ý nghĩa / Giải thích viết tắt | Ghi chú |
| :--- | :--- | :---: | :--- | :--- |
| **`EMP_ID`** | `NVARCHAR(20)` | PK, FK | **Employee ID** | Mã nhân viên nhận lương |
| **`YYY_MM`** | `NVARCHAR(6)` | PK | **Year Month** | Tháng tính lương (Ví dụ: '202607') |
| **`SEQ_NO`** | `INT` | PK | **Sequence Number** | Số thứ tự lần chi trả lương trong tháng |
| **`DEP_ID`** | `NVARCHAR(10)` | | **Department ID** | Phòng ban của nhân viên thời điểm nhận lương |
| **`COL_VL`** | `FLOAT` | | **Column Value** | Giá trị số tiền tương ứng từng khoản lương |

---

## 3. BIỂU ĐỒ GỢI Ý & LUỒNG ĐI CỦA DỮ LIỆU (DATA FLOW)

Hệ thống hoạt động dựa trên 3 luồng xử lý chính:

```
[Máy Chấm Công / File Excel] 
          │
          ▼ (Dữ liệu quẹt thẻ thô)
┌────────────────────────┐
│     FILC01A (Raw Log)  │
└────────────────────────┘
          │
          ▼ (Hệ thống chạy Batch Job tổng hợp theo ca làm việc FILC02A)
┌────────────────────────┐
│   FILC06A (Công ngày)  │ ◄─────── [Đăng ký phép - FILC04A]
└────────────────────────┘
          │
          ▼ (Chốt công cuối tháng, chuyển sang module lương)
┌────────────────────────┐
│   FILD02A (Lương tháng)│ ◄─────── [Cơ cấu tính lương - FILD01A]
└────────────────────────┘
```

---

## 4. DANH SÁCH CÁC API ENDPOINTS CỐT LÕI (RESTFUL API)

Để tích hợp với các ứng dụng Web/Mobile phục vụ nhân viên tự tra cứu, đề xuất hệ thống API chuẩn sau:

| STT | Phương thức | API Endpoint | Chức năng | Tham số đầu vào (JSON/Query) |
| :--- | :---: | :--- | :--- | :--- |
| 1 | `GET` | `/api/v1/employees` | Lấy danh sách nhân viên | `?dep_id=X&status=1` |
| 2 | `GET` | `/api/v1/employees/{emp_id}` | Xem chi tiết hồ sơ nhân viên | Đường dẫn chứa mã nhân viên |
| 3 | `POST` | `/api/v1/attendance/swipe-log` | Đẩy dữ liệu quẹt thẻ thô từ máy chấm công | `{ "emp_id": "...", "swipe_time": "..." }` |
| 4 | `GET` | `/api/v1/attendance/daily` | Tra cứu bảng công ngày của nhân viên | `?emp_id=X&start_date=Y&end_date=Z` |
| 5 | `POST` | `/api/v1/leaves/request` | Đăng ký nghỉ phép trực tuyến | `{ "emp_id": "...", "vac_id": "...", "dates": [] }` |
| 6 | `GET` | `/api/v1/payroll/payslip` | Lấy phiếu lương chi tiết hàng tháng | `?emp_id=X&year_month=202607` |

---

## 5. INSIGHT & ĐỀ XUẤT KIẾN TRÚC TỐI ƯU CỦA CHUYÊN GIA

### 1. Phân vùng dữ liệu (Partitioning) & Lưu trữ tối ưu
* **Vấn đề:** Bảng dữ liệu quẹt thẻ thô `FILC01A` và kết quả công ngày `FILC06A` tăng trưởng cực kỳ nhanh theo thời gian (Hàng triệu dòng mỗi năm đối với nhà máy lớn).
* **Đề xuất hành động:** Thực hiện **Partitioning theo tháng/năm** dựa trên cột `CRD_DT` (ở bảng `FILC01A`) và `ATT_DT` (ở bảng `FILC06A`). Dữ liệu quá 2 năm nên được gom luồng (Archived) sang một DB lưu trữ lịch sử giá rẻ (Cold Storage) để duy trì tốc độ truy vấn tức thời cho DB hiện hành (Hot Storage).

### 2. Chiến lược đánh chỉ mục (Index) nâng cao hiệu năng
* Đánh **Composite Index** trên bảng chấm công ngày `FILC06A` theo cặp `(EMP_ID, ATT_DT)` để tối ưu hóa triệt để màn hình tra cứu lịch sử chấm công của nhân viên trên App.
* Đánh Index trên cột `DEP_ID` của bảng nhân viên `FILB01A` để tối ưu hóa truy vấn lọc nhân viên theo phòng ban cho các cấp quản lý trực tiếp.

### 3. Cơ chế Cache cho công thức Lương
* Cấu hình thiết lập lương `FILD01A` ít khi thay đổi trong tháng nhưng lại được gọi liên tục khi chạy bảng lương. Nên lưu trữ cấu hình này vào **Redis Cache** để hạn chế tối đa việc truy vấn trực tiếp vào DB trong quá trình thực hiện vòng lặp tính lương cho hàng vạn nhân sự.
### Tóm tắt nội dung Phân tích & Quy hoạch Hệ thống GP8000C:

1. **Ý nghĩa quy tắc đặt tên bảng viết tắt trong DB:**
    
    - **`FILA` (Hệ danh mục tham chiếu - Master Data):** Các bảng cấu hình chung của hệ thống như Phòng ban (`FILA02A`), Chức vụ (`FILA07A`), Học vấn (`FILA04A`), Loại nghỉ phép (`FILA06A`),...
        
    - **`FILB` (Hệ thông tin nhân sự - HR Core):** Sơ yếu lý lịch nhân viên (`FILB01A`), Hợp đồng lao động (`FILB03A`),...
        
    - **`FILC` (Hệ chấm công - Time Attendance):** Dữ liệu quẹt thẻ thô trực tiếp từ máy chấm công (`FILC01A`), Bảng dữ liệu chấm công tổng hợp ngày (`FILC06A`), Đăng ký nghỉ phép (`FILC04A`),...
        
    - **`FILD` (Hệ tính lương - Payroll):** Cấu trúc thiết lập cột lương (`FILD01A`), Bảng tính toán lương chi tiết hàng tháng (`FILD02A`),...
        
2. **Các đề xuất tối ưu hóa hệ thống từ SA:**
    
    - **Chiến lược Phân vùng dữ liệu (Partitioning):** Do đặc thù bảng dữ liệu quẹt thẻ (`FILC01A`) và chấm công ngày (`FILC06A`) tích tụ cực kỳ lớn theo thời gian, đề xuất áp dụng Partitioning theo tháng/năm giúp các câu lệnh truy vấn luôn đạt tốc độ tối đa.
        
    - **Chiến lược Đánh Index:** Tạo các chỉ mục phức hợp (Composite Indexes) trên các cặp khóa ngoại và mốc thời gian như `(EMP_ID, ATT_DT)` nhằm tăng tốc độ tải màn hình chấm công/bảng lương trên Mobile App hoặc Web Portal.
        
    - **Caching:** Khuyến nghị lưu trữ cấu hình bảng lương (`FILD01A`) trên Redis Cache để tránh nghẽn cổ chai DB khi hệ thống tính toán bảng lương cho hàng ngàn nhân sự cùng lúc.