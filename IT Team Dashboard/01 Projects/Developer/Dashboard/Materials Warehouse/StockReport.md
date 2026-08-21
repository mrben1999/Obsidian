---
type: project
status: in-progress
priority: P2
team:
owner:
start_date: 2026-07-06
due:
created: 2026-07-06
tags:
  - project
---
# TÀI LIỆU ĐẶC TẢ KỸ THUẬT API (API SPECIFICATION)

## 1. THÔNG TIN CHUNG (OVERVIEW)
* **API Name:** Get Customer & Season Stock Report with Iss Rate
* **Endpoint:** `/api/StockReport`
* **Method:** `GET`
* **Content-Type:** `application/json`
* **Chức năng:** Cung cấp toàn bộ dữ liệu báo cáo tồn kho phân loại theo Khách hàng (Customer) và Mùa vụ (Season), đồng thời tính toán sẵn tỷ lệ phát hàng so với nhận hàng (ISS RATE %). Dữ liệu này dùng để đổ trực tiếp lên các widget bảng biểu và đồ thị phân tích năng suất vận hành của phân hệ Dashboard WMC.
* **Cơ chế giảm tải (Caching):** API tích hợp bộ nhớ đệm ngắn hạn (Memory Cache) với thời gian tự hủy **30 giây**. Trong khoảng thời gian này, các request lặp lại có cùng tham số `warehouse` sẽ lấy dữ liệu tức thì từ RAM, giúp giảm tải tối đa áp lực I/O xuống Database MySQL khi giao diện kích hoạt Auto-Refresh.

---

## 2. THAM SỐ ĐẦU VÀO (REQUEST PARAMETERS)

API sử dụng phương thức `GET`, các tham số bộ lọc được truyền trực tiếp thông qua đường dẫn **Query String** (Không sử dụng Request Body).

| Tham số | Kiểu dữ liệu | Bắt buộc | Mặc định | Mô tả | Ví dụ |
| :--- | :--- | :--- | :--- | :--- | :--- |
| `warehouse` | `string` | Không | `"QVN-A"` | Mã định danh kho hàng cần kết xuất dữ liệu tổng hợp. | `QVN-A` |

### Ví dụ URL Request:
```http
GET http://localhost:44301/api/StockReport?warehouse=QVN-A
````

## 3. CẤU TRÚC DỮ LIỆU ĐẦU RA (RESPONSE JSON)

### 3.1. Trường hợp thành công (HTTP Status Code: 200 OK)

Kết quả trả về được bọc trong cấu trúc `ApiResponse<T>` đồng bộ của dự án. Khối `data` trả về một mảng phẳng (Flat Array) các đối tượng báo cáo.

JSON

```
{
  "isSuccess": true,
  "message": "Lấy báo cáo tồn kho thành công.",
  "data": [
    {
      "customer": "KAWAS",
      "season": "FA26",
      "rcvQty": 5968.00,
      "issQty": -28.00,
      "stockQty": 5940.00,
      "issRate": 0.47
    },
    {
      "customer": "MAMU",
      "season": "FA26",
      "rcvQty": 100.00,
      "issQty": -68.00,
      "stockQty": 32.00,
      "issRate": 68.00
    },
    {
      "customer": "VF",
      "season": "FA26",
      "rcvQty": 163406.00,
      "issQty": -161204.46,
      "stockQty": 2201.54,
      "issRate": 98.65
    },
    {
      "customer": "MB",
      "season": "SP26",
      "rcvQty": 81.20,
      "issQty": -81.20,
      "stockQty": 0.00,
      "issRate": 100.00
    }
  ]
}
```

### 3.2. Chi tiết đặc tả các trường dữ liệu (Data Dictionary cho QA & Frontend)

|**Key JSON**|**Kiểu dữ liệu**|**Định dạng hiển thị UI**|**Ý nghĩa nghiệp vụ**|**Lưu ý kỹ thuật cho QA / Frontend Dev**|
|---|---|---|---|---|
|`isSuccess`|`boolean`|Không hiển thị|Trạng thái xử lý của API|`true` biểu thị xử lý thành công không lỗi.|
|`message`|`string`|Không hiển thị|Thông báo từ hệ thống Backend|Dùng làm cơ sở hiển thị Toast Notification hoặc ghi log.|
|`data`|`array`|Bảng dữ liệu / Biểu đồ|Danh sách dữ liệu chi tiết|Chứa tập hợp các bản ghi Nhập-Xuất-Tồn-Tỷ lệ.|
|`data[].customer`|`string`|Chữ in hoa (VD: `NIKE`)|Mã định danh Khách hàng|Khớp với cột khách hàng trên trục hoặc bảng.|
|`data[].season`|`string`|Mã 4 ký tự (VD: `FA26`)|Mã Mùa vụ (2 chữ + 2 số)|Định dạng cố định `XXYY` đại diện cho các mùa trong năm.|
|`data[].rcvQty`|`number`|Số phân tách hàng nghìn|Tổng số lượng đã Nhận (`RCV`)|Đã làm tròn tối đa 2 chữ số thập phân, giá trị luôn `>= 0`.|
|`data[].issQty`|`number`|Số phân tách hàng nghìn|Tổng số lượng đã Xuất (`ISS`)|Mang **giá trị âm (`< 0`)** đại diện cho lượng xuất giảm kho.|
|`data[].stockQty`|`number`|Số phân tách hàng nghìn|Lượng Tồn kho hiện tại (`STOCK`)|Được tính toán đồng bộ dưới DB. `StockQty = RcvQty + IssQty`.|
|`data[].issRate`|`number`|Thêm hậu tố `%` (VD: `98.65%`)|**Tỷ lệ phát hàng (ISS RATE)**|Giá trị trả về dưới dạng phần trăm thực tế (0 - 100+), đã được Backend tính trị tuyệt đối và làm tròn 2 chữ số thập phân.|

## 4. KỊCH BẢN KIỂM THỬ DÀNH CHO QA (TEST CASES)

|**ID**|**Tên kịch bản**|**Điều kiện đầu vào (Input)**|**Kết quả mong đợi (Expected Outcome)**|
|---|---|---|---|
|**TC-01**|Kiểm thử tham số mặc định|Không truyền `warehouse`|API tự động nhận diện kho `QVN-A`. Trả về HTTP Status 200 kèm danh sách dữ liệu hợp lệ.|
|**TC-02**|Kiểm thử lọc theo kho chỉ định|Truyền mã kho `?warehouse=LQN-A`|Trả về HTTP Status 200, hiển thị chính xác tập dữ liệu thuộc phạm vi quản lý của kho `LQN-A`.|
|**TC-03**|Kiểm thử kiểm soát làm tròn số|Kiểm tra ngẫu nhiên các trường số|Tuyệt đối không xuất hiện hiện tượng loãng số (Floating-point error) kiểu dài ngoằng `.390000000001`. Tất cả số phải gọn đẹp ở 2 chữ số thập phân.|
|**TC-04**|Kiểm thử thuật toán tính `issRate`|Bản ghi có `rcvQty = 0` và `issQty < 0`|Trường `issRate` phải trả về đúng giá trị quy ước là `100` (Không bị lỗi crash hệ thống `DivideByZeroException`).|
|**TC-05**|Kiểm thử hiệu năng Cache|Kích hoạt gọi API liên tục 3-5 lần trong vòng 5 giây|Lần đầu tiên hệ thống quét DB. Từ lần thứ 2, tốc độ phản hồi phải cực kỳ nhanh (`< 50ms`) do trúng Memory Cache ngắn hạn.|

## 5. HƯỚNG DẪN TÍCH HỢP DÀNH CHO FRONTEND DEVELOPER

1. **Xử lý hiển thị cột ISS RATE (%):**
    
    Trường `issRate` đã được Backend nhân sẵn với `100` và làm tròn về dạng thập phân đẹp (Ví dụ: `98.65`). Khi hiển thị lên Widget giao diện, Frontend chỉ cần thực hiện nối chuỗi với ký tự `%` (Ví dụ: `${item.issRate}%`) mà không cần tính toán lại công thức.
    
2. **Lưu ý về dấu của số lượng xuất (`issQty`):**
    
    Giá trị `issQty` luôn trả về số âm (Ví dụ: `-161204.46`). Nếu thiết kế UI yêu cầu hiển thị số dương thuần túy trên biểu đồ, hãy dùng hàm trị tuyệt đối `Math.abs(item.issQty)` trước khi gán vào mảng dữ liệu đồ thị.