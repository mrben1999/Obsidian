---
type: FABRIC & SUPPLY CHAIN MONITOR
status: in-progress
priority: P2
team: developer
owner: Tô Nguyễn Hải Đăng
start_date: 2026-07-06
due:
created: 2026-07-06
tags:
  - project
---

# 📁 Project — Untitled

## Mục tiêu dự án
>Xây dựng Dashboard theo dõi "FABRIC & SUPPLY CHAIN MONITOR"

## Phạm vi
- **Trong phạm vi:**
- **Ngoài phạm vi:**

## Mốc thời gian (Milestones)
| Mốc | Ngày dự kiến | Trạng thái |
|---|---|---|
| | | ☐ |

## Task thuộc dự án này
```dataview
TABLE status as "Trạng thái", priority as "Ưu tiên", assignee as "Phụ trách", due as "Hạn"
FROM #task
WHERE project = this.file.link
SORT due ASC
```

## Rủi ro
| Rủi ro | Mức độ | Giải pháp giảm thiểu |
|---|---|---|
| | | |

## Ghi chú
>

## ## Kế hoạch phân rã Task

| **ID**  | **Module / Sprint**          | **Tên Đầu Việc (Task Name)**                                                       | **GEM Phụ Trách**                   | **Ưu Tiên** | **Trạng Thái** | **Mô Tả Ngắn Gọn**                                                                                         |
| ------- | ---------------------------- | ---------------------------------------------------------------------------------- | ----------------------------------- | ----------- | -------------- | ---------------------------------------------------------------------------------------------------------- |
| **T01** | Sprint 1: Architecture       | Quy hoạch Database Schema & Thiết kế tài liệu đặc tả API Restful                   | **QA - System Analyst & Architect** | High        | To Do          | Định nghĩa cấu trúc bảng snapshot dữ liệu tồn kho, shipment, dữ liệu 8 line (A-H) và đặc tả API JSON.      |
| **T02** | Sprint 1: Backend & Security | Xây dựng cấu trúc Entities, DTOs, Controllers và tối ưu truy vấn SARGable          | **QA - Backend Developer**          | High        | To Do          | Hiện thực hóa mã nguồn C#/.NET, xử lý logic tính toán tỷ lệ cấp phát, dữ liệu trễ hạn, tối ưu index.       |
| **T03** | Sprint 1: Backend & Security | Cấu hình bảo mật hệ thống: CORS, JWT/Identity và quét mã nguồn OWASP Top 10        | **QA - Security Expert**            | High        | To Do          | Đảm bảo an toàn thông tin chuỗi cung ứng, mã hóa token và rà soát lỗ hổng bảo mật trước khi deploy.        |
| **T04** | Sprint 2: Frontend UI/UX     | Xây dựng Layout tổng thể và các thành phần Reusable Components (Top Cards, Tables) | **QA - Frontend Developer**         | High        | To Do          | Phát triển UI bằng React/TypeScript, dựng 4 thẻ KPI đầu dòng, bảng Incoming Shipment và Invoice Detail.    |
| **T05** | Sprint 2: Frontend UI/UX     | Tích hợp biểu đồ trực quan (Donut, Bar Charts) và quản lý State cho 8 Gauge Lines  | **QA - Frontend Developer**         | High        | To Do          | Vẽ biểu đồ phân bổ khách hàng, hiệu suất supplier, top 5 nhóm vải và 8 đồng hồ đo hiệu suất từ Line A-H.   |
| **T06** | Sprint 2: Quality Control    | Lập ma trận test, viết Unit Test tự động (xUnit/Jest) và tìm kịch bản lỗi biên     | **QA - QC/Tester**                  | High        | To Do          | Kiểm thử tự động luồng dữ liệu, test các tình huống biên (dữ liệu rỗng, số quá lớn) và logic Auto Refresh. |

## Gói lệnh chuyển giao cho các GEM

Anh hãy copy nguyên văn các đoạn block lệnh dưới đây để giao việc trực tiếp cho từng Agent:

### 1. Lệnh giao việc cho QA - System Analyst & Architect

Markdown

```
Vai trò của bạn: QA - System Analyst & Architect (Chuyên gia phân tích & Thiết kế).
Nhiệm vụ: Thực hiện Task T01 cho dự án Dashboard "FABRIC & SUPPLY CHAIN MONITOR" (File thiết kế tham chiếu: image_c0ea42.png).

MỤC TIÊU:
- Thiết kế một cấu trúc cơ sở dữ liệu (Database Schema) lưu trữ dữ liệu snapshot vận hành tối ưu từ các phân xưởng.
- Viết tài liệu đặc tả các API Restful để cung cấp dữ liệu chuẩn hóa dạng JSON cho Frontend.

INPUT CUNG CẤP:
- Bản trực quan hóa giao diện: image_c0ea42.png.
- Các cụm thông tin cần bóc tách thực tế:
  1. Thẻ KPI Top: Total Fabric Stock (Yds/Rolls), Total Receive (30 days), Total Issue (30 days), Invoice# in Transit (Lượng Yds & Số lượng hóa đơn).
  2. Phân bổ tồn kho: Stock by Customer (Tỷ lệ phần trăm PATA, NIKE, NB, MB, VF...).
  3. Hiệu suất nhà cung ứng: Supplier Performance (Early, On Time, Delayed) và Top 5 Material Class by Stock.
  4. Danh sách tiến độ: Incoming Shipment (Cus, Packing List, Supp, ETA, Qty, Status) và Invoice Performance Detail.
  5. Dữ liệu vận hành phân xưởng: 8 Line sản xuất từ A đến H (Thông số Rolls, Yds, Tỷ lệ %).

OUTPUT KỲ VỌNG:
1. Bản vẽ hoặc script SQL khởi tạo các bảng (Tables), mối quan hệ (Relationships) hệ thống dữ liệu snapshot chuỗi cung ứng.
2. Tài liệu đặc tả API chi tiết (Endpoint, Method, Request Body, Response JSON cấu trúc rõ ràng cho từng widget trên giao diện).
```

### 2. Lệnh giao việc cho QA - Backend Developer

Markdown

```
Vai trò của bạn: QA - Backend Developer (Kỹ sư mã nguồn Backend C#/.NET).
Nhiệm vụ: Thực hiện Task T02 dựa trên thiết kế giao diện image_c0ea42.png và tài liệu đặc tả từ System Analyst.

MỤC TIÊU:
- Hiện thực hóa mã nguồn ứng dụng C#/.NET Core để xử lý các phép tính toán logic, lưu trữ và kết xuất dữ liệu phục vụ Dashboard chuỗi cung ứng.
- Đảm bảo hiệu năng truy vấn dữ liệu sản xuất quy mô lớn đạt tốc độ tối đa.

INPUT CUNG CẤP:
- File mockup giao diện: image_c0ea42.png.
- Database Schema và tài liệu thiết kế luồng API từ hệ thống kiến trúc.

OUTPUT KỲ VỌNG:
1. Mã nguồn hoàn chỉnh cho cấu trúc Entities, Data Transfer Objects (DTOs) và API Controllers viết bằng C#/.NET.
2. Các câu lệnh truy vấn SQL/LINQ được tối ưu hóa theo tiêu chuẩn SARGable (Sử dụng index hiệu quả, tránh quét toàn bộ bảng, tối ưu các mệnh đề JOIN/CTE). Các hàm code phải có chú thích giải thích chức năng chi tiết, rõ ràng.
```

### 3. Lệnh giao việc cho QA - Security Expert

Markdown

```
Vai trò của bạn: QA - Security Expert (Chuyên gia an ninh hệ thống).
Nhiệm vụ: Thực hiện Task T03 để bảo vệ an toàn cho hệ thống Dashboard (File tham chiếu: image_c0ea42.png).

MỤC TIÊU:
- Rà soát an ninh, cấu hình hệ thống xác thực và đảm bảo mã nguồn Backend/Frontend không dính các lỗ hổng bảo mật nghiêm trọng trước khi hệ thống được đẩy lên môi trường production.

INPUT CUNG CẤP:
- Bản thiết kế kiến trúc hệ thống, mã nguồn Backend C#/.NET và kế hoạch phân phối API.
- Yêu cầu vận hành: Dashboard chạy nội bộ trong nhà mạng sản xuất nhưng giao tiếp qua môi trường Web-based, hỗ trợ Auto Refresh liên tục.

OUTPUT KỲ VỌNG:
1. File cấu hình thiết lập CORS (Cross-Origin Resource Sharing) nghiêm ngặt, chỉ cho phép các domain chỉ định truy cập.
2. Giải pháp tích hợp JWT (JSON Web Token) / Identity để quản lý phiên đăng nhập và phân quyền hiển thị dữ liệu theo cấp bậc nhân sự.
3. Báo cáo quét mã nguồn tự động, chứng minh mã nguồn không vi phạm các tiêu chuẩn bảo mật thuộc danh mục OWASP Top 10.
```

### 4. Lệnh giao việc cho QA - Frontend Developer

Markdown

```
Vai trò của bạn: QA - Frontend Developer (Kỹ sư giao diện React/TypeScript).
Nhiệm vụ: Thực hiện Task T04 & T05 để dựng hoàn chỉnh giao diện Dashboard (File thiết kế gốc: image_c0ea42.png).

MỤC TIÊU:
- Tái dựng lại chính xác 100% giao diện "FABRIC & SUPPLY CHAIN MONITOR" trên nền tảng Web thông qua các thành phần linh hoạt, tái sử dụng được (Reusable Components).
- Xử lý quản lý State mượt mà khi kết nối dữ liệu API thời gian thực.

INPUT CUNG CẤP:
- Bản mẫu thiết kế: image_c0ea42.png.
- Tông màu chủ đạo: Dark Theme (nền xanh đen sẫm), chữ trắng/neon sáng. 
- Quy tắc màu trạng thái: Late (Chấm đỏ), Arrived (Chấm xanh lá), In Transit (Chấm cam).

OUTPUT KỲ VỌNG:
1. Bộ mã nguồn React/TypeScript hoàn chỉnh sử dụng cấu trúc Grid/Flexbox để chia Layout cân đối.
2. Tích hợp thư viện biểu đồ vẽ thành công:
   - 1 Donut Chart (Stock by Customer).
   - 1 Horizontal Bar Chart (Supplier Performance).
   - 1 Stacked Horizontal Bar Chart (Top 5 Material Class).
   - Nhóm 8 cụm đồ thị hình cung (Gauge) đại diện cho hiệu suất từ Line A đến Line H có đổ màu gradient theo tỷ lệ phần trăm (Đỏ/Cam/Xanh lá).
3. Logic xử lý đồng hồ đếm ngược "Auto Refresh" hiển thị góc phải trên cùng, tự động gọi API cập nhật dữ liệu mà không gây hiện tượng giật lag UI.
```

### 5. Lệnh giao việc cho QA - QC/Tester

Markdown

```
Vai trò của bạn: QA - QC/Tester (Kỹ sư đảm bảo chất lượng).
Nhiệm vụ: Thực hiện Task T06 nhằm nghiệm thu toàn bộ chất lượng vận hành của Dashboard (Ảnh thiết kế: image_c0ea42.png).

MỤC TIÊU:
- Đảm bảo hệ thống Dashboard hoạt động chính xác về logic số liệu, không có lỗi hiển thị tràn khung hình và chạy ổn định khi tải dữ liệu liên tục.

INPUT CUNG CẤP:
- Sản phẩm chạy thử nghiệm từ đội phát triển (Frontend + Backend).
- File thiết kế chuẩn: image_c0ea42.png.

OUTPUT KỲ VỌNG:
1. Ma trận kiểm thử (Test Matrix) bao quát toàn bộ các kịch bản kiểm thử chức năng, tính toán tổng số liệu và kiểm thử giao diện (UI/UX).
2. Các kịch bản kiểm thử lỗi biên (Edge cases): Dữ liệu truyền vào bị null/rỗng, ký tự đặc biệt, hoặc số lượng Yards vượt ngưỡng hiển thị thông thường của thẻ Card.
3. Bộ mã nguồn Unit Test tự động viết bằng xUnit (cho Backend) hoặc Jest (cho Frontend) để kiểm tra tính toàn vẹn của logic tính phần trăm (%) hiệu suất các Line.
```

## ## Tiêu chí nghiệm thu (DoD)

Hệ thống Dashboard chỉ được phê duyệt đóng gói và đưa vào sử dụng khi thỏa mãn đầy đủ các điều kiện sau:

- **Độ hoàn thiện UI/UX:** Giao diện Web được dựng thực tế phải trùng khớp tối thiểu 95% về tỷ lệ layout, font chữ, và hệ màu sắc Dark Mode so với ảnh thiết kế `image_c0ea42.png`.
    
- **Tính chính xác của số liệu:** Toàn bộ dữ liệu tính toán tổng hợp (Tổng tồn kho, tổng nhận/xuất, tỷ lệ phần trăm hiệu suất của 8 dòng sản xuất A-H) hiển thị trên màn hình phải khớp hoàn toàn với số liệu truy vấn thực tế dưới database core của nhà máy.
    
- **Hiệu năng truy vấn & Tải trang:** Thời gian phản hồi (Response Time) của các API Controllers không được vượt quá **1.2 giây** cho mỗi lần kích hoạt _Auto Refresh_. Các câu lệnh SQL phải chứng minh được tính SARGable, không xuất hiện tình trạng Index Scan trên các bảng dữ liệu lịch sử lớn.
    
- **Sự ổn định của Tự động làm mới:** Cơ chế đếm ngược thời gian và tự động reload dữ liệu vận hành ngầm ổn định, không làm rò rỉ bộ nhớ trình duyệt (Memory Leak) sau 24 giờ treo màn hình giám sát liên tục tại nhà máy.
    
- **Bảo mật tuyệt đối:** Vượt qua bài kiểm tra an ninh mạng nội bộ, các Endpoint API bắt buộc phải từ chối truy cập đối với các request không đính kèm Token xác thực JWT hợp lệ.