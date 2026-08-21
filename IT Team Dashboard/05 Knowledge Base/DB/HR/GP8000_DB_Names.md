# GP8000 – Tài liệu tham khảo cấu trúc CSDL (GP8000_DB_Names.md)

> Sinh tự động từ `Gp8000CDatabase.sql` (159 bảng, export ngày 16/07/2026), kết hợp với bảng chức năng do người dùng cung cấp (ảnh chụp màn hình).

## ⚠️ Cách đọc tài liệu này

- Cột **Chức năng** lấy trực tiếp từ ảnh người dùng cung cấp khi có, được đánh dấu **[Xác nhận]**.
- Với các bảng không có trong ảnh, chức năng được **suy luận** từ tên bảng, tiền tố/hậu tố tên cột và ngữ cảnh nghiệp vụ (payroll/chấm công) — đánh dấu **[Suy luận]**, cần đội backend/nghiệp vụ cũ xác nhận lại trước khi dùng chính thức.
- Với từng cột, giải nghĩa được ghép từ **tiền tố** (khái niệm chính, ví dụ `EMP`=Nhân viên) và **hậu tố** (loại dữ liệu, ví dụ `_ID`=Mã, `_DT`=Ngày). Cột nào có cờ ⚠️ nghĩa là suy luận theo quy ước đặt tên, độ tin cậy thấp hơn.
- Các cột đã đặt tên tiếng Việt rõ ràng (`LuongCB`, `TongLuong`, `ThueTNCN`...) được giữ nguyên, không suy luận thêm.
- Các bảng backup/biến thể/tạm (hậu tố `_BK_...`, `_cu`, `_vs`, `_b/_c/_d/_e`, `Temp`...) được gộp nhóm, không liệt kê lại toàn bộ cột trùng với bảng gốc để tiết kiệm thời gian tham khảo.

---

## 1. Từ điển viết tắt dùng chung

### 1.1. Tiền tố (root code – phần đứng trước dấu `_` đầu, mang khái niệm nghiệp vụ)

| Tiền tố | Nghĩa | Độ tin cậy |
|---|---|---|
| `ABS` | Vắng mặt (Absent) | ✅ Cao |
| `ACC` | Tài khoản ngân hàng | ✅ Cao |
| `ACT` | Trạng thái hoạt động | ⚠️ Suy luận |
| `ADD` | Địa chỉ | ✅ Cao |
| `AF` | Sau (After) | ✅ Cao |
| `AMT` | Số tiền quy định | ⚠️ Suy luận |
| `ATT` | Chấm công / Có mặt | ✅ Cao |
| `BAF` | Loại thưởng phạt | ✅ Cao |
| `BF` | Trước (Before) | ✅ Cao |
| `BHX` | Bảo hiểm xã hội | ✅ Cao |
| `BIR` | Ngày sinh | ✅ Cao |
| `BLT` | Người tạo bản ghi (Built by) | ✅ Cao |
| `BNK` | Ngân hàng | ✅ Cao |
| `CIT` | Tỉnh / Thành phố | ✅ Cao |
| `COL` | Cột dữ liệu (Column) — dùng trong bảng cấu hình cột động | ✅ Cao |
| `COM` | Công ty | ✅ Cao |
| `CON` | Điều kiện / Kết nối | ⚠️ Suy luận |
| `COU` | Huyện / Quận | ⚠️ Suy luận |
| `CRD` | CMND / CCCD (Chứng minh nhân dân / Căn cước công dân) | ✅ Cao |
| `CRD01` | Thẻ chấm công | ⚠️ Suy luận |
| `CUT` | Cắt trừ | ⚠️ Suy luận |
| `DAT` | Ngày / giờ dữ liệu (Data time) | ⚠️ Suy luận |
| `DAY` | Ngày | ✅ Cao |
| `DEL` | Xóa (đánh dấu đã xóa) | ✅ Cao |
| `DEP` | Phòng ban / Bộ phận | ✅ Cao |
| `DIR` | Trực tiếp quản lý / Giám đốc | ⚠️ Suy luận |
| `DOF` | Ngày nghỉ (Day off) | ✅ Cao |
| `DON` | Đơn (đơn xin/đơn đề nghị) | ✅ Cao |
| `EAR` | Về sớm (Early) | ✅ Cao |
| `EDU` | Trình độ học vấn | ✅ Cao |
| `EMA` | Email | ✅ Cao |
| `EMP` | Nhân viên | ✅ Cao |
| `END` | Kết thúc (End) | ✅ Cao |
| `FAX` | Số fax | ✅ Cao |
| `FIL` | Tên file | ✅ Cao |
| `FRM` | Từ ngày (From) | ✅ Cao |
| `FUN` | Hàm / chức năng (Function) | ✅ Cao |
| `GIO` | Giờ | ✅ Cao |
| `GRA` | Bằng cấp / Nơi tốt nghiệp | ⚠️ Suy luận |
| `GRP` | Nhóm | ✅ Cao |
| `GRT` | Nhóm lương | ⚠️ Suy luận |
| `HOL` | Ngày lễ (Holiday) | ✅ Cao |
| `HOU` | Số giờ | ✅ Cao |
| `INH` | Ngày vào công ty (Hire date) | ✅ Cao |
| `INN` | Vào (biến thể của ONN) | ⚠️ Suy luận |
| `ITE` | Hạng mục (Item) | ⚠️ Suy luận |
| `JUR` | Chưa rõ nghĩa cụ thể (có thể liên quan quyết định/chức danh pháp lý) | ⚠️ Suy luận |
| `LAB` | Hợp đồng lao động (Labour contract) | ✅ Cao |
| `LAT` | Đi trễ (Late) | ✅ Cao |
| `LCK` | Khóa (không cho chỉnh sửa) | ✅ Cao |
| `LEA` | Nghỉ phép (Leave) | ✅ Cao |
| `LEV` | Cấp bậc / Bậc lương (Level) | ✅ Cao |
| `LIM` | Giới hạn | ✅ Cao |
| `LOC` | Vị trí / Định vị chấm công (Location) | ⚠️ Suy luận |
| `LST` | Người & thời gian sửa lần cuối (Last update) | ✅ Cao |
| `MAN` | Thời gian yêu cầu tăng ca thủ công (Manual) | ⚠️ Suy luận |
| `MAR` | Tình trạng hôn nhân | ✅ Cao |
| `MEA` | Chưa rõ nghĩa cụ thể | ⚠️ Suy luận |
| `MMM` | Tháng | ✅ Cao |
| `MON` | Tháng | ✅ Cao |
| `MST` | Mã số thuế | ✅ Cao |
| `NAT` | Quốc tịch | ✅ Cao |
| `NEW` | Nhân viên mới | ⚠️ Suy luận |
| `NIG` | Ban đêm (Night) | ✅ Cao |
| `NOT` | Ghi chú | ✅ Cao |
| `OFF` | Giờ ra / Check-out | ✅ Cao |
| `ONN` | Giờ vào / Check-in | ✅ Cao |
| `OT1` | Tăng ca mức 1 | ⚠️ Suy luận |
| `OTR` | Tăng ca khác | ⚠️ Suy luận |
| `OTT` | Tăng ca (Overtime Total) | ⚠️ Suy luận |
| `OVO` | Tăng ca ngày khác (Overtime Other) | ⚠️ Suy luận |
| `PEO` | Số người (People) | ⚠️ Suy luận |
| `PIC` | Hình ảnh nhân viên | ✅ Cao |
| `POS` | Chức vụ / Vị trí công việc | ✅ Cao |
| `PRO` | Trình độ chuyên môn (hoặc: Thử việc - Probation, tùy bảng) | ⚠️ Suy luận |
| `RAC` | Dân tộc | ✅ Cao |
| `REA` | Lý do (Reason) | ✅ Cao |
| `REL` | Quan hệ (người thân / liên hệ khẩn cấp) | ⚠️ Suy luận |
| `REM` | Ghi chú / Remark | ✅ Cao |
| `ROU` | Làm tròn (Round) | ⚠️ Suy luận |
| `RUN` | Cho phép chạy / kích hoạt | ⚠️ Suy luận |
| `SEG` | Phân đoạn / hạn mức (Segment) | ⚠️ Suy luận |
| `SEN` | Thâm niên (Seniority) | ✅ Cao |
| `SEQ` | Số thứ tự | ✅ Cao |
| `SEX` | Giới tính | ✅ Cao |
| `SHI` | Ca làm việc (Shift) | ✅ Cao |
| `SQL` | Câu lệnh SQL động | ✅ Cao |
| `STA` | Trạng thái (Status) | ⚠️ Suy luận |
| `STR` | Bắt đầu (Start) | ✅ Cao |
| `STT` | Số thứ tự | ✅ Cao |
| `SWI` | Chuyển ca / Swipe (quẹt thẻ) | ⚠️ Suy luận |
| `TEL` | Điện thoại | ✅ Cao |
| `TIM` | Số lần quy định | ⚠️ Suy luận |
| `TOO` | Đến ngày (To) | ⚠️ Suy luận |
| `TPE` | Loại (Type) | ⚠️ Suy luận |
| `TRE` | Trễ | ⚠️ Suy luận |
| `TRU` | Trừ (giờ/ngày công) | ⚠️ Suy luận |
| `TYP` | Loại / Phân loại | ✅ Cao |
| `USR` | Người dùng (User) | ✅ Cao |
| `VAC` | Nghỉ việc (lý do/trạng thái thôi việc) | ✅ Cao |
| `VAL` | Giá trị | ✅ Cao |
| `WEB` | Website | ✅ Cao |
| `WRK` | Làm việc (Work) | ✅ Cao |
| `YSD` | Chưa rõ nghĩa cụ thể | ⚠️ Suy luận |
| `YYY` | Năm | ✅ Cao |

### 1.2. Hậu tố (phần đứng sau dấu `_` cuối, thường mô tả kiểu/loại dữ liệu)

| Hậu tố | Nghĩa | Độ tin cậy |
|---|---|---|
| `_AD` | Địa chỉ (Address) | ✅ Cao |
| `_BT` | Cờ đúng-sai (Bit: 1/0) | ✅ Cao |
| `_C1` | Ca 1 (Shift 1) | ⚠️ Suy luận |
| `_C2` | Ca 2 (Shift 2) | ⚠️ Suy luận |
| `_CD` | Mã (Code) | ⚠️ Suy luận |
| `_CH` | Tên tiếng Hoa (đa ngôn ngữ) | ✅ Cao |
| `_CK` | Người kiểm tra (Check) | ⚠️ Suy luận |
| `_CO` | Quốc gia (Country) | ✅ Cao |
| `_D1` | Trường phụ / biến thể của cột ngày hoặc diễn giải | ⚠️ Suy luận |
| `_DO` | Lý do | ⚠️ Suy luận |
| `_DR` | Nội dung diễn giải / ghi chú dạng text | ✅ Cao |
| `_DT` | Ngày (Date) | ✅ Cao |
| `_DV` | Đơn vị | ⚠️ Suy luận |
| `_DY` | Số ngày (Days) | ✅ Cao |
| `_ED` | Kết thúc (End) | ⚠️ Suy luận |
| `_EN` | Tên tiếng Anh (đa ngôn ngữ) | ✅ Cao |
| `_HL` | Chưa rõ nghĩa cụ thể | ⚠️ Suy luận |
| `_HO` | Chưa rõ nghĩa cụ thể | ⚠️ Suy luận |
| `_HR` | Số giờ (Hours) | ✅ Cao |
| `_HV` | Chưa rõ nghĩa cụ thể | ⚠️ Suy luận |
| `_I1` | Trường phụ / biến thể 1 | ⚠️ Suy luận |
| `_I2` | Trường phụ / biến thể 2 | ⚠️ Suy luận |
| `_I3` | Trường phụ / biến thể 3 | ⚠️ Suy luận |
| `_ID` | Mã (khóa nhận diện) | ✅ Cao |
| `_IV` | Chưa rõ nghĩa cụ thể (liên quan giờ thử việc) | ⚠️ Suy luận |
| `_LC` | Nơi cấp / địa điểm (Location) | ✅ Cao |
| `_MM` | Tháng (Month) | ✅ Cao |
| `_MN` | Số phút (Minutes) — hoặc mã nhóm tùy bảng | ⚠️ Suy luận |
| `_N1` | Trường tên phụ / biến thể 2 | ⚠️ Suy luận |
| `_N2` | Trường tên phụ / biến thể 3 | ⚠️ Suy luận |
| `_NG` | Chưa rõ nghĩa cụ thể (có thể là 'ngày') | ⚠️ Suy luận |
| `_NM` | Tên | ✅ Cao |
| `_NO` | Số (Number) | ✅ Cao |
| `_OK` | Trạng thái đã xác nhận / đồng ý | ⚠️ Suy luận |
| `_OR` | Gốc / ban đầu (Original) | ⚠️ Suy luận |
| `_OT` | Tăng ca (Overtime) | ✅ Cao |
| `_OV` | Tăng ca loại khác | ⚠️ Suy luận |
| `_PH` | Phép (nghỉ có lương) | ⚠️ Suy luận |
| `_QT` | Giá trị quy định (số lần/số tiền) | ⚠️ Suy luận |
| `_ST` | Bắt đầu (Start) | ✅ Cao |
| `_TL` | Tỷ lệ (Rate/%) | ⚠️ Suy luận |
| `_TM` | Giờ / thời điểm (Time) | ✅ Cao |
| `_TP` | Loại (Type) | ✅ Cao |
| `_TS` | Tổng số | ⚠️ Suy luận |
| `_TT` | Tổng / Trạng thái (tùy ngữ cảnh) | ⚠️ Suy luận |
| `_VL` | Giá trị (Value) | ✅ Cao |
| `_VN` | Tên tiếng Việt (đa ngôn ngữ) | ✅ Cao |
| `_YY` | Năm (Year) | ✅ Cao |

---

## 2. Danh mục tổng hợp toàn bộ 159 bảng

| STT | Tên bảng | Nhóm | Chức năng | Số cột | Ghi chú |
|---|---|---|---|---|---|
| 1 | `BH` | Khác / bảng tạm / bảng phụ trợ | *(xem chi tiết ở Phần 3)* | 4 |  |
| 2 | `CD_BH` | Khác / bảng tạm / bảng phụ trợ | *(xem chi tiết ở Phần 3)* | 3 |  |
| 3 | `Data` | Khác / bảng tạm / bảng phụ trợ | Bảng tạm / phụ trợ import-export **[Suy luận]** | 12 | bảng tạm |
| 4 | `FILA01A` | FILA – Danh mục / dữ liệu nền (Master data) | Công ty **[Xác nhận]** | 14 |  |
| 5 | `FILA02A` | FILA – Danh mục / dữ liệu nền (Master data) | Bộ Phận **[Xác nhận]** | 9 |  |
| 6 | `FILA02A1` | FILA – Danh mục / dữ liệu nền (Master data) | *(xem chi tiết ở Phần 3)* | 9 |  |
| 7 | `FILA03A` | FILA – Danh mục / dữ liệu nền (Master data) | Tỉnh Thành **[Xác nhận]** | 2 |  |
| 8 | `FILA04A` | FILA – Danh mục / dữ liệu nền (Master data) | Học Vấn **[Xác nhận]** | 2 |  |
| 9 | `FILA05A` | FILA – Danh mục / dữ liệu nền (Master data) | Chức Vụ **[Xác nhận]** | 2 |  |
| 10 | `FILA06A` | FILA – Danh mục / dữ liệu nền (Master data) | Lý Do Nghỉ Việc **[Xác nhận]** | 2 |  |
| 11 | `FILA07A` | FILA – Danh mục / dữ liệu nền (Master data) | Chức Danh Công Việc **[Xác nhận]** | 5 |  |
| 12 | `FILA07A1` | FILA – Danh mục / dữ liệu nền (Master data) | *(xem chi tiết ở Phần 3)* | 6 |  |
| 13 | `FILA07A_BK_20260115` | FILA – Danh mục / dữ liệu nền (Master data) | Bản sao/biến thể của `FILA07A` **[Suy luận]** | 5 | backup/biến thể |
| 14 | `FILA08A` | FILA – Danh mục / dữ liệu nền (Master data) | *(xem chi tiết ở Phần 3)* | 2 |  |
| 15 | `FILA09A` | FILA – Danh mục / dữ liệu nền (Master data) | *(xem chi tiết ở Phần 3)* | 4 |  |
| 16 | `FILA10A` | FILA – Danh mục / dữ liệu nền (Master data) | *(xem chi tiết ở Phần 3)* | 2 |  |
| 17 | `FILA10B` | FILA – Danh mục / dữ liệu nền (Master data) | Chứng chỉ **[Xác nhận]** | 2 |  |
| 18 | `FILA11A` | FILA – Danh mục / dữ liệu nền (Master data) | Loại Công Nhân **[Xác nhận]** | 15 |  |
| 19 | `FILA12A` | FILA – Danh mục / dữ liệu nền (Master data) | Dân Tộc **[Xác nhận]** | 2 |  |
| 20 | `FILA13A` | FILA – Danh mục / dữ liệu nền (Master data) | Loại Thưởng Phạt **[Xác nhận]** | 3 |  |
| 21 | `FILA13B` | FILA – Danh mục / dữ liệu nền (Master data) | Tiền Thưởng Phạt **[Xác nhận]** | 4 |  |
| 22 | `FILA14A` | FILA – Danh mục / dữ liệu nền (Master data) | *(xem chi tiết ở Phần 3)* | 2 |  |
| 23 | `FILA15A` | FILA – Danh mục / dữ liệu nền (Master data) | Phép **[Xác nhận]** | 11 |  |
| 24 | `FILA16A` | FILA – Danh mục / dữ liệu nền (Master data) | *(xem chi tiết ở Phần 3)* | 33 |  |
| 25 | `FILA17A` | FILA – Danh mục / dữ liệu nền (Master data) | *(xem chi tiết ở Phần 3)* | 2 |  |
| 26 | `FILA17AA` | FILA – Danh mục / dữ liệu nền (Master data) | *(xem chi tiết ở Phần 3)* | 6 |  |
| 27 | `FILA18A` | FILA – Danh mục / dữ liệu nền (Master data) | Tỉnh Thành **[Xác nhận]** | 2 |  |
| 28 | `FILA19A` | FILA – Danh mục / dữ liệu nền (Master data) | Bậc Lương **[Xác nhận]** | 154 |  |
| 29 | `FILB01A` | FILB – Hồ sơ nhân viên & biến động nhân sự | DS_Nhân viên **[Xác nhận]** | 48 |  |
| 30 | `FILB01AA` | FILB – Hồ sơ nhân viên & biến động nhân sự | *(xem chi tiết ở Phần 3)* | 8 |  |
| 31 | `FILB01AA1` | FILB – Hồ sơ nhân viên & biến động nhân sự | *(xem chi tiết ở Phần 3)* | 8 |  |
| 32 | `FILB01AB` | FILB – Hồ sơ nhân viên & biến động nhân sự | Hình **[Xác nhận]** | 2 |  |
| 33 | `FILB01AC` | FILB – Hồ sơ nhân viên & biến động nhân sự | Nghỉ Việc **[Xác nhận]** | 7 |  |
| 34 | `FILB01ACA` | FILB – Hồ sơ nhân viên & biến động nhân sự | Nghỉ Việc **[Xác nhận]** | 12 |  |
| 35 | `FILB01AD` | FILB – Hồ sơ nhân viên & biến động nhân sự | *(xem chi tiết ở Phần 3)* | 3 |  |
| 36 | `FILB01AE` | FILB – Hồ sơ nhân viên & biến động nhân sự | *(xem chi tiết ở Phần 3)* | 15 |  |
| 37 | `FILB01AF` | FILB – Hồ sơ nhân viên & biến động nhân sự | Hợp đồng **[Xác nhận]** | 19 |  |
| 38 | `FILB02A` | FILB – Hồ sơ nhân viên & biến động nhân sự | Thăng chức **[Xác nhận]** | 9 |  |
| 39 | `FILB03A` | FILB – Hồ sơ nhân viên & biến động nhân sự | Chuyển bộ phận **[Xác nhận]** | 10 |  |
| 40 | `FILB04A` | FILB – Hồ sơ nhân viên & biến động nhân sự | *(xem chi tiết ở Phần 3)* | 8 |  |
| 41 | `FILB05A` | FILB – Hồ sơ nhân viên & biến động nhân sự | *(xem chi tiết ở Phần 3)* | 15 |  |
| 42 | `FILB06A` | FILB – Hồ sơ nhân viên & biến động nhân sự | *(xem chi tiết ở Phần 3)* | 8 |  |
| 43 | `FILB07A` | FILB – Hồ sơ nhân viên & biến động nhân sự | *(xem chi tiết ở Phần 3)* | 15 |  |
| 44 | `FILB08A` | FILB – Hồ sơ nhân viên & biến động nhân sự | *(xem chi tiết ở Phần 3)* | 6 |  |
| 45 | `FILB09A` | FILB – Hồ sơ nhân viên & biến động nhân sự | *(xem chi tiết ở Phần 3)* | 9 |  |
| 46 | `FILC01A` | FILC – Chấm công / thời gian làm việc | Đơn Lieu Tho **[Xác nhận]** | 11 |  |
| 47 | `FILC01A_VS` | FILC – Chấm công / thời gian làm việc | Bản sao/biến thể của `FILC01A` **[Suy luận]** | 11 | backup/biến thể |
| 48 | `FILC01A_cu` | FILC – Chấm công / thời gian làm việc | Bản sao/biến thể của `FILC01A` **[Suy luận]** | 11 | backup/biến thể |
| 49 | `FILC02A` | FILC – Chấm công / thời gian làm việc | Danh Mục Ca **[Xác nhận]** | 15 |  |
| 50 | `FILC02B` | FILC – Chấm công / thời gian làm việc | *(xem chi tiết ở Phần 3)* | 19 |  |
| 51 | `FILC03A` | FILC – Chấm công / thời gian làm việc | Sap ca **[Xác nhận]** | 37 |  |
| 52 | `FILC04A` | FILC – Chấm công / thời gian làm việc | Đăng Ký Phép **[Xác nhận]** | 16 |  |
| 53 | `FILC04A_BK_To2021` | FILC – Chấm công / thời gian làm việc | Bản sao/biến thể của `FILC04A` **[Suy luận]** | 16 | backup/biến thể |
| 54 | `FILC04B` | FILC – Chấm công / thời gian làm việc | *(xem chi tiết ở Phần 3)* | 16 |  |
| 55 | `FILC04B_BK_To2021` | FILC – Chấm công / thời gian làm việc | Bản sao/biến thể của `FILC04B` **[Suy luận]** | 16 | backup/biến thể |
| 56 | `FILC04C` | FILC – Chấm công / thời gian làm việc | *(xem chi tiết ở Phần 3)* | 17 |  |
| 57 | `FILC05A` | FILC – Chấm công / thời gian làm việc | *(xem chi tiết ở Phần 3)* | 16 |  |
| 58 | `FILC06A` | FILC – Chấm công / thời gian làm việc | Cham Cong **[Xác nhận]** | 97 |  |
| 59 | `FILC06AA` | FILC – Chấm công / thời gian làm việc | Giờ cong tháng **[Xác nhận]** | 99 |  |
| 60 | `FILC06A_b` | FILC – Chấm công / thời gian làm việc | Bản sao/biến thể của `FILC06A` **[Suy luận]** | 97 | backup/biến thể |
| 61 | `FILC06A_c` | FILC – Chấm công / thời gian làm việc | Bản sao/biến thể của `FILC06A` **[Suy luận]** | 97 | backup/biến thể |
| 62 | `FILC06A_d` | FILC – Chấm công / thời gian làm việc | Bản sao/biến thể của `FILC06A` **[Suy luận]** | 97 | backup/biến thể |
| 63 | `FILC06A_e` | FILC – Chấm công / thời gian làm việc | Bản sao/biến thể của `FILC06A` **[Suy luận]** | 97 | backup/biến thể |
| 64 | `FILC06A_hiencc` | FILC – Chấm công / thời gian làm việc | Bản sao/biến thể của `FILC06A` **[Suy luận]** | 96 | backup/biến thể |
| 65 | `FILC06A_vinhtuyen` | FILC – Chấm công / thời gian làm việc | Bản sao/biến thể của `FILC06A` **[Suy luận]** | 97 | backup/biến thể |
| 66 | `FILC06B` | FILC – Chấm công / thời gian làm việc | *(xem chi tiết ở Phần 3)* | 92 |  |
| 67 | `FILC07A` | FILC – Chấm công / thời gian làm việc | *(xem chi tiết ở Phần 3)* | 10 |  |
| 68 | `FILC08A` | FILC – Chấm công / thời gian làm việc | Công thức **[Xác nhận]** | 12 |  |
| 69 | `FILC08A1` | FILC – Chấm công / thời gian làm việc | *(xem chi tiết ở Phần 3)* | 12 |  |
| 70 | `FILC09A` | FILC – Chấm công / thời gian làm việc | Nuoi con nho, Thai Sản **[Xác nhận]** | 12 |  |
| 71 | `FILC10A` | FILC – Chấm công / thời gian làm việc | *(xem chi tiết ở Phần 3)* | 10 |  |
| 72 | `FILC11A` | FILC – Chấm công / thời gian làm việc | *(xem chi tiết ở Phần 3)* | 3 |  |
| 73 | `FILC12A` | FILC – Chấm công / thời gian làm việc | *(xem chi tiết ở Phần 3)* | 3 |  |
| 74 | `FILC12B` | FILC – Chấm công / thời gian làm việc | *(xem chi tiết ở Phần 3)* | 13 |  |
| 75 | `FILC13A` | FILC – Chấm công / thời gian làm việc | *(xem chi tiết ở Phần 3)* | 37 |  |
| 76 | `FILC13A_DEP` | FILC – Chấm công / thời gian làm việc | Bản sao/biến thể của `FILC13A` **[Suy luận]** | 37 | backup/biến thể |
| 77 | `FILC14A` | FILC – Chấm công / thời gian làm việc | *(xem chi tiết ở Phần 3)* | 11 |  |
| 78 | `FILD01A` | FILD – Bảng lương / phúc lợi | *(xem chi tiết ở Phần 3)* | 13 |  |
| 79 | `FILD01B` | FILD – Bảng lương / phúc lợi | *(xem chi tiết ở Phần 3)* | 16 |  |
| 80 | `FILD02A` | FILD – Bảng lương / phúc lợi | Bang Luong **[Xác nhận]** | 119 |  |
| 81 | `FILD02A_1` | FILD – Bảng lương / phúc lợi | Bản sao/biến thể của `FILD02A` **[Suy luận]** | 70 | backup/biến thể |
| 82 | `FILD03A` | FILD – Bảng lương / phúc lợi | Bang Dieu Luong **[Xác nhận]** | 116 |  |
| 83 | `FILD04A` | FILD – Bảng lương / phúc lợi | Khen thưởng - Kỷ Luật **[Xác nhận]** | 13 |  |
| 84 | `FILD05A` | FILD – Bảng lương / phúc lợi | TTNCN **[Xác nhận]** | 2 |  |
| 85 | `FILD06A` | FILD – Bảng lương / phúc lợi | *(xem chi tiết ở Phần 3)* | 22 |  |
| 86 | `FILD07A` | FILD – Bảng lương / phúc lợi | *(xem chi tiết ở Phần 3)* | 3 |  |
| 87 | `FILE01A` | FILE – Hợp đồng lao động | Danh Mục Hợp Đồng **[Xác nhận]** | 16 |  |
| 88 | `FILE01B` | FILE – Hợp đồng lao động | *(xem chi tiết ở Phần 3)* | 5 |  |
| 89 | `FILE01BA` | FILE – Hợp đồng lao động | *(xem chi tiết ở Phần 3)* | 4 |  |
| 90 | `FILE02A` | FILE – Hợp đồng lao động | Loại Hợp Đồng **[Xác nhận]** | 5 |  |
| 91 | `FILE03A` | FILE – Hợp đồng lao động | Hop Dong TV 2T **[Xác nhận]** | 12 |  |
| 92 | `FILE05A` | FILE – Hợp đồng lao động | *(xem chi tiết ở Phần 3)* | 7 |  |
| 93 | `FILE05B` | FILE – Hợp đồng lao động | *(xem chi tiết ở Phần 3)* | 5 |  |
| 94 | `FILE05BA` | FILE – Hợp đồng lao động | *(xem chi tiết ở Phần 3)* | 4 |  |
| 95 | `FILE05BB` | FILE – Hợp đồng lao động | *(xem chi tiết ở Phần 3)* | 2 |  |
| 96 | `FILE06A` | FILE – Hợp đồng lao động | Chi Tiết Hợp đồng **[Xác nhận]** | 29 |  |
| 97 | `FILE07A` | FILE – Hợp đồng lao động | *(xem chi tiết ở Phần 3)* | 2 |  |
| 98 | `FILE07B` | FILE – Hợp đồng lao động | *(xem chi tiết ở Phần 3)* | 15 |  |
| 99 | `FILF01A` | FILF – Tài khoản đăng nhập / bảo mật nhân viên | Thông tin tài khoản **[Xác nhận]** | 49 |  |
| 100 | `FILF02A` | FILF – Tài khoản đăng nhập / bảo mật nhân viên | *(xem chi tiết ở Phần 3)* | 45 |  |
| 101 | `FILT01A` | FILT – Bảng tổng hợp/tra cứu thông tin nhân viên (tương tự FILB01A) | *(xem chi tiết ở Phần 3)* | 47 |  |
| 102 | `GP_ANNEXLABOURCONTRACT_FILENAME` | GP_ – Nghiệp vụ & tiện ích hệ thống GP8000 | *(xem chi tiết ở Phần 3)* | 3 |  |
| 103 | `GP_BACKUP` | GP_ – Nghiệp vụ & tiện ích hệ thống GP8000 | *(xem chi tiết ở Phần 3)* | 6 |  |
| 104 | `GP_EXCEL_DETAIL` | GP_ – Nghiệp vụ & tiện ích hệ thống GP8000 | Bảng tạm / phụ trợ import-export **[Suy luận]** | 3 | bảng tạm |
| 105 | `GP_EXCEL_MASTER` | GP_ – Nghiệp vụ & tiện ích hệ thống GP8000 | Bảng tạm / phụ trợ import-export **[Suy luận]** | 1 | bảng tạm |
| 106 | `GP_HISTORY` | GP_ – Nghiệp vụ & tiện ích hệ thống GP8000 | *(xem chi tiết ở Phần 3)* | 4 |  |
| 107 | `GP_HISTORYINPUTPIECERATE` | GP_ – Nghiệp vụ & tiện ích hệ thống GP8000 | *(xem chi tiết ở Phần 3)* | 6 |  |
| 108 | `GP_KEY` | GP_ – Nghiệp vụ & tiện ích hệ thống GP8000 | *(xem chi tiết ở Phần 3)* | 3 |  |
| 109 | `GP_LABOURCONTRACT_FILENAME` | GP_ – Nghiệp vụ & tiện ích hệ thống GP8000 | *(xem chi tiết ở Phần 3)* | 3 |  |
| 110 | `GP_MONTHADDUP` | GP_ – Nghiệp vụ & tiện ích hệ thống GP8000 | *(xem chi tiết ở Phần 3)* | 7 |  |
| 111 | `GP_SYS_GET_ATTFOR` | GP_SYS_ – Cấu hình & tiện ích hệ thống GP8000 | *(xem chi tiết ở Phần 3)* | 3 |  |
| 112 | `GP_SYS_GET_PAYROLLFOR` | GP_SYS_ – Cấu hình & tiện ích hệ thống GP8000 | *(xem chi tiết ở Phần 3)* | 7 |  |
| 113 | `GP_SYS_MESSAGE` | GP_SYS_ – Cấu hình & tiện ích hệ thống GP8000 | *(xem chi tiết ở Phần 3)* | 1 |  |
| 114 | `GP_SYS_READER` | GP_SYS_ – Cấu hình & tiện ích hệ thống GP8000 | *(xem chi tiết ở Phần 3)* | 6 |  |
| 115 | `GP_SYS_READER_TYPE` | GP_SYS_ – Cấu hình & tiện ích hệ thống GP8000 | *(xem chi tiết ở Phần 3)* | 2 |  |
| 116 | `GP_SYS_SETTING` | GP_SYS_ – Cấu hình & tiện ích hệ thống GP8000 | *(xem chi tiết ở Phần 3)* | 15 |  |
| 117 | `GP_SYS_SHIFT` | GP_SYS_ – Cấu hình & tiện ích hệ thống GP8000 | *(xem chi tiết ở Phần 3)* | 7 |  |
| 118 | `GP_SYS_SQL_FROM` | GP_SYS_ – Cấu hình & tiện ích hệ thống GP8000 | *(xem chi tiết ở Phần 3)* | 3 |  |
| 119 | `GP_SYS_SQL_SELECT` | GP_SYS_ – Cấu hình & tiện ích hệ thống GP8000 | *(xem chi tiết ở Phần 3)* | 8 |  |
| 120 | `GP_SYS_STAFFSEARCH` | GP_SYS_ – Cấu hình & tiện ích hệ thống GP8000 | *(xem chi tiết ở Phần 3)* | 3 |  |
| 121 | `GP_SYS_SYNGPS` | GP_SYS_ – Cấu hình & tiện ích hệ thống GP8000 | *(xem chi tiết ở Phần 3)* | 5 |  |
| 122 | `GSC_FILE01A` | GSC_ – Module chấm công phụ (đầu đọc thẻ / cổng vào-ra) | *(xem chi tiết ở Phần 3)* | 5 |  |
| 123 | `GSC_FILE01B` | GSC_ – Module chấm công phụ (đầu đọc thẻ / cổng vào-ra) | *(xem chi tiết ở Phần 3)* | 12 |  |
| 124 | `GSC_FILE01C` | GSC_ – Module chấm công phụ (đầu đọc thẻ / cổng vào-ra) | *(xem chi tiết ở Phần 3)* | 6 |  |
| 125 | `GSC_FILE01D` | GSC_ – Module chấm công phụ (đầu đọc thẻ / cổng vào-ra) | *(xem chi tiết ở Phần 3)* | 4 |  |
| 126 | `HistoryOfFILA06A` | Khác / bảng tạm / bảng phụ trợ | *(xem chi tiết ở Phần 3)* | 6 |  |
| 127 | `LoaiNV` | Khác / bảng tạm / bảng phụ trợ | Bảng tạm / phụ trợ import-export **[Suy luận]** | 2 | bảng tạm |
| 128 | `NVMOI` | Khác / bảng tạm / bảng phụ trợ | Bảng tạm / phụ trợ import-export **[Suy luận]** | 48 | bảng tạm |
| 129 | `P_FILA10A` | Khác / bảng tạm / bảng phụ trợ | Bảng tạm / phụ trợ import-export **[Suy luận]** | 2 | bảng tạm |
| 130 | `P_FILB01A` | Khác / bảng tạm / bảng phụ trợ | Bảng tạm / phụ trợ import-export **[Suy luận]** | 5 | bảng tạm |
| 131 | `P_FILB01B` | Khác / bảng tạm / bảng phụ trợ | Bảng tạm / phụ trợ import-export **[Suy luận]** | 11 | bảng tạm |
| 132 | `SYS_BS_TAPRINTOUT_GETCOLS` | SYS_ – Hệ thống chung (người dùng, phân quyền, menu, nhãn) | *(xem chi tiết ở Phần 3)* | 9 |  |
| 133 | `SYS_CONTROL_USER` | SYS_ – Hệ thống chung (người dùng, phân quyền, menu, nhãn) | *(xem chi tiết ở Phần 3)* | 4 |  |
| 134 | `SYS_GROUP` | SYS_ – Hệ thống chung (người dùng, phân quyền, menu, nhãn) | *(xem chi tiết ở Phần 3)* | 2 |  |
| 135 | `SYS_HELP` | SYS_ – Hệ thống chung (người dùng, phân quyền, menu, nhãn) | *(xem chi tiết ở Phần 3)* | 5 |  |
| 136 | `SYS_LABEL` | SYS_ – Hệ thống chung (người dùng, phân quyền, menu, nhãn) | *(xem chi tiết ở Phần 3)* | 7 |  |
| 137 | `SYS_LABEL_PMENU` | SYS_ – Hệ thống chung (người dùng, phân quyền, menu, nhãn) | *(xem chi tiết ở Phần 3)* | 13 |  |
| 138 | `SYS_LABEL_RPT` | SYS_ – Hệ thống chung (người dùng, phân quyền, menu, nhãn) | *(xem chi tiết ở Phần 3)* | 7 |  |
| 139 | `SYS_LABEL_VS` | SYS_ – Hệ thống chung (người dùng, phân quyền, menu, nhãn) | *(xem chi tiết ở Phần 3)* | 7 |  |
| 140 | `SYS_LABEL_VS_ATT` | SYS_ – Hệ thống chung (người dùng, phân quyền, menu, nhãn) | *(xem chi tiết ở Phần 3)* | 7 |  |
| 141 | `SYS_LOG_INFO` | SYS_ – Hệ thống chung (người dùng, phân quyền, menu, nhãn) | *(xem chi tiết ở Phần 3)* | 4 |  |
| 142 | `SYS_MENU` | SYS_ – Hệ thống chung (người dùng, phân quyền, menu, nhãn) | *(xem chi tiết ở Phần 3)* | 11 |  |
| 143 | `SYS_MSG` | SYS_ – Hệ thống chung (người dùng, phân quyền, menu, nhãn) | *(xem chi tiết ở Phần 3)* | 7 |  |
| 144 | `SYS_SECURITY` | SYS_ – Hệ thống chung (người dùng, phân quyền, menu, nhãn) | *(xem chi tiết ở Phần 3)* | 11 |  |
| 145 | `SYS_SECURITY_DEP` | SYS_ – Hệ thống chung (người dùng, phân quyền, menu, nhãn) | Phan Quyen theo User **[Xác nhận]** | 4 |  |
| 146 | `SYS_SECURITY_TYP` | SYS_ – Hệ thống chung (người dùng, phân quyền, menu, nhãn) | *(xem chi tiết ở Phần 3)* | 4 |  |
| 147 | `SYS_SQL_FROM` | SYS_ – Hệ thống chung (người dùng, phân quyền, menu, nhãn) | *(xem chi tiết ở Phần 3)* | 3 |  |
| 148 | `SYS_SQL_SELECT` | SYS_ – Hệ thống chung (người dùng, phân quyền, menu, nhãn) | *(xem chi tiết ở Phần 3)* | 8 |  |
| 149 | `SYS_USER` | SYS_ – Hệ thống chung (người dùng, phân quyền, menu, nhãn) | *(xem chi tiết ở Phần 3)* | 4 |  |
| 150 | `S_LABEL_T` | SYS_ – Hệ thống chung (người dùng, phân quyền, menu, nhãn) | *(xem chi tiết ở Phần 3)* | 8 |  |
| 151 | `SelectTemp` | Khác / bảng tạm / bảng phụ trợ | Bảng tạm / phụ trợ import-export **[Suy luận]** | 8 | bảng tạm |
| 152 | `Temp` | Khác / bảng tạm / bảng phụ trợ | Bảng tạm / phụ trợ import-export **[Suy luận]** | 7 | bảng tạm |
| 153 | `Temp_vs` | Khác / bảng tạm / bảng phụ trợ | Bảng tạm / phụ trợ import-export **[Suy luận]** | 7 | bảng tạm |
| 154 | `TransferExcelToDB_Setting` | Khác / bảng tạm / bảng phụ trợ | Bảng tạm / phụ trợ import-export **[Suy luận]** | 9 | bảng tạm |
| 155 | `chuyen` | Khác / bảng tạm / bảng phụ trợ | Bảng tạm / phụ trợ import-export **[Suy luận]** | 20 | bảng tạm |
| 156 | `dtproperties` | Khác / bảng tạm / bảng phụ trợ | Bảng tạm / phụ trợ import-export **[Suy luận]** | 7 | bảng tạm |
| 157 | `dulieu` | Khác / bảng tạm / bảng phụ trợ | Bảng tạm / phụ trợ import-export **[Suy luận]** | 2 | bảng tạm |
| 158 | `selecttemp_GP` | Khác / bảng tạm / bảng phụ trợ | Bảng tạm / phụ trợ import-export **[Suy luận]** | 8 | bảng tạm |
| 159 | `sysdiagrams` | Khác / bảng tạm / bảng phụ trợ | Bảng tạm / phụ trợ import-export **[Suy luận]** | 5 | bảng tạm |

---
## 3. Chi tiết từng bảng theo nhóm

### FILA – Danh mục / dữ liệu nền (Master data)

#### `FILA01A` — Công ty **[Xác nhận]**

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `COM_ID` | INT NOT NULL | Công ty (Mã (khóa nhận diện)) |
| `COM_N1` | NVARCHAR(50) NULL | Công ty (Trường tên phụ / biến thể 2)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `COM_N2` | NVARCHAR(80) NULL | Công ty (Trường tên phụ / biến thể 3)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `TEL_N1` | NVARCHAR(20) NULL | Điện thoại (Trường tên phụ / biến thể 2)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `TEL_N2` | NVARCHAR(20) NULL | Điện thoại (Trường tên phụ / biến thể 3)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `FAX_N1` | NVARCHAR(20) NULL | Số fax (Trường tên phụ / biến thể 2)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `FAX_N2` | NVARCHAR(20) NULL | Số fax (Trường tên phụ / biến thể 3)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `WEB_AD` | NVARCHAR(50) NULL | Website (Địa chỉ (Address)) |
| `EMA_NM` | NVARCHAR(50) NULL | Email (Tên) |
| `ADD_DR` | NVARCHAR(200) NULL | Địa chỉ (Nội dung diễn giải / ghi chú dạng text) |
| `ACC_NO` | NVARCHAR(20) NULL | Tài khoản ngân hàng (Số (Number)) |
| `COM_CD` | NVARCHAR(20) NULL | Công ty (Mã (Code))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `BNK_NM` | NVARCHAR(100) NULL | Ngân hàng (Tên) |
| `ACT_BT` | BIT NULL DEFAULT (0) | Trạng thái hoạt động (Cờ đúng-sai (Bit: 1/0))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |

#### `FILA02A` — Bộ Phận **[Xác nhận]**

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `DEP_ID` | NVARCHAR(10) NOT NULL | Phòng ban / Bộ phận (Mã (khóa nhận diện)) |
| `DEP_NM` | NVARCHAR(100) NULL | Phòng ban / Bộ phận (Tên) |
| `DEP_N1` | NVARCHAR(100) NULL | Phòng ban / Bộ phận (Trường tên phụ / biến thể 2)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `DEP_HG` | NVARCHAR(200) NULL | Phòng ban / Bộ phận |
| `COL_NO` | NVARCHAR(20) NULL | Cột dữ liệu (Column) — dùng trong bảng cấu hình cột động (Số (Number)) |
| `PEO_TT` | INT NULL | Số người (People) (Tổng / Trạng thái (tùy ngữ cảnh))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `SEG_HR` | INT NULL | Phân đoạn / hạn mức (Segment) (Số giờ (Hours))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `ROU_MN` | INT NULL | Làm tròn (Round) (Số phút (Minutes) — hoặc mã nhóm tùy bảng)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `REM_DR` | NVARCHAR(50) NULL | Ghi chú / Remark (Nội dung diễn giải / ghi chú dạng text) |

#### `FILA02A1` — *(xem chi tiết ở Phần 3)*

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `DEP_ID` | NVARCHAR(10) NOT NULL | Phòng ban / Bộ phận (Mã (khóa nhận diện)) |
| `DEP_NM` | NVARCHAR(100) NULL | Phòng ban / Bộ phận (Tên) |
| `DEP_N1` | NVARCHAR(100) NULL | Phòng ban / Bộ phận (Trường tên phụ / biến thể 2)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `DEP_HG` | NVARCHAR(200) NULL | Phòng ban / Bộ phận |
| `COL_NO` | NVARCHAR(20) NULL | Cột dữ liệu (Column) — dùng trong bảng cấu hình cột động (Số (Number)) |
| `PEO_TT` | INT NULL | Số người (People) (Tổng / Trạng thái (tùy ngữ cảnh))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `SEG_HR` | INT NULL | Phân đoạn / hạn mức (Segment) (Số giờ (Hours))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `ROU_MN` | INT NULL | Làm tròn (Round) (Số phút (Minutes) — hoặc mã nhóm tùy bảng)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `REM_DR` | NVARCHAR(50) NULL | Ghi chú / Remark (Nội dung diễn giải / ghi chú dạng text) |

#### `FILA03A` — Tỉnh Thành **[Xác nhận]**

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `CIT_ID` | NVARCHAR(3) NOT NULL | Tỉnh / Thành phố (Mã (khóa nhận diện)) |
| `CIT_NM` | NVARCHAR(50) NULL | Tỉnh / Thành phố (Tên) |

#### `FILA04A` — Học Vấn **[Xác nhận]**

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `EDU_ID` | NVARCHAR(3) NOT NULL | Trình độ học vấn (Mã (khóa nhận diện)) |
| `EDU_NM` | NVARCHAR(50) NULL | Trình độ học vấn (Tên) |

#### `FILA05A` — Chức Vụ **[Xác nhận]**

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `PRO_ID` | NVARCHAR(3) NOT NULL | Trình độ chuyên môn (hoặc: Thử việc - Probation, tùy bảng) (Mã (khóa nhận diện))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `PRO_NM` | NVARCHAR(50) NULL | Trình độ chuyên môn (hoặc: Thử việc - Probation, tùy bảng) (Tên)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |

#### `FILA06A` — Lý Do Nghỉ Việc **[Xác nhận]**

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `VAC_ID` | NVARCHAR(3) NOT NULL | Nghỉ việc (lý do/trạng thái thôi việc) (Mã (khóa nhận diện)) |
| `VAC_NM` | NVARCHAR(50) NULL | Nghỉ việc (lý do/trạng thái thôi việc) (Tên) |

#### `FILA07A` — Chức Danh Công Việc **[Xác nhận]**

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `POS_ID` | NVARCHAR(3) NOT NULL | Chức vụ / Vị trí công việc (Mã (khóa nhận diện)) |
| `POS_NM` | NVARCHAR(50) NULL | Chức vụ / Vị trí công việc (Tên) |
| `POS_N1` | NVARCHAR(50) NULL | Chức vụ / Vị trí công việc (Trường tên phụ / biến thể 2)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `COL_NO` | NVARCHAR(20) NULL | Cột dữ liệu (Column) — dùng trong bảng cấu hình cột động (Số (Number)) |
| `POS_DR` | NVARCHAR(3) NULL | Chức vụ / Vị trí công việc (Nội dung diễn giải / ghi chú dạng text) |

#### `FILA07A1` — *(xem chi tiết ở Phần 3)*

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `POS_ID` | NVARCHAR(3) NOT NULL | Chức vụ / Vị trí công việc (Mã (khóa nhận diện)) |
| `POS_NM` | NVARCHAR(50) NULL | Chức vụ / Vị trí công việc (Tên) |
| `POS_N1` | NVARCHAR(50) NULL | Chức vụ / Vị trí công việc (Trường tên phụ / biến thể 2)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `COL_NO` | NVARCHAR(20) NULL | Cột dữ liệu (Column) — dùng trong bảng cấu hình cột động (Số (Number)) |
| `POS_DR` | NVARCHAR(3) NULL | Chức vụ / Vị trí công việc (Nội dung diễn giải / ghi chú dạng text) |
| `POS_DI` | VARCHAR(1) NULL | Chức vụ / Vị trí công việc |

#### `FILA07A_BK_20260115` — Bản sao/biến thể của `FILA07A` **[Suy luận]**

Bảng này có cấu trúc tương tự bảng gốc **`FILA07A`** (xem chi tiết cột tại mục bảng đó). Đây là bản sao lưu / biến thể lịch sử, **khuyến nghị không cần map sang backend mới**, trừ khi cần đối chiếu dữ liệu cũ.

#### `FILA08A` — *(xem chi tiết ở Phần 3)*

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `GRP_ID` | NVARCHAR(3) NOT NULL | Nhóm (Mã (khóa nhận diện)) |
| `GRP_NM` | NVARCHAR(50) NULL | Nhóm (Tên) |

#### `FILA09A` — *(xem chi tiết ở Phần 3)*

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `GRT_ID` | NVARCHAR(3) NOT NULL | Nhóm lương (Mã (khóa nhận diện))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `GRT_NM` | NVARCHAR(50) NULL | Nhóm lương (Tên)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `GRP_ID` | NVARCHAR(3) NULL | Nhóm (Mã (khóa nhận diện)) |
| `AMT_QT` | FLOAT NULL | Số tiền quy định (Giá trị quy định (số lần/số tiền))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |

#### `FILA10A` — *(xem chi tiết ở Phần 3)*

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `GRA_ID` | NVARCHAR(3) NOT NULL | Bằng cấp / Nơi tốt nghiệp (Mã (khóa nhận diện))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `GRA_NM` | NVARCHAR(50) NULL | Bằng cấp / Nơi tốt nghiệp (Tên)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |

#### `FILA10B` — Chứng chỉ **[Xác nhận]**

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `CTF_ID` | NVARCHAR(4) NOT NULL | (Mã (khóa nhận diện)) |
| `CTF_NM` | NVARCHAR(100) NULL | (Tên) |

#### `FILA11A` — Quy Định Ngày Phép Năm Cho Công Nhân **[Xác nhận]** 

| Cột      | Kiểu dữ liệu         | Giải nghĩa                                                          |
| -------- | -------------------- | ------------------------------------------------------------------- |
| `TYP_ID` | NVARCHAR(3) NOT NULL | Loại / Phân loại (Mã (khóa nhận diện))                              |
| `TYP_NM` | NVARCHAR(50) NULL    | Loại / Phân loại (Tên Loại Phép)                                    |
| `LEA_DY` | INT NULL DEFAULT (0) | Số Ngày Phép Năm Được Nghỉ (Leave) (Số ngày (Days))                 |
| `NEW_OD` | INT NULL DEFAULT (0) | Nhân viên mới  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `STR_DT` | INT NULL DEFAULT (0) | Bắt đầu (Start) (Ngày (Date))                                       |
| `WAG_MM` | INT NULL             | (Tháng (Month))                                                     |
| `SEN_YY` | INT NULL             | Thâm niên (Seniority) (Năm (Year))                                  |
| `SEN_DY` | INT NULL             | Thâm niên (Seniority) (Số ngày (Days))                              |
| `BLT_NM` | NVARCHAR(50) NULL    | Người tạo bản ghi (Built by) (Tên)                                  |
| `BLT_DT` | DATETIME NULL        | Người tạo bản ghi (Built by) (Ngày (Date))                          |
| `LST_NM` | NVARCHAR(50) NULL    | Người & thời gian sửa lần cuối (Last update) (Tên)                  |
| `LST_DT` | DATETIME NULL        | Người & thời gian sửa lần cuối (Last update) (Ngày (Date))          |
| `LEA_PY` | INT NULL             | Nghỉ phép (Leave)                                                   |
| `LEA_DM` | INT NULL             | Nghỉ phép (Leave)                                                   |
| `CHK_LB` | BIT NULL             | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ.    |

#### `FILA12A` — Dân Tộc **[Xác nhận]**

| Cột      | Kiểu dữ liệu         | Giải nghĩa                                                                          |
| -------- | -------------------- | ----------------------------------------------------------------------------------- |
| `COU_ID` | NVARCHAR(3) NOT NULL | Dân Tộc (Mã (khóa nhận diện))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `COU_NM` | NVARCHAR(50) NULL    | Dân Tộc (Tên)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại*                 |

#### `FILA13A` — Loại Thưởng Phạt **[Xác nhận]**

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `BAF_ID` | NVARCHAR(3) NOT NULL | Loại thưởng phạt (Mã (khóa nhận diện)) |
| `BAF_NM` | NVARCHAR(50) NULL | Loại thưởng phạt (Tên) |
| `TPE_ID` | BIT NULL | Loại (Type) (Mã (khóa nhận diện))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |

#### `FILA13B` — Tiền Thưởng Phạt **[Xác nhận]**

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `BAF_ID` | NVARCHAR(3) NOT NULL | Loại thưởng phạt (Mã (khóa nhận diện)) |
| `TIM_QT` | INT NOT NULL | Số lần quy định (Giá trị quy định (số lần/số tiền))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `AMT_QT` | FLOAT NULL DEFAULT (0) | Số tiền quy định (Giá trị quy định (số lần/số tiền))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `VAC_ID` | NVARCHAR(3) NULL | Nghỉ việc (lý do/trạng thái thôi việc) (Mã (khóa nhận diện)) |

#### `FILA14A` — *(xem chi tiết ở Phần 3)*

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `JUR_ID` | NVARCHAR(3) NOT NULL | Chưa rõ nghĩa cụ thể (có thể liên quan quyết định/chức danh pháp lý) (Mã (khóa nhận diện))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `JUR_NM` | NVARCHAR(50) NULL | Chưa rõ nghĩa cụ thể (có thể liên quan quyết định/chức danh pháp lý) (Tên)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |

#### `FILA15A` — Loại Phép **[Xác nhận]**

| Cột      | Kiểu dữ liệu         | Giải nghĩa                                                                                     |
| -------- | -------------------- | ---------------------------------------------------------------------------------------------- |
| `LEA_ID` | NVARCHAR(3) NOT NULL | Nghỉ phép (Leave) (Mã (khóa nhận diện))                                                        |
| `SEQ_NO` | NVARCHAR(3) NULL     | Số thứ tự (Số (Number))                                                                        |
| `COL_NM` | NVARCHAR(50) NULL    | Cột dữ liệu (Column) — dùng trong bảng cấu hình cột động (Tên)                                 |
| `LEA_NM` | NVARCHAR(50) NULL    | Nghỉ phép (Leave) (Tên)                                                                        |
| `SHR_NM` | NVARCHAR(5) NULL     | (Tên)                                                                                          |
| `DAY_MM` | INT NULL             | Ngày (Tháng (Month))                                                                           |
| `DAY_YY` | INT NULL             | Ngày (Năm (Year))                                                                              |
| `DAY_QT` | INT NULL             | Ngày (Giá trị quy định (số lần/số tiền))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `DAY_TM` | INT NULL             | Ngày (Giờ / thời điểm (Time))                                                                  |
| `SAL_CK` | BIT NULL             | (Người kiểm tra (Check))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại*                 |
| `HOL_BT` | BIT NULL             | Ngày lễ (Holiday) (Cờ đúng-sai (Bit: 1/0))                                                     |

#### `FILA16A` — *(xem chi tiết ở Phần 3)* Không sử dụng.

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `YYY_YY` | NVARCHAR(4) NOT NULL | Năm (Năm (Year)) |
| `MMM_MM` | INT NOT NULL | Tháng (Tháng (Month)) |
| `h1` | BIT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `h2` | BIT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `h3` | BIT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `h4` | BIT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `h5` | BIT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `h6` | BIT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `h7` | BIT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `h8` | BIT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `h9` | BIT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `h10` | BIT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `h11` | BIT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `h12` | BIT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `h13` | BIT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `h14` | BIT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `h15` | BIT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `h16` | BIT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `h17` | BIT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `h18` | BIT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `h19` | BIT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `h20` | BIT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `h21` | BIT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `h22` | BIT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `h23` | BIT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `h24` | BIT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `h25` | BIT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `h26` | BIT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `h27` | BIT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `h28` | BIT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `h29` | BIT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `h30` | BIT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `h31` | BIT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |

#### `FILA17A` — *(xem chi tiết ở Phần 3)*

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `MAC_ID` | NVARCHAR(50) NOT NULL | (Mã (khóa nhận diện)) |
| `ATT_BT` | BIT NULL | Chấm công / Có mặt (Cờ đúng-sai (Bit: 1/0)) |

#### `FILA17AA` — *(xem chi tiết ở Phần 3)*

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `SEQ_NO` | INT NOT NULL | Số thứ tự (Số (Number)) |
| `MCH_ID` | NVARCHAR(3) NOT NULL | (Mã (khóa nhận diện)) |
| `MCH_NM` | NVARCHAR(50) NULL | (Tên) |
| `CON_TP` | NVARCHAR(3) NULL | Điều kiện / Kết nối (Loại (Type))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `ADD_IP` | NVARCHAR(15) NULL | Địa chỉ |
| `ATT_BT` | BIT NULL | Chấm công / Có mặt (Cờ đúng-sai (Bit: 1/0)) |

#### `FILA18A` — Tỉnh Thành **[Xác nhận]**

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `NAT_ID` | NVARCHAR(10) NOT NULL | Quốc tịch (Mã (khóa nhận diện)) |
| `NAT_NM` | NVARCHAR(50) NULL | Quốc tịch (Tên) |

#### `FILA19A` — Bậc Lương **[Xác nhận]**

> ⚠️ Bảng có **154 cột** (nhiều khả năng là bảng tổng hợp/ma trận theo ngày hoặc theo ca). Danh sách đầy đủ bên dưới, nhưng nhiều cột lặp lại theo mẫu số thứ tự (01, 02, 03...) cùng một ý nghĩa nghiệp vụ.

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `LEV_ID` | NVARCHAR(3) NOT NULL | Cấp bậc / Bậc lương (Level) (Mã (khóa nhận diện)) |
| `LEV_NM` | NVARCHAR(50) NULL | Cấp bậc / Bậc lương (Level) (Tên) |
| `AMT_QT` | FLOAT NULL | Số tiền quy định (Giá trị quy định (số lần/số tiền))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `LuongCB` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `TongNgayCong` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `TienChuyenCan` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `TongLuong` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `BaoHiem` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `GiamTruGiaCanh` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `ThuNhapTinhThue` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `ThueTNCN` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `ThucLanh` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `LuongCoBan` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `LuongThuViec` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `LuongBHXH` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `PhuCap` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `ThueTN` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `CongKhac` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `Thuong` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `BHXH` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `BHYT` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `TamUng` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `CongDoan` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `aa` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `ThueNha` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `phucapcongviec` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `trocap` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `mucluongcoban` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `mucPCcongviec` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `muctrocap` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `mucchuyencan` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `muctongluong` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `gioTC15` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `gioTC2` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `gioTC185` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `gioTC3` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `nghihuongluong` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `tonggioTC` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `chuyencan` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `luong15` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `luong2` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `luong185` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `luong3` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `tongluong2` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `tongtinh` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `BHXH6` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `BHYT15` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `BHTN1` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `tongtinhBH` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `BHXH16` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `BHYT3` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `PCkhac` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `dieuchinhluong` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `thuethunhap` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `thuongsanluong` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `ngaycongchuan` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `giamtrugiacanh_n` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `DK_thueTN` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `NgayLVTrongThang` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `NgayLe` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `NgayPN` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `GioTC` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `GioTCCN` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `GioTCQD` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `GioTCLE` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `TienLe` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `TienPN` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `TienTC` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `TienTCCN` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `TienTCLe` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `PhanComTC` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `LuongSanPham` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `TongGioCong` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `LuongSanPhamGio` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `PhuCapNNDH` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `PhuCapChucVu` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `TongLuongCB` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `LuongCBGio` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `TienGioCongTieuChuan` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `GioCong` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `GioPhepCoLuong` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `TienPhepCoLuong` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `TienThuongNangLuc` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `TienThuongSanXuat` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `TienThuongSanXuat_TL` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `TroCapXe` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `TroCapCom` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `TroCapComTC` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `PhiSinhHoat` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `BoiDuongDocHai` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `BuKhac` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `TruTienCom` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `TruTangCa` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `VonVayCEP` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `SoNguoiPhuThuoc` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `LoaiLuong` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `PhiHoTroGiuTre` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `ThuNhapTinhThue_TT` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `TienTCQD` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `TienThuongNangSuat` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `GioCaDem` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `TienCaDem` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `CongDoan_OK` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `BHTN_OK` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `TienThuongNangLuc_TL` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `TienThuongDacBiet` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `TienComXeCN` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `TienComXeLE` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `TienComXeSHDem` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `TienComXeSHQuaDem` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `TongLuongTrongGio` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `ThucLanhTrongGio` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `TongLuongNgoaiGio` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `ThuNhapTinhThueTG` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `ThueTNCN_TG` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `TruTamUng` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `GioLe` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `GioTCVuot` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `TienTCVuot` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `TroCapComTCVuot` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `GioCN_NG` | FLOAT NULL | (Chưa rõ nghĩa cụ thể (có thể là 'ngày'))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `TienCN_NG` | FLOAT NULL | (Chưa rõ nghĩa cụ thể (có thể là 'ngày'))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `TienComXeCN_NG` | FLOAT NULL | (Chưa rõ nghĩa cụ thể (có thể là 'ngày'))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `Thuongtet` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `Thuongchungnhan` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `Songaypnnv` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `Hesopn` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `Sothangconlai` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `Sopnngayconlai` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `NgayleT` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `Tienlethem` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `ThuongDBCT` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `HAV_QTCT` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `ADD_QTCT` | FLOAT NULL | Địa chỉ |
| `BOR_QTCT` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `DID_QTCT` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `A` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `Ngayphepnamdh` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `PCHSE` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `BDDH` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `tiencomle` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `tiencomcn` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `tienxecn` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `tienxele` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `Tongluongcb_PL` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `Songayphep_NDH` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `LuongCBgiocong` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `HoanThue` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `GioPhep` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `LuongCBgioTC` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `LuongNgungViec` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `Alowance` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `ThuongNangSuat` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `NCC` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |

### FILB – Hồ sơ nhân viên & biến động nhân sự

#### `FILB01A` — DS_Nhân viên **[Xác nhận]**

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `EMP_ID` | NVARCHAR(20) NOT NULL | Nhân viên (Mã (khóa nhận diện)) |
| `EMP_I1` | NVARCHAR(20) NULL | Nhân viên (Trường phụ / biến thể 1)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `EMP_NM` | NVARCHAR(50) NULL | Nhân viên (Tên) |
| `EMP_N1` | NVARCHAR(50) NULL | Nhân viên (Trường tên phụ / biến thể 2)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `MST_DR` | NVARCHAR(13) NULL | Mã số thuế (Nội dung diễn giải / ghi chú dạng text) |
| `BIR_DT` | NVARCHAR(10) NULL | Ngày sinh (Ngày (Date)) |
| `SEX_BT` | BIT NULL | Giới tính (Cờ đúng-sai (Bit: 1/0)) |
| `MAR_BT` | BIT NULL | Tình trạng hôn nhân (Cờ đúng-sai (Bit: 1/0)) |
| `DEP_ID` | NVARCHAR(10) NULL | Phòng ban / Bộ phận (Mã (khóa nhận diện)) |
| `COU_ID` | NVARCHAR(10) NULL | Huyện / Quận (Mã (khóa nhận diện))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `CRD_NO` | NVARCHAR(20) NULL | CMND / CCCD (Chứng minh nhân dân / Căn cước công dân) (Số (Number)) |
| `POS_ID` | NVARCHAR(10) NULL | Chức vụ / Vị trí công việc (Mã (khóa nhận diện)) |
| `ADD_DR` | NVARCHAR(255) NULL | Địa chỉ (Nội dung diễn giải / ghi chú dạng text) |
| `ADD_D1` | NVARCHAR(255) NULL | Địa chỉ (Trường phụ / biến thể của cột ngày hoặc diễn giải)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `INH_DT` | DATETIME NULL | Ngày vào công ty (Hire date) (Ngày (Date)) |
| `CRD_ID` | NVARCHAR(20) NULL | CMND / CCCD (Chứng minh nhân dân / Căn cước công dân) (Mã (khóa nhận diện)) |
| `CRD_DT` | DATETIME NULL | CMND / CCCD (Chứng minh nhân dân / Căn cước công dân) (Ngày (Date)) |
| `CRD_LC` | NVARCHAR(255) NULL | CMND / CCCD (Chứng minh nhân dân / Căn cước công dân) (Nơi cấp / địa điểm (Location)) |
| `CIT_ID` | NVARCHAR(10) NULL | Tỉnh / Thành phố (Mã (khóa nhận diện)) |
| `RAC_NM` | NVARCHAR(50) NULL | Dân tộc (Tên) |
| `NAT_CO` | NVARCHAR(50) NULL | Quốc tịch (Quốc gia (Country)) |
| `EDU_ID` | NVARCHAR(10) NULL | Trình độ học vấn (Mã (khóa nhận diện)) |
| `PRO_ID` | NVARCHAR(10) NULL | Trình độ chuyên môn (hoặc: Thử việc - Probation, tùy bảng) (Mã (khóa nhận diện))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `GRA_ID` | NVARCHAR(10) NULL | Bằng cấp / Nơi tốt nghiệp (Mã (khóa nhận diện))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `TEL_NO` | NVARCHAR(50) NULL | Điện thoại (Số (Number)) |
| `TYP_ID` | NVARCHAR(10) NULL | Loại / Phân loại (Mã (khóa nhận diện)) |
| `ACC_NO` | NVARCHAR(20) NULL | Tài khoản ngân hàng (Số (Number)) |
| `ACC_NM` | NVARCHAR(50) NULL | Tài khoản ngân hàng (Tên) |
| `BNK_NM` | NVARCHAR(100) NULL | Ngân hàng (Tên) |
| `REL_DR` | NVARCHAR(50) NULL | Quan hệ (người thân / liên hệ khẩn cấp) (Nội dung diễn giải / ghi chú dạng text)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `NEW_BT` | BIT NULL DEFAULT (0) | Nhân viên mới (Cờ đúng-sai (Bit: 1/0))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `MEA_BT` | BIT NULL | Chưa rõ nghĩa cụ thể (Cờ đúng-sai (Bit: 1/0))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `REM_DR` | NVARCHAR(500) NULL | Ghi chú / Remark (Nội dung diễn giải / ghi chú dạng text) |
| `ATT_BT` | BIT NULL DEFAULT (0) | Chấm công / Có mặt (Cờ đúng-sai (Bit: 1/0)) |
| `VAC_BT` | BIT NULL DEFAULT (0) | Nghỉ việc (lý do/trạng thái thôi việc) (Cờ đúng-sai (Bit: 1/0)) |
| `DEL_BT` | BIT NULL DEFAULT (0) | Xóa (đánh dấu đã xóa) (Cờ đúng-sai (Bit: 1/0)) |
| `GRT_ID` | NVARCHAR(10) NULL | Nhóm lương (Mã (khóa nhận diện))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `GRP_ID` | NVARCHAR(10) NULL | Nhóm (Mã (khóa nhận diện)) |
| `LEV_ID` | NVARCHAR(10) NULL | Cấp bậc / Bậc lương (Level) (Mã (khóa nhận diện)) |
| `LCK_BT` | BIT NULL DEFAULT (0) | Khóa (không cho chỉnh sửa) (Cờ đúng-sai (Bit: 1/0)) |
| `BHX_BT` | BIT NULL | Bảo hiểm xã hội (Cờ đúng-sai (Bit: 1/0)) |
| `DIR_BT` | BIT NULL | Trực tiếp quản lý / Giám đốc (Cờ đúng-sai (Bit: 1/0))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `BLT_NM` | NVARCHAR(50) NULL | Người tạo bản ghi (Built by) (Tên) |
| `BLT_DT` | DATETIME NULL | Người tạo bản ghi (Built by) (Ngày (Date)) |
| `LST_NM` | NVARCHAR(50) NULL | Người & thời gian sửa lần cuối (Last update) (Tên) |
| `LST_DT` | DATETIME NULL | Người & thời gian sửa lần cuối (Last update) (Ngày (Date)) |
| `SEN_DT` | DATETIME NULL | Thâm niên (Seniority) (Ngày (Date)) |
| `REM_D2` | NVARCHAR(50) NULL | Ghi chú / Remark |

#### `FILB01AA` — *(xem chi tiết ở Phần 3)*

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `EMP_ID` | NVARCHAR(20) NOT NULL | Nhân viên (Mã (khóa nhận diện)) |
| `SEQ_NO` | INT NOT NULL | Số thứ tự (Số (Number)) |
| `TYP_ID` | NVARCHAR(2) NULL | Loại / Phân loại (Mã (khóa nhận diện)) |
| `FAM_NM` | NVARCHAR(50) NULL | (Tên) |
| `BIR_DT` | DATETIME NULL | Ngày sinh (Ngày (Date)) |
| `JOB_NM` | NVARCHAR(50) NULL | (Tên) |
| `COM_NM` | NVARCHAR(50) NULL | Công ty (Tên) |
| `ADD_DR` | NVARCHAR(250) NULL | Địa chỉ (Nội dung diễn giải / ghi chú dạng text) |

#### `FILB01AA1` — *(xem chi tiết ở Phần 3)*

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `EMP_ID` | NVARCHAR(20) NOT NULL | Nhân viên (Mã (khóa nhận diện)) |
| `SEQ_NO` | INT NOT NULL | Số thứ tự (Số (Number)) |
| `TYP_ID` | NVARCHAR(2) NULL | Loại / Phân loại (Mã (khóa nhận diện)) |
| `FAM_NM` | NVARCHAR(50) NULL | (Tên) |
| `BIR_DT` | NVARCHAR(14) NULL | Ngày sinh (Ngày (Date)) |
| `JOB_NM` | NVARCHAR(50) NULL | (Tên) |
| `COM_NM` | NVARCHAR(50) NULL | Công ty (Tên) |
| `ADD_DR` | NVARCHAR(250) NULL | Địa chỉ (Nội dung diễn giải / ghi chú dạng text) |

#### `FILB01AB` — Hình **[Xác nhận]**

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `EMP_ID` | NVARCHAR(20) NOT NULL | Nhân viên (Mã (khóa nhận diện)) |
| `PIC_DR` | IMAGE NULL | Hình ảnh nhân viên (Nội dung diễn giải / ghi chú dạng text) |

#### `FILB01AC` — Nghỉ Việc **[Xác nhận]**

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `EMP_ID` | NVARCHAR(20) NOT NULL | Nhân viên (Mã (khóa nhận diện)) |
| `VAC_ID` | NVARCHAR(3) NOT NULL | Nghỉ việc (lý do/trạng thái thôi việc) (Mã (khóa nhận diện)) |
| `VAC_DT` | DATETIME NULL | Nghỉ việc (lý do/trạng thái thôi việc) (Ngày (Date)) |
| `NOT_DR` | NVARCHAR(100) NULL | Ghi chú (Nội dung diễn giải / ghi chú dạng text) |
| `BLT_NM` | NVARCHAR(50) NULL | Người tạo bản ghi (Built by) (Tên) |
| `BLT_DT` | DATETIME NULL | Người tạo bản ghi (Built by) (Ngày (Date)) |
| `VAT_BT` | BIT NULL | (Cờ đúng-sai (Bit: 1/0)) |

#### `FILB01ACA` — Nghỉ Việc **[Xác nhận]**

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `SEQ_NO` | INT NOT NULL | Số thứ tự (Số (Number)) |
| `EMP_ID` | NVARCHAR(20) NOT NULL | Nhân viên (Mã (khóa nhận diện)) |
| `VAC_ID` | NVARCHAR(10) NOT NULL | Nghỉ việc (lý do/trạng thái thôi việc) (Mã (khóa nhận diện)) |
| `STR_DT` | DATETIME NULL | Bắt đầu (Start) (Ngày (Date)) |
| `VAC_DT` | DATETIME NULL | Nghỉ việc (lý do/trạng thái thôi việc) (Ngày (Date)) |
| `NOT_DR` | NVARCHAR(100) NULL | Ghi chú (Nội dung diễn giải / ghi chú dạng text) |
| `WRK_DT` | DATETIME NULL | Làm việc (Work) (Ngày (Date)) |
| `REM_DR` | NVARCHAR(100) NULL | Ghi chú / Remark (Nội dung diễn giải / ghi chú dạng text) |
| `BLT_NM` | NVARCHAR(50) NULL | Người tạo bản ghi (Built by) (Tên) |
| `BLT_DT` | DATETIME NULL | Người tạo bản ghi (Built by) (Ngày (Date)) |
| `BLT_N1` | NVARCHAR(50) NULL | Người tạo bản ghi (Built by) (Trường tên phụ / biến thể 2)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `BLT_D1` | DATETIME NULL | Người tạo bản ghi (Built by) (Trường phụ / biến thể của cột ngày hoặc diễn giải)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |

#### `FILB01AD` — *(xem chi tiết ở Phần 3)*

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `EMP_ID` | NVARCHAR(20) NOT NULL | Nhân viên (Mã (khóa nhận diện)) |
| `BLT_NM` | NVARCHAR(50) NULL | Người tạo bản ghi (Built by) (Tên) |
| `BLT_DT` | DATETIME NULL | Người tạo bản ghi (Built by) (Ngày (Date)) |

#### `FILB01AE` — *(xem chi tiết ở Phần 3)*

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `EMP_ID` | NVARCHAR(20) NOT NULL | Nhân viên (Mã (khóa nhận diện)) |
| `PAS_ID` | NVARCHAR(30) NULL | (Mã (khóa nhận diện)) |
| `PAS_ST` | DATETIME NULL | (Bắt đầu (Start)) |
| `PAS_ED` | DATETIME NULL | (Kết thúc (End))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `VIS_ID` | NVARCHAR(30) NULL | (Mã (khóa nhận diện)) |
| `VIS_ST` | DATETIME NULL | (Bắt đầu (Start)) |
| `VIS_ED` | DATETIME NULL | (Kết thúc (End))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `WRK_ID` | NVARCHAR(30) NULL | Làm việc (Work) (Mã (khóa nhận diện)) |
| `WRK_ST` | DATETIME NULL | Làm việc (Work) (Bắt đầu (Start)) |
| `WRK_ED` | DATETIME NULL | Làm việc (Work) (Kết thúc (End))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `WRK_I1` | DATETIME NULL | Làm việc (Work) (Trường phụ / biến thể 1)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `BLT_NM` | NVARCHAR(50) NULL | Người tạo bản ghi (Built by) (Tên) |
| `BLT_DT` | DATETIME NULL | Người tạo bản ghi (Built by) (Ngày (Date)) |
| `LST_NM` | NVARCHAR(50) NULL | Người & thời gian sửa lần cuối (Last update) (Tên) |
| `LST_DT` | DATETIME NULL | Người & thời gian sửa lần cuối (Last update) (Ngày (Date)) |

#### `FILB01AF` — Hợp đồng **[Xác nhận]**

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `EMP_ID` | NVARCHAR(20) NOT NULL | Nhân viên (Mã (khóa nhận diện)) |
| `BHX_ID` | NVARCHAR(20) NULL | Bảo hiểm xã hội (Mã (khóa nhận diện)) |
| `BHX_NO` | NVARCHAR(20) NULL | Bảo hiểm xã hội (Số (Number)) |
| `BHX_ST` | DATETIME NULL | Bảo hiểm xã hội (Bắt đầu (Start)) |
| `BHX_ED` | DATETIME NULL | Bảo hiểm xã hội (Kết thúc (End))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `BHY_NO` | NVARCHAR(20) NULL | (Số (Number)) |
| `BHY_ST` | DATETIME NULL | (Bắt đầu (Start)) |
| `BHY_ED` | DATETIME NULL | (Kết thúc (End))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `BHL_NO` | NVARCHAR(20) NULL | (Số (Number)) |
| `BHL_ST` | DATETIME NULL | (Bắt đầu (Start)) |
| `BHL_ED` | DATETIME NULL | (Kết thúc (End))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `LAB_NO` | NVARCHAR(50) NULL | Hợp đồng lao động (Labour contract) (Số (Number)) |
| `LAB_ST` | DATETIME NULL | Hợp đồng lao động (Labour contract) (Bắt đầu (Start)) |
| `LAB_ED` | DATETIME NULL | Hợp đồng lao động (Labour contract) (Kết thúc (End))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `LAB_TM` | INT NULL | Hợp đồng lao động (Labour contract) (Giờ / thời điểm (Time)) |
| `LA1_NO` | NVARCHAR(50) NULL | (Số (Number)) |
| `LA1_ST` | DATETIME NULL | (Bắt đầu (Start)) |
| `LA1_ED` | DATETIME NULL | (Kết thúc (End))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `LA1_TM` | INT NULL | (Giờ / thời điểm (Time)) |

#### `FILB02A` — Thăng chức **[Xác nhận]**

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `SEQ_NO` | FLOAT NOT NULL | Số thứ tự (Số (Number)) |
| `SEQ_DT` | DATETIME NULL | Số thứ tự (Ngày (Date)) |
| `EMP_ID` | NVARCHAR(20) NULL | Nhân viên (Mã (khóa nhận diện)) |
| `POS_ID` | NVARCHAR(3) NULL | Chức vụ / Vị trí công việc (Mã (khóa nhận diện)) |
| `POS_I1` | NVARCHAR(3) NULL | Chức vụ / Vị trí công việc (Trường phụ / biến thể 1)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `JUR_ID` | NVARCHAR(10) NULL | Chưa rõ nghĩa cụ thể (có thể liên quan quyết định/chức danh pháp lý) (Mã (khóa nhận diện))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `NOT_DR` | NVARCHAR(100) NULL | Ghi chú (Nội dung diễn giải / ghi chú dạng text) |
| `BLT_NM` | NVARCHAR(50) NULL | Người tạo bản ghi (Built by) (Tên) |
| `BLT_DT` | DATETIME NULL | Người tạo bản ghi (Built by) (Ngày (Date)) |

#### `FILB03A` — Chuyển bộ phận **[Xác nhận]**

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `SEQ_NO` | FLOAT NOT NULL | Số thứ tự (Số (Number)) |
| `SEQ_DT` | DATETIME NULL | Số thứ tự (Ngày (Date)) |
| `EMP_ID` | NVARCHAR(20) NULL | Nhân viên (Mã (khóa nhận diện)) |
| `EMP_I3` | NVARCHAR(20) NULL | Nhân viên (Trường phụ / biến thể 3)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `EMP_I4` | NVARCHAR(20) NULL | Nhân viên |
| `DEP_I1` | NVARCHAR(20) NULL | Phòng ban / Bộ phận (Trường phụ / biến thể 1)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `DEP_I2` | NVARCHAR(20) NULL | Phòng ban / Bộ phận (Trường phụ / biến thể 2)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `NOT_DR` | NVARCHAR(100) NULL | Ghi chú (Nội dung diễn giải / ghi chú dạng text) |
| `BLT_NM` | NVARCHAR(50) NULL | Người tạo bản ghi (Built by) (Tên) |
| `BLT_DT` | DATETIME NULL | Người tạo bản ghi (Built by) (Ngày (Date)) |

#### `FILB04A` — *(xem chi tiết ở Phần 3)*

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `SEQ_NO` | FLOAT NOT NULL | Số thứ tự (Số (Number)) |
| `SEQ_DT` | DATETIME NULL | Số thứ tự (Ngày (Date)) |
| `EMP_ID` | NVARCHAR(20) NULL | Nhân viên (Mã (khóa nhận diện)) |
| `CRD_N1` | NVARCHAR(20) NULL | CMND / CCCD (Chứng minh nhân dân / Căn cước công dân) (Trường tên phụ / biến thể 2)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `CRD_N2` | NVARCHAR(20) NULL | CMND / CCCD (Chứng minh nhân dân / Căn cước công dân) (Trường tên phụ / biến thể 3)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `NOT_DR` | NVARCHAR(100) NULL | Ghi chú (Nội dung diễn giải / ghi chú dạng text) |
| `BLT_NM` | NVARCHAR(50) NULL | Người tạo bản ghi (Built by) (Tên) |
| `BLT_DT` | DATETIME NULL | Người tạo bản ghi (Built by) (Ngày (Date)) |

#### `FILB05A` — *(xem chi tiết ở Phần 3)*

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `SEQ_NO` | FLOAT NOT NULL | Số thứ tự (Số (Number)) |
| `EMP_ID` | NVARCHAR(20) NULL | Nhân viên (Mã (khóa nhận diện)) |
| `STA_DT` | DATETIME NULL | Trạng thái (Status) (Ngày (Date))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `END_DT` | DATETIME NULL | Kết thúc (End) (Ngày (Date)) |
| `COU_NM` | NVARCHAR(50) NULL | Huyện / Quận (Tên)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `HOU_QT` | FLOAT NULL | Số giờ (Giá trị quy định (số lần/số tiền))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `REP_DR` | NVARCHAR(50) NULL | (Nội dung diễn giải / ghi chú dạng text) |
| `POI_QT` | FLOAT NULL | (Giá trị quy định (số lần/số tiền))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `NOT_DR` | NVARCHAR(100) NULL | Ghi chú (Nội dung diễn giải / ghi chú dạng text) |
| `COS_QT` | FLOAT NULL | (Giá trị quy định (số lần/số tiền))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `TYP_NM` | NVARCHAR(50) NULL | Loại / Phân loại (Tên) |
| `BLT_NM` | NVARCHAR(50) NULL | Người tạo bản ghi (Built by) (Tên) |
| `BLT_DT` | DATETIME NULL | Người tạo bản ghi (Built by) (Ngày (Date)) |
| `LST_NM` | NVARCHAR(50) NULL | Người & thời gian sửa lần cuối (Last update) (Tên) |
| `LST_DT` | DATETIME NULL | Người & thời gian sửa lần cuối (Last update) (Ngày (Date)) |

#### `FILB06A` — *(xem chi tiết ở Phần 3)*

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `EMP_ID` | NVARCHAR(20) NOT NULL | Nhân viên (Mã (khóa nhận diện)) |
| `SEQ_NO` | INT NOT NULL | Số thứ tự (Số (Number)) |
| `ACC_NO` | NVARCHAR(20) NULL | Tài khoản ngân hàng (Số (Number)) |
| `ACC_NM` | NVARCHAR(50) NULL | Tài khoản ngân hàng (Tên) |
| `BNK_NM` | NVARCHAR(100) NULL | Ngân hàng (Tên) |
| `REM_DR` | NVARCHAR(50) NULL | Ghi chú / Remark (Nội dung diễn giải / ghi chú dạng text) |
| `BLT_NM` | NVARCHAR(50) NULL | Người tạo bản ghi (Built by) (Tên) |
| `BLT_DT` | DATETIME NULL | Người tạo bản ghi (Built by) (Ngày (Date)) |

#### `FILB07A` — *(xem chi tiết ở Phần 3)*

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `SEQ_NO` | FLOAT NOT NULL | Số thứ tự (Số (Number)) |
| `SEQ_DT` | DATETIME NULL | Số thứ tự (Ngày (Date)) |
| `EMP_ID` | NVARCHAR(20) NOT NULL | Nhân viên (Mã (khóa nhận diện)) |
| `GRT_I1` | NVARCHAR(10) NULL | Nhóm lương (Trường phụ / biến thể 1)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `GRP_I1` | NVARCHAR(10) NULL | Nhóm (Trường phụ / biến thể 1)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `LEV_I1` | NVARCHAR(10) NULL | Cấp bậc / Bậc lương (Level) (Trường phụ / biến thể 1)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `GRT_ID` | NVARCHAR(10) NULL | Nhóm lương (Mã (khóa nhận diện))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `GRP_ID` | NVARCHAR(10) NULL | Nhóm (Mã (khóa nhận diện)) |
| `LEV_ID` | NVARCHAR(10) NULL | Cấp bậc / Bậc lương (Level) (Mã (khóa nhận diện)) |
| `REM_DR` | NVARCHAR(50) NULL | Ghi chú / Remark (Nội dung diễn giải / ghi chú dạng text) |
| `BLT_NM` | NVARCHAR(50) NULL | Người tạo bản ghi (Built by) (Tên) |
| `BLT_DT` | DATETIME NULL | Người tạo bản ghi (Built by) (Ngày (Date)) |
| `GRT_BT` | BIT NULL | Nhóm lương (Cờ đúng-sai (Bit: 1/0))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `GRP_BT` | BIT NULL | Nhóm (Cờ đúng-sai (Bit: 1/0)) |
| `LEV_BT` | BIT NULL | Cấp bậc / Bậc lương (Level) (Cờ đúng-sai (Bit: 1/0)) |

#### `FILB08A` — *(xem chi tiết ở Phần 3)*

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `EMP_ID` | NVARCHAR(20) NOT NULL | Nhân viên (Mã (khóa nhận diện)) |
| `SEQ_NO` | INT NOT NULL | Số thứ tự (Số (Number)) |
| `CTF_ID` | NVARCHAR(10) NULL | (Mã (khóa nhận diện)) |
| `REM_DR` | NVARCHAR(50) NULL | Ghi chú / Remark (Nội dung diễn giải / ghi chú dạng text) |
| `BLT_NM` | NVARCHAR(50) NULL | Người tạo bản ghi (Built by) (Tên) |
| `BLT_DT` | DATETIME NULL | Người tạo bản ghi (Built by) (Ngày (Date)) |

#### `FILB09A` — *(xem chi tiết ở Phần 3)*

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `SEQ_NO` | FLOAT NOT NULL | Số thứ tự (Số (Number)) |
| `EMP_ID` | NVARCHAR(20) NULL | Nhân viên (Mã (khóa nhận diện)) |
| `TYP_I1` | NVARCHAR(4) NULL | Loại / Phân loại (Trường phụ / biến thể 1)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `TYP_I2` | NVARCHAR(4) NULL | Loại / Phân loại (Trường phụ / biến thể 2)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `SWI_DT` | DATETIME NULL | Chuyển ca / Swipe (quẹt thẻ) (Ngày (Date))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `NOT_DR` | NVARCHAR(100) NULL | Ghi chú (Nội dung diễn giải / ghi chú dạng text) |
| `LST_MN` | NVARCHAR(50) NULL | Người & thời gian sửa lần cuối (Last update) (Số phút (Minutes) — hoặc mã nhóm tùy bảng)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `LST_DT` | DATETIME NULL | Người & thời gian sửa lần cuối (Last update) (Ngày (Date)) |
| `SEQ_AN` | FLOAT NULL | Số thứ tự |

### FILC – Chấm công / thời gian làm việc

#### `FILC01A` — Đơn Lieu Tho **[Xác nhận]**

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `DAT_TM` | FLOAT NULL | Ngày / giờ dữ liệu (Data time) (Giờ / thời điểm (Time))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `EMP_ID` | NVARCHAR(20) NULL | Nhân viên (Mã (khóa nhận diện)) |
| `SWI_DT` | DATETIME NULL | Chuyển ca / Swipe (quẹt thẻ) (Ngày (Date))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `USR_NM` | NVARCHAR(50) NULL | Người dùng (User) (Tên) |
| `CRD_DT` | DATETIME NOT NULL | CMND / CCCD (Chứng minh nhân dân / Căn cước công dân) (Ngày (Date)) |
| `CRD_TM` | FLOAT NOT NULL | CMND / CCCD (Chứng minh nhân dân / Căn cước công dân) (Giờ / thời điểm (Time)) |
| `CRD_NO` | NVARCHAR(20) NOT NULL | CMND / CCCD (Chứng minh nhân dân / Căn cước công dân) (Số (Number)) |
| `REA_NO` | NVARCHAR(10) NULL | Lý do (Reason) (Số (Number)) |
| `STA_DR` | NVARCHAR(10) NULL | Trạng thái (Status) (Nội dung diễn giải / ghi chú dạng text)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `FIL_NM` | NVARCHAR(100) NULL | Tên file (Tên) |
| `YSD_BT` | BIT NULL | Chưa rõ nghĩa cụ thể (Cờ đúng-sai (Bit: 1/0))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |

#### `FILC01A_VS` — Bản sao/biến thể của `FILC01A` **[Suy luận]**

Bảng này có cấu trúc tương tự bảng gốc **`FILC01A`** (xem chi tiết cột tại mục bảng đó). Đây là bản sao lưu / biến thể lịch sử, **khuyến nghị không cần map sang backend mới**, trừ khi cần đối chiếu dữ liệu cũ.

#### `FILC01A_cu` — Bản sao/biến thể của `FILC01A` **[Suy luận]**

Bảng này có cấu trúc tương tự bảng gốc **`FILC01A`** (xem chi tiết cột tại mục bảng đó). Đây là bản sao lưu / biến thể lịch sử, **khuyến nghị không cần map sang backend mới**, trừ khi cần đối chiếu dữ liệu cũ.

#### `FILC02A` — Danh Mục Ca **[Xác nhận]**

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `SHI_ID` | NVARCHAR(10) NOT NULL | Ca làm việc (Shift) (Mã (khóa nhận diện)) |
| `SHI_NM` | NVARCHAR(50) NULL | Ca làm việc (Shift) (Tên) |
| `MAX_HR` | FLOAT NULL | (Số giờ (Hours)) |
| `MIN_HR` | FLOAT NULL | (Số giờ (Hours)) |
| `CON_H1` | FLOAT NULL | Điều kiện / Kết nối  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `ADD_H1` | FLOAT NULL | Địa chỉ |
| `CON_H2` | FLOAT NULL | Điều kiện / Kết nối  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `ADD_H2` | FLOAT NULL | Địa chỉ |
| `BLT_NM` | NVARCHAR(50) NULL | Người tạo bản ghi (Built by) (Tên) |
| `BLT_DT` | DATETIME NULL | Người tạo bản ghi (Built by) (Ngày (Date)) |
| `LST_NM` | NVARCHAR(50) NULL | Người & thời gian sửa lần cuối (Last update) (Tên) |
| `LST_DT` | DATETIME NULL | Người & thời gian sửa lần cuối (Last update) (Ngày (Date)) |
| `TIM_02` | BIT NULL | Số lần quy định  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `ONN_TM` | FLOAT NULL | Giờ vào / Check-in (Giờ / thời điểm (Time)) |
| `OFF_TM` | FLOAT NULL | Giờ ra / Check-out (Giờ / thời điểm (Time)) |

#### `FILC02B` — *(xem chi tiết ở Phần 3)*

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `SHI_ID` | NVARCHAR(10) NOT NULL | Ca làm việc (Shift) (Mã (khóa nhận diện)) |
| `SEQ_N1` | INT NOT NULL | Số thứ tự (Trường tên phụ / biến thể 2)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `SEQ_NO` | NVARCHAR(2) NULL | Số thứ tự (Số (Number)) |
| `ONN_TM` | FLOAT NULL | Giờ vào / Check-in (Giờ / thời điểm (Time)) |
| `ONN_RD` | NVARCHAR(5) NULL | Giờ vào / Check-in |
| `ONN_BT` | BIT NULL | Giờ vào / Check-in (Cờ đúng-sai (Bit: 1/0)) |
| `OFF_TM` | FLOAT NULL | Giờ ra / Check-out (Giờ / thời điểm (Time)) |
| `OFF_RD` | NVARCHAR(5) NULL | Giờ ra / Check-out |
| `OFF_BT` | BIT NULL | Giờ ra / Check-out (Cờ đúng-sai (Bit: 1/0)) |
| `TYP_ID` | NVARCHAR(10) NULL | Loại / Phân loại (Mã (khóa nhận diện)) |
| `MIN_ST` | FLOAT NULL | (Bắt đầu (Start)) |
| `WRK_HR` | FLOAT NULL | Làm việc (Work) (Số giờ (Hours)) |
| `LAT_BT` | BIT NULL | Đi trễ (Late) (Cờ đúng-sai (Bit: 1/0)) |
| `BLT_NM` | NVARCHAR(50) NULL | Người tạo bản ghi (Built by) (Tên) |
| `BLT_DT` | DATETIME NULL | Người tạo bản ghi (Built by) (Ngày (Date)) |
| `LST_NM` | NVARCHAR(50) NULL | Người & thời gian sửa lần cuối (Last update) (Tên) |
| `LST_DT` | DATETIME NULL | Người & thời gian sửa lần cuối (Last update) (Ngày (Date)) |
| `MAN_IN` | FLOAT NULL | Thời gian yêu cầu tăng ca thủ công (Manual)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `MAN_OU` | FLOAT NULL | Thời gian yêu cầu tăng ca thủ công (Manual)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |

#### `FILC03A` — Sap ca **[Xác nhận]**

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `EMP_ID` | NVARCHAR(20) NOT NULL | Nhân viên (Mã (khóa nhận diện)) |
| `YYY_MM` | NVARCHAR(6) NOT NULL | Năm (Tháng (Month)) |
| `DAY_01` | NVARCHAR(10) NULL | Ngày |
| `DAY_02` | NVARCHAR(10) NULL | Ngày |
| `DAY_03` | NVARCHAR(10) NULL | Ngày |
| `DAY_04` | NVARCHAR(10) NULL | Ngày |
| `DAY_05` | NVARCHAR(10) NULL | Ngày |
| `DAY_06` | NVARCHAR(10) NULL | Ngày |
| `DAY_07` | NVARCHAR(10) NULL | Ngày |
| `DAY_08` | NVARCHAR(10) NULL | Ngày |
| `DAY_09` | NVARCHAR(10) NULL | Ngày |
| `DAY_10` | NVARCHAR(10) NULL | Ngày |
| `DAY_11` | NVARCHAR(10) NULL | Ngày |
| `DAY_12` | NVARCHAR(10) NULL | Ngày |
| `DAY_13` | NVARCHAR(10) NULL | Ngày |
| `DAY_14` | NVARCHAR(10) NULL | Ngày |
| `DAY_15` | NVARCHAR(10) NULL | Ngày |
| `DAY_16` | NVARCHAR(10) NULL | Ngày |
| `DAY_17` | NVARCHAR(10) NULL | Ngày |
| `DAY_18` | NVARCHAR(10) NULL | Ngày |
| `DAY_19` | NVARCHAR(10) NULL | Ngày |
| `DAY_20` | NVARCHAR(10) NULL | Ngày |
| `DAY_21` | NVARCHAR(10) NULL | Ngày |
| `DAY_22` | NVARCHAR(10) NULL | Ngày |
| `DAY_23` | NVARCHAR(10) NULL | Ngày |
| `DAY_24` | NVARCHAR(10) NULL | Ngày |
| `DAY_25` | NVARCHAR(10) NULL | Ngày |
| `DAY_26` | NVARCHAR(10) NULL | Ngày |
| `DAY_27` | NVARCHAR(10) NULL | Ngày |
| `DAY_28` | NVARCHAR(10) NULL | Ngày |
| `DAY_29` | NVARCHAR(10) NULL | Ngày |
| `DAY_30` | NVARCHAR(10) NULL | Ngày |
| `DAY_31` | NVARCHAR(10) NULL | Ngày |
| `BLT_NM` | NVARCHAR(50) NULL | Người tạo bản ghi (Built by) (Tên) |
| `BLT_DT` | DATETIME NULL | Người tạo bản ghi (Built by) (Ngày (Date)) |
| `LST_NM` | NVARCHAR(50) NULL | Người & thời gian sửa lần cuối (Last update) (Tên) |
| `LST_DT` | DATETIME NULL | Người & thời gian sửa lần cuối (Last update) (Ngày (Date)) |

#### `FILC04A` — Đăng Ký Phép **[Xác nhận]**

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `SEQ_NO` | INT NOT NULL | Số thứ tự (Số (Number)) |
| `EMP_ID` | NVARCHAR(20) NULL | Nhân viên (Mã (khóa nhận diện)) |
| `STR_DT` | DATETIME NULL | Bắt đầu (Start) (Ngày (Date)) |
| `END_DT` | DATETIME NULL | Kết thúc (End) (Ngày (Date)) |
| `HOU_DY` | FLOAT NULL | Số giờ (Số ngày (Days)) |
| `STR_TM` | INT NULL | Bắt đầu (Start) (Giờ / thời điểm (Time)) |
| `END_TM` | INT NULL | Kết thúc (End) (Giờ / thời điểm (Time)) |
| `HOU_TT` | FLOAT NULL | Số giờ (Tổng / Trạng thái (tùy ngữ cảnh))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `LEA_ID` | NVARCHAR(3) NULL | Nghỉ phép (Leave) (Mã (khóa nhận diện)) |
| `DAY_TT` | FLOAT NULL | Ngày (Tổng / Trạng thái (tùy ngữ cảnh))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `DAY_BT` | BIT NULL | Ngày (Cờ đúng-sai (Bit: 1/0)) |
| `NOT_DR` | NVARCHAR(100) NULL | Ghi chú (Nội dung diễn giải / ghi chú dạng text) |
| `BLT_NM` | NVARCHAR(50) NULL | Người tạo bản ghi (Built by) (Tên) |
| `BLT_DT` | DATETIME NULL | Người tạo bản ghi (Built by) (Ngày (Date)) |
| `LST_NM` | NVARCHAR(50) NULL | Người & thời gian sửa lần cuối (Last update) (Tên) |
| `LST_DT` | DATETIME NULL | Người & thời gian sửa lần cuối (Last update) (Ngày (Date)) |

#### `FILC04A_BK_To2021` — Bản sao/biến thể của `FILC04A` **[Suy luận]**

Bảng này có cấu trúc tương tự bảng gốc **`FILC04A`** (xem chi tiết cột tại mục bảng đó). Đây là bản sao lưu / biến thể lịch sử, **khuyến nghị không cần map sang backend mới**, trừ khi cần đối chiếu dữ liệu cũ.

#### `FILC04B` — *(xem chi tiết ở Phần 3)*

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `YYY_YY` | NVARCHAR(4) NOT NULL DEFAULT (0) | Năm (Năm (Year)) |
| `EMP_ID` | NVARCHAR(20) NOT NULL | Nhân viên (Mã (khóa nhận diện)) |
| `DID_QT` | FLOAT NULL DEFAULT (0) | (Giá trị quy định (số lần/số tiền))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `HAV_QT` | FLOAT NULL DEFAULT (0) | (Giá trị quy định (số lần/số tiền))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `ADD_QT` | FLOAT NULL DEFAULT (0) | Địa chỉ (Giá trị quy định (số lần/số tiền))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `BOR_QT` | FLOAT NULL DEFAULT (0) | (Giá trị quy định (số lần/số tiền))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `SUP_QT` | FLOAT NULL | (Giá trị quy định (số lần/số tiền))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `LST_QT` | FLOAT NULL DEFAULT (0) | Người & thời gian sửa lần cuối (Last update) (Giá trị quy định (số lần/số tiền))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `LST_Q1` | FLOAT NULL DEFAULT (0) | Người & thời gian sửa lần cuối (Last update) |
| `BLT_NM` | NVARCHAR(50) NULL | Người tạo bản ghi (Built by) (Tên) |
| `BLT_DT` | DATETIME NULL | Người tạo bản ghi (Built by) (Ngày (Date)) |
| `LST_NM` | NVARCHAR(50) NULL | Người & thời gian sửa lần cuối (Last update) (Tên) |
| `LST_DT` | DATETIME NULL | Người & thời gian sửa lần cuối (Last update) (Ngày (Date)) |
| `CAN_QT` | FLOAT NULL | (Giá trị quy định (số lần/số tiền))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `ThangCuoi` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `Namcuoi` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |

#### `FILC04B_BK_To2021` — Bản sao/biến thể của `FILC04B` **[Suy luận]**

Bảng này có cấu trúc tương tự bảng gốc **`FILC04B`** (xem chi tiết cột tại mục bảng đó). Đây là bản sao lưu / biến thể lịch sử, **khuyến nghị không cần map sang backend mới**, trừ khi cần đối chiếu dữ liệu cũ.

#### `FILC04C` — *(xem chi tiết ở Phần 3)*

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `YYY_YY` | NVARCHAR(6) NOT NULL | Năm (Năm (Year)) |
| `EMP_ID` | NVARCHAR(20) NOT NULL | Nhân viên (Mã (khóa nhận diện)) |
| `DID_QT` | FLOAT NULL | (Giá trị quy định (số lần/số tiền))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `HAV_QT` | FLOAT NULL | (Giá trị quy định (số lần/số tiền))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `ADD_QT` | FLOAT NULL | Địa chỉ (Giá trị quy định (số lần/số tiền))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `BOR_QT` | FLOAT NULL | (Giá trị quy định (số lần/số tiền))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `SUP_QT` | FLOAT NULL | (Giá trị quy định (số lần/số tiền))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `LST_QT` | FLOAT NULL | Người & thời gian sửa lần cuối (Last update) (Giá trị quy định (số lần/số tiền))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `LST_Q1` | FLOAT NULL | Người & thời gian sửa lần cuối (Last update) |
| `BLT_NM` | NVARCHAR(50) NULL | Người tạo bản ghi (Built by) (Tên) |
| `BLT_DT` | DATETIME NULL | Người tạo bản ghi (Built by) (Ngày (Date)) |
| `LST_NM` | NVARCHAR(50) NULL | Người & thời gian sửa lần cuối (Last update) (Tên) |
| `LST_DT` | DATETIME NULL | Người & thời gian sửa lần cuối (Last update) (Ngày (Date)) |
| `CAN_QT` | FLOAT NULL | (Giá trị quy định (số lần/số tiền))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `DID_MM` | FLOAT NULL | (Tháng (Month)) |
| `APP_MM` | FLOAT NULL | (Tháng (Month)) |
| `HAV_MM` | FLOAT NULL | (Tháng (Month)) |

#### `FILC05A` — *(xem chi tiết ở Phần 3)*

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `SEQ_NO` | INT NOT NULL | Số thứ tự (Số (Number)) |
| `EMP_ID` | NVARCHAR(20) NULL | Nhân viên (Mã (khóa nhận diện)) |
| `STR_DT` | DATETIME NULL | Bắt đầu (Start) (Ngày (Date)) |
| `END_DT` | DATETIME NULL | Kết thúc (End) (Ngày (Date)) |
| `STR_TM` | INT NULL | Bắt đầu (Start) (Giờ / thời điểm (Time)) |
| `END_TM` | INT NULL | Kết thúc (End) (Giờ / thời điểm (Time)) |
| `PUR_DR` | NVARCHAR(50) NULL | (Nội dung diễn giải / ghi chú dạng text) |
| `DES_NM` | NVARCHAR(50) NULL | (Tên) |
| `HOU_TT` | FLOAT NULL | Số giờ (Tổng / Trạng thái (tùy ngữ cảnh))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `DAY_TT` | FLOAT NULL DEFAULT (0) | Ngày (Tổng / Trạng thái (tùy ngữ cảnh))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `CIT_BT` | BIT NULL DEFAULT (0) | Tỉnh / Thành phố (Cờ đúng-sai (Bit: 1/0)) |
| `NOT_DR` | NVARCHAR(100) NULL | Ghi chú (Nội dung diễn giải / ghi chú dạng text) |
| `BLT_NM` | NVARCHAR(50) NULL | Người tạo bản ghi (Built by) (Tên) |
| `BLT_DT` | DATETIME NULL | Người tạo bản ghi (Built by) (Ngày (Date)) |
| `LST_NM` | NVARCHAR(50) NULL | Người & thời gian sửa lần cuối (Last update) (Tên) |
| `LST_DT` | DATETIME NULL | Người & thời gian sửa lần cuối (Last update) (Ngày (Date)) |

#### `FILC06A` — Cham Cong **[Xác nhận]**

> ⚠️ Bảng có **97 cột** (nhiều khả năng là bảng tổng hợp/ma trận theo ngày hoặc theo ca). Danh sách đầy đủ bên dưới, nhưng nhiều cột lặp lại theo mẫu số thứ tự (01, 02, 03...) cùng một ý nghĩa nghiệp vụ.

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `EMP_ID` | NVARCHAR(20) NOT NULL | Nhân viên (Mã (khóa nhận diện)) |
| `ATT_DT` | DATETIME NOT NULL | Chấm công / Có mặt (Ngày (Date)) |
| `DEP_ID` | NVARCHAR(10) NULL | Phòng ban / Bộ phận (Mã (khóa nhận diện)) |
| `EMP_I1` | NVARCHAR(20) NULL | Nhân viên (Trường phụ / biến thể 1)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `SHI_ID` | NVARCHAR(10) NOT NULL | Ca làm việc (Shift) (Mã (khóa nhận diện)) |
| `NOT_OR` | NVARCHAR(500) NULL | Ghi chú (Gốc / ban đầu (Original))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `NOT_DR` | NVARCHAR(500) NULL | Ghi chú (Nội dung diễn giải / ghi chú dạng text) |
| `NOT_D1` | NVARCHAR(500) NULL | Ghi chú (Trường phụ / biến thể của cột ngày hoặc diễn giải)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `NIG_TM` | NVARCHAR(50) NULL DEFAULT (0) | Ban đêm (Night) (Giờ / thời điểm (Time)) |
| `ONN_01` | FLOAT NULL DEFAULT (0) | Giờ vào / Check-in |
| `OFF_01` | FLOAT NULL DEFAULT (0) | Giờ ra / Check-out |
| `ONN_02` | FLOAT NULL DEFAULT (0) | Giờ vào / Check-in |
| `OFF_02` | FLOAT NULL DEFAULT (0) | Giờ ra / Check-out |
| `ONN_03` | FLOAT NULL DEFAULT (0) | Giờ vào / Check-in |
| `OFF_03` | FLOAT NULL DEFAULT (0) | Giờ ra / Check-out |
| `ONN_04` | FLOAT NULL DEFAULT (0) | Giờ vào / Check-in |
| `OFF_04` | FLOAT NULL DEFAULT (0) | Giờ ra / Check-out |
| `ONN_05` | FLOAT NULL DEFAULT (0) | Giờ vào / Check-in |
| `OFF_05` | FLOAT NULL DEFAULT (0) | Giờ ra / Check-out |
| `ONN_06` | FLOAT NULL DEFAULT (0) | Giờ vào / Check-in |
| `OFF_06` | FLOAT NULL DEFAULT (0) | Giờ ra / Check-out |
| `OFF_07` | FLOAT NULL DEFAULT (0) | Giờ ra / Check-out |
| `ONN_07` | FLOAT NULL DEFAULT (0) | Giờ vào / Check-in |
| `OFF_08` | FLOAT NULL DEFAULT (0) | Giờ ra / Check-out |
| `ONN_08` | FLOAT NULL DEFAULT (0) | Giờ vào / Check-in |
| `ONN_09` | FLOAT NULL DEFAULT (0) | Giờ vào / Check-in |
| `OFF_09` | FLOAT NULL DEFAULT (0) | Giờ ra / Check-out |
| `ONN_10` | FLOAT NULL DEFAULT (0) | Giờ vào / Check-in |
| `OFF_10` | FLOAT NULL DEFAULT (0) | Giờ ra / Check-out |
| `ATT_HR` | FLOAT NULL DEFAULT (0) | Chấm công / Có mặt (Số giờ (Hours)) |
| `OTT_HR` | FLOAT NULL DEFAULT (0) | Tăng ca (Overtime Total) (Số giờ (Hours))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `OT1_HR` | FLOAT NULL | Tăng ca mức 1 (Số giờ (Hours))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `OVO_HR` | FLOAT NULL DEFAULT (0) | Tăng ca ngày khác (Overtime Other) (Số giờ (Hours))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `LAT_MN` | FLOAT NULL DEFAULT (0) | Đi trễ (Late) (Số phút (Minutes) — hoặc mã nhóm tùy bảng)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `LAT_TM` | INT NULL DEFAULT (0) | Đi trễ (Late) (Giờ / thời điểm (Time)) |
| `EAR_MN` | FLOAT NULL DEFAULT (0) | Về sớm (Early) (Số phút (Minutes) — hoặc mã nhóm tùy bảng)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `EAR_TM` | INT NULL DEFAULT (0) | Về sớm (Early) (Giờ / thời điểm (Time)) |
| `ABS_MN` | FLOAT NULL DEFAULT (0) | Vắng mặt (Absent) (Số phút (Minutes) — hoặc mã nhóm tùy bảng)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `ABS_TM` | INT NULL DEFAULT (0) | Vắng mặt (Absent) (Giờ / thời điểm (Time)) |
| `ATT_DY` | FLOAT NULL DEFAULT (0) | Chấm công / Có mặt (Số ngày (Days)) |
| `NIG_DY` | FLOAT NULL DEFAULT (0) | Ban đêm (Night) (Số ngày (Days)) |
| `LOC_BT` | BIT NULL | Vị trí / Định vị chấm công (Location) (Cờ đúng-sai (Bit: 1/0))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `LOC_B1` | BIT NULL | Vị trí / Định vị chấm công (Location)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `USR_CK` | NVARCHAR(50) NULL | Người dùng (User) (Người kiểm tra (Check))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `NIG_HR` | FLOAT NULL DEFAULT (0) | Ban đêm (Night) (Số giờ (Hours)) |
| `DOF_HR` | FLOAT NULL DEFAULT (0) | Ngày nghỉ (Day off) (Số giờ (Hours)) |
| `DOF_OT` | FLOAT NULL DEFAULT (0) | Ngày nghỉ (Day off) (Tăng ca (Overtime)) |
| `DOF_OV` | FLOAT NULL DEFAULT (0) | Ngày nghỉ (Day off) (Tăng ca loại khác)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `HOL_HR` | FLOAT NULL DEFAULT (0) | Ngày lễ (Holiday) (Số giờ (Hours)) |
| `HOL_OT` | FLOAT NULL DEFAULT (0) | Ngày lễ (Holiday) (Tăng ca (Overtime)) |
| `HOL_OV` | FLOAT NULL DEFAULT (0) | Ngày lễ (Holiday) (Tăng ca loại khác)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `NIG_OT` | FLOAT NULL DEFAULT (0) | Ban đêm (Night) (Tăng ca (Overtime)) |
| `NIG_OV` | FLOAT NULL | Ban đêm (Night) (Tăng ca loại khác)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `PRO_HR` | FLOAT NULL DEFAULT (0) | Trình độ chuyên môn (hoặc: Thử việc - Probation, tùy bảng) (Số giờ (Hours))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `PRO_IV` | FLOAT NULL DEFAULT (0) | Trình độ chuyên môn (hoặc: Thử việc - Probation, tùy bảng) (Chưa rõ nghĩa cụ thể (liên quan giờ thử việc))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `PRO_OT` | FLOAT NULL DEFAULT (0) | Trình độ chuyên môn (hoặc: Thử việc - Probation, tùy bảng) (Tăng ca (Overtime))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `LEA_I1` | NVARCHAR(10) NULL | Nghỉ phép (Leave) (Trường phụ / biến thể 1)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `LEA_H1` | FLOAT NULL DEFAULT (0) | Nghỉ phép (Leave) |
| `LEA_I2` | NVARCHAR(10) NULL | Nghỉ phép (Leave) (Trường phụ / biến thể 2)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `LEA_H2` | FLOAT NULL DEFAULT (0) | Nghỉ phép (Leave) |
| `LEA_I3` | NVARCHAR(10) NULL | Nghỉ phép (Leave) (Trường phụ / biến thể 3)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `LEA_H3` | FLOAT NULL DEFAULT (0) | Nghỉ phép (Leave) |
| `OTR_HR` | FLOAT NULL DEFAULT (0) | Tăng ca khác (Số giờ (Hours))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `Cơm TC` | INT NULL DEFAULT (0) | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `TRE_PH` | BIT NULL | Trễ (Phép (nghỉ có lương))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `TRU_C1` | FLOAT NULL DEFAULT (0) | Trừ (giờ/ngày công) (Ca 1 (Shift 1))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `TRU_C2` | FLOAT NULL DEFAULT (0) | Trừ (giờ/ngày công) (Ca 2 (Shift 2))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `LAT_C1` | FLOAT NULL DEFAULT (0) | Đi trễ (Late) (Ca 1 (Shift 1))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `LAT_C2` | FLOAT NULL DEFAULT (0) | Đi trễ (Late) (Ca 2 (Shift 2))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `COM_PH` | FLOAT NULL DEFAULT (0) | Công ty (Phép (nghỉ có lương))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `COMTC1` | FLOAT NULL DEFAULT (0) | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `COMTC2` | FLOAT NULL DEFAULT (0) | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `GIO_TS` | FLOAT NULL DEFAULT (0) | Giờ (Tổng số)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `DOF_DY` | FLOAT NULL DEFAULT (0) | Ngày nghỉ (Day off) (Số ngày (Days)) |
| `OVO_DY` | FLOAT NULL DEFAULT (0) | Tăng ca ngày khác (Overtime Other) (Số ngày (Days))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `NIG_D1` | FLOAT NULL DEFAULT (0) | Ban đêm (Night) (Trường phụ / biến thể của cột ngày hoặc diễn giải)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `INN_DY` | FLOAT NULL DEFAULT (0) | Vào (biến thể của ONN) (Số ngày (Days))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `INN_D1` | FLOAT NULL DEFAULT (0) | Vào (biến thể của ONN) (Trường phụ / biến thể của cột ngày hoặc diễn giải)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `GIOSH` | FLOAT NULL DEFAULT (0) | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `HOL_DY` | FLOAT NULL DEFAULT (0) | Ngày lễ (Holiday) (Số ngày (Days)) |
| `CUT_OT` | FLOAT NULL DEFAULT (0) | Cắt trừ (Tăng ca (Overtime))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `CUT_OV` | FLOAT NULL DEFAULT (0) | Cắt trừ (Tăng ca loại khác)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `CUT_DO` | FLOAT NULL DEFAULT (0) | Cắt trừ (Lý do)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `CUT_HO` | FLOAT NULL DEFAULT (0) | Cắt trừ (Chưa rõ nghĩa cụ thể)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `CUT_DV` | FLOAT NULL DEFAULT (0) | Cắt trừ (Đơn vị)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `CUT_HV` | FLOAT NULL DEFAULT (0) | Cắt trừ (Chưa rõ nghĩa cụ thể)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `CUT_NG` | FLOAT NULL DEFAULT (0) | Cắt trừ (Chưa rõ nghĩa cụ thể (có thể là 'ngày'))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `CUT_NO` | FLOAT NULL DEFAULT (0) | Cắt trừ (Số (Number))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `LST_NM` | NVARCHAR(50) NULL | Người & thời gian sửa lần cuối (Last update) (Tên) |
| `LST_DT` | DATETIME NULL | Người & thời gian sửa lần cuối (Last update) (Ngày (Date)) |
| `NG` | FLOAT NULL DEFAULT (0) | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `ITRE` | FLOAT NULL DEFAULT (0) | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `ISOM` | FLOAT NULL DEFAULT (0) | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `ITRES` | FLOAT NULL DEFAULT (0) | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `ISOMS` | FLOAT NULL DEFAULT (0) | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `NIG_HL` | FLOAT NULL | Ban đêm (Night) (Chưa rõ nghĩa cụ thể)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `COM_OT` | FLOAT NULL DEFAULT ((0)) | Công ty (Tăng ca (Overtime)) |

#### `FILC06AA` — Giờ cong tháng **[Xác nhận]**

> ⚠️ Bảng có **99 cột** (nhiều khả năng là bảng tổng hợp/ma trận theo ngày hoặc theo ca). Danh sách đầy đủ bên dưới, nhưng nhiều cột lặp lại theo mẫu số thứ tự (01, 02, 03...) cùng một ý nghĩa nghiệp vụ.

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `EMP_ID` | NVARCHAR(20) NOT NULL | Nhân viên (Mã (khóa nhận diện)) |
| `YYY_MM` | NVARCHAR(6) NOT NULL | Năm (Tháng (Month)) |
| `SEQ_NO` | INT NOT NULL | Số thứ tự (Số (Number)) |
| `DEP_I1` | NVARCHAR(50) NULL | Phòng ban / Bộ phận (Trường phụ / biến thể 1)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `EMP_DW` | NVARCHAR(20) NULL | Nhân viên |
| `NOT_DR` | NVARCHAR(50) NULL | Ghi chú (Nội dung diễn giải / ghi chú dạng text) |
| `BLT_NM` | NVARCHAR(50) NULL | Người tạo bản ghi (Built by) (Tên) |
| `BLT_DT` | DATETIME NULL | Người tạo bản ghi (Built by) (Ngày (Date)) |
| `LST_NM` | NVARCHAR(50) NULL | Người & thời gian sửa lần cuối (Last update) (Tên) |
| `LST_DT` | DATETIME NULL | Người & thời gian sửa lần cuối (Last update) (Ngày (Date)) |
| `LEA_I1` | NVARCHAR(10) NULL | Nghỉ phép (Leave) (Trường phụ / biến thể 1)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `LEA_H1` | FLOAT NULL DEFAULT (0) | Nghỉ phép (Leave) |
| `LEA_I2` | NVARCHAR(10) NULL | Nghỉ phép (Leave) (Trường phụ / biến thể 2)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `LEA_H2` | FLOAT NULL DEFAULT (0) | Nghỉ phép (Leave) |
| `LEA_I3` | NVARCHAR(10) NULL | Nghỉ phép (Leave) (Trường phụ / biến thể 3)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `LEA_H3` | FLOAT NULL DEFAULT (0) | Nghỉ phép (Leave) |
| `LOC_B1` | BIT NULL | Vị trí / Định vị chấm công (Location)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `HOL_TT` | FLOAT NULL DEFAULT (0) | Ngày lễ (Holiday) (Tổng / Trạng thái (tùy ngữ cảnh))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `ATT_HR` | FLOAT NULL DEFAULT (0) | Chấm công / Có mặt (Số giờ (Hours)) |
| `OTT_HR` | FLOAT NULL DEFAULT (0) | Tăng ca (Overtime Total) (Số giờ (Hours))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `OT1_HR` | FLOAT NULL | Tăng ca mức 1 (Số giờ (Hours))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `OVO_HR` | FLOAT NULL DEFAULT (0) | Tăng ca ngày khác (Overtime Other) (Số giờ (Hours))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `LAT_MN` | FLOAT NULL DEFAULT (0) | Đi trễ (Late) (Số phút (Minutes) — hoặc mã nhóm tùy bảng)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `LAT_TM` | INT NULL DEFAULT (0) | Đi trễ (Late) (Giờ / thời điểm (Time)) |
| `EAR_MN` | FLOAT NULL DEFAULT (0) | Về sớm (Early) (Số phút (Minutes) — hoặc mã nhóm tùy bảng)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `EAR_TM` | INT NULL DEFAULT (0) | Về sớm (Early) (Giờ / thời điểm (Time)) |
| `ABS_MN` | FLOAT NULL DEFAULT (0) | Vắng mặt (Absent) (Số phút (Minutes) — hoặc mã nhóm tùy bảng)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `ABS_TM` | INT NULL DEFAULT (0) | Vắng mặt (Absent) (Giờ / thời điểm (Time)) |
| `LEA_QT` | FLOAT NULL DEFAULT (0) | Nghỉ phép (Leave) (Giá trị quy định (số lần/số tiền))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `ATT_DY` | FLOAT NULL DEFAULT (0) | Chấm công / Có mặt (Số ngày (Days)) |
| `NIG_DY` | FLOAT NULL DEFAULT (0) | Ban đêm (Night) (Số ngày (Days)) |
| `NIG_HR` | FLOAT NULL DEFAULT (0) | Ban đêm (Night) (Số giờ (Hours)) |
| `DOF_HR` | FLOAT NULL DEFAULT (0) | Ngày nghỉ (Day off) (Số giờ (Hours)) |
| `DOF_OT` | FLOAT NULL DEFAULT (0) | Ngày nghỉ (Day off) (Tăng ca (Overtime)) |
| `DOF_OV` | FLOAT NULL DEFAULT (0) | Ngày nghỉ (Day off) (Tăng ca loại khác)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `HOL_HR` | FLOAT NULL DEFAULT (0) | Ngày lễ (Holiday) (Số giờ (Hours)) |
| `HOL_OT` | FLOAT NULL DEFAULT (0) | Ngày lễ (Holiday) (Tăng ca (Overtime)) |
| `HOL_OV` | FLOAT NULL DEFAULT (0) | Ngày lễ (Holiday) (Tăng ca loại khác)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `NIG_OT` | FLOAT NULL DEFAULT (0) | Ban đêm (Night) (Tăng ca (Overtime)) |
| `NIG_OV` | FLOAT NULL | Ban đêm (Night) (Tăng ca loại khác)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `PRO_HR` | FLOAT NULL DEFAULT (0) | Trình độ chuyên môn (hoặc: Thử việc - Probation, tùy bảng) (Số giờ (Hours))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `PRO_IV` | FLOAT NULL DEFAULT (0) | Trình độ chuyên môn (hoặc: Thử việc - Probation, tùy bảng) (Chưa rõ nghĩa cụ thể (liên quan giờ thử việc))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `PRO_OT` | FLOAT NULL DEFAULT (0) | Trình độ chuyên môn (hoặc: Thử việc - Probation, tùy bảng) (Tăng ca (Overtime))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `OTR_HR` | FLOAT NULL DEFAULT (0) | Tăng ca khác (Số giờ (Hours))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `LEA_001` | FLOAT NULL DEFAULT (0) | Nghỉ phép (Leave) |
| `LEA_002` | FLOAT NULL DEFAULT (0) | Nghỉ phép (Leave) |
| `LEA_003` | FLOAT NULL DEFAULT (0) | Nghỉ phép (Leave) |
| `LEA_004` | FLOAT NULL DEFAULT (0) | Nghỉ phép (Leave) |
| `LEA_005` | FLOAT NULL DEFAULT (0) | Nghỉ phép (Leave) |
| `LEA_006` | FLOAT NULL DEFAULT (0) | Nghỉ phép (Leave) |
| `LEA_007` | FLOAT NULL DEFAULT (0) | Nghỉ phép (Leave) |
| `LEA_008` | FLOAT NULL DEFAULT (0) | Nghỉ phép (Leave) |
| `LEA_009` | FLOAT NULL DEFAULT (0) | Nghỉ phép (Leave) |
| `LEA_010` | FLOAT NULL DEFAULT (0) | Nghỉ phép (Leave) |
| `LEA_011` | FLOAT NULL DEFAULT (0) | Nghỉ phép (Leave) |
| `LEA_012` | FLOAT NULL DEFAULT (0) | Nghỉ phép (Leave) |
| `LEA_013` | FLOAT NULL DEFAULT (0) | Nghỉ phép (Leave) |
| `LEA_014` | FLOAT NULL DEFAULT (0) | Nghỉ phép (Leave) |
| `LEA_015` | FLOAT NULL DEFAULT (0) | Nghỉ phép (Leave) |
| `LEA_016` | FLOAT NULL DEFAULT (0) | Nghỉ phép (Leave) |
| `LEA_017` | FLOAT NULL DEFAULT (0) | Nghỉ phép (Leave) |
| `LEA_018` | FLOAT NULL DEFAULT (0) | Nghỉ phép (Leave) |
| `LEA_019` | FLOAT NULL DEFAULT (0) | Nghỉ phép (Leave) |
| `LEA_020` | FLOAT NULL DEFAULT (0) | Nghỉ phép (Leave) |
| `BOS_AM` | FLOAT NULL DEFAULT (0) | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `FIN_AM` | FLOAT NULL DEFAULT (0) | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `Cơm TC` | INT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `TRE_PH` | BIT NULL | Trễ (Phép (nghỉ có lương))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `TRU_C1` | FLOAT NULL | Trừ (giờ/ngày công) (Ca 1 (Shift 1))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `TRU_C2` | FLOAT NULL | Trừ (giờ/ngày công) (Ca 2 (Shift 2))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `LAT_C1` | FLOAT NULL | Đi trễ (Late) (Ca 1 (Shift 1))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `LAT_C2` | FLOAT NULL | Đi trễ (Late) (Ca 2 (Shift 2))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `COM_PH` | FLOAT NULL | Công ty (Phép (nghỉ có lương))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `COMTC1` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `COMTC2` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `DOF_TT` | FLOAT NULL | Ngày nghỉ (Day off) (Tổng / Trạng thái (tùy ngữ cảnh))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `GIO_TS` | FLOAT NULL | Giờ (Tổng số)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `DOF_DY` | FLOAT NULL | Ngày nghỉ (Day off) (Số ngày (Days)) |
| `OVO_DY` | FLOAT NULL | Tăng ca ngày khác (Overtime Other) (Số ngày (Days))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `NIG_D1` | FLOAT NULL | Ban đêm (Night) (Trường phụ / biến thể của cột ngày hoặc diễn giải)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `INN_DY` | FLOAT NULL | Vào (biến thể của ONN) (Số ngày (Days))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `INN_D1` | FLOAT NULL | Vào (biến thể của ONN) (Trường phụ / biến thể của cột ngày hoặc diễn giải)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `GIOSH` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `HOL_DY` | FLOAT NULL | Ngày lễ (Holiday) (Số ngày (Days)) |
| `CUT_OT` | FLOAT NULL | Cắt trừ (Tăng ca (Overtime))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `CUT_OV` | FLOAT NULL | Cắt trừ (Tăng ca loại khác)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `CUT_DO` | FLOAT NULL | Cắt trừ (Lý do)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `CUT_HO` | FLOAT NULL | Cắt trừ (Chưa rõ nghĩa cụ thể)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `CUT_DV` | FLOAT NULL | Cắt trừ (Đơn vị)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `CUT_HV` | FLOAT NULL | Cắt trừ (Chưa rõ nghĩa cụ thể)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `CUT_NG` | FLOAT NULL | Cắt trừ (Chưa rõ nghĩa cụ thể (có thể là 'ngày'))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `CUT_NO` | FLOAT NULL | Cắt trừ (Số (Number))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `NG` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `ITRE` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `ISOM` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `ITRES` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `ISOMS` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `NIG_HL` | FLOAT NULL | Ban đêm (Night) (Chưa rõ nghĩa cụ thể)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `COM_OT` | FLOAT NULL | Công ty (Tăng ca (Overtime)) |

#### `FILC06A_b` — Bản sao/biến thể của `FILC06A` **[Suy luận]**

Bảng này có cấu trúc tương tự bảng gốc **`FILC06A`** (xem chi tiết cột tại mục bảng đó). Đây là bản sao lưu / biến thể lịch sử, **khuyến nghị không cần map sang backend mới**, trừ khi cần đối chiếu dữ liệu cũ.

#### `FILC06A_c` — Bản sao/biến thể của `FILC06A` **[Suy luận]**

Bảng này có cấu trúc tương tự bảng gốc **`FILC06A`** (xem chi tiết cột tại mục bảng đó). Đây là bản sao lưu / biến thể lịch sử, **khuyến nghị không cần map sang backend mới**, trừ khi cần đối chiếu dữ liệu cũ.

#### `FILC06A_d` — Bản sao/biến thể của `FILC06A` **[Suy luận]**

Bảng này có cấu trúc tương tự bảng gốc **`FILC06A`** (xem chi tiết cột tại mục bảng đó). Đây là bản sao lưu / biến thể lịch sử, **khuyến nghị không cần map sang backend mới**, trừ khi cần đối chiếu dữ liệu cũ.

#### `FILC06A_e` — Bản sao/biến thể của `FILC06A` **[Suy luận]**

Bảng này có cấu trúc tương tự bảng gốc **`FILC06A`** (xem chi tiết cột tại mục bảng đó). Đây là bản sao lưu / biến thể lịch sử, **khuyến nghị không cần map sang backend mới**, trừ khi cần đối chiếu dữ liệu cũ.

#### `FILC06A_hiencc` — Bản sao/biến thể của `FILC06A` **[Suy luận]**

Bảng này có cấu trúc tương tự bảng gốc **`FILC06A`** (xem chi tiết cột tại mục bảng đó). Đây là bản sao lưu / biến thể lịch sử, **khuyến nghị không cần map sang backend mới**, trừ khi cần đối chiếu dữ liệu cũ.

#### `FILC06A_vinhtuyen` — Bản sao/biến thể của `FILC06A` **[Suy luận]**

Bảng này có cấu trúc tương tự bảng gốc **`FILC06A`** (xem chi tiết cột tại mục bảng đó). Đây là bản sao lưu / biến thể lịch sử, **khuyến nghị không cần map sang backend mới**, trừ khi cần đối chiếu dữ liệu cũ.

#### `FILC06B` — *(xem chi tiết ở Phần 3)*

> ⚠️ Bảng có **92 cột** (nhiều khả năng là bảng tổng hợp/ma trận theo ngày hoặc theo ca). Danh sách đầy đủ bên dưới, nhưng nhiều cột lặp lại theo mẫu số thứ tự (01, 02, 03...) cùng một ý nghĩa nghiệp vụ.

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `EMP_ID` | NVARCHAR(20) NOT NULL | Nhân viên (Mã (khóa nhận diện)) |
| `ATT_DT` | DATETIME NOT NULL | Chấm công / Có mặt (Ngày (Date)) |
| `DEP_ID` | NVARCHAR(10) NULL | Phòng ban / Bộ phận (Mã (khóa nhận diện)) |
| `EMP_I1` | NVARCHAR(20) NULL | Nhân viên (Trường phụ / biến thể 1)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `SHI_ID` | NVARCHAR(10) NOT NULL | Ca làm việc (Shift) (Mã (khóa nhận diện)) |
| `NOT_DR` | NVARCHAR(500) NULL | Ghi chú (Nội dung diễn giải / ghi chú dạng text) |
| `NOT_D1` | NVARCHAR(500) NULL | Ghi chú (Trường phụ / biến thể của cột ngày hoặc diễn giải)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `NIG_TM` | FLOAT NULL DEFAULT (0) | Ban đêm (Night) (Giờ / thời điểm (Time)) |
| `ONN_01` | FLOAT NULL DEFAULT (0) | Giờ vào / Check-in |
| `OFF_01` | FLOAT NULL DEFAULT (0) | Giờ ra / Check-out |
| `ONN_02` | FLOAT NULL DEFAULT (0) | Giờ vào / Check-in |
| `OFF_02` | FLOAT NULL DEFAULT (0) | Giờ ra / Check-out |
| `ONN_03` | FLOAT NULL DEFAULT (0) | Giờ vào / Check-in |
| `OFF_03` | FLOAT NULL DEFAULT (0) | Giờ ra / Check-out |
| `ONN_04` | FLOAT NULL DEFAULT (0) | Giờ vào / Check-in |
| `OFF_04` | FLOAT NULL DEFAULT (0) | Giờ ra / Check-out |
| `ONN_05` | FLOAT NULL DEFAULT (0) | Giờ vào / Check-in |
| `OFF_05` | FLOAT NULL DEFAULT (0) | Giờ ra / Check-out |
| `ONN_06` | FLOAT NULL DEFAULT (0) | Giờ vào / Check-in |
| `OFF_06` | FLOAT NULL DEFAULT (0) | Giờ ra / Check-out |
| `OFF_07` | FLOAT NULL DEFAULT (0) | Giờ ra / Check-out |
| `ONN_07` | FLOAT NULL DEFAULT (0) | Giờ vào / Check-in |
| `OFF_08` | FLOAT NULL DEFAULT (0) | Giờ ra / Check-out |
| `ONN_08` | FLOAT NULL DEFAULT (0) | Giờ vào / Check-in |
| `ONN_09` | FLOAT NULL DEFAULT (0) | Giờ vào / Check-in |
| `OFF_09` | FLOAT NULL DEFAULT (0) | Giờ ra / Check-out |
| `ONN_10` | FLOAT NULL DEFAULT (0) | Giờ vào / Check-in |
| `OFF_10` | FLOAT NULL DEFAULT (0) | Giờ ra / Check-out |
| `ATT_HR` | FLOAT NULL DEFAULT (0) | Chấm công / Có mặt (Số giờ (Hours)) |
| `OTT_HR` | FLOAT NULL DEFAULT (0) | Tăng ca (Overtime Total) (Số giờ (Hours))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `OVO_HR` | FLOAT NULL DEFAULT (0) | Tăng ca ngày khác (Overtime Other) (Số giờ (Hours))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `LAT_MN` | FLOAT NULL DEFAULT (0) | Đi trễ (Late) (Số phút (Minutes) — hoặc mã nhóm tùy bảng)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `LAT_TM` | INT NULL DEFAULT (0) | Đi trễ (Late) (Giờ / thời điểm (Time)) |
| `EAR_MN` | FLOAT NULL DEFAULT (0) | Về sớm (Early) (Số phút (Minutes) — hoặc mã nhóm tùy bảng)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `EAR_TM` | INT NULL DEFAULT (0) | Về sớm (Early) (Giờ / thời điểm (Time)) |
| `ABS_MN` | FLOAT NULL DEFAULT (0) | Vắng mặt (Absent) (Số phút (Minutes) — hoặc mã nhóm tùy bảng)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `ABS_TM` | INT NULL DEFAULT (0) | Vắng mặt (Absent) (Giờ / thời điểm (Time)) |
| `ATT_DY` | FLOAT NULL DEFAULT (0) | Chấm công / Có mặt (Số ngày (Days)) |
| `NIG_DY` | FLOAT NULL DEFAULT (0) | Ban đêm (Night) (Số ngày (Days)) |
| `LOC_BT` | BIT NULL | Vị trí / Định vị chấm công (Location) (Cờ đúng-sai (Bit: 1/0))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `LOC_B1` | BIT NULL | Vị trí / Định vị chấm công (Location)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `USR_CK` | NVARCHAR(50) NULL | Người dùng (User) (Người kiểm tra (Check))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `NIG_HR` | FLOAT NULL DEFAULT (0) | Ban đêm (Night) (Số giờ (Hours)) |
| `NIG_OV` | FLOAT NULL | Ban đêm (Night) (Tăng ca loại khác)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `DOF_HR` | FLOAT NULL DEFAULT (0) | Ngày nghỉ (Day off) (Số giờ (Hours)) |
| `DOF_OT` | FLOAT NULL DEFAULT (0) | Ngày nghỉ (Day off) (Tăng ca (Overtime)) |
| `DOF_OV` | FLOAT NULL DEFAULT (0) | Ngày nghỉ (Day off) (Tăng ca loại khác)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `HOL_HR` | FLOAT NULL DEFAULT (0) | Ngày lễ (Holiday) (Số giờ (Hours)) |
| `HOL_OT` | FLOAT NULL DEFAULT (0) | Ngày lễ (Holiday) (Tăng ca (Overtime)) |
| `HOL_OV` | FLOAT NULL DEFAULT (0) | Ngày lễ (Holiday) (Tăng ca loại khác)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `NIG_OT` | FLOAT NULL DEFAULT (0) | Ban đêm (Night) (Tăng ca (Overtime)) |
| `PRO_HR` | FLOAT NULL DEFAULT (0) | Trình độ chuyên môn (hoặc: Thử việc - Probation, tùy bảng) (Số giờ (Hours))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `PRO_IV` | FLOAT NULL DEFAULT (0) | Trình độ chuyên môn (hoặc: Thử việc - Probation, tùy bảng) (Chưa rõ nghĩa cụ thể (liên quan giờ thử việc))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `PRO_OT` | FLOAT NULL DEFAULT (0) | Trình độ chuyên môn (hoặc: Thử việc - Probation, tùy bảng) (Tăng ca (Overtime))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `LEA_I1` | NVARCHAR(10) NULL | Nghỉ phép (Leave) (Trường phụ / biến thể 1)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `LEA_H1` | FLOAT NULL DEFAULT (0) | Nghỉ phép (Leave) |
| `LEA_I2` | NVARCHAR(10) NULL | Nghỉ phép (Leave) (Trường phụ / biến thể 2)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `LEA_H2` | FLOAT NULL DEFAULT (0) | Nghỉ phép (Leave) |
| `LEA_I3` | NVARCHAR(10) NULL | Nghỉ phép (Leave) (Trường phụ / biến thể 3)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `LEA_H3` | FLOAT NULL DEFAULT (0) | Nghỉ phép (Leave) |
| `OTR_HR` | FLOAT NULL DEFAULT (0) | Tăng ca khác (Số giờ (Hours))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `Cơm TC` | INT NULL DEFAULT (0) | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `TRE_PH` | BIT NULL | Trễ (Phép (nghỉ có lương))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `TRU_C1` | FLOAT NULL DEFAULT (0) | Trừ (giờ/ngày công) (Ca 1 (Shift 1))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `TRU_C2` | FLOAT NULL DEFAULT (0) | Trừ (giờ/ngày công) (Ca 2 (Shift 2))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `LAT_C1` | FLOAT NULL DEFAULT (0) | Đi trễ (Late) (Ca 1 (Shift 1))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `LAT_C2` | FLOAT NULL DEFAULT (0) | Đi trễ (Late) (Ca 2 (Shift 2))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `COM_PH` | FLOAT NULL DEFAULT (0) | Công ty (Phép (nghỉ có lương))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `COMTC1` | FLOAT NULL DEFAULT (0) | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `COMTC2` | FLOAT NULL DEFAULT (0) | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `GIO_TS` | FLOAT NULL DEFAULT (0) | Giờ (Tổng số)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `DOF_DY` | FLOAT NULL DEFAULT (0) | Ngày nghỉ (Day off) (Số ngày (Days)) |
| `OVO_DY` | FLOAT NULL DEFAULT (0) | Tăng ca ngày khác (Overtime Other) (Số ngày (Days))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `NIG_D1` | FLOAT NULL DEFAULT (0) | Ban đêm (Night) (Trường phụ / biến thể của cột ngày hoặc diễn giải)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `INN_DY` | FLOAT NULL DEFAULT (0) | Vào (biến thể của ONN) (Số ngày (Days))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `INN_D1` | FLOAT NULL DEFAULT (0) | Vào (biến thể của ONN) (Trường phụ / biến thể của cột ngày hoặc diễn giải)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `GIOSH` | FLOAT NULL DEFAULT (0) | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `HOL_DY` | FLOAT NULL DEFAULT (0) | Ngày lễ (Holiday) (Số ngày (Days)) |
| `CUT_OT` | FLOAT NULL DEFAULT (0) | Cắt trừ (Tăng ca (Overtime))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `CUT_OV` | FLOAT NULL DEFAULT (0) | Cắt trừ (Tăng ca loại khác)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `CUT_DO` | FLOAT NULL DEFAULT (0) | Cắt trừ (Lý do)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `CUT_HO` | FLOAT NULL DEFAULT (0) | Cắt trừ (Chưa rõ nghĩa cụ thể)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `CUT_DV` | FLOAT NULL DEFAULT (0) | Cắt trừ (Đơn vị)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `CUT_HV` | FLOAT NULL DEFAULT (0) | Cắt trừ (Chưa rõ nghĩa cụ thể)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `CUT_NG` | FLOAT NULL DEFAULT (0) | Cắt trừ (Chưa rõ nghĩa cụ thể (có thể là 'ngày'))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `CUT_NO` | FLOAT NULL DEFAULT (0) | Cắt trừ (Số (Number))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `NG` | FLOAT NULL DEFAULT (0) | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `ITRE` | FLOAT NULL DEFAULT (0) | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `ISOM` | FLOAT NULL DEFAULT (0) | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `ITRES` | FLOAT NULL DEFAULT (0) | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `ISOMS` | FLOAT NULL DEFAULT (0) | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `COM_OT` | FLOAT NULL DEFAULT ((0)) | Công ty (Tăng ca (Overtime)) |

#### `FILC07A` — *(xem chi tiết ở Phần 3)*

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `COL_NM` | NVARCHAR(6) NOT NULL | Cột dữ liệu (Column) — dùng trong bảng cấu hình cột động (Tên) |
| `COL_MM` | NVARCHAR(50) NULL | Cột dữ liệu (Column) — dùng trong bảng cấu hình cột động (Tháng (Month)) |
| `COL_EN` | NVARCHAR(50) NULL | Cột dữ liệu (Column) — dùng trong bảng cấu hình cột động (Tên tiếng Anh (đa ngôn ngữ)) |
| `COL_VN` | NVARCHAR(50) NULL | Cột dữ liệu (Column) — dùng trong bảng cấu hình cột động (Tên tiếng Việt (đa ngôn ngữ)) |
| `COL_CH` | NVARCHAR(50) NULL | Cột dữ liệu (Column) — dùng trong bảng cấu hình cột động (Tên tiếng Hoa (đa ngôn ngữ)) |
| `COL_TT` | NVARCHAR(50) NULL | Cột dữ liệu (Column) — dùng trong bảng cấu hình cột động (Tổng / Trạng thái (tùy ngữ cảnh))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `MON_BT` | BIT NULL | Tháng (Cờ đúng-sai (Bit: 1/0)) |
| `FOR_DR` | NVARCHAR(50) NULL | (Nội dung diễn giải / ghi chú dạng text) |
| `GIO_BT` | BIT NULL | Giờ (Cờ đúng-sai (Bit: 1/0)) |
| `HID_BT` | BIT NULL | (Cờ đúng-sai (Bit: 1/0)) |

#### `FILC08A` — Công thức **[Xác nhận]**

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `SEQ_NO` | INT NOT NULL | Số thứ tự (Số (Number)) |
| `RUN_BT` | BIT NOT NULL | Cho phép chạy / kích hoạt (Cờ đúng-sai (Bit: 1/0))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `SEQ_N1` | INT NULL | Số thứ tự (Trường tên phụ / biến thể 2)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `ITE_NM` | NVARCHAR(8) NULL | Hạng mục (Item) (Tên)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `VAL_DR` | NVARCHAR(500) NULL | Giá trị (Nội dung diễn giải / ghi chú dạng text) |
| `CON_DR` | NVARCHAR(1000) NULL | Điều kiện / Kết nối (Nội dung diễn giải / ghi chú dạng text)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `SQL_DR` | NVARCHAR(4000) NULL | Câu lệnh SQL động (Nội dung diễn giải / ghi chú dạng text) |
| `REM_DR` | NVARCHAR(500) NULL | Ghi chú / Remark (Nội dung diễn giải / ghi chú dạng text) |
| `BLT_NM` | NVARCHAR(50) NULL | Người tạo bản ghi (Built by) (Tên) |
| `BLT_DT` | DATETIME NULL | Người tạo bản ghi (Built by) (Ngày (Date)) |
| `LST_NM` | NVARCHAR(50) NULL | Người & thời gian sửa lần cuối (Last update) (Tên) |
| `LST_DT` | DATETIME NULL | Người & thời gian sửa lần cuối (Last update) (Ngày (Date)) |

#### `FILC08A1` — *(xem chi tiết ở Phần 3)*

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `SEQ_NO` | INT NOT NULL | Số thứ tự (Số (Number)) |
| `RUN_BT` | BIT NULL | Cho phép chạy / kích hoạt (Cờ đúng-sai (Bit: 1/0))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `SEQ_N1` | INT NULL | Số thứ tự (Trường tên phụ / biến thể 2)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `ITE_NM` | NVARCHAR(8) NULL | Hạng mục (Item) (Tên)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `VAL_DR` | NVARCHAR(500) NULL | Giá trị (Nội dung diễn giải / ghi chú dạng text) |
| `CON_DR` | NVARCHAR(1000) NULL | Điều kiện / Kết nối (Nội dung diễn giải / ghi chú dạng text)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `SQL_DR` | NVARCHAR(4000) NULL | Câu lệnh SQL động (Nội dung diễn giải / ghi chú dạng text) |
| `REM_DR` | NVARCHAR(500) NULL | Ghi chú / Remark (Nội dung diễn giải / ghi chú dạng text) |
| `BLT_NM` | NVARCHAR(50) NULL | Người tạo bản ghi (Built by) (Tên) |
| `BLT_DT` | DATETIME NULL | Người tạo bản ghi (Built by) (Ngày (Date)) |
| `LST_NM` | NVARCHAR(50) NULL | Người & thời gian sửa lần cuối (Last update) (Tên) |
| `LST_DT` | DATETIME NULL | Người & thời gian sửa lần cuối (Last update) (Ngày (Date)) |

#### `FILC09A` — Nuoi con nho, Thai Sản **[Xác nhận]**

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `EMP_ID` | NVARCHAR(20) NOT NULL | Nhân viên (Mã (khóa nhận diện)) |
| `SEQ_NO` | INT NOT NULL | Số thứ tự (Số (Number)) |
| `MAN_ST` | DATETIME NULL | Thời gian yêu cầu tăng ca thủ công (Manual) (Bắt đầu (Start))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `MAN_ED` | DATETIME NULL | Thời gian yêu cầu tăng ca thủ công (Manual) (Kết thúc (End))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `OTT_BT` | BIT NULL | Tăng ca (Overtime Total) (Cờ đúng-sai (Bit: 1/0))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `WRK_OT` | FLOAT NULL | Làm việc (Work) (Tăng ca (Overtime)) |
| `CON_HR` | FLOAT NULL | Điều kiện / Kết nối (Số giờ (Hours))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `REM_DR` | NVARCHAR(50) NULL | Ghi chú / Remark (Nội dung diễn giải / ghi chú dạng text) |
| `BLT_NM` | NVARCHAR(50) NULL | Người tạo bản ghi (Built by) (Tên) |
| `BLT_DT` | DATETIME NULL | Người tạo bản ghi (Built by) (Ngày (Date)) |
| `LST_NM` | NVARCHAR(50) NULL | Người & thời gian sửa lần cuối (Last update) (Tên) |
| `LST_DT` | DATETIME NULL | Người & thời gian sửa lần cuối (Last update) (Ngày (Date)) |

#### `FILC10A` — *(xem chi tiết ở Phần 3)*

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `SEQ_NO` | INT NOT NULL | Số thứ tự (Số (Number)) |
| `EMP_ID` | NVARCHAR(20) NOT NULL | Nhân viên (Mã (khóa nhận diện)) |
| `SEQ_DT` | DATETIME NOT NULL | Số thứ tự (Ngày (Date)) |
| `FRM_DT` | DATETIME NULL | Từ ngày (From) (Ngày (Date)) |
| `TOO_DT` | DATETIME NULL | Đến ngày (To) (Ngày (Date))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `DON_AP` | BIT NULL | Đơn (đơn xin/đơn đề nghị) |
| `REA_DR` | NVARCHAR(50) NULL | Lý do (Reason) (Nội dung diễn giải / ghi chú dạng text) |
| `VAC_BT` | BIT NULL | Nghỉ việc (lý do/trạng thái thôi việc) (Cờ đúng-sai (Bit: 1/0)) |
| `LST_NM` | NVARCHAR(50) NULL | Người & thời gian sửa lần cuối (Last update) (Tên) |
| `LST_DT` | DATETIME NULL | Người & thời gian sửa lần cuối (Last update) (Ngày (Date)) |

#### `FILC11A` — *(xem chi tiết ở Phần 3)*

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `FUN_ID` | NVARCHAR(50) NOT NULL | Hàm / chức năng (Function) (Mã (khóa nhận diện)) |
| `FUN_NM` | NVARCHAR(50) NULL | Hàm / chức năng (Function) (Tên) |
| `SQL_DR` | NVARCHAR(4000) NULL | Câu lệnh SQL động (Nội dung diễn giải / ghi chú dạng text) |

#### `FILC12A` — *(xem chi tiết ở Phần 3)*

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `GRP_FO` | NVARCHAR(10) NOT NULL | Nhóm |
| `GRP_NM` | NVARCHAR(20) NULL | Nhóm (Tên) |
| `ADD_HR` | FLOAT NULL | Địa chỉ (Số giờ (Hours)) |

#### `FILC12B` — *(xem chi tiết ở Phần 3)*

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `GRP_FO` | NVARCHAR(10) NOT NULL | Nhóm |
| `FOR_ID` | INT NOT NULL | (Mã (khóa nhận diện)) |
| `COL_NM1` | NVARCHAR(6) NULL | Cột dữ liệu (Column) — dùng trong bảng cấu hình cột động |
| `COL_MM1` | NVARCHAR(50) NULL | Cột dữ liệu (Column) — dùng trong bảng cấu hình cột động |
| `CON_DR` | FLOAT NULL | Điều kiện / Kết nối (Nội dung diễn giải / ghi chú dạng text)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `COL_NM2` | NVARCHAR(6) NULL | Cột dữ liệu (Column) — dùng trong bảng cấu hình cột động |
| `COL_MM2` | NVARCHAR(50) NULL | Cột dữ liệu (Column) — dùng trong bảng cấu hình cột động |
| `SEQ_NO` | INT NULL | Số thứ tự (Số (Number)) |
| `FUN_ID` | NVARCHAR(50) NULL | Hàm / chức năng (Function) (Mã (khóa nhận diện)) |
| `BLT_NM` | NVARCHAR(50) NULL | Người tạo bản ghi (Built by) (Tên) |
| `BLT_DT` | DATETIME NULL | Người tạo bản ghi (Built by) (Ngày (Date)) |
| `LST_NM` | NVARCHAR(50) NULL | Người & thời gian sửa lần cuối (Last update) (Tên) |
| `LST_DT` | DATETIME NULL | Người & thời gian sửa lần cuối (Last update) (Ngày (Date)) |

#### `FILC13A` — *(xem chi tiết ở Phần 3)*

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `YYY_YY` | NVARCHAR(4) NOT NULL | Năm (Năm (Year)) |
| `MMM_MM` | INT NOT NULL | Tháng (Tháng (Month)) |
| `h1` | NVARCHAR(10) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `h2` | NVARCHAR(10) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `h3` | NVARCHAR(10) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `h4` | NVARCHAR(10) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `h5` | NVARCHAR(10) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `h6` | NVARCHAR(10) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `h7` | NVARCHAR(10) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `h8` | NVARCHAR(10) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `h9` | NVARCHAR(10) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `h10` | NVARCHAR(10) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `h11` | NVARCHAR(10) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `h12` | NVARCHAR(10) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `h13` | NVARCHAR(10) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `h14` | NVARCHAR(10) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `h15` | NVARCHAR(10) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `h16` | NVARCHAR(10) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `h17` | NVARCHAR(10) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `h18` | NVARCHAR(10) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `h19` | NVARCHAR(10) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `h20` | NVARCHAR(10) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `h21` | NVARCHAR(10) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `h22` | NVARCHAR(10) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `h23` | NVARCHAR(10) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `h24` | NVARCHAR(10) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `h25` | NVARCHAR(10) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `h26` | NVARCHAR(10) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `h27` | NVARCHAR(10) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `h28` | NVARCHAR(10) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `h29` | NVARCHAR(10) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `h30` | NVARCHAR(10) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `h31` | NVARCHAR(10) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `BLT_NM` | NVARCHAR(50) NULL | Người tạo bản ghi (Built by) (Tên) |
| `BLT_DT` | DATETIME NULL | Người tạo bản ghi (Built by) (Ngày (Date)) |
| `LST_NM` | NVARCHAR(50) NULL | Người & thời gian sửa lần cuối (Last update) (Tên) |
| `LST_DT` | DATETIME NULL | Người & thời gian sửa lần cuối (Last update) (Ngày (Date)) |

#### `FILC13A_DEP` — Bản sao/biến thể của `FILC13A` **[Suy luận]**

Bảng này có cấu trúc tương tự bảng gốc **`FILC13A`** (xem chi tiết cột tại mục bảng đó). Đây là bản sao lưu / biến thể lịch sử, **khuyến nghị không cần map sang backend mới**, trừ khi cần đối chiếu dữ liệu cũ.

#### `FILC14A` — *(xem chi tiết ở Phần 3)*

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `YYY_YY` | NVARCHAR(4) NOT NULL | Năm (Năm (Year)) |
| `h1` | NVARCHAR(10) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `h2` | NVARCHAR(10) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `h3` | NVARCHAR(10) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `h4` | NVARCHAR(10) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `h5` | NVARCHAR(10) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `h6` | NVARCHAR(10) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `h7` | NVARCHAR(10) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `WEE_BY` | BIT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `LST_NM` | NVARCHAR(50) NULL | Người & thời gian sửa lần cuối (Last update) (Tên) |
| `LST_DT` | DATETIME NULL | Người & thời gian sửa lần cuối (Last update) (Ngày (Date)) |

### FILD – Bảng lương / phúc lợi

#### `FILD01A` — *(xem chi tiết ở Phần 3)*

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `COL_NM` | NVARCHAR(20) NOT NULL | Cột dữ liệu (Column) — dùng trong bảng cấu hình cột động (Tên) |
| `SEQ_NO` | INT NULL | Số thứ tự (Số (Number)) |
| `COL_EN` | NVARCHAR(50) NULL | Cột dữ liệu (Column) — dùng trong bảng cấu hình cột động (Tên tiếng Anh (đa ngôn ngữ)) |
| `COL_VN` | NVARCHAR(50) NULL | Cột dữ liệu (Column) — dùng trong bảng cấu hình cột động (Tên tiếng Việt (đa ngôn ngữ)) |
| `COL_CH` | NVARCHAR(50) NULL | Cột dữ liệu (Column) — dùng trong bảng cấu hình cột động (Tên tiếng Hoa (đa ngôn ngữ)) |
| `COL_TT` | NVARCHAR(50) NULL | Cột dữ liệu (Column) — dùng trong bảng cấu hình cột động (Tổng / Trạng thái (tùy ngữ cảnh))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `HUR_BT` | BIT NULL | (Cờ đúng-sai (Bit: 1/0)) |
| `ACC_BT` | BIT NULL | Tài khoản ngân hàng (Cờ đúng-sai (Bit: 1/0)) |
| `BAS_BT` | BIT NULL | (Cờ đúng-sai (Bit: 1/0)) |
| `QIN_BT` | BIT NULL | (Cờ đúng-sai (Bit: 1/0)) |
| `LCK_BT` | BIT NULL | Khóa (không cho chỉnh sửa) (Cờ đúng-sai (Bit: 1/0)) |
| `HID_BT` | BIT NULL | (Cờ đúng-sai (Bit: 1/0)) |
| `INI_BT` | BIT NULL | (Cờ đúng-sai (Bit: 1/0)) |

#### `FILD01B` — *(xem chi tiết ở Phần 3)*

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `SEQ_NO` | INT NOT NULL | Số thứ tự (Số (Number)) |
| `SEQ_N1` | INT NULL | Số thứ tự (Trường tên phụ / biến thể 2)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `ITE_NM` | NVARCHAR(22) NULL | Hạng mục (Item) (Tên)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `VAL_DR` | NVARCHAR(500) NULL | Giá trị (Nội dung diễn giải / ghi chú dạng text) |
| `CON_DR` | NVARCHAR(4000) NULL | Điều kiện / Kết nối (Nội dung diễn giải / ghi chú dạng text)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `SQL_DR` | NVARCHAR(4000) NULL | Câu lệnh SQL động (Nội dung diễn giải / ghi chú dạng text) |
| `REM_DR` | NVARCHAR(500) NULL | Ghi chú / Remark (Nội dung diễn giải / ghi chú dạng text) |
| `FST_BT` | BIT NULL | (Cờ đúng-sai (Bit: 1/0)) |
| `LST_BT` | BIT NULL | Người & thời gian sửa lần cuối (Last update) (Cờ đúng-sai (Bit: 1/0)) |
| `SUM_BT` | BIT NULL | (Cờ đúng-sai (Bit: 1/0)) |
| `BEF_BT` | BIT NULL | (Cờ đúng-sai (Bit: 1/0)) |
| `AFT_BT` | BIT NULL | (Cờ đúng-sai (Bit: 1/0)) |
| `BLT_NM` | NVARCHAR(50) NULL | Người tạo bản ghi (Built by) (Tên) |
| `BLT_DT` | DATETIME NULL | Người tạo bản ghi (Built by) (Ngày (Date)) |
| `LST_NM` | NVARCHAR(50) NULL | Người & thời gian sửa lần cuối (Last update) (Tên) |
| `LST_DT` | DATETIME NULL | Người & thời gian sửa lần cuối (Last update) (Ngày (Date)) |

#### `FILD02A` — Bang Luong **[Xác nhận]**

> ⚠️ Bảng có **119 cột** (nhiều khả năng là bảng tổng hợp/ma trận theo ngày hoặc theo ca). Danh sách đầy đủ bên dưới, nhưng nhiều cột lặp lại theo mẫu số thứ tự (01, 02, 03...) cùng một ý nghĩa nghiệp vụ.

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `EMP_ID` | NVARCHAR(20) NOT NULL | Nhân viên (Mã (khóa nhận diện)) |
| `YYY_MM` | NVARCHAR(6) NOT NULL | Năm (Tháng (Month)) |
| `SEQ_NO` | INT NOT NULL | Số thứ tự (Số (Number)) |
| `DEP_ID` | NVARCHAR(10) NULL | Phòng ban / Bộ phận (Mã (khóa nhận diện)) |
| `EMP_DW` | NVARCHAR(20) NULL | Nhân viên |
| `LCK_BT` | BIT NULL | Khóa (không cho chỉnh sửa) (Cờ đúng-sai (Bit: 1/0)) |
| `REM_DR` | NVARCHAR(50) NULL | Ghi chú / Remark (Nội dung diễn giải / ghi chú dạng text) |
| `BLT_NM` | NVARCHAR(50) NULL | Người tạo bản ghi (Built by) (Tên) |
| `BLT_DT` | DATETIME NULL | Người tạo bản ghi (Built by) (Ngày (Date)) |
| `LST_NM` | NVARCHAR(50) NULL | Người & thời gian sửa lần cuối (Last update) (Tên) |
| `LST_DT` | DATETIME NULL | Người & thời gian sửa lần cuối (Last update) (Ngày (Date)) |
| `ROU_NM` | NVARCHAR(50) NULL | Làm tròn (Round) (Tên)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `ROU_DT` | DATETIME NULL | Làm tròn (Round) (Ngày (Date))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `LuongCB` | FLOAT NULL DEFAULT (0) | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `TongNgayCong` | FLOAT NULL DEFAULT (0) | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `TienChuyenCan` | FLOAT NULL DEFAULT (0) | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `TongLuong` | FLOAT NULL DEFAULT (0) | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `BaoHiem` | FLOAT NULL DEFAULT (0) | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `GiamTruGiaCanh` | FLOAT NULL DEFAULT (0) | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `ThuNhapTinhThue` | FLOAT NULL DEFAULT (0) | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `ThueTNCN` | FLOAT NULL DEFAULT (0) | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `ThucLanh` | FLOAT NULL DEFAULT (0) | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `NgayLVTrongThang` | FLOAT NULL DEFAULT (0) | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `NgayLe` | FLOAT NULL DEFAULT (0) | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `NgayPN` | FLOAT NULL DEFAULT (0) | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `GioTC` | FLOAT NULL DEFAULT (0) | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `GioTCCN` | FLOAT NULL DEFAULT (0) | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `GioTCQD` | FLOAT NULL DEFAULT (0) | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `GioTCLE` | FLOAT NULL DEFAULT (0) | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `TienLe` | FLOAT NULL DEFAULT (0) | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `TienPN` | FLOAT NULL DEFAULT (0) | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `TienTC` | FLOAT NULL DEFAULT (0) | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `TienTCCN` | FLOAT NULL DEFAULT (0) | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `TienTCLe` | FLOAT NULL DEFAULT (0) | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `CongDoan` | FLOAT NULL DEFAULT (0) | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `PhanComTC` | FLOAT NULL DEFAULT (0) | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `LuongSanPham` | FLOAT NULL DEFAULT (0) | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `TongGioCong` | FLOAT NULL DEFAULT (0) | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `LuongSanPhamGio` | FLOAT NULL DEFAULT (0) | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `PhuCapNNDH` | FLOAT NULL DEFAULT (0) | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `PhuCapChucVu` | FLOAT NULL DEFAULT (0) | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `TongLuongCB` | FLOAT NULL DEFAULT (0) | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `LuongCBGio` | FLOAT NULL DEFAULT (0) | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `TienGioCongTieuChuan` | FLOAT NULL DEFAULT (0) | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `GioCong` | FLOAT NULL DEFAULT (0) | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `GioPhepCoLuong` | FLOAT NULL DEFAULT (0) | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `TienPhepCoLuong` | FLOAT NULL DEFAULT (0) | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `TienThuongNangLuc` | FLOAT NULL DEFAULT (0) | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `TienThuongSanXuat` | FLOAT NULL DEFAULT (0) | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `TienThuongSanXuat_TL` | FLOAT NULL DEFAULT (0) | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `TroCapXe` | FLOAT NULL DEFAULT (0) | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `TroCapCom` | FLOAT NULL DEFAULT (0) | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `TroCapComTC` | FLOAT NULL DEFAULT (0) | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `PhiSinhHoat` | FLOAT NULL DEFAULT (0) | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `BoiDuongDocHai` | FLOAT NULL DEFAULT (0) | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `BuKhac` | FLOAT NULL DEFAULT (0) | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `TruTienCom` | FLOAT NULL DEFAULT (0) | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `TruTangCa` | FLOAT NULL DEFAULT (0) | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `VonVayCEP` | FLOAT NULL DEFAULT (0) | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `SoNguoiPhuThuoc` | FLOAT NULL DEFAULT (0) | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `LoaiLuong` | FLOAT NULL DEFAULT (0) | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `PhiHoTroGiuTre` | FLOAT NULL DEFAULT (0) | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `ThuNhapTinhThue_TT` | FLOAT NULL DEFAULT (0) | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `TienTCQD` | FLOAT NULL DEFAULT (0) | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `TienThuongNangSuat` | FLOAT NULL DEFAULT (0) | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `GioCaDem` | FLOAT NULL DEFAULT (0) | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `TienCaDem` | FLOAT NULL DEFAULT (0) | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `CongDoan_OK` | FLOAT NULL DEFAULT (0) | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `BHTN_OK` | FLOAT NULL DEFAULT (0) | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `TienThuongNangLuc_TL` | FLOAT NULL DEFAULT (0) | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `TienThuongDacBiet` | FLOAT NULL DEFAULT (0) | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `TienComXeCN` | FLOAT NULL DEFAULT (0) | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `TienComXeLE` | FLOAT NULL DEFAULT (0) | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `TienComXeSHDem` | FLOAT NULL DEFAULT (0) | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `TienComXeSHQuaDem` | FLOAT NULL DEFAULT (0) | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `TongLuongTrongGio` | FLOAT NULL DEFAULT (0) | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `ThucLanhTrongGio` | FLOAT NULL DEFAULT (0) | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `TongLuongNgoaiGio` | FLOAT NULL DEFAULT (0) | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `ThuNhapTinhThueTG` | FLOAT NULL DEFAULT (0) | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `ThueTNCN_TG` | FLOAT NULL DEFAULT (0) | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `GioTCVuot` | FLOAT NULL DEFAULT (0) | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `TienTCVuot` | FLOAT NULL DEFAULT (0) | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `TroCapComTCVuot` | FLOAT NULL DEFAULT (0) | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `TruTamUng` | FLOAT NULL DEFAULT (0) | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `GioLe` | FLOAT NULL DEFAULT (0) | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `GioCN_NG` | FLOAT NULL DEFAULT (0) | (Chưa rõ nghĩa cụ thể (có thể là 'ngày'))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `TienCN_NG` | FLOAT NULL DEFAULT (0) | (Chưa rõ nghĩa cụ thể (có thể là 'ngày'))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `TienComXeCN_NG` | FLOAT NULL DEFAULT (0) | (Chưa rõ nghĩa cụ thể (có thể là 'ngày'))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `Thuongtet` | FLOAT NULL DEFAULT (0) | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `Thuongchungnhan` | FLOAT NULL DEFAULT (0) | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `Songaypnnv` | FLOAT NULL DEFAULT (0) | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `Hesopn` | FLOAT NULL DEFAULT (0) | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `Sothangconlai` | FLOAT NULL DEFAULT (0) | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `Sopnngayconlai` | FLOAT NULL DEFAULT (0) | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `NgayleT` | FLOAT NULL DEFAULT (0) | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `Tienlethem` | FLOAT NULL DEFAULT (0) | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `ThuongDBCT` | FLOAT NULL DEFAULT (0) | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `HAV_QTCT` | FLOAT NULL DEFAULT (0) | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `ADD_QTCT` | FLOAT NULL DEFAULT (0) | Địa chỉ |
| `BOR_QTCT` | FLOAT NULL DEFAULT (0) | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `DID_QTCT` | FLOAT NULL DEFAULT (0) | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `A` | FLOAT NULL DEFAULT (0) | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `Ngayphepnamdh` | FLOAT NULL DEFAULT (0) | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `PCHSE` | FLOAT NULL DEFAULT (0) | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `BDDH` | FLOAT NULL DEFAULT (0) | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `tiencomle` | FLOAT NULL DEFAULT (0) | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `tiencomcn` | FLOAT NULL DEFAULT (0) | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `tienxecn` | FLOAT NULL DEFAULT (0) | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `tienxele` | FLOAT NULL DEFAULT (0) | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `Tongluongcb_PL` | FLOAT NULL DEFAULT (0) | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `Songayphep_NDH` | FLOAT NULL DEFAULT (0) | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `LuongCBgiocong` | FLOAT NULL DEFAULT (0) | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `HoanThue` | FLOAT NULL DEFAULT (0) | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `GioPhep` | FLOAT NULL DEFAULT (0) | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `LuongCBgioTC` | FLOAT NULL DEFAULT (0) | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `LuongNgungViec` | FLOAT NULL DEFAULT ((0)) | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `Alowance` | FLOAT NULL DEFAULT ((0)) | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `ThuongNangSuat` | FLOAT NULL DEFAULT ((0)) | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `NCC` | FLOAT NULL DEFAULT ((0)) | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |

#### `FILD02A_1` — Bản sao/biến thể của `FILD02A` **[Suy luận]**

Bảng này có cấu trúc tương tự bảng gốc **`FILD02A`** (xem chi tiết cột tại mục bảng đó). Đây là bản sao lưu / biến thể lịch sử, **khuyến nghị không cần map sang backend mới**, trừ khi cần đối chiếu dữ liệu cũ.

#### `FILD03A` — Bang Dieu Luong **[Xác nhận]**

> ⚠️ Bảng có **116 cột** (nhiều khả năng là bảng tổng hợp/ma trận theo ngày hoặc theo ca). Danh sách đầy đủ bên dưới, nhưng nhiều cột lặp lại theo mẫu số thứ tự (01, 02, 03...) cùng một ý nghĩa nghiệp vụ.

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `EMP_ID` | NVARCHAR(20) NOT NULL | Nhân viên (Mã (khóa nhận diện)) |
| `SEQ_NO` | INT NOT NULL | Số thứ tự (Số (Number)) |
| `CHA_DT` | DATETIME NULL | (Ngày (Date)) |
| `NOT_DR` | NVARCHAR(50) NULL | Ghi chú (Nội dung diễn giải / ghi chú dạng text) |
| `BLT_NM` | NVARCHAR(50) NULL | Người tạo bản ghi (Built by) (Tên) |
| `BLT_DT` | DATETIME NULL | Người tạo bản ghi (Built by) (Ngày (Date)) |
| `LST_NM` | NVARCHAR(50) NULL | Người & thời gian sửa lần cuối (Last update) (Tên) |
| `LST_DT` | DATETIME NULL | Người & thời gian sửa lần cuối (Last update) (Ngày (Date)) |
| `DON_AP` | BIT NULL | Đơn (đơn xin/đơn đề nghị) |
| `REA_DR` | NVARCHAR(50) NULL | Lý do (Reason) (Nội dung diễn giải / ghi chú dạng text) |
| `LuongCB` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `TongNgayCong` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `TienChuyenCan` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `TongLuong` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `BaoHiem` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `GiamTruGiaCanh` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `ThuNhapTinhThue` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `ThueTNCN` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `ThucLanh` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `NgayLVTrongThang` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `NgayLe` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `NgayPN` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `GioTC` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `GioTCCN` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `GioTCQD` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `GioTCLE` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `TienLe` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `TienPN` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `TienTC` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `TienTCCN` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `TienTCLe` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `CongDoan` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `PhanComTC` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `LuongSanPham` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `TongGioCong` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `LuongSanPhamGio` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `PhuCapNNDH` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `PhuCapChucVu` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `TongLuongCB` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `LuongCBGio` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `TienGioCongTieuChuan` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `GioCong` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `GioPhepCoLuong` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `TienPhepCoLuong` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `TienThuongNangLuc` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `TienThuongSanXuat` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `TienThuongSanXuat_TL` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `TroCapXe` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `TroCapCom` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `TroCapComTC` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `PhiSinhHoat` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `BoiDuongDocHai` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `BuKhac` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `TruTienCom` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `TruTangCa` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `VonVayCEP` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `SoNguoiPhuThuoc` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `LoaiLuong` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `PhiHoTroGiuTre` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `ThuNhapTinhThue_TT` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `TienTCQD` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `TienThuongNangSuat` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `GioCaDem` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `TienCaDem` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `CongDoan_OK` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `BHTN_OK` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `TienThuongNangLuc_TL` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `TienThuongDacBiet` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `TienComXeCN` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `TienComXeLE` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `TienComXeSHDem` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `TienComXeSHQuaDem` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `TongLuongTrongGio` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `ThucLanhTrongGio` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `TongLuongNgoaiGio` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `ThuNhapTinhThueTG` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `ThueTNCN_TG` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `GioTCVuot` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `TienTCVuot` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `TroCapComTCVuot` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `TruTamUng` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `GioLe` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `GioCN_NG` | FLOAT NULL | (Chưa rõ nghĩa cụ thể (có thể là 'ngày'))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `TienCN_NG` | FLOAT NULL | (Chưa rõ nghĩa cụ thể (có thể là 'ngày'))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `TienComXeCN_NG` | FLOAT NULL | (Chưa rõ nghĩa cụ thể (có thể là 'ngày'))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `Thuongtet` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `Thuongchungnhan` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `Songaypnnv` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `Hesopn` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `Sothangconlai` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `Sopnngayconlai` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `NgayleT` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `Tienlethem` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `ThuongDBCT` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `HAV_QTCT` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `ADD_QTCT` | FLOAT NULL | Địa chỉ |
| `BOR_QTCT` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `DID_QTCT` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `A` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `Ngayphepnamdh` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `PCHSE` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `BDDH` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `tiencomle` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `tiencomcn` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `tienxecn` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `tienxele` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `Tongluongcb_PL` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `Songayphep_NDH` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `LuongCBgiocong` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `HoanThue` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `GioPhep` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `LuongCBgioTC` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `LuongNgungViec` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `Alowance` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `ThuongNangSuat` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `NCC` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |

#### `FILD04A` — Khen thưởng - Kỷ Luật **[Xác nhận]**

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `EMP_ID` | NVARCHAR(20) NOT NULL | Nhân viên (Mã (khóa nhận diện)) |
| `SEQ_NO` | INT NOT NULL | Số thứ tự (Số (Number)) |
| `SEQ_DT` | DATETIME NULL | Số thứ tự (Ngày (Date)) |
| `BAF_ID` | NVARCHAR(3) NOT NULL | Loại thưởng phạt (Mã (khóa nhận diện)) |
| `TPE_ID` | BIT NULL | Loại (Type) (Mã (khóa nhận diện))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `TIM_QT` | INT NOT NULL | Số lần quy định (Giá trị quy định (số lần/số tiền))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `AMT_QT` | FLOAT NULL DEFAULT (0) | Số tiền quy định (Giá trị quy định (số lần/số tiền))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `VAC_ID` | NVARCHAR(3) NULL | Nghỉ việc (lý do/trạng thái thôi việc) (Mã (khóa nhận diện)) |
| `NOT_DR` | NVARCHAR(50) NULL | Ghi chú (Nội dung diễn giải / ghi chú dạng text) |
| `BLT_NM` | NVARCHAR(50) NOT NULL | Người tạo bản ghi (Built by) (Tên) |
| `BLT_DT` | DATETIME NULL | Người tạo bản ghi (Built by) (Ngày (Date)) |
| `LST_NM` | NVARCHAR(50) NULL | Người & thời gian sửa lần cuối (Last update) (Tên) |
| `LST_DT` | DATETIME NULL | Người & thời gian sửa lần cuối (Last update) (Ngày (Date)) |

#### `FILD05A` — TTNCN **[Xác nhận]**

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `MON_QT` | FLOAT NOT NULL | Tháng (Giá trị quy định (số lần/số tiền))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `COL_NO` | NVARCHAR(20) NULL | Cột dữ liệu (Column) — dùng trong bảng cấu hình cột động (Số (Number)) |

#### `FILD06A` — *(xem chi tiết ở Phần 3)*

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `EMP_ID` | NVARCHAR(20) NOT NULL | Nhân viên (Mã (khóa nhận diện)) |
| `YYY_MM` | NVARCHAR(6) NOT NULL | Năm (Tháng (Month)) |
| `SEQ_NO` | INT NOT NULL | Số thứ tự (Số (Number)) |
| `COL_NM` | NVARCHAR(30) NULL | Cột dữ liệu (Column) — dùng trong bảng cấu hình cột động (Tên) |
| `AMT_QT` | FLOAT NULL | Số tiền quy định (Giá trị quy định (số lần/số tiền))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `AMT_Q1` | FLOAT NULL | Số tiền quy định  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `COL_01` | INT NULL | Cột dữ liệu (Column) — dùng trong bảng cấu hình cột động |
| `COL_02` | INT NULL | Cột dữ liệu (Column) — dùng trong bảng cấu hình cột động |
| `COL_03` | INT NULL | Cột dữ liệu (Column) — dùng trong bảng cấu hình cột động |
| `COL_04` | INT NULL | Cột dữ liệu (Column) — dùng trong bảng cấu hình cột động |
| `COL_05` | INT NULL | Cột dữ liệu (Column) — dùng trong bảng cấu hình cột động |
| `COL_06` | INT NULL | Cột dữ liệu (Column) — dùng trong bảng cấu hình cột động |
| `COL_07` | INT NULL | Cột dữ liệu (Column) — dùng trong bảng cấu hình cột động |
| `COL_08` | INT NULL | Cột dữ liệu (Column) — dùng trong bảng cấu hình cột động |
| `COL_09` | INT NULL | Cột dữ liệu (Column) — dùng trong bảng cấu hình cột động |
| `COL_10` | INT NULL | Cột dữ liệu (Column) — dùng trong bảng cấu hình cột động |
| `COL_11` | INT NULL | Cột dữ liệu (Column) — dùng trong bảng cấu hình cột động |
| `COL_12` | INT NULL | Cột dữ liệu (Column) — dùng trong bảng cấu hình cột động |
| `BLT_NM` | NVARCHAR(50) NULL | Người tạo bản ghi (Built by) (Tên) |
| `BLT_DT` | DATETIME NULL | Người tạo bản ghi (Built by) (Ngày (Date)) |
| `LST_NM` | NVARCHAR(50) NULL | Người & thời gian sửa lần cuối (Last update) (Tên) |
| `LST_DT` | DATETIME NULL | Người & thời gian sửa lần cuối (Last update) (Ngày (Date)) |

#### `FILD07A` — *(xem chi tiết ở Phần 3)*

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `FRM_QT` | INT NOT NULL | Từ ngày (From) (Giá trị quy định (số lần/số tiền))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `TOO_QT` | INT NULL | Đến ngày (To) (Giá trị quy định (số lần/số tiền))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `VAL_QT` | INT NULL | Giá trị (Giá trị quy định (số lần/số tiền))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |

### FILE – Hợp đồng lao động

#### `FILE01A` — Danh Mục Hợp Đồng **[Xác nhận]**

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `LAB_NO` | NVARCHAR(20) NOT NULL | Hợp đồng lao động (Labour contract) (Số (Number)) |
| `LAB_DR` | NVARCHAR(50) NULL | Hợp đồng lao động (Labour contract) (Nội dung diễn giải / ghi chú dạng text) |
| `YYY_YY` | INT NULL | Năm (Năm (Year)) |
| `MMM_MM` | INT NULL | Tháng (Tháng (Month)) |
| `LIM_NO` | BIT NULL | Giới hạn (Số (Number)) |
| `LIM_DR` | NVARCHAR(50) NULL | Giới hạn (Nội dung diễn giải / ghi chú dạng text) |
| `LAB_ID` | NVARCHAR(50) NULL | Hợp đồng lao động (Labour contract) (Mã (khóa nhận diện)) |
| `STT_N1` | INT NULL | Số thứ tự (Trường tên phụ / biến thể 2)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `STT_N2` | INT NULL | Số thứ tự (Trường tên phụ / biến thể 3)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `STT_N3` | INT NULL | Số thứ tự |
| `LAB_TP` | NVARCHAR(20) NULL | Hợp đồng lao động (Labour contract) (Loại (Type)) |
| `DAY_LB` | INT NULL | Ngày |
| `DAY_BF` | INT NULL | Ngày |
| `MON_BF` | BIT NULL | Tháng |
| `DAY_AF` | INT NULL | Ngày |
| `MON_AF` | BIT NULL | Tháng |

#### `FILE01B` — *(xem chi tiết ở Phần 3)*

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `LAB_NO` | NVARCHAR(20) NOT NULL | Hợp đồng lao động (Labour contract) (Số (Number)) |
| `LAB_TP` | NVARCHAR(20) NOT NULL | Hợp đồng lao động (Labour contract) (Loại (Type)) |
| `INF_ID` | INT NOT NULL | (Mã (khóa nhận diện)) |
| `INF_NM` | NVARCHAR(50) NULL | (Tên) |
| `INF_VL` | NVARCHAR(50) NULL | (Giá trị (Value)) |

#### `FILE01BA` — *(xem chi tiết ở Phần 3)*

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `LAB_TP` | NVARCHAR(10) NOT NULL | Hợp đồng lao động (Labour contract) (Loại (Type)) |
| `INF_ID` | INT NOT NULL | (Mã (khóa nhận diện)) |
| `INF_NM` | NVARCHAR(50) NULL | (Tên) |
| `INF_VL` | NVARCHAR(50) NULL | (Giá trị (Value)) |

#### `FILE02A` — Loại Hợp Đồng **[Xác nhận]**

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `TYP_ID` | NVARCHAR(3) NOT NULL | Loại / Phân loại (Mã (khóa nhận diện)) |
| `CON_ID` | INT NOT NULL | Điều kiện / Kết nối (Mã (khóa nhận diện))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `SEQ_NO` | INT NULL | Số thứ tự (Số (Number)) |
| `LAB_NO` | NVARCHAR(20) NOT NULL | Hợp đồng lao động (Labour contract) (Số (Number)) |
| `REP_BT` | BIT NULL | (Cờ đúng-sai (Bit: 1/0)) |

#### `FILE03A` — Hop Dong TV 2T **[Xác nhận]**

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `EMP_ID` | NVARCHAR(20) NOT NULL | Nhân viên (Mã (khóa nhận diện)) |
| `DEP_ID` | NVARCHAR(10) NULL | Phòng ban / Bộ phận (Mã (khóa nhận diện)) |
| `POS_ID` | NVARCHAR(10) NULL | Chức vụ / Vị trí công việc (Mã (khóa nhận diện)) |
| `TYP_ID` | NVARCHAR(10) NULL | Loại / Phân loại (Mã (khóa nhận diện)) |
| `SEQ_NO` | INT NOT NULL | Số thứ tự (Số (Number)) |
| `LAB_ID` | NVARCHAR(50) NOT NULL | Hợp đồng lao động (Labour contract) (Mã (khóa nhận diện)) |
| `LAB_NO` | NVARCHAR(20) NULL | Hợp đồng lao động (Labour contract) (Số (Number)) |
| `LAB_ST` | DATETIME NULL | Hợp đồng lao động (Labour contract) (Bắt đầu (Start)) |
| `LAB_ED` | DATETIME NULL | Hợp đồng lao động (Labour contract) (Kết thúc (End))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `LIM_NO` | BIT NULL | Giới hạn (Số (Number)) |
| `SEQ_N1` | FLOAT NULL | Số thứ tự (Trường tên phụ / biến thể 2)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `SEQ_N2` | FLOAT NOT NULL | Số thứ tự (Trường tên phụ / biến thể 3)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |

#### `FILE05A` — *(xem chi tiết ở Phần 3)*

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `LAB_NO` | NVARCHAR(20) NOT NULL | Hợp đồng lao động (Labour contract) (Số (Number)) |
| `LAB_DR` | NVARCHAR(50) NULL | Hợp đồng lao động (Labour contract) (Nội dung diễn giải / ghi chú dạng text) |
| `LAB_ID` | NVARCHAR(50) NULL | Hợp đồng lao động (Labour contract) (Mã (khóa nhận diện)) |
| `STT_N1` | INT NULL | Số thứ tự (Trường tên phụ / biến thể 2)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `STT_N2` | INT NULL | Số thứ tự (Trường tên phụ / biến thể 3)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `STT_N3` | INT NULL | Số thứ tự |
| `LAB_TP` | NVARCHAR(20) NULL | Hợp đồng lao động (Labour contract) (Loại (Type)) |

#### `FILE05B` — *(xem chi tiết ở Phần 3)*

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `LAB_NO` | NVARCHAR(20) NOT NULL | Hợp đồng lao động (Labour contract) (Số (Number)) |
| `LAB_TP` | NVARCHAR(20) NOT NULL | Hợp đồng lao động (Labour contract) (Loại (Type)) |
| `INF_ID` | INT NOT NULL | (Mã (khóa nhận diện)) |
| `INF_NM` | NVARCHAR(50) NULL | (Tên) |
| `INF_VL` | NVARCHAR(50) NULL | (Giá trị (Value)) |

#### `FILE05BA` — *(xem chi tiết ở Phần 3)*

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `LAB_TP` | NVARCHAR(10) NOT NULL | Hợp đồng lao động (Labour contract) (Loại (Type)) |
| `INF_ID` | INT NOT NULL | (Mã (khóa nhận diện)) |
| `INF_NM` | NVARCHAR(50) NULL | (Tên) |
| `INF_VL` | NVARCHAR(50) NULL | (Giá trị (Value)) |

#### `FILE05BB` — *(xem chi tiết ở Phần 3)*

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `LAB_TP` | NVARCHAR(10) NOT NULL | Hợp đồng lao động (Labour contract) (Loại (Type)) |
| `COL_NM` | NVARCHAR(6) NOT NULL | Cột dữ liệu (Column) — dùng trong bảng cấu hình cột động (Tên) |

#### `FILE06A` — Chi Tiết Hợp đồng **[Xác nhận]**

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `EMP_ID` | NVARCHAR(50) NOT NULL | Nhân viên (Mã (khóa nhận diện)) |
| `SEQ_NO` | INT NULL | Số thứ tự (Số (Number)) |
| `LAB_ID` | NVARCHAR(20) NULL | Hợp đồng lao động (Labour contract) (Mã (khóa nhận diện)) |
| `LAB_ST` | DATETIME NULL | Hợp đồng lao động (Labour contract) (Bắt đầu (Start)) |
| `LAB_ED` | DATETIME NULL | Hợp đồng lao động (Labour contract) (Kết thúc (End))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `LA1_ID` | NVARCHAR(20) NULL | (Mã (khóa nhận diện)) |
| `LAB_NO` | NVARCHAR(20) NULL | Hợp đồng lao động (Labour contract) (Số (Number)) |
| `LA1_ST` | DATETIME NULL | (Bắt đầu (Start)) |
| `LA1_SG` | DATETIME NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `SEQ_N1` | FLOAT NULL | Số thứ tự (Trường tên phụ / biến thể 2)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `SEQ_N2` | FLOAT NOT NULL | Số thứ tự (Trường tên phụ / biến thể 3)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `SAL_N1` | NVARCHAR(20) NULL | (Trường tên phụ / biến thể 2)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `SAL_Q1` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `SAL_N2` | NVARCHAR(20) NULL | (Trường tên phụ / biến thể 3)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `SAL_Q2` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `SAL_N3` | NVARCHAR(20) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `SAL_Q3` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `SAL_N4` | NVARCHAR(20) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `SAL_Q4` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `SAL_N5` | NVARCHAR(20) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `SAL_Q5` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `SAL_N6` | NVARCHAR(20) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `SAL_Q6` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `SAL_N7` | NVARCHAR(20) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `SAL_Q7` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `SAL_N8` | NVARCHAR(20) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `SAL_Q8` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `SAL_N9` | NVARCHAR(20) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `SAL_Q9` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |

#### `FILE07A` — *(xem chi tiết ở Phần 3)*

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `RPT_ID` | INT NOT NULL | (Mã (khóa nhận diện)) |
| `RPT_DR` | NVARCHAR(100) NULL | (Nội dung diễn giải / ghi chú dạng text) |

#### `FILE07B` — *(xem chi tiết ở Phần 3)*

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `RPT_ID` | INT NOT NULL | (Mã (khóa nhận diện)) |
| `COL_ID` | NVARCHAR(50) NOT NULL | Cột dữ liệu (Column) — dùng trong bảng cấu hình cột động (Mã (khóa nhận diện)) |
| `SEQ_NO` | NVARCHAR(3) NULL | Số thứ tự (Số (Number)) |
| `SHO_BT` | BIT NULL | (Cờ đúng-sai (Bit: 1/0)) |
| `COL_NM` | NVARCHAR(50) NULL | Cột dữ liệu (Column) — dùng trong bảng cấu hình cột động (Tên) |
| `TAB_DR` | NVARCHAR(50) NULL | (Nội dung diễn giải / ghi chú dạng text) |
| `SUM_BT` | BIT NULL | (Cờ đúng-sai (Bit: 1/0)) |
| `SRT_BT` | BIT NULL | (Cờ đúng-sai (Bit: 1/0)) |
| `TYP_ID` | INT NULL | Loại / Phân loại (Mã (khóa nhận diện)) |
| `CON_C1` | NVARCHAR(10) NULL | Điều kiện / Kết nối (Ca 1 (Shift 1))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `CON_D1` | NVARCHAR(50) NULL | Điều kiện / Kết nối (Trường phụ / biến thể của cột ngày hoặc diễn giải)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `AND_OR` | NVARCHAR(50) NULL | (Gốc / ban đầu (Original))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `CON_C2` | NVARCHAR(10) NULL | Điều kiện / Kết nối (Ca 2 (Shift 2))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `CON_D2` | NVARCHAR(50) NULL | Điều kiện / Kết nối  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `WID_VL` | INT NULL | (Giá trị (Value)) |

### FILF – Tài khoản đăng nhập / bảo mật nhân viên

#### `FILF01A` — Thông tin tài khoản **[Xác nhận]**

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `EMP_ID` | NVARCHAR(20) NOT NULL | Nhân viên (Mã (khóa nhận diện)) |
| `EMP_I1` | NVARCHAR(20) NULL | Nhân viên (Trường phụ / biến thể 1)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `EMP_NM` | NVARCHAR(50) NULL | Nhân viên (Tên) |
| `EMP_N1` | NVARCHAR(50) NULL | Nhân viên (Trường tên phụ / biến thể 2)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `MST_DR` | NVARCHAR(13) NULL | Mã số thuế (Nội dung diễn giải / ghi chú dạng text) |
| `BIR_DT` | NVARCHAR(10) NULL | Ngày sinh (Ngày (Date)) |
| `SEX_BT` | BIT NULL | Giới tính (Cờ đúng-sai (Bit: 1/0)) |
| `MAR_BT` | BIT NULL | Tình trạng hôn nhân (Cờ đúng-sai (Bit: 1/0)) |
| `DEP_ID` | NVARCHAR(10) NULL | Phòng ban / Bộ phận (Mã (khóa nhận diện)) |
| `COU_ID` | NVARCHAR(10) NULL | Huyện / Quận (Mã (khóa nhận diện))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `CRD_NO` | NVARCHAR(20) NULL | CMND / CCCD (Chứng minh nhân dân / Căn cước công dân) (Số (Number)) |
| `POS_ID` | NVARCHAR(10) NULL | Chức vụ / Vị trí công việc (Mã (khóa nhận diện)) |
| `ADD_DR` | NVARCHAR(255) NULL | Địa chỉ (Nội dung diễn giải / ghi chú dạng text) |
| `ADD_D1` | NVARCHAR(255) NULL | Địa chỉ (Trường phụ / biến thể của cột ngày hoặc diễn giải)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `INH_DT` | DATETIME NULL | Ngày vào công ty (Hire date) (Ngày (Date)) |
| `CRD_ID` | NVARCHAR(20) NULL | CMND / CCCD (Chứng minh nhân dân / Căn cước công dân) (Mã (khóa nhận diện)) |
| `CRD_DT` | DATETIME NULL | CMND / CCCD (Chứng minh nhân dân / Căn cước công dân) (Ngày (Date)) |
| `CRD_LC` | NVARCHAR(255) NULL | CMND / CCCD (Chứng minh nhân dân / Căn cước công dân) (Nơi cấp / địa điểm (Location)) |
| `CIT_ID` | NVARCHAR(10) NULL | Tỉnh / Thành phố (Mã (khóa nhận diện)) |
| `RAC_NM` | NVARCHAR(50) NULL | Dân tộc (Tên) |
| `NAT_CO` | NVARCHAR(50) NULL | Quốc tịch (Quốc gia (Country)) |
| `EDU_ID` | NVARCHAR(10) NULL | Trình độ học vấn (Mã (khóa nhận diện)) |
| `PRO_ID` | NVARCHAR(10) NULL | Trình độ chuyên môn (hoặc: Thử việc - Probation, tùy bảng) (Mã (khóa nhận diện))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `GRA_ID` | NVARCHAR(10) NULL | Bằng cấp / Nơi tốt nghiệp (Mã (khóa nhận diện))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `TEL_NO` | NVARCHAR(50) NULL | Điện thoại (Số (Number)) |
| `TYP_ID` | NVARCHAR(10) NULL | Loại / Phân loại (Mã (khóa nhận diện)) |
| `ACC_NO` | NVARCHAR(20) NULL | Tài khoản ngân hàng (Số (Number)) |
| `ACC_NM` | NVARCHAR(50) NULL | Tài khoản ngân hàng (Tên) |
| `BNK_NM` | NVARCHAR(100) NULL | Ngân hàng (Tên) |
| `REL_DR` | NVARCHAR(50) NULL | Quan hệ (người thân / liên hệ khẩn cấp) (Nội dung diễn giải / ghi chú dạng text)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `NEW_BT` | BIT NULL | Nhân viên mới (Cờ đúng-sai (Bit: 1/0))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `MEA_BT` | BIT NULL | Chưa rõ nghĩa cụ thể (Cờ đúng-sai (Bit: 1/0))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `REM_DR` | NVARCHAR(500) NULL | Ghi chú / Remark (Nội dung diễn giải / ghi chú dạng text) |
| `ATT_BT` | BIT NULL | Chấm công / Có mặt (Cờ đúng-sai (Bit: 1/0)) |
| `VAC_BT` | BIT NULL | Nghỉ việc (lý do/trạng thái thôi việc) (Cờ đúng-sai (Bit: 1/0)) |
| `DEL_BT` | BIT NULL | Xóa (đánh dấu đã xóa) (Cờ đúng-sai (Bit: 1/0)) |
| `GRT_ID` | NVARCHAR(10) NULL | Nhóm lương (Mã (khóa nhận diện))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `GRP_ID` | NVARCHAR(10) NULL | Nhóm (Mã (khóa nhận diện)) |
| `LEV_ID` | NVARCHAR(10) NULL | Cấp bậc / Bậc lương (Level) (Mã (khóa nhận diện)) |
| `LCK_BT` | BIT NULL | Khóa (không cho chỉnh sửa) (Cờ đúng-sai (Bit: 1/0)) |
| `BHX_BT` | BIT NULL | Bảo hiểm xã hội (Cờ đúng-sai (Bit: 1/0)) |
| `DIR_BT` | BIT NULL | Trực tiếp quản lý / Giám đốc (Cờ đúng-sai (Bit: 1/0))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `BLT_NM` | NVARCHAR(50) NULL | Người tạo bản ghi (Built by) (Tên) |
| `BLT_DT` | DATETIME NULL | Người tạo bản ghi (Built by) (Ngày (Date)) |
| `LST_NM` | NVARCHAR(50) NULL | Người & thời gian sửa lần cuối (Last update) (Tên) |
| `LST_DT` | DATETIME NULL | Người & thời gian sửa lần cuối (Last update) (Ngày (Date)) |
| `SEN_DT` | DATETIME NULL | Thâm niên (Seniority) (Ngày (Date)) |
| `REM_D2` | NVARCHAR(50) NULL | Ghi chú / Remark |
| `VAC_DT` | DATETIME NULL | Nghỉ việc (lý do/trạng thái thôi việc) (Ngày (Date)) |

#### `FILF02A` — *(xem chi tiết ở Phần 3)*

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `EMP_ID` | NVARCHAR(20) NOT NULL | Nhân viên (Mã (khóa nhận diện)) |
| `EMP_I1` | NVARCHAR(20) NULL | Nhân viên (Trường phụ / biến thể 1)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `EMP_NM` | NVARCHAR(50) NULL | Nhân viên (Tên) |
| `EMP_N1` | NVARCHAR(50) NULL | Nhân viên (Trường tên phụ / biến thể 2)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `BIR_DT` | NVARCHAR(10) NULL | Ngày sinh (Ngày (Date)) |
| `SEX_BT` | BIT NULL | Giới tính (Cờ đúng-sai (Bit: 1/0)) |
| `MAR_BT` | BIT NULL | Tình trạng hôn nhân (Cờ đúng-sai (Bit: 1/0)) |
| `DEP_ID` | NVARCHAR(10) NULL | Phòng ban / Bộ phận (Mã (khóa nhận diện)) |
| `COU_ID` | NVARCHAR(10) NULL | Huyện / Quận (Mã (khóa nhận diện))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `CRD_NO` | NVARCHAR(20) NULL | CMND / CCCD (Chứng minh nhân dân / Căn cước công dân) (Số (Number)) |
| `POS_ID` | NVARCHAR(10) NULL | Chức vụ / Vị trí công việc (Mã (khóa nhận diện)) |
| `ADD_DR` | NVARCHAR(255) NULL | Địa chỉ (Nội dung diễn giải / ghi chú dạng text) |
| `ADD_D1` | NVARCHAR(255) NULL | Địa chỉ (Trường phụ / biến thể của cột ngày hoặc diễn giải)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `INH_DT` | DATETIME NULL | Ngày vào công ty (Hire date) (Ngày (Date)) |
| `CRD_ID` | NVARCHAR(20) NULL | CMND / CCCD (Chứng minh nhân dân / Căn cước công dân) (Mã (khóa nhận diện)) |
| `CRD_DT` | DATETIME NULL | CMND / CCCD (Chứng minh nhân dân / Căn cước công dân) (Ngày (Date)) |
| `CRD_LC` | NVARCHAR(255) NULL | CMND / CCCD (Chứng minh nhân dân / Căn cước công dân) (Nơi cấp / địa điểm (Location)) |
| `CIT_ID` | NVARCHAR(10) NULL | Tỉnh / Thành phố (Mã (khóa nhận diện)) |
| `RAC_NM` | NVARCHAR(50) NULL | Dân tộc (Tên) |
| `NAT_CO` | NVARCHAR(10) NULL | Quốc tịch (Quốc gia (Country)) |
| `EDU_ID` | NVARCHAR(10) NULL | Trình độ học vấn (Mã (khóa nhận diện)) |
| `PRO_ID` | NVARCHAR(10) NULL | Trình độ chuyên môn (hoặc: Thử việc - Probation, tùy bảng) (Mã (khóa nhận diện))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `GRA_ID` | NVARCHAR(10) NULL | Bằng cấp / Nơi tốt nghiệp (Mã (khóa nhận diện))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `TEL_NO` | NVARCHAR(50) NULL | Điện thoại (Số (Number)) |
| `TYP_ID` | NVARCHAR(10) NULL | Loại / Phân loại (Mã (khóa nhận diện)) |
| `ACC_NO` | NVARCHAR(20) NULL | Tài khoản ngân hàng (Số (Number)) |
| `ACC_NM` | NVARCHAR(50) NULL | Tài khoản ngân hàng (Tên) |
| `BNK_NM` | NVARCHAR(100) NULL | Ngân hàng (Tên) |
| `REL_DR` | NVARCHAR(50) NULL | Quan hệ (người thân / liên hệ khẩn cấp) (Nội dung diễn giải / ghi chú dạng text)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `NEW_BT` | BIT NOT NULL | Nhân viên mới (Cờ đúng-sai (Bit: 1/0))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `MEA_BT` | BIT NULL | Chưa rõ nghĩa cụ thể (Cờ đúng-sai (Bit: 1/0))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `REM_DR` | NVARCHAR(500) NULL | Ghi chú / Remark (Nội dung diễn giải / ghi chú dạng text) |
| `ATT_BT` | BIT NULL | Chấm công / Có mặt (Cờ đúng-sai (Bit: 1/0)) |
| `VAC_BT` | BIT NULL | Nghỉ việc (lý do/trạng thái thôi việc) (Cờ đúng-sai (Bit: 1/0)) |
| `DEL_BT` | BIT NULL | Xóa (đánh dấu đã xóa) (Cờ đúng-sai (Bit: 1/0)) |
| `GRT_ID` | NVARCHAR(10) NULL | Nhóm lương (Mã (khóa nhận diện))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `GRP_ID` | NVARCHAR(10) NULL | Nhóm (Mã (khóa nhận diện)) |
| `LEV_ID` | NVARCHAR(10) NULL | Cấp bậc / Bậc lương (Level) (Mã (khóa nhận diện)) |
| `LCK_BT` | BIT NULL | Khóa (không cho chỉnh sửa) (Cờ đúng-sai (Bit: 1/0)) |
| `BHX_BT` | BIT NULL | Bảo hiểm xã hội (Cờ đúng-sai (Bit: 1/0)) |
| `DIR_BT` | BIT NULL | Trực tiếp quản lý / Giám đốc (Cờ đúng-sai (Bit: 1/0))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `BLT_NM` | NVARCHAR(50) NULL | Người tạo bản ghi (Built by) (Tên) |
| `BLT_DT` | DATETIME NULL | Người tạo bản ghi (Built by) (Ngày (Date)) |
| `LST_NM` | NVARCHAR(50) NULL | Người & thời gian sửa lần cuối (Last update) (Tên) |
| `LST_DT` | DATETIME NULL | Người & thời gian sửa lần cuối (Last update) (Ngày (Date)) |

### FILT – Bảng tổng hợp/tra cứu thông tin nhân viên (tương tự FILB01A)

#### `FILT01A` — *(xem chi tiết ở Phần 3)*

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `EMP_ID` | NVARCHAR(20) NULL | Nhân viên (Mã (khóa nhận diện)) |
| `EMP_I1` | NVARCHAR(20) NULL | Nhân viên (Trường phụ / biến thể 1)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `EMP_NM` | NVARCHAR(50) NULL | Nhân viên (Tên) |
| `EMP_N1` | NVARCHAR(50) NULL | Nhân viên (Trường tên phụ / biến thể 2)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `MST_DR` | NVARCHAR(12) NULL | Mã số thuế (Nội dung diễn giải / ghi chú dạng text) |
| `BIR_DT` | NVARCHAR(10) NULL | Ngày sinh (Ngày (Date)) |
| `SEX_BT` | BIT NULL | Giới tính (Cờ đúng-sai (Bit: 1/0)) |
| `MAR_BT` | BIT NULL | Tình trạng hôn nhân (Cờ đúng-sai (Bit: 1/0)) |
| `DEP_ID` | NVARCHAR(10) NULL | Phòng ban / Bộ phận (Mã (khóa nhận diện)) |
| `COU_ID` | NVARCHAR(10) NULL | Huyện / Quận (Mã (khóa nhận diện))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `CRD_NO` | NVARCHAR(20) NULL | CMND / CCCD (Chứng minh nhân dân / Căn cước công dân) (Số (Number)) |
| `POS_ID` | NVARCHAR(10) NULL | Chức vụ / Vị trí công việc (Mã (khóa nhận diện)) |
| `ADD_DR` | NVARCHAR(255) NULL | Địa chỉ (Nội dung diễn giải / ghi chú dạng text) |
| `ADD_D1` | NVARCHAR(255) NULL | Địa chỉ (Trường phụ / biến thể của cột ngày hoặc diễn giải)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `INH_DT` | DATETIME NULL | Ngày vào công ty (Hire date) (Ngày (Date)) |
| `INH_D1` | DATETIME NULL | Ngày vào công ty (Hire date) (Trường phụ / biến thể của cột ngày hoặc diễn giải)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `CRD_ID` | NVARCHAR(20) NOT NULL | CMND / CCCD (Chứng minh nhân dân / Căn cước công dân) (Mã (khóa nhận diện)) |
| `CRD_DT` | DATETIME NULL | CMND / CCCD (Chứng minh nhân dân / Căn cước công dân) (Ngày (Date)) |
| `CRD_LC` | NVARCHAR(255) NULL | CMND / CCCD (Chứng minh nhân dân / Căn cước công dân) (Nơi cấp / địa điểm (Location)) |
| `CIT_ID` | NVARCHAR(10) NULL | Tỉnh / Thành phố (Mã (khóa nhận diện)) |
| `RAC_NM` | NVARCHAR(50) NULL | Dân tộc (Tên) |
| `NAT_CO` | NVARCHAR(10) NULL | Quốc tịch (Quốc gia (Country)) |
| `EDU_ID` | NVARCHAR(10) NULL | Trình độ học vấn (Mã (khóa nhận diện)) |
| `PRO_ID` | NVARCHAR(10) NULL | Trình độ chuyên môn (hoặc: Thử việc - Probation, tùy bảng) (Mã (khóa nhận diện))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `GRA_ID` | NVARCHAR(10) NULL | Bằng cấp / Nơi tốt nghiệp (Mã (khóa nhận diện))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `TEL_NO` | NVARCHAR(50) NULL | Điện thoại (Số (Number)) |
| `TYP_ID` | NVARCHAR(10) NULL | Loại / Phân loại (Mã (khóa nhận diện)) |
| `ACC_NO` | NVARCHAR(20) NULL | Tài khoản ngân hàng (Số (Number)) |
| `ACC_NM` | NVARCHAR(50) NULL | Tài khoản ngân hàng (Tên) |
| `BNK_NM` | NVARCHAR(100) NULL | Ngân hàng (Tên) |
| `REL_DR` | NVARCHAR(50) NULL | Quan hệ (người thân / liên hệ khẩn cấp) (Nội dung diễn giải / ghi chú dạng text)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `NEW_BT` | BIT NULL DEFAULT (0) | Nhân viên mới (Cờ đúng-sai (Bit: 1/0))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `MEA_BT` | BIT NULL | Chưa rõ nghĩa cụ thể (Cờ đúng-sai (Bit: 1/0))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `REM_DR` | NVARCHAR(500) NULL | Ghi chú / Remark (Nội dung diễn giải / ghi chú dạng text) |
| `ATT_BT` | BIT NULL DEFAULT (0) | Chấm công / Có mặt (Cờ đúng-sai (Bit: 1/0)) |
| `VAC_BT` | BIT NULL DEFAULT (0) | Nghỉ việc (lý do/trạng thái thôi việc) (Cờ đúng-sai (Bit: 1/0)) |
| `DEL_BT` | BIT NULL DEFAULT (0) | Xóa (đánh dấu đã xóa) (Cờ đúng-sai (Bit: 1/0)) |
| `GRT_ID` | NVARCHAR(10) NULL | Nhóm lương (Mã (khóa nhận diện))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `GRP_ID` | NVARCHAR(10) NULL | Nhóm (Mã (khóa nhận diện)) |
| `LEV_ID` | NVARCHAR(10) NULL | Cấp bậc / Bậc lương (Level) (Mã (khóa nhận diện)) |
| `LCK_BT` | BIT NULL DEFAULT (0) | Khóa (không cho chỉnh sửa) (Cờ đúng-sai (Bit: 1/0)) |
| `BHX_BT` | BIT NULL | Bảo hiểm xã hội (Cờ đúng-sai (Bit: 1/0)) |
| `DIR_BT` | BIT NULL | Trực tiếp quản lý / Giám đốc (Cờ đúng-sai (Bit: 1/0))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `BLT_NM` | NVARCHAR(50) NULL | Người tạo bản ghi (Built by) (Tên) |
| `BLT_DT` | DATETIME NULL | Người tạo bản ghi (Built by) (Ngày (Date)) |
| `LST_NM` | NVARCHAR(50) NULL | Người & thời gian sửa lần cuối (Last update) (Tên) |
| `LST_DT` | DATETIME NULL | Người & thời gian sửa lần cuối (Last update) (Ngày (Date)) |

### GSC_ – Module chấm công phụ (đầu đọc thẻ / cổng vào-ra)

#### `GSC_FILE01A` — *(xem chi tiết ở Phần 3)*

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `ATT_DT` | DATETIME NOT NULL | Chấm công / Có mặt (Ngày (Date)) |
| `SHI_ID` | NVARCHAR(50) NOT NULL | Ca làm việc (Shift) (Mã (khóa nhận diện)) |
| `INN_NO` | NVARCHAR(10) NOT NULL | Vào (biến thể của ONN) (Số (Number))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `BLT_NM` | NVARCHAR(50) NULL | Người tạo bản ghi (Built by) (Tên) |
| `BLT_DT` | DATETIME NULL | Người tạo bản ghi (Built by) (Ngày (Date)) |

#### `GSC_FILE01B` — *(xem chi tiết ở Phần 3)*

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `ATT_DT` | DATETIME NOT NULL | Chấm công / Có mặt (Ngày (Date)) |
| `SHI_ID` | NVARCHAR(50) NOT NULL | Ca làm việc (Shift) (Mã (khóa nhận diện)) |
| `INN_NO` | NVARCHAR(50) NOT NULL | Vào (biến thể của ONN) (Số (Number))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `EMP_ID` | NVARCHAR(50) NOT NULL | Nhân viên (Mã (khóa nhận diện)) |
| `CRD_NO` | NVARCHAR(10) NULL | CMND / CCCD (Chứng minh nhân dân / Căn cước công dân) (Số (Number)) |
| `ATT_TM` | FLOAT NULL | Chấm công / Có mặt (Giờ / thời điểm (Time)) |
| `WOK_TM` | FLOAT NULL | (Giờ / thời điểm (Time)) |
| `REM_DR` | NVARCHAR(200) NULL | Ghi chú / Remark (Nội dung diễn giải / ghi chú dạng text) |
| `BLT_NM` | NVARCHAR(50) NULL | Người tạo bản ghi (Built by) (Tên) |
| `BLT_DT` | DATETIME NULL | Người tạo bản ghi (Built by) (Ngày (Date)) |
| `LST_NM` | NVARCHAR(50) NULL | Người & thời gian sửa lần cuối (Last update) (Tên) |
| `LST_DT` | DATETIME NULL | Người & thời gian sửa lần cuối (Last update) (Ngày (Date)) |

#### `GSC_FILE01C` — *(xem chi tiết ở Phần 3)*

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `ATT_DT` | DATETIME NOT NULL | Chấm công / Có mặt (Ngày (Date)) |
| `SHI_ID` | NVARCHAR(10) NOT NULL | Ca làm việc (Shift) (Mã (khóa nhận diện)) |
| `EMP_ID` | NVARCHAR(20) NOT NULL | Nhân viên (Mã (khóa nhận diện)) |
| `INN_NO` | NVARCHAR(50) NOT NULL | Vào (biến thể của ONN) (Số (Number))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `CRD_NO` | NVARCHAR(10) NULL | CMND / CCCD (Chứng minh nhân dân / Căn cước công dân) (Số (Number)) |
| `WOK_TM` | FLOAT NULL | (Giờ / thời điểm (Time)) |

#### `GSC_FILE01D` — *(xem chi tiết ở Phần 3)*

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `ATT_DT` | DATETIME NOT NULL | Chấm công / Có mặt (Ngày (Date)) |
| `EMP_ID` | NVARCHAR(50) NOT NULL | Nhân viên (Mã (khóa nhận diện)) |
| `CRD_NO` | NVARCHAR(10) NULL | CMND / CCCD (Chứng minh nhân dân / Căn cước công dân) (Số (Number)) |
| `WOK_TM` | FLOAT NOT NULL | (Giờ / thời điểm (Time)) |

### GP_SYS_ – Cấu hình & tiện ích hệ thống GP8000

#### `GP_SYS_GET_ATTFOR` — *(xem chi tiết ở Phần 3)*

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `COL_NM` | NVARCHAR(50) NOT NULL | Cột dữ liệu (Column) — dùng trong bảng cấu hình cột động (Tên) |
| `LAB_DR` | NVARCHAR(50) NULL | Hợp đồng lao động (Labour contract) (Nội dung diễn giải / ghi chú dạng text) |
| `DAT_TP` | INT NULL | Ngày / giờ dữ liệu (Data time) (Loại (Type))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |

#### `GP_SYS_GET_PAYROLLFOR` — *(xem chi tiết ở Phần 3)*

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `COL_ID` | NVARCHAR(50) NOT NULL | Cột dữ liệu (Column) — dùng trong bảng cấu hình cột động (Mã (khóa nhận diện)) |
| `COL_NM` | NVARCHAR(50) NULL | Cột dữ liệu (Column) — dùng trong bảng cấu hình cột động (Tên) |
| `DES_NM` | NVARCHAR(50) NULL | (Tên) |
| `STA_BT` | BIT NULL | Trạng thái (Status) (Cờ đúng-sai (Bit: 1/0))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `MON_BT` | BIT NULL | Tháng (Cờ đúng-sai (Bit: 1/0)) |
| `TAB_DR` | NVARCHAR(50) NULL | (Nội dung diễn giải / ghi chú dạng text) |
| `SQL_DR` | NVARCHAR(500) NULL | Câu lệnh SQL động (Nội dung diễn giải / ghi chú dạng text) |

#### `GP_SYS_MESSAGE` — *(xem chi tiết ở Phần 3)*

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `MSG_DR` | NVARCHAR(1000) NULL | (Nội dung diễn giải / ghi chú dạng text) |

#### `GP_SYS_READER` — *(xem chi tiết ở Phần 3)*

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `SEQ_NO` | NVARCHAR(1) NOT NULL | Số thứ tự (Số (Number)) |
| `TYP_NM` | NVARCHAR(20) NULL | Loại / Phân loại (Tên) |
| `CRD_LN` | INT NULL | CMND / CCCD (Chứng minh nhân dân / Căn cước công dân) |
| `DIR_DR` | NVARCHAR(1000) NULL | Trực tiếp quản lý / Giám đốc (Nội dung diễn giải / ghi chú dạng text)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `FIL_NM` | NVARCHAR(1000) NULL | Tên file (Tên) |
| `RCD_FG` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |

#### `GP_SYS_READER_TYPE` — *(xem chi tiết ở Phần 3)*

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `TYP_ID` | NVARCHAR(20) NOT NULL | Loại / Phân loại (Mã (khóa nhận diện)) |
| `TYP_NM` | NVARCHAR(20) NULL | Loại / Phân loại (Tên) |

#### `GP_SYS_SETTING` — *(xem chi tiết ở Phần 3)*

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `SEQ_NO` | INT NOT NULL | Số thứ tự (Số (Number)) |
| `ONN_MN` | INT NULL | Giờ vào / Check-in (Số phút (Minutes) — hoặc mã nhóm tùy bảng)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `ONN_BT` | BIT NULL | Giờ vào / Check-in (Cờ đúng-sai (Bit: 1/0)) |
| `OFF_MN` | INT NULL | Giờ ra / Check-out (Số phút (Minutes) — hoặc mã nhóm tùy bảng)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `OFF_BT` | BIT NULL | Giờ ra / Check-out (Cờ đúng-sai (Bit: 1/0)) |
| `ASB_MN` | INT NULL | (Số phút (Minutes) — hoặc mã nhóm tùy bảng)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `CRD_MN` | INT NULL | CMND / CCCD (Chứng minh nhân dân / Căn cước công dân) (Số phút (Minutes) — hoặc mã nhóm tùy bảng)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `MEA_QT` | INT NULL | Chưa rõ nghĩa cụ thể (Giá trị quy định (số lần/số tiền))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `SLI_OT` | BIT NULL | (Tăng ca (Overtime)) |
| `MAX_WK` | INT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `MAX_YR` | INT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `SEQ_HR` | INT NULL | Số thứ tự (Số giờ (Hours)) |
| `ROU_MN` | INT NULL | Làm tròn (Round) (Số phút (Minutes) — hoặc mã nhóm tùy bảng)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `ROU_NO` | BIT NULL | Làm tròn (Round) (Số (Number))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `SUM_BT` | BIT NULL | (Cờ đúng-sai (Bit: 1/0)) |

#### `GP_SYS_SHIFT` — *(xem chi tiết ở Phần 3)*

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `TYP_ID` | NVARCHAR(10) NOT NULL | Loại / Phân loại (Mã (khóa nhận diện)) |
| `TYP_NM` | NVARCHAR(50) NULL | Loại / Phân loại (Tên) |
| `TYP_EN` | NVARCHAR(50) NULL | Loại / Phân loại (Tên tiếng Anh (đa ngôn ngữ)) |
| `TYP_CH` | NVARCHAR(50) NULL | Loại / Phân loại (Tên tiếng Hoa (đa ngôn ngữ)) |
| `TYP_VN` | NVARCHAR(50) NULL | Loại / Phân loại (Tên tiếng Việt (đa ngôn ngữ)) |
| `TYP_TT` | NVARCHAR(50) NULL | Loại / Phân loại (Tổng / Trạng thái (tùy ngữ cảnh))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `ROU_DR` | NVARCHAR(5) NULL | Làm tròn (Round) (Nội dung diễn giải / ghi chú dạng text)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |

#### `GP_SYS_SQL_FROM` — *(xem chi tiết ở Phần 3)*

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `ID` | NVARCHAR(50) NOT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `FROM` | NVARCHAR(200) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `TABLE` | NVARCHAR(50) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |

#### `GP_SYS_SQL_SELECT` — *(xem chi tiết ở Phần 3)*

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `ID` | NVARCHAR(50) NOT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `ID1` | INT NOT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `NAME` | NVARCHAR(20) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `FIELD` | NVARCHAR(40) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `SHOW` | BIT NULL DEFAULT (1) | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `SEQ` | INT NULL | Số thứ tự |
| `HIDE` | BIT NULL DEFAULT (0) | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `LOCK` | BIT NULL DEFAULT (0) | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |

#### `GP_SYS_STAFFSEARCH` — *(xem chi tiết ở Phần 3)*

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `FIE_NM` | NVARCHAR(10) NOT NULL | (Tên) |
| `TYP_ID` | NVARCHAR(50) NULL | Loại / Phân loại (Mã (khóa nhận diện)) |
| `SQL_DR` | NVARCHAR(200) NULL | Câu lệnh SQL động (Nội dung diễn giải / ghi chú dạng text) |

#### `GP_SYS_SYNGPS` — *(xem chi tiết ở Phần 3)*

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `TAB_NM` | NVARCHAR(30) NOT NULL | (Tên) |
| `MEN_NM` | NVARCHAR(50) NULL | (Tên) |
| `INS_BT` | BIT NULL | (Cờ đúng-sai (Bit: 1/0)) |
| `UPD_BT` | BIT NULL | (Cờ đúng-sai (Bit: 1/0)) |
| `DEL_BT` | BIT NULL | Xóa (đánh dấu đã xóa) (Cờ đúng-sai (Bit: 1/0)) |

### GP_ – Nghiệp vụ & tiện ích hệ thống GP8000

#### `GP_ANNEXLABOURCONTRACT_FILENAME` — *(xem chi tiết ở Phần 3)*

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `LAB_TP` | NVARCHAR(20) NOT NULL | Hợp đồng lao động (Labour contract) (Loại (Type)) |
| `CUS_ID` | INT NOT NULL | (Mã (khóa nhận diện)) |
| `FIL_NM` | NVARCHAR(50) NULL | Tên file (Tên) |

#### `GP_BACKUP` — *(xem chi tiết ở Phần 3)*

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `TB` | NVARCHAR(50) NOT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `CON` | NVARCHAR(50) NULL | Điều kiện / Kết nối  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `YYY_YY` | NVARCHAR(50) NULL | Năm (Năm (Year)) |
| `YYY_MM` | NVARCHAR(50) NULL | Năm (Tháng (Month)) |
| `YYYY_MM_DD` | NVARCHAR(50) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `BOQUA` | NVARCHAR(1) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |

#### `GP_EXCEL_DETAIL` — Bảng tạm / phụ trợ import-export **[Suy luận]**

Bảng tạm / phụ trợ cho thao tác import-export hoặc xử lý trung gian trong ứng dụng cũ. **Khuyến nghị: không cần thiết kế lại ở backend mới**, trừ khi có yêu cầu nghiệp vụ cụ thể.

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `EXC_ID` | NVARCHAR(50) NOT NULL | (Mã (khóa nhận diện)) |
| `COL_NM` | NVARCHAR(50) NOT NULL | Cột dữ liệu (Column) — dùng trong bảng cấu hình cột động (Tên) |
| `COL_ID` | NVARCHAR(3) NULL | Cột dữ liệu (Column) — dùng trong bảng cấu hình cột động (Mã (khóa nhận diện)) |

#### `GP_EXCEL_MASTER` — Bảng tạm / phụ trợ import-export **[Suy luận]**

Bảng tạm / phụ trợ cho thao tác import-export hoặc xử lý trung gian trong ứng dụng cũ. **Khuyến nghị: không cần thiết kế lại ở backend mới**, trừ khi có yêu cầu nghiệp vụ cụ thể.

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `EXC_ID` | NVARCHAR(50) NOT NULL | (Mã (khóa nhận diện)) |

#### `GP_HISTORY` — *(xem chi tiết ở Phần 3)*

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `SEQ_NO` | INT NOT NULL | Số thứ tự (Số (Number)) |
| `DEL_NM` | NVARCHAR(50) NOT NULL | Xóa (đánh dấu đã xóa) (Tên) |
| `DEL_DT` | NVARCHAR(50) NULL | Xóa (đánh dấu đã xóa) (Ngày (Date)) |
| `NOT_DR` | NVARCHAR(100) NULL | Ghi chú (Nội dung diễn giải / ghi chú dạng text) |

#### `GP_HISTORYINPUTPIECERATE` — *(xem chi tiết ở Phần 3)*

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `ID` | FLOAT NOT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `YYYY_MM` | NVARCHAR(6) NULL | (Tháng (Month)) |
| `COL_NM` | NVARCHAR(50) NULL | Cột dữ liệu (Column) — dùng trong bảng cấu hình cột động (Tên) |
| `COL_VL` | FLOAT NULL | Cột dữ liệu (Column) — dùng trong bảng cấu hình cột động (Giá trị (Value)) |
| `BLT_NM` | NVARCHAR(50) NULL | Người tạo bản ghi (Built by) (Tên) |
| `BLT_DT` | DATETIME NULL | Người tạo bản ghi (Built by) (Ngày (Date)) |

#### `GP_KEY` — *(xem chi tiết ở Phần 3)*

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `COL_MN` | INT NULL | Cột dữ liệu (Column) — dùng trong bảng cấu hình cột động (Số phút (Minutes) — hoặc mã nhóm tùy bảng)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `COL_DT` | NVARCHAR(100) NULL | Cột dữ liệu (Column) — dùng trong bảng cấu hình cột động (Ngày (Date)) |
| `TYP_MN` | NVARCHAR(2) NULL | Loại / Phân loại (Số phút (Minutes) — hoặc mã nhóm tùy bảng)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |

#### `GP_LABOURCONTRACT_FILENAME` — *(xem chi tiết ở Phần 3)*

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `LAB_TP` | NVARCHAR(20) NOT NULL | Hợp đồng lao động (Labour contract) (Loại (Type)) |
| `CUS_ID` | INT NOT NULL | (Mã (khóa nhận diện)) |
| `FIL_NM` | NVARCHAR(50) NULL | Tên file (Tên) |

#### `GP_MONTHADDUP` — *(xem chi tiết ở Phần 3)*

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `TYP_ID` | NVARCHAR(10) NOT NULL | Loại / Phân loại (Mã (khóa nhận diện)) |
| `TYP_NM` | NVARCHAR(50) NULL | Loại / Phân loại (Tên) |
| `TYP_EN` | NVARCHAR(50) NULL | Loại / Phân loại (Tên tiếng Anh (đa ngôn ngữ)) |
| `TYP_CH` | NVARCHAR(50) NULL | Loại / Phân loại (Tên tiếng Hoa (đa ngôn ngữ)) |
| `TYP_VN` | NVARCHAR(50) NULL | Loại / Phân loại (Tên tiếng Việt (đa ngôn ngữ)) |
| `TYP_TT` | NVARCHAR(50) NULL | Loại / Phân loại (Tổng / Trạng thái (tùy ngữ cảnh))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `ROU_DR` | NVARCHAR(5) NULL | Làm tròn (Round) (Nội dung diễn giải / ghi chú dạng text)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |

### SYS_ – Hệ thống chung (người dùng, phân quyền, menu, nhãn)

#### `SYS_BS_TAPRINTOUT_GETCOLS` — *(xem chi tiết ở Phần 3)*

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `COL_ID` | NVARCHAR(50) NOT NULL | Cột dữ liệu (Column) — dùng trong bảng cấu hình cột động (Mã (khóa nhận diện)) |
| `COL_NM` | NVARCHAR(50) NULL | Cột dữ liệu (Column) — dùng trong bảng cấu hình cột động (Tên) |
| `DES_NM` | NVARCHAR(50) NULL | (Tên) |
| `STA_BT` | BIT NULL | Trạng thái (Status) (Cờ đúng-sai (Bit: 1/0))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `MON_BT` | BIT NULL | Tháng (Cờ đúng-sai (Bit: 1/0)) |
| `TAB_DR` | NVARCHAR(50) NULL | (Nội dung diễn giải / ghi chú dạng text) |
| `SQL_DR` | NVARCHAR(500) NULL | Câu lệnh SQL động (Nội dung diễn giải / ghi chú dạng text) |
| `TYP_ID` | INT NULL | Loại / Phân loại (Mã (khóa nhận diện)) |
| `TAA_PR` | INT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |

#### `SYS_CONTROL_USER` — *(xem chi tiết ở Phần 3)*

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `USER_ID` | NVARCHAR(50) NOT NULL | (Mã (khóa nhận diện)) |
| `STATE` | BIT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `MAC_NM` | NVARCHAR(50) NULL | (Tên) |
| `TIM_DR` | DATETIME NULL | Số lần quy định (Nội dung diễn giải / ghi chú dạng text)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |

#### `SYS_GROUP` — *(xem chi tiết ở Phần 3)*

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `GROUP_ID` | NVARCHAR(50) NOT NULL | (Mã (khóa nhận diện)) |
| `GROUP_NM` | NVARCHAR(50) NULL | (Tên) |

#### `SYS_HELP` — *(xem chi tiết ở Phần 3)*

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `NAME` | NVARCHAR(50) NOT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `EN` | NVARCHAR(500) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `CH` | NVARCHAR(500) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `VN` | NVARCHAR(500) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `TT` | NVARCHAR(500) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |

#### `SYS_LABEL` — *(xem chi tiết ở Phần 3)*

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `NAME` | NVARCHAR(50) NOT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `ID` | INT NOT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `EN` | NVARCHAR(500) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `CH` | NVARCHAR(500) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `VN` | NVARCHAR(500) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `TT` | NVARCHAR(500) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `FNAME` | NVARCHAR(50) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |

#### `SYS_LABEL_PMENU` — *(xem chi tiết ở Phần 3)*

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `NAME` | NVARCHAR(50) NOT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `ID` | INT NOT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `EN` | NVARCHAR(500) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `CH` | NVARCHAR(500) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `VN` | NVARCHAR(500) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `TT` | NVARCHAR(500) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `FNAME` | NVARCHAR(50) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `DT_BT` | BIT NULL | (Cờ đúng-sai (Bit: 1/0)) |
| `MT_BT` | BIT NULL | (Cờ đúng-sai (Bit: 1/0)) |
| `CK_BT` | BIT NULL | (Cờ đúng-sai (Bit: 1/0)) |
| `QT_BT` | BIT NULL | (Cờ đúng-sai (Bit: 1/0)) |
| `DP_BT` | BIT NULL | (Cờ đúng-sai (Bit: 1/0)) |
| `FIL_NM` | NVARCHAR(50) NULL | Tên file (Tên) |

#### `SYS_LABEL_RPT` — *(xem chi tiết ở Phần 3)*

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `NAME` | NVARCHAR(50) NOT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `ID` | INT NOT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `EN` | NVARCHAR(500) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `CH` | NVARCHAR(500) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `VN` | NVARCHAR(500) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `TT` | NVARCHAR(500) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `FNAME` | NVARCHAR(50) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |

#### `SYS_LABEL_VS` — *(xem chi tiết ở Phần 3)*

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `NAME` | NVARCHAR(50) NOT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `ID` | INT NOT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `EN` | NVARCHAR(500) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `CH` | NVARCHAR(500) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `VN` | NVARCHAR(500) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `TT` | NVARCHAR(500) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `FNAME` | NVARCHAR(50) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |

#### `SYS_LABEL_VS_ATT` — *(xem chi tiết ở Phần 3)*

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `NAME` | NVARCHAR(50) NOT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `ID` | INT NOT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `EN` | NVARCHAR(500) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `CH` | NVARCHAR(500) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `VN` | NVARCHAR(500) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `TT` | NVARCHAR(500) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `FNAME` | NVARCHAR(50) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |

#### `SYS_LOG_INFO` — *(xem chi tiết ở Phần 3)*

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `USER_ID` | NVARCHAR(50) NOT NULL | (Mã (khóa nhận diện)) |
| `MAC_DR` | NVARCHAR(50) NOT NULL | (Nội dung diễn giải / ghi chú dạng text) |
| `LOGIN_DT` | DATETIME NOT NULL | (Ngày (Date)) |
| `LOGOUT_DT` | DATETIME NULL | (Ngày (Date)) |

#### `SYS_MENU` — *(xem chi tiết ở Phần 3)*

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `ID` | INT NOT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `H_ID` | INT NULL | (Mã (khóa nhận diện)) |
| `SEQ` | INT NULL | Số thứ tự |
| `HIDE` | BIT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `EN` | NVARCHAR(100) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `CH` | NVARCHAR(100) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `VN` | NVARCHAR(100) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `SEC` | BIT NULL DEFAULT (1) | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `TT` | NVARCHAR(100) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `DEP_BT` | BIT NULL DEFAULT (0) | Phòng ban / Bộ phận (Cờ đúng-sai (Bit: 1/0)) |
| `TYP_BT` | BIT NULL | Loại / Phân loại (Cờ đúng-sai (Bit: 1/0)) |

#### `SYS_MSG` — *(xem chi tiết ở Phần 3)*

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `Name` | NVARCHAR(50) NOT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `ID` | INT NOT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `EN` | NVARCHAR(500) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `CH` | NVARCHAR(500) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `VN` | NVARCHAR(500) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `TT` | NVARCHAR(500) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `FNAME` | NVARCHAR(50) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |

#### `SYS_SECURITY` — *(xem chi tiết ở Phần 3)*

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `GROUP_ID` | NVARCHAR(50) NOT NULL | (Mã (khóa nhận diện)) |
| `MNU_ID` | INT NOT NULL | (Mã (khóa nhận diện)) |
| `ADD` | BIT NULL DEFAULT (0) | Địa chỉ |
| `UPDATE` | BIT NULL DEFAULT (0) | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `DELETE` | BIT NULL DEFAULT (0) | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `USAGE` | BIT NULL DEFAULT (0) | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `PRINT` | BIT NULL DEFAULT (0) | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `CT_DT` | DATETIME NULL | (Ngày (Date)) |
| `CT_ID` | NVARCHAR(50) NULL | (Mã (khóa nhận diện)) |
| `MD_DT` | DATETIME NULL | (Ngày (Date)) |
| `MD_ID` | NVARCHAR(50) NULL | (Mã (khóa nhận diện)) |

#### `SYS_SECURITY_DEP` — Phan Quyen theo User **[Xác nhận]**

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `USER_ID` | NVARCHAR(50) NOT NULL | (Mã (khóa nhận diện)) |
| `DEP_ID` | NVARCHAR(50) NOT NULL | Phòng ban / Bộ phận (Mã (khóa nhận diện)) |
| `MNU_ID` | INT NOT NULL | (Mã (khóa nhận diện)) |
| `ALL_BT` | BIT NULL | (Cờ đúng-sai (Bit: 1/0)) |

#### `SYS_SECURITY_TYP` — *(xem chi tiết ở Phần 3)*

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `USER_ID` | NVARCHAR(50) NOT NULL | (Mã (khóa nhận diện)) |
| `TYP_ID` | NVARCHAR(50) NOT NULL | Loại / Phân loại (Mã (khóa nhận diện)) |
| `MNU_ID` | INT NOT NULL | (Mã (khóa nhận diện)) |
| `ALL_BT` | BIT NULL | (Cờ đúng-sai (Bit: 1/0)) |

#### `SYS_SQL_FROM` — *(xem chi tiết ở Phần 3)*

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `ID` | NVARCHAR(50) NOT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `FROM` | NVARCHAR(2000) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `TABLE` | NVARCHAR(50) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |

#### `SYS_SQL_SELECT` — *(xem chi tiết ở Phần 3)*

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `ID` | NVARCHAR(50) NOT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `ID1` | INT NOT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `NAME` | NVARCHAR(20) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `FIELD` | NVARCHAR(40) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `SHOW` | BIT NULL DEFAULT (1) | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `SEQ` | INT NULL | Số thứ tự |
| `HIDE` | BIT NULL DEFAULT (0) | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `LOCK` | BIT NULL DEFAULT (0) | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |

#### `SYS_USER` — *(xem chi tiết ở Phần 3)*

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `USER_ID` | NVARCHAR(50) NOT NULL | (Mã (khóa nhận diện)) |
| `USER_NAME` | NVARCHAR(100) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `PASS` | NVARCHAR(50) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `GROUP_ID` | NVARCHAR(50) NULL | (Mã (khóa nhận diện)) |

#### `S_LABEL_T` — *(xem chi tiết ở Phần 3)*

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `LABEL_ID` | NVARCHAR(50) NOT NULL | (Mã (khóa nhận diện)) |
| `INDEX_START` | INT NOT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `VNESE` | NVARCHAR(1200) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `ENG` | NVARCHAR(1000) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `THAIL` | NVARCHAR(1000) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `CHESE` | NVARCHAR(1000) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `KOREAN` | NVARCHAR(1000) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `FIELDNAME` | NVARCHAR(50) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |

### Khác / bảng tạm / bảng phụ trợ

#### `BH` — *(xem chi tiết ở Phần 3)*

Bảng tạm / phụ trợ cho thao tác import-export hoặc xử lý trung gian trong ứng dụng cũ. **Khuyến nghị: không cần thiết kế lại ở backend mới**, trừ khi có yêu cầu nghiệp vụ cụ thể.

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `STT` | NVARCHAR(50) NULL | Số thứ tự |
| `Ten` | NVARCHAR(50) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `BP` | NVARCHAR(50) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `MS` | NVARCHAR(50) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |

#### `CD_BH` — *(xem chi tiết ở Phần 3)*

Bảng tạm / phụ trợ cho thao tác import-export hoặc xử lý trung gian trong ứng dụng cũ. **Khuyến nghị: không cần thiết kế lại ở backend mới**, trừ khi có yêu cầu nghiệp vụ cụ thể.

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `EMP_ID` | NVARCHAR(255) NULL | Nhân viên (Mã (khóa nhận diện)) |
| `CongDoan_OK` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |
| `BHTN_OK` | FLOAT NULL | Tên cột tiếng Việt tự giải nghĩa (đọc trực tiếp theo tên). |

#### `Data` — Bảng tạm / phụ trợ import-export **[Suy luận]**

Bảng tạm / phụ trợ cho thao tác import-export hoặc xử lý trung gian trong ứng dụng cũ. **Khuyến nghị: không cần thiết kế lại ở backend mới**, trừ khi có yêu cầu nghiệp vụ cụ thể.

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `MS` | NVARCHAR(53) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `HOTEN` | NVARCHAR(255) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `NGAYSINH` | SMALLDATETIME NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `GT` | BIT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `BP` | NVARCHAR(255) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `CV` | NVARCHAR(255) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `HOCVAN` | NVARCHAR(255) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `LOAINV` | NVARCHAR(255) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `DIACHI` | NVARCHAR(255) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `QT` | NVARCHAR(255) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `DT` | NVARCHAR(255) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `NVL` | DATETIME NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |

#### `HistoryOfFILA06A` — *(xem chi tiết ở Phần 3)*

Bảng tạm / phụ trợ cho thao tác import-export hoặc xử lý trung gian trong ứng dụng cũ. **Khuyến nghị: không cần thiết kế lại ở backend mới**, trừ khi có yêu cầu nghiệp vụ cụ thể.

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `SEQ_NO` | INT NULL | Số thứ tự (Số (Number)) |
| `STR_DT` | DATETIME NULL | Bắt đầu (Start) (Ngày (Date)) |
| `END_DT` | DATETIME NULL | Kết thúc (End) (Ngày (Date)) |
| `USER` | NVARCHAR(100) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `WHERE` | NVARCHAR(4000) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `RESULT` | NVARCHAR(4000) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |

#### `LoaiNV` — Bảng tạm / phụ trợ import-export **[Suy luận]**

Bảng tạm / phụ trợ cho thao tác import-export hoặc xử lý trung gian trong ứng dụng cũ. **Khuyến nghị: không cần thiết kế lại ở backend mới**, trừ khi có yêu cầu nghiệp vụ cụ thể.

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `EMP_ID` | NVARCHAR(255) NULL | Nhân viên (Mã (khóa nhận diện)) |
| `TYP_ID` | NVARCHAR(255) NULL | Loại / Phân loại (Mã (khóa nhận diện)) |

#### `NVMOI` — Bảng tạm / phụ trợ import-export **[Suy luận]**

Bảng tạm / phụ trợ cho thao tác import-export hoặc xử lý trung gian trong ứng dụng cũ. **Khuyến nghị: không cần thiết kế lại ở backend mới**, trừ khi có yêu cầu nghiệp vụ cụ thể.

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `EMP_ID` | NVARCHAR(255) NULL | Nhân viên (Mã (khóa nhận diện)) |
| `MSBP` | NVARCHAR(255) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `EMP_NM` | NVARCHAR(255) NULL | Nhân viên (Tên) |
| `EMP_N1` | NVARCHAR(255) NULL | Nhân viên (Trường tên phụ / biến thể 2)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `MST_DR` | NVARCHAR(255) NULL | Mã số thuế (Nội dung diễn giải / ghi chú dạng text) |
| `BIR_DT` | NVARCHAR(255) NULL | Ngày sinh (Ngày (Date)) |
| `SEX_BT` | FLOAT NULL | Giới tính (Cờ đúng-sai (Bit: 1/0)) |
| `MAR_BT` | NVARCHAR(255) NULL | Tình trạng hôn nhân (Cờ đúng-sai (Bit: 1/0)) |
| `DEP_ID` | NVARCHAR(255) NULL | Phòng ban / Bộ phận (Mã (khóa nhận diện)) |
| `COU_ID` | NVARCHAR(255) NULL | Huyện / Quận (Mã (khóa nhận diện))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `CRD_NO` | FLOAT NULL | CMND / CCCD (Chứng minh nhân dân / Căn cước công dân) (Số (Number)) |
| `POS_ID` | NVARCHAR(255) NULL | Chức vụ / Vị trí công việc (Mã (khóa nhận diện)) |
| `ADD_DR` | NVARCHAR(255) NULL | Địa chỉ (Nội dung diễn giải / ghi chú dạng text) |
| `ADD_D1` | NVARCHAR(255) NULL | Địa chỉ (Trường phụ / biến thể của cột ngày hoặc diễn giải)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `INH_DT` | SMALLDATETIME NULL | Ngày vào công ty (Hire date) (Ngày (Date)) |
| `CRD_ID` | NVARCHAR(255) NULL | CMND / CCCD (Chứng minh nhân dân / Căn cước công dân) (Mã (khóa nhận diện)) |
| `CRD_DT` | SMALLDATETIME NULL | CMND / CCCD (Chứng minh nhân dân / Căn cước công dân) (Ngày (Date)) |
| `CRD_LC` | NVARCHAR(255) NULL | CMND / CCCD (Chứng minh nhân dân / Căn cước công dân) (Nơi cấp / địa điểm (Location)) |
| `CIT_ID` | NVARCHAR(255) NULL | Tỉnh / Thành phố (Mã (khóa nhận diện)) |
| `RAC_NM` | NVARCHAR(255) NULL | Dân tộc (Tên) |
| `NAT_CO` | NVARCHAR(255) NULL | Quốc tịch (Quốc gia (Country)) |
| `EDU_ID` | NVARCHAR(255) NULL | Trình độ học vấn (Mã (khóa nhận diện)) |
| `PRO_ID` | NVARCHAR(255) NULL | Trình độ chuyên môn (hoặc: Thử việc - Probation, tùy bảng) (Mã (khóa nhận diện))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `GRA_ID` | NVARCHAR(255) NULL | Bằng cấp / Nơi tốt nghiệp (Mã (khóa nhận diện))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `TEL_NO` | FLOAT NULL | Điện thoại (Số (Number)) |
| `TYP_ID` | NVARCHAR(255) NULL | Loại / Phân loại (Mã (khóa nhận diện)) |
| `ACC_NO` | NVARCHAR(255) NULL | Tài khoản ngân hàng (Số (Number)) |
| `ACC_NM` | NVARCHAR(255) NULL | Tài khoản ngân hàng (Tên) |
| `BNK_NM` | NVARCHAR(255) NULL | Ngân hàng (Tên) |
| `REL_DR` | NVARCHAR(255) NULL | Quan hệ (người thân / liên hệ khẩn cấp) (Nội dung diễn giải / ghi chú dạng text)  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `NEW_BT` | NVARCHAR(255) NULL | Nhân viên mới (Cờ đúng-sai (Bit: 1/0))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `MEA_BT` | NVARCHAR(255) NULL | Chưa rõ nghĩa cụ thể (Cờ đúng-sai (Bit: 1/0))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `REM_DR` | NVARCHAR(255) NULL | Ghi chú / Remark (Nội dung diễn giải / ghi chú dạng text) |
| `ATT_BT` | NVARCHAR(255) NULL | Chấm công / Có mặt (Cờ đúng-sai (Bit: 1/0)) |
| `VAC_BT` | NVARCHAR(255) NULL | Nghỉ việc (lý do/trạng thái thôi việc) (Cờ đúng-sai (Bit: 1/0)) |
| `DEL_BT` | NVARCHAR(255) NULL | Xóa (đánh dấu đã xóa) (Cờ đúng-sai (Bit: 1/0)) |
| `GRT_ID` | NVARCHAR(255) NULL | Nhóm lương (Mã (khóa nhận diện))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `GRP_ID` | NVARCHAR(255) NULL | Nhóm (Mã (khóa nhận diện)) |
| `LEV_ID` | NVARCHAR(255) NULL | Cấp bậc / Bậc lương (Level) (Mã (khóa nhận diện)) |
| `LCK_BT` | NVARCHAR(255) NULL | Khóa (không cho chỉnh sửa) (Cờ đúng-sai (Bit: 1/0)) |
| `BHX_BT` | NVARCHAR(255) NULL | Bảo hiểm xã hội (Cờ đúng-sai (Bit: 1/0)) |
| `DIR_BT` | NVARCHAR(255) NULL | Trực tiếp quản lý / Giám đốc (Cờ đúng-sai (Bit: 1/0))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `BLT_NM` | NVARCHAR(255) NULL | Người tạo bản ghi (Built by) (Tên) |
| `BLT_DT` | NVARCHAR(255) NULL | Người tạo bản ghi (Built by) (Ngày (Date)) |
| `LST_NM` | NVARCHAR(255) NULL | Người & thời gian sửa lần cuối (Last update) (Tên) |
| `LST_DT` | NVARCHAR(255) NULL | Người & thời gian sửa lần cuối (Last update) (Ngày (Date)) |
| `SEN_DT` | NVARCHAR(255) NULL | Thâm niên (Seniority) (Ngày (Date)) |
| `REM_D2` | NVARCHAR(255) NULL | Ghi chú / Remark |

#### `P_FILA10A` — Bảng tạm / phụ trợ import-export **[Suy luận]**

Bảng tạm / phụ trợ cho thao tác import-export hoặc xử lý trung gian trong ứng dụng cũ. **Khuyến nghị: không cần thiết kế lại ở backend mới**, trừ khi có yêu cầu nghiệp vụ cụ thể.

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `SEC_ID` | NVARCHAR(20) NOT NULL | (Mã (khóa nhận diện)) |
| `SEC_NM` | NVARCHAR(50) NULL | (Tên) |

#### `P_FILB01A` — Bảng tạm / phụ trợ import-export **[Suy luận]**

Bảng tạm / phụ trợ cho thao tác import-export hoặc xử lý trung gian trong ứng dụng cũ. **Khuyến nghị: không cần thiết kế lại ở backend mới**, trừ khi có yêu cầu nghiệp vụ cụ thể.

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `STY_NO` | NVARCHAR(30) NOT NULL | (Số (Number)) |
| `BLT_NM` | NVARCHAR(50) NULL | Người tạo bản ghi (Built by) (Tên) |
| `BLT_DT` | DATETIME NULL | Người tạo bản ghi (Built by) (Ngày (Date)) |
| `LST_NM` | NVARCHAR(50) NULL | Người & thời gian sửa lần cuối (Last update) (Tên) |
| `LST_DT` | DATETIME NULL | Người & thời gian sửa lần cuối (Last update) (Ngày (Date)) |

#### `P_FILB01B` — Bảng tạm / phụ trợ import-export **[Suy luận]**

Bảng tạm / phụ trợ cho thao tác import-export hoặc xử lý trung gian trong ứng dụng cũ. **Khuyến nghị: không cần thiết kế lại ở backend mới**, trừ khi có yêu cầu nghiệp vụ cụ thể.

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `SEQ_NO` | INT NULL | Số thứ tự (Số (Number)) |
| `STY_NO` | NVARCHAR(30) NOT NULL | (Số (Number)) |
| `SEC_ID` | NVARCHAR(20) NOT NULL | (Mã (khóa nhận diện)) |
| `TIM_QT` | FLOAT NULL | Số lần quy định (Giá trị quy định (số lần/số tiền))  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `UNT_PR` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `TOP_PR` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `AMT_PR` | FLOAT NULL | Số tiền quy định  ⚠️ *suy luận theo quy ước đặt tên, cần xác nhận lại* |
| `BLT_NM` | NVARCHAR(50) NULL | Người tạo bản ghi (Built by) (Tên) |
| `BLT_DT` | DATETIME NULL | Người tạo bản ghi (Built by) (Ngày (Date)) |
| `LST_NM` | NVARCHAR(50) NULL | Người & thời gian sửa lần cuối (Last update) (Tên) |
| `LST_DT` | DATETIME NULL | Người & thời gian sửa lần cuối (Last update) (Ngày (Date)) |

#### `SelectTemp` — Bảng tạm / phụ trợ import-export **[Suy luận]**

Bảng tạm / phụ trợ cho thao tác import-export hoặc xử lý trung gian trong ứng dụng cũ. **Khuyến nghị: không cần thiết kế lại ở backend mới**, trừ khi có yêu cầu nghiệp vụ cụ thể.

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `ID` | NVARCHAR(50) NOT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `ID1` | INT NOT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `NAME` | NVARCHAR(20) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `FIELD` | NVARCHAR(40) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `SHOW` | BIT NULL DEFAULT (1) | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `SEQ` | INT NULL | Số thứ tự |
| `HIDE` | BIT NULL DEFAULT (0) | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `LOCK` | BIT NULL DEFAULT (0) | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |

#### `Temp` — Bảng tạm / phụ trợ import-export **[Suy luận]**

Bảng tạm / phụ trợ cho thao tác import-export hoặc xử lý trung gian trong ứng dụng cũ. **Khuyến nghị: không cần thiết kế lại ở backend mới**, trừ khi có yêu cầu nghiệp vụ cụ thể.

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `NAME` | NVARCHAR(50) NOT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `ID` | INT NOT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `EN` | NVARCHAR(500) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `CH` | NVARCHAR(500) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `VN` | NVARCHAR(500) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `TT` | NVARCHAR(500) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `FNAME` | NVARCHAR(50) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |

#### `Temp_vs` — Bảng tạm / phụ trợ import-export **[Suy luận]**

Bảng tạm / phụ trợ cho thao tác import-export hoặc xử lý trung gian trong ứng dụng cũ. **Khuyến nghị: không cần thiết kế lại ở backend mới**, trừ khi có yêu cầu nghiệp vụ cụ thể.

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `NAME` | NVARCHAR(50) NOT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `ID` | INT NOT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `EN` | NVARCHAR(500) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `CH` | NVARCHAR(500) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `VN` | NVARCHAR(500) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `TT` | NVARCHAR(500) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `FNAME` | NVARCHAR(50) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |

#### `TransferExcelToDB_Setting` — Bảng tạm / phụ trợ import-export **[Suy luận]**

Bảng tạm / phụ trợ cho thao tác import-export hoặc xử lý trung gian trong ứng dụng cũ. **Khuyến nghị: không cần thiết kế lại ở backend mới**, trừ khi có yêu cầu nghiệp vụ cụ thể.

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `Function_ID` | INT NOT NULL | (Mã (khóa nhận diện)) |
| `TableName` | NVARCHAR(100) NOT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `FieldName` | NVARCHAR(200) NOT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `ExcelCol_name` | NVARCHAR(50) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `ExcelCol_Pos` | NVARCHAR(50) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `NO` | INT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `Cdtion_View` | NVARCHAR(100) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `iTableUseful` | SMALLINT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `bShow` | BIT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |

#### `chuyen` — Bảng tạm / phụ trợ import-export **[Suy luận]**

Bảng tạm / phụ trợ cho thao tác import-export hoặc xử lý trung gian trong ứng dụng cũ. **Khuyến nghị: không cần thiết kế lại ở backend mới**, trừ khi có yêu cầu nghiệp vụ cụ thể.

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `stt` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `ho` | NVARCHAR(255) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `tan` | NVARCHAR(255) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `tentienghoa` | NVARCHAR(255) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `maso` | NVARCHAR(255) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `ngaysinh` | NVARCHAR(10) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `diachi` | NVARCHAR(255) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `cmnd` | NVARCHAR(255) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `noisinh` | NVARCHAR(255) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `ngaycap` | NVARCHAR(255) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `ngayvaolam` | SMALLDATETIME NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `vitri` | SMALLDATETIME NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `gioitinh` | NVARCHAR(255) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `baclung` | NVARCHAR(255) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `mathe` | NVARCHAR(255) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `bophan` | NVARCHAR(255) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `chucvu` | NVARCHAR(255) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `bophàn` | NVARCHAR(255) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `donvi` | FLOAT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `manv` | NVARCHAR(255) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |

#### `dtproperties` — Bảng tạm / phụ trợ import-export **[Suy luận]**

Bảng tạm / phụ trợ cho thao tác import-export hoặc xử lý trung gian trong ứng dụng cũ. **Khuyến nghị: không cần thiết kế lại ở backend mới**, trừ khi có yêu cầu nghiệp vụ cụ thể.

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `id` | INT NOT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `objectid` | INT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `property` | VARCHAR(64) NOT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `value` | VARCHAR(255) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `uvalue` | NVARCHAR(255) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `lvalue` | IMAGE NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `version` | INT NOT NULL DEFAULT (0) | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |

#### `dulieu` — Bảng tạm / phụ trợ import-export **[Suy luận]**

Bảng tạm / phụ trợ cho thao tác import-export hoặc xử lý trung gian trong ứng dụng cũ. **Khuyến nghị: không cần thiết kế lại ở backend mới**, trừ khi có yêu cầu nghiệp vụ cụ thể.

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `STCU` | NVARCHAR(255) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `STMOI` | NVARCHAR(255) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |

#### `selecttemp_GP` — Bảng tạm / phụ trợ import-export **[Suy luận]**

Bảng tạm / phụ trợ cho thao tác import-export hoặc xử lý trung gian trong ứng dụng cũ. **Khuyến nghị: không cần thiết kế lại ở backend mới**, trừ khi có yêu cầu nghiệp vụ cụ thể.

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `ID` | NVARCHAR(50) NOT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `ID1` | INT NOT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `NAME` | NVARCHAR(20) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `FIELD` | NVARCHAR(40) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `SHOW` | BIT NULL DEFAULT (1) | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `SEQ` | INT NULL | Số thứ tự |
| `HIDE` | BIT NULL DEFAULT (0) | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `LOCK` | BIT NULL DEFAULT (0) | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |

#### `sysdiagrams` — Bảng tạm / phụ trợ import-export **[Suy luận]**

Bảng tạm / phụ trợ cho thao tác import-export hoặc xử lý trung gian trong ứng dụng cũ. **Khuyến nghị: không cần thiết kế lại ở backend mới**, trừ khi có yêu cầu nghiệp vụ cụ thể.

| Cột | Kiểu dữ liệu | Giải nghĩa |
|---|---|---|
| `name` | NVARCHAR(128) NOT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `principal_id` | INT NOT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `diagram_id` | INT IDENTITY(1,1) NOT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `version` | INT NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
| `definition` | VARBINARY(MAX) NULL | Chưa xác định được nghĩa — cần hỏi lại đội nghiệp vụ/backend cũ. |
