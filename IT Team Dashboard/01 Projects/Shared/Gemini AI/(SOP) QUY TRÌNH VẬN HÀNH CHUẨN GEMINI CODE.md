# QUY TRÌNH VẬN HÀNH CHUẨN (SOP)
## ĐIỀU PHỐI HỆ THỐNG 6 AI GEMS TRONG PHÁT TRIỂN DỰ ÁN PHẦN MỀM

| Mã Tài Liệu | Phiên Bản | Ngày Ban Hành | Bộ Phận Trách Nhiệm | Người Vận Hành |
| :--- | :---: | :---: | :--- | :--- |
| SOP-IT-01-2026 | 1.0 | 06/07/2026 | Ban Quản Lý Dự Án & CNTT | CTO / Lập Trình Viên Chính |

---

## I. MỤC TIÊU & PHẠM VI ÁP DỤNG
* **Mục tiêu:** Chuẩn hóa quy trình phối hợp, điều phối và chuyển giao thông tin giữa 6 cấu hình AI chuyên gia (Gems) nhằm tối ưu hóa hiệu suất, đảm bảo tính toàn vẹn kiến trúc, chất lượng mã nguồn và an ninh hệ thống trong suốt vòng đời dự án.
* **Phạm vi áp dụng:** Áp dụng cho toàn bộ các dự án phát triển phần mềm độc lập, các hệ thống báo cáo, API doanh nghiệp hoặc các mô-đun chức năng cải tiến.

---

## II. ĐỊNH DANH HỆ THỐNG 6 AI GEMS (SƠ ĐỒ NHÂN SỰ)

| STT | Tên GEM Định Danh                       | Vai Trò Chuyên Biệt                | Nhiệm Vụ Cốt Lõi                                                                           |
| :-: | :-------------------------------------- | :--------------------------------- | :----------------------------------------------------------------------------------------- |
|  1  | **QA - Project Manager & Orchestrator** | Quản lý dự án / Điều phối viên     | Lên kế hoạch, băm nhỏ task (Agile/Scrum), soạn gói lệnh chuyển giao (Task Prompts).        |
|  2  | **QA - System Analyst & Architect**     | Chuyên gia phân tích & Thiết kế    | Quy hoạch cơ sở dữ liệu (Database Schema), thiết kế luồng dữ liệu, đặc tả API Restful.     |
|  3  | **QA - Backend Developer**              | Kỹ sư mã nguồn Backend (C#/.NET)   | Viết cấu trúc Entities, DTOs, Controllers; tối ưu hóa hiệu năng và truy vấn SARGable.      |
|  4  | **QA - Frontend Developer**             | Kỹ sư giao diện (React/TypeScript) | Xây dựng UI/UX Reusable Components, kết nối dữ liệu API, quản lý State.                    |
|  5  | **QA - QC/Tester**                      | Kỹ sư đảm bảo chất lượng           | Tìm kịch bản lỗi biên (Edge cases), lập ma trận test, viết Unit Test tự động (xUnit/Jest). |
|  6  | **QA - Security Expert**                | Chuyên gia an ninh hệ thống        | Quét mã nguồn theo tiêu chuẩn OWASP Top 10, cấu hình CORS, JWT/Identity, duyệt deploy.     |

---

## III. QUY HOẠCH CẤU TRÚC LƯU TRỮ VÀ TÀI LIỆU KỸ THUẬT

Để tối ưu hóa cửa sổ ngữ cảnh (Context Window) của các GEM, toàn bộ tài liệu đặc tả dự án phải được tổ chức thành các tệp tin Markdown (`.md`) độc lập theo cấu trúc cây thư mục dưới đây trên môi trường lưu trữ tập trung:


📁 [Ten_Du_An]_Blueprint/
│
├── 📁 01_Requirements/                # Tài liệu yêu cầu nghiệp vụ
│   ├── 📄 01_PRD_Tong_The.md          # Đặc tả yêu cầu sản phẩm (Product Requirements)
│   └── 📄 02_User_Stories.md          # Kịch bản nghiệp vụ người dùng
│
├── 📁 02_System_Architecture/         # Khung xương kỹ thuật hệ thống
│   ├── 📄 01_Tech_Stack.md            # Danh mục công nghệ lựa chọn áp dụng
│   └── 📄 02_System_Flow.md           # Sơ đồ luồng đi của dữ liệu (Data Flow)
│
├── 📁 03_Database_Design/             # Thiết kế tầng dữ liệu
│   ├── 📄 01_ERD_Conceptual.md        # Mô tả mối quan hệ thực thể
│   └── 📄 02_Table_Schemas.md         # Chi tiết cấu trúc các bảng (Script CREATE TABLE)
│
├── 📁 04_API_Specifications/          # Cầu nối kỹ thuật hệ thống
│   ├── 📄 01_Auth_API.md              # Đặc tả API Xác thực và Phân quyền
│   ├── 📄 02_Module_A_API.md          # Chi tiết các Endpoints của phân hệ A
│   └── 📄 03_Module_B_API.md          # Chi tiết các Endpoints của phân hệ B
│
└── 📁 05_UI_UX_Wireframes/           # Cấu trúc tầng giao diện
    └── 📄 01_Screen_Layouts.md        # Mô tả luồng màn hình và cấu trúc Component

## IV. QUY TRÌNH VẬN HÀNH 6 BƯỚC (DÒNG CÔNG VIỆC CHUYỂN GIAO)

### Bước 1: Khởi tạo Yêu cầu & Lên Khung Tổng Thể

- **Bắt đầu:** Người vận hành cung cấp ý tưởng thô cho GEM **`QA - Project Manager & Orchestrator`**.
    
- **Nhiệm vụ AI:** Xác định chỉ số KPI cốt lõi, phạm vi sản phẩm và lộ trình triển khai tổng quan.
    
- **Đầu ra (Output):** Tài liệu `01_PRD_Tong_The.md`.
    

### Bước 2: Thiết kế Kiến trúc Hệ thống & Cơ sở Dữ liệu

- **Thực hiện:** Sao chép nội dung `01_PRD_Tong_The.md` cung cấp cho GEM **`QA - System Analyst & Architect`**.
    
- **Nhiệm vụ AI:** Sinh cấu trúc bảng Database chuẩn hóa (3NF), chiến lược đánh Index và danh sách cấu trúc các API Restful.
    
- **Đầu ra (Output):** Tài liệu `02_Table_Schemas.md` và `04_API_Specifications/`.
    

### Bước 3: Phân rã Backlog & Soạn Lệnh Giao Việc

- **Thực hiện:** Cung cấp ngược lại toàn bộ tài liệu thiết kế tại Bước 2 cho GEM **`QA - Project Manager & Orchestrator`**.
    
- **Nhiệm vụ AI:** Phân nhỏ các tính năng thành danh sách công việc (Backlog Task) và soạn sẵn các gói câu lệnh (Task Prompts) chi tiết cho tầng phát triển lập trình.
    
- **Đầu ra (Output):** Bảng tiến độ kèm mã Prompt lập trình được may đo sẵn cho Backend và Frontend.
    

### Bước 4: Phát triển Lập trình Song song (Development)

Người vận hành mở hai phiên làm việc độc lập và dán các gói lệnh tương ứng từ Bước 3 vào:

1. **GEM `QA - Backend Developer`:** Tiếp nhận cấu trúc DB và API Specs $\rightarrow$ Sinh mã nguồn C#/.NET 8 (Entities, DTOs, API Controllers) đảm bảo tính SARGable.
    
2. **GEM `QA - Frontend Developer`:** Tiếp nhận API Specs và giao diện mẫu $\rightarrow$ Sinh mã nguồn React/TypeScript Components hoàn chỉnh.
    

- **Đầu ra (Output):** Mã nguồn Backend và Giao diện Frontend độc lập của tính năng.
    

### Bước 5: Kiểm thử Tự động & Rà soát Lỗi Logic

- **Thực hiện:** Thu thập toàn bộ mã nguồn tại Bước 4 chuyển giao cho GEM **`QA - QC/Tester`**.
    
- **Nhiệm vụ AI:** Phân tích mã nguồn, thiết lập ma trận kịch bản lỗi biên (Edge Cases), viết bộ Unit Test tự động (xUnit/Jest) để tối ưu độ bao phủ mã nguồn (Code Coverage).
    
- **Đầu ra (Output):** Báo cáo kiểm thử. _Nếu phát hiện lỗi, người vận hành chuyển thông tin lỗi cho GEM Dev xử lý lại trước khi chuyển sang Bước 6._
    

### Bước 6: Kiểm tra An ninh & Cấp phép Phát hành (Deploy)

- **Thực hiện:** Chuyển giao mã nguồn đã vượt qua vòng kiểm thử sạch cho GEM **`QA - Security Expert`**.
    
- **Nhiệm vụ AI:** Kiểm tra mã nguồn dựa trên các tiêu chuẩn bảo mật (OWASP Top 10), phát hiện nguy cơ lỗ hổng (SQL Injection, XSS, BOLA), cấu hình CORS và cơ chế JWT an toàn.
    
- **Đầu ra (Output):** Chứng nhận mã nguồn an toàn kèm cấu hình bảo mật hệ thống. Hoàn thành chu kỳ Sprint.
    

## V. CÁC NGUYÊN TẮC VÀNG TRONG VẬN HÀNH (GHI CHÚ QUAN TRỌNG)

> ⚠️ **1. Cách ly Ngữ cảnh Tuyệt đối (Context Isolation)**
> 
> Không đảo lộn hoặc pha trộn vai trò của các GEM. Không yêu cầu sửa code Frontend trong GEM Backend và ngược lại. Việc hỏi sai GEM sẽ làm phá vỡ cấu trúc tư duy định sẵn của AI, dẫn đến dữ liệu đầu ra bị loãng và sai lệch tiêu chuẩn.

> ⚠️ **2. Cơ chế Giao tiếp Gián tiếp (No Direct DB Plugins)**
> 
> Tuyệt đối không cài đặt plugin kết nối trực tiếp các GEM vào Database Production đang vận hành. Toàn bộ quá trình đọc-hiểu dữ liệu phải thực hiện gián tiếp thông qua file cấu trúc Schema (Script SQL) hoặc qua cấu trúc trung gian DTOs (Data Transfer Objects) để bảo mật tài nguyên nhà máy/doanh nghiệp.

> ⚠️ **3. Vai trò Điều phối viên của Con người (Human-in-the-loop)**
> 
> Các GEM không thể tự động nhắn tin cho nhau. Người vận hành đóng vai trò là "Trọng tài dữ liệu" kiêm "Giao liên". Khi GEM QC phát hiện lỗi, người vận hành phải chủ động copy log lỗi gửi về cho GEM Dev tương ứng để yêu cầu khắc phục, không để các GEM tự xử lý chéo ngữ cảnh.