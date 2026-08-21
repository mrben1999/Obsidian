# 📋 STANDARD OPERATING PROCEDURE (SOP)
## Cấu Hình, Vận Hành Và Khai Thác Hermes Agent & Gemini API Trên Windows 11

---

### 1. TỔNG QUAN HỆ THỐNG & KIẾN TRÚC THÀNH PHẦN

SOP này thiết lập quy trình chuẩn hóa nhằm vận hành, bảo trì và khai thác **Hermes Agent** — một tác tử trí tuệ nhân tạo nguồn mở tiên tiến phát triển bởi *Nous Research*, kết hợp cùng mô hình ngôn ngữ lớn **Google Gemini API (Gemini 2.5/1.5 Flash)** chạy trong môi trường cục bộ (Local Backend) trên nền tảng **Windows 11 Pro** (Máy trạm HP Z440 Workstation).

#### 1.1 Khái Niệm Cốt Lõi
*   **Hermes Agent:** Là một AI Agent dạng điều khiển vòng lặp (ReAct/Agentic Loop), có khả năng tự lập kế hoạch, sử dụng các công cụ hệ thống (Terminal, File System, Browser, Máy tính) độc lập để hoàn thành các mục tiêu phức tạp thay vì chỉ chat phản hồi đơn thuần.
*   **Gemini API:** Đóng vai trò là "bộ não" xử lý ngôn ngữ tự nhiên, lập luận logic và sinh mã nguồn. Cấu hình sử dụng Key miễn phí thông qua cổng Google AI Studio nhằm tối ưu chi phí vận hành.

#### 1.2 Mô Hình Luồng Hoạt Động (Architecture Flow)
```
[User Interface (CLI)] 
        │
        ▼
[Hermes Agent Runtime Engine (Python/uv)] ◄───► [Context Engine (Quét Codebase)]
        │
        ├───► [Google Gemini API (Lập luận & Sinh kế hoạch)]
        │
        └───► [Local OS Tools Executions]
                   ├── Terminal (PowerShell / Git Bash) -> Thực thi lệnh .NET
                   ├── File Operations -> Đọc/Ghi/Sửa mã nguồn trực tiếp
                   └── Browser Automation -> Cào dữ liệu & Tra cứu tài liệu
```

---

### 2. QUY TRÌNH SETUP & THÔNG SỐ CẤU HÌNH TIÊU CHUẨN

#### 2.1 Yêu Cầu Môi Trường Cục Bộ (Prerequisites)
Hệ thống yêu cầu các thành phần nền tảng được cấu hình và nhận diện chính xác qua trình quản lý gói độc lập `uv`:
*   **Package Manager:** Managed `uv` (Phiên bản v0.11.28 trở lên).
*   **Môi trường dịch:** Python v3.11.15.
*   **Quản lý mã nguồn:** Git v2.55.0 (Windows).
*   **Đường dẫn thực thi Bash:** `C:\Program Files\Git\bin\bash.exe` (được gán qua biến `HERMES_GIT_BASH_PATH`).
*   **Tự động hóa Web:** Node.js v25.2.1 (Phục vụ lõi Browser Automation Playwright/Puppeteer).
*   **Hỗ trợ tìm kiếm & Đa phương tiện:** Ripgrep v15.1.0 (Tìm file siêu tốc) và Ffmpeg (Xử lý âm thanh/TTS).

#### 2.2 Các Tham Số Thiết Lập Dự Án (Wizard Configurations)
Khi chạy lệnh khởi tạo `hermes setup`, các tùy chọn sau bắt buộc phải tuân thủ để chạy chế độ cục bộ không phụ thuộc tài khoản trả phí Nous Portal:

| Thành phần | Tùy chọn cấu hình tiêu chuẩn | Bản chất vận hành |
| :--- | :--- | :--- |
| **Setup Mode** | `2. Full setup` | Cho phép tự cấu hình thủ công từng nhà cung cấp và dán API Key cá nhân. |
| **API Provider** | `Google AI Studio` | Sử dụng cổng kết nối chính thức của Google để gọi các dòng model Gemini. |
| **Base URL** | `https://generativelanguage.googleapis.com/v1beta` | Đường dẫn API Endpoint mặc định của Google AI Studio Beta. |
| **Terminal Backend** | `1. Local` | Cho phép tác tử tương tác trực tiếp lên OS, thực thi lệnh `dotnet` trên máy trạm vật lý. |
| **Platforms Connect** | `Skip (Nhấn Enter trống)` | Bỏ qua các cổng Chatbot (Slack, Discord, Telegram...) để tập trung vào CLI phát triển ứng dụng. |

#### 2.3 Quản Lý Bộ Công Cụ (Core Tools Mapping)
Tác tử được phân quyền kích hoạt chuỗi công cụ hệ thống tối nghiêm ngặt bao gồm:
1.  `Terminal & Processes` (Lệnh: `terminal`, `process`): Thực thi mã lệnh PowerShell hệ thống.
2.  `File Operations` (Lệnh: `read_file`, `write_file`, `patch`, `search_files`): Thao tác trực tiếp trên cấu trúc thư mục dự án.
3.  `Context Engine` (Mục 15 - Đã bật): Quét, phân tích cấu trúc mã nguồn toàn bộ mã nguồn (.NET/C#).
4.  `Web Search & Scraping`: Tìm kiếm thông tin qua thư viện DuckDuckGo miễn phí tích hợp sẵn (`ddgs`), không tốn tài nguyên premium.
5.  `Browser Automation`: Tự động hóa trình duyệt ở chế độ ẩn danh (Headless Chromium cục bộ) để phân tích lỗi web.
6.  `Computer Use`: Cho phép tương tác sâu các hành vi click/type nền thông qua `cua-driver` đã đăng ký mức quyền cao nhất (`RunLevel=Highest`).

---

### 3. QUY TRÌNH VẬN HÀNH & DI CHUYỂN KHÔNG GIAN LÀM VIỆC (WORKSPACE CONTROL)

Mặc định khi khởi động bằng lệnh `hermes`, Agent sẽ đứng ở thư mục người dùng (`C:\Users\DangTo`). Để chuyển đổi vùng không gian làm việc an toàn sang các ổ đĩa lưu trữ dự án (như ổ **D:\**), nhân viên vận hành cần tuân thủ cấu trúc ra lệnh tự nhiên.

#### 3.1 Quy trình chuyển đổi Workspace lên ổ đĩa D
Thay vì gõ các lệnh CMD rời rạc, hãy cung cấp ngữ cảnh rõ ràng cho Agent trong khung Prompt chat:

*   **Prompt mẫu khởi tạo không gian:**
    > *"Hãy chuyển phân vùng làm việc sang ổ đĩa `D:\` và tạo một thư mục quản lý tập trung tên là `DotNetProjects`. Tiến hành khởi tạo một dự án ASP.NET Core Web API mới tại đó bằng .NET SDK mới nhất."*

*   **Kết quả xử lý chuẩn hóa của Agent:**
    *   Tự điều hướng phân vùng ổ đĩa (`D:`).
    *   Tự thiết lập cây thư mục (`mkdir DotNetProjects` -> `cd DotNetProjects`).
    *   Khởi chạy tiến trình tạo khung xương dự án (`dotnet new webapi`).
    *   Thực hiện biên dịch kiểm thử (`dotnet build`) để bàn giao trạng thái dự án sạch.

#### 3.2 Cấu trúc tệp tin dự án tiêu chuẩn được tạo lập
Khi Agent khởi tạo hoàn tất dự án .NET Fullstack, cấu trúc tối thiểu trong Workspace bao gồm:
*   `[TênDựÁn].csproj`: Tệp định nghĩa các gói Nuget phụ thuộc và phiên bản Target Framework (.NET 9.0).
*   `Program.cs`: Điểm khởi chạy ứng dụng, cấu hình Middleware và định tuyến Endpoint.
*   `appsettings.json` / `appsettings.Development.json`: Tệp lưu trữ cấu hình môi trường, chuỗi kết nối Database.
*   `Properties/launchSettings.json`: Chỉ định cổng Port thực thi HTTP/HTTPS khi debug.

---

### 4. QUY TRÌNH CHO AI LẬP TRÌNH "HỌC" VÀ PHÂN TÍCH CODEBASE CÓ SẴN (CONTEXT ENGINE ACQUISITION)

Để Hermes Agent hiểu sâu, đúng và viết code chuẩn chỉnh theo các Pattern cấu trúc dự án sẵn có của doanh nghiệp hoặc các dự án cũ, quy trình nạp Context bắt buộc phải được thực hiện theo các bước sau:

#### 4.1 Lệnh Nạp Mã Nguồn Toàn Diện (Full Repository Indexing)
Sử dụng công cụ `Context Engine` bằng cách cung cấp đường dẫn tuyệt đối cho Agent:

*   **Prompt mẫu:**
    > *"Hãy kích hoạt Context Engine để quét toàn bộ mã nguồn cấu trúc dự án có sẵn của tôi tại đường dẫn `D:\DotNetProjects\TenDuAnCu`. Hãy phân tích kỹ các tầng Kiến trúc (như Controller, Service, Repository, DTO), các mẫu thiết kế (Design Pattern) đang dùng và tóm tắt lại tổng quan công nghệ."*

#### 4.2 Các Tiêu Chí AI Tự Động Phân Tích (Học Code)
1.  **Phân tích Dependency:** Đọc file `.csproj` để xác định ORM (Entity Framework Core, Dapper), cơ sở dữ liệu kết nối (SQL Server, PostgreSQL) và các thư viện bên thứ ba.
2.  **Nhận diện Base Class:** Tìm kiếm các lớp cơ sở như `BaseController`, `BaseService` hoặc cấu trúc kết quả trả về chung (`ApiResponse<T>`) để bắt chước định dạng khi viết code mới.
3.  **Luồng Bất Đồng Bộ:** Kiểm tra cách thức triển khai `async / await` trong các tầng xử lý dữ liệu nhằm đảm bảo tính đồng nhất, tránh nghẽn luồng (Thread Pool Starvation).

#### 4.3 Khai Thác Sau Khi Học
Sau khi Agent báo cáo trạng thái `Context Loaded Successfully`, nhân viên lập trình có thể ra lệnh tối ưu:
*   **Thêm tính năng mới chuẩn Pattern:** *"Hãy tạo một Controller mới tên là ProductController, viết các API CRUD đầy đủ. Đảm bảo kế thừa từ BaseController và tiêm (Inject) ProductService thông qua Dependency Injection đúng cấu trúc dự án hiện tại."*
*   **Rà soát lỗi (Code Review):** *"Dựa trên toàn bộ mã nguồn vừa quét, hãy tìm các đoạn mã xử lý logic chưa tối ưu hoặc thiếu khối try-catch xử lý ngoại lệ ở tầng Service."*

---

### 5. CÁC CÂU LỆNH HỆ THỐNG (SYSTEM CLI COMMANDS) KHẨN CẤP

Khi đang trong phiên làm việc trực tiếp (`interactive session`) với Hermes Agent, người dùng có thể điều khiển trình quản lý bằng các cú pháp có dấu gạch chéo `/`:

*   `/help` : Hiển thị bảng cứu trợ, hướng dẫn toàn bộ các nhóm công cụ hệ thống.
*   `/exit` hoặc `/quit` : Đóng an toàn phiên làm việc của Hermes Agent, lưu lại bộ nhớ đệm (Memory) và giải phóng Terminal quay về PowerShell gốc của Windows.
*   `/clear` : Xóa sạch màn hình làm việc để giải phóng bộ nhớ hiển thị đồ họa CLI mà không làm mất ngữ cảnh cuộc hội thoại.
*   `/tools` : Kiểm tra nhanh danh sách các tool đang kích hoạt, trạng thái kết nối phần cứng thông qua driver điều khiển.
*   `/resume` : Khôi phục lại phiên làm việc dang dở trước đó dựa trên ID Session được lưu trữ trong thư mục AppData cục bộ.

---
**Tài liệu này được biên soạn chuẩn cấu trúc Markdown, tối ưu hóa hiển thị cho Obsidian Vault để liên kết đồ thị tri thức (Knowledge Graph) và tra cứu nhanh phục vụ lập trình Fullstack .NET.**
