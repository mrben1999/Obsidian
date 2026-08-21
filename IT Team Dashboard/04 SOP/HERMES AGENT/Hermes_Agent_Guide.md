---
type: SOP
area:
owner: Tô Nguyễn Hải Đăng
version: 1
last_reviewed: 2026-07-12
tags:
  - sop
---

# 📋 SOP —  TÀI LIỆU HƯỚNG DẪN: HERMES AGENT & GEMINI API ON WINDOWS 11

## Mục đích
>Tài liệu hướng dẫn tích hợp Tác tử tự trị Hermes Agent với Gemini API miễn phí để phát triển Fullstack .NET.*

## Các bước thực hiện

## 🔑 BƯỚC 0: KHỞI TẠO GOOGLE GEMINI API KEY
1. Truy cập vào **Google AI Studio** (`aistudio.google.com`).
2. Đăng nhập bằng tài khoản Google cá nhân.
3. Chọn **"Get API key"** (ở góc trên bên trái).
4. Chọn **"Create API key"** > Sao chép (Copy) chuỗi mã định danh được cấp.
*Lưu ý: Giữ bí mật mã này, không chia sẻ lên GitHub công khai.*

---

## 📦 CÁCH 1: CÀI ĐẶT BẢN DESKTOP APP (GIAO DIỆN ĐỒ HỌA)
*Dành cho nhu cầu sử dụng trực quan, quản lý file bằng chuột và giao diện ứng dụng cửa sổ.*

1. **Tải bộ cài đặt:** 
   Truy cập `github.com/NousResearch/hermes-agent/releases` và tải file dạng `.exe` hoặc `.msi` mới nhất cho Windows.
2. **Cài đặt phần mềm:** 
   Click đúp vào file vừa tải, bấm `Next` để hệ thống tự động thiết lập môi trường.
3. **Cấu hình API:**
   * Mở ứng dụng **Hermes Desktop**.
   * Tại mục **Model Provider**, chọn **Google / Gemini**.
   * Dán **API Key** đã lấy ở Bước 0 vào ô trống.
   * Chọn dòng mô hình: `gemini-1.5-flash` để tối ưu tốc độ và token.

---

## 💻 CÁCH 2: CÀI ĐẶT BẢN CLI (DÒNG LỆNH - KHUYÊN DÙNG CHO CODE .NET)
*Dành cho lập trình viên fullstack cần Tác tử tương tác trực tiếp với hệ thống tệp và công cụ dòng lệnh.*

### 🛠️ Bước 2.1: Kiểm tra môi trường .NET
Mở **PowerShell**, chạy lệnh để đảm bảo máy tính đã cài .NET SDK:
```powershell
dotnet --version
````

### ⚡ Bước 2.2: Chạy lệnh cài đặt tự động Hermes

1. Bấm phím `Windows`, gõ **PowerShell**, chuột phải chọn **Run as Administrator** (Chạy với quyền Admin).
    
2. Chạy lệnh native dành cho Windows từ Nous Research:
    
    PowerShell
    
    ```
    iex (irm [https://hermes-agent.nousresearch.com/install.ps1](https://hermes-agent.nousresearch.com/install.ps1))
    ```
    
3. Sau khi chạy xong, **TẮT** cửa sổ PowerShell đó đi và **MỞ LẠI** cửa sổ mới để hệ thống cập nhật biến môi trường.
    

### ⚙️ Bước 2.3: Cấu hình kết nối Gemini

1. Tại cửa sổ PowerShell mới, gõ lệnh:
    
    PowerShell
    
    ```
    hermes setup
    ```
    
2. Sử dụng các phím mũi tên trên bàn phím, di chuyển và chọn nhà cung cấp mô hình là **Gemini** (hoặc **Google**).
    
3. Dán chuỗi **API Key** (Bước 0) vào và nhấn `Enter`.
    

### 🩺 Bước 2.4: Kiểm tra sức khỏe hệ thống

Gõ lệnh sau để đảm bảo không có lỗi dependency nào xảy ra:

PowerShell

```
hermes doctor
```

### 🚀 Bước 2.5: Triệu hồi Agent và Kích hoạt Công cụ

1. Gõ lệnh để bắt đầu trò chuyện với Agent trong terminal:
    
    PowerShell
    
    ```
    hermes
    ```
    
2. Để kích hoạt toàn bộ sức mạnh quản lý file và chạy lệnh code .NET, gõ:
    
    PowerShell
    
    ```
    hermes tools
    ```
    
    _Tích hoạt các công cụ cốt lõi: `file`, `terminal`, `web`, `skills`, `memory`._
    

````

---

### FILE 2: DANH SÁCH KIỂM TRA TIẾN ĐỘ (Hermes_Checklist.md)

```markdown
# 🗂️ CHECKLIST: TIẾN TRÌNH TRIỂN KHAI HERMES AGENT

> **Trạng thái Máy trạm (HP Z440):** 32GB RAM, CPU Xeon E5 v4, GPU GTX 1060 6GB.
> **Giải pháp lựa chọn:** Chạy framework cục bộ (Local Agent) kết hợp Trí tuệ đám mây (Gemini Cloud API).

---

## 🟥 GIAI ĐOẠN 1: CHUẨN BỊ TÀI NGUYÊN
- [ ] **1.1** Đăng nhập vào Google AI Studio thành công.
- [ ] **1.2** Khởi tạo thành công Gemini API Key miễn phí.
- [ ] **1.3** Lưu API Key vào một file text bảo mật trên máy tính.
- [ ] **1.4** Kiểm tra phiên bản .NET SDK trên máy (`dotnet --version`) để sẵn sàng code Fullstack.

## 🟨 GIAI ĐOẠN 2: CÀI ĐẶT HỆ THỐNG (Chọn 1 trong 2 cách)

### Lựa chọn A: Bản Desktop App (Giao diện)
- [ ] **2.A.1** Tải file cài đặt `.exe`/`.msi` từ GitHub Release.
- [ ] **2.A.2** Cài đặt thành công ứng dụng vào Windows 11.
- [ ] **2.A.3** Nhập API Key Gemini và chọn mô hình `gemini-1.5-flash`.

### Lựa chọn B: Bản CLI Terminal (Dòng lệnh - Khuyên dùng)
- [ ] **2.B.1** Mở PowerShell bằng quyền Administrator.
- [ ] **2.B.2** Chạy lệnh cài đặt tự động bằng script `install.ps1`.
- [ ] **2.B.3** Khởi động lại PowerShell sau khi cài đặt xong để cập nhật PATH.
- [ ] **2.B.4** Chạy lệnh `hermes setup` và cấu hình thành công nhà cung cấp Gemini.

## 🟩 GIAI ĐOẠN 3: KIỂM TRA & VẬN HÀNH KHỞI ĐẦU
- [ ] **3.1** Chạy lệnh `hermes doctor` và đạt trạng thái "All Green" (Không có lỗi).
- [ ] **3.2** Khởi động Agent bằng lệnh `hermes` thành công.
- [ ] **3.3** Gõ câu lệnh chào hỏi đầu tiên để test phản hồi của Agent.
- [ ] **3.4** Chạy lệnh `hermes tools` để bật quyền truy cập `file` và `terminal` cho Agent.

## 🚀 GIAI ĐOẠN 4: THỬ NGHIỆM PROJECT FULLSTACK .NET
- [ ] **4.1** Ra lệnh cho Hermes Agent tạo thử 1 dự án Web API (`dotnet new webapi`).
- [ ] **4.2** Thử nghiệm tính năng sửa lỗi tự động: Bắt Agent chạy `dotnet build`.
- [ ] **4.3** Sử dụng lệnh `/learn` để dạy cho Agent một quy chuẩn viết code C# của riêng bạn.
````

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
