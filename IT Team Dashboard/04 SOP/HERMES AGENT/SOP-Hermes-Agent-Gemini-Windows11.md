# SOP — Cấu Hình, Vận Hành Và Khai Thác Hermes Agent & Gemini API Trên Windows 11

> **Nguồn tham chiếu:** Tài liệu chính thức Hermes Agent (Nous Research) —
> `hermes-agent.nousresearch.com/docs`, mục *Getting Started → Learning Path*,
> *Installation*, *Quickstart*, *Windows (Native) Guide*, *AI Providers*, và
> *Guides → Google Gemini*.
> **Phạm vi áp dụng:** Cài đặt native trên Windows 10/11 (không dùng WSL2, không Docker).
> **Phiên bản tài liệu:** 1.0 — Cập nhật theo tài liệu Hermes Agent tại thời điểm biên soạn (07/2026).

---

## Mục Lục

1. [Tổng Quan Hệ Thống](#1-tổng-quan-hệ-thống)
2. [Chuẩn Bị Trước Khi Cài Đặt](#2-chuẩn-bị-trước-khi-cài-đặt)
3. [SOP-01: Cài Đặt Hermes Agent Trên Windows 11](#sop-01-cài-đặt-hermes-agent-trên-windows-11)
4. [SOP-02: Lấy Và Cấu Hình Gemini API Key](#sop-02-lấy-và-cấu-hình-gemini-api-key)
5. [SOP-03: Kết Nối Hermes Agent Với Gemini API](#sop-03-kết-nối-hermes-agent-với-gemini-api)
6. [SOP-04: Kiểm Tra Vận Hành (Verification)](#sop-04-kiểm-tra-vận-hành-verification)
7. [SOP-05: Vận Hành Hằng Ngày (CLI/TUI)](#sop-05-vận-hành-hằng-ngày-clitui)
8. [SOP-06: Khai Thác Nâng Cao](#sop-06-khai-thác-nâng-cao)
9. [SOP-07: Chạy Gateway (Bot Nhắn Tin) Tự Động Khi Đăng Nhập Windows](#sop-07-chạy-gateway-bot-nhắn-tin-tự-động-khi-đăng-nhập-windows)
10. [SOP-08: Cập Nhật & Gỡ Cài Đặt](#sop-08-cập-nhật--gỡ-cài-đặt)
11. [Xử Lý Sự Cố (Troubleshooting)](#11-xử-lý-sự-cố-troubleshooting)
12. [Phụ Lục: Bảng Lệnh Tham Chiếu Nhanh](#12-phụ-lục-bảng-lệnh-tham-chiếu-nhanh)

---

## 1. Tổng Quan Hệ Thống

**Hermes Agent** là một agent AI dạng CLI/TUI (có thể mở rộng thành bot Telegram/Discord/Slack…) do Nous Research phát triển, hỗ trợ nhiều nhà cung cấp mô hình (provider) khác nhau — trong đó có **Google Gemini** thông qua Google AI Studio API.

Trên Windows, Hermes chạy **native** (không bắt buộc WSL2, không Cygwin, không Docker) nhờ:
- Trình cài đặt PowerShell tự động tải Python (qua `uv`), Node.js 22, PortableGit.
- Lớp giả lập terminal Unix thông qua **Git Bash** (`bash.exe`) để chạy công cụ terminal của agent.
- Lớp xử lý UTF-8 console riêng cho Windows để tránh lỗi font/encoding.

Sơ đồ thành phần:

```
┌───────────────────────────────────────────────────────────┐
│                     Windows 11 (Native)                     │
│                                                               │
│  %LOCALAPPDATA%\hermes\                                      │
│   ├── hermes-agent\   (mã nguồn + venv)                       │
│   ├── git\            (PortableGit — cung cấp bash.exe)       │
│   ├── node\           (Node.js 22 — công cụ trình duyệt)      │
│   ├── bin\            (uv.exe — quản lý Python)                │
│   ├── config.yaml     (cấu hình KHÔNG bí mật)                  │
│   ├── .env            (API key, token — BÍ MẬT)                │
│   ├── skills\ sessions\ logs\ auth.json                        │
│                                                               │
│  hermes.exe (venv\Scripts) ──► gọi API ──► Google Gemini API   │
│                                    (generativelanguage         │
│                                     .googleapis.com/v1beta)     │
└───────────────────────────────────────────────────────────┘
```

---

## 2. Chuẩn Bị Trước Khi Cài Đặt

| Hạng mục | Yêu cầu |
|---|---|
| Hệ điều hành | Windows 10 hoặc Windows 11 (khuyến nghị Windows 11 22H2+ để có Windows Terminal mặc định) |
| Quyền quản trị | **Không bắt buộc** — cài đặt vào `%LOCALAPPDATA%`, không cần admin |
| Kết nối mạng | Cần truy cập Internet để tải Python/Node/Git và gọi API Gemini |
| Tài khoản Google | Cần tài khoản Google để tạo Gemini API key tại Google AI Studio |
| Thẻ thanh toán (khuyến nghị) | Gemini free-tier quota rất thấp, không đủ cho phiên làm việc agent dài — nên bật billing trên Google Cloud project gắn với API key |
| Terminal | Windows Terminal (cài sẵn trên Windows 11) hoặc PowerShell |

---

## SOP-01: Cài Đặt Hermes Agent Trên Windows 11

### Bước 1.1 — Mở PowerShell

Mở **Windows Terminal** hoặc **PowerShell** (không cần chạy với quyền Administrator).

### Bước 1.2 — Chạy lệnh cài đặt một dòng

```powershell
iex (irm https://raw.githubusercontent.com/NousResearch/hermes-agent/main/scripts/install.ps1)
```

Cách khác: dùng bộ cài đặt cách 1 (từ trang chủ):
 ```powershell
 iex (irm https://hermes-agent.nousresearch.com/install.ps1)
 ```

**Trình cài đặt sẽ tự động thực hiện theo thứ tự:**

1. Cài `uv` (trình quản lý Python nhanh) vào `%USERPROFILE%\.local\bin`.
2. Cài Python 3.11 qua `uv`.
3. Cài Node.js 22 (qua winget hoặc bản portable) vào `%LOCALAPPDATA%\hermes\node`.
4. Cài **PortableGit** (nếu máy chưa có Git) vào `%LOCALAPPDATA%\hermes\git` — cung cấp `bash.exe`.
5. Clone mã nguồn vào `%LOCALAPPDATA%\hermes\hermes-agent` và tạo virtualenv.
6. Cài các gói phụ thuộc Python (`.[all]`, có cơ chế fallback nếu lỗi mạng).
7. Thiết lập biến môi trường `HERMES_GIT_BASH_PATH`.
8. Thêm `%LOCALAPPDATA%\hermes\hermes-agent\venv\Scripts` vào **User PATH** và đặt `HERMES_HOME=%LOCALAPPDATA%\hermes`.
9. Chạy `hermes setup` — wizard cấu hình lần đầu (model, provider, toolsets).

**Tham số tùy chọn** (dùng dạng scriptblock nếu cần truyền tham số):
 ```powershell
 & ([scriptblock]::Create((irm https://raw.githubusercontent.com/NousResearch/hermes-agent/main/scripts/install.ps1))) -NoVenv -SkipSetup -Branch main
 ```

| Tham số       | Mặc định                             | Công dụng                                |
| ------------- | ------------------------------------ | ---------------------------------------- |
| `-Branch`     | `main`                               | Clone theo nhánh cụ thể                  |
| `-Commit`     | (không)                              | Ghim theo commit SHA                     |
| `-Tag`        | (không)                              | Ghim theo tag                            |
| `-NoVenv`     | off                                  | Bỏ qua tạo venv                          |
| `-SkipSetup`  | off                                  | Bỏ qua wizard `hermes setup` sau cài đặt |
| `-HermesHome` | `%LOCALAPPDATA%\hermes`              | Đổi thư mục dữ liệu                      |
| `-InstallDir` | `%LOCALAPPDATA%\hermes\hermes-agent` | Đổi thư mục mã nguồn                     |


**Lựa chọn thay thế — Bộ cài đặt Desktop (GUI):**
Nếu muốn cài bằng giao diện đồ họa (không mở PowerShell thủ công), tải **Hermes Desktop installer** tại trang chủ `hermes-agent.nousresearch.com` và chạy file `.exe`. Sau lần chạy đầu, ứng dụng desktop và CLI dùng chung một bộ cài tại `%LOCALAPPDATA%\hermes`.

### Bước 1.3 — Mở lại terminal để nhận PATH mới

Đóng cửa sổ PowerShell hiện tại, **mở một cửa sổ mới**. Terminal cũ không tự nhận biến PATH vừa được thêm.

### Bước 1.4 — Xác minh cài đặt thành công

```powershell
Get-Command hermes
hermes --version
```

Kết quả mong đợi: đường dẫn trỏ tới
`C:\Users\<tên_user>\AppData\Local\hermes\hermes-agent\venv\Scripts\hermes.exe`

---

## SOP-02: Lấy Và Cấu Hình Gemini API Key

### Bước 2.1 — Tạo API key tại Google AI Studio

1. Truy cập: **https://aistudio.google.com/apikey**
2. Đăng nhập bằng tài khoản Google.
3. Tạo API key mới (gắn với một Google Cloud project).
4. **Khuyến nghị bắt buộc:** Bật **billing (thanh toán)** cho Google Cloud project gắn với key này.
   > Lý do: gói miễn phí của Gemini có quota rất thấp — không đủ cho một phiên agent chạy dài vì Hermes có thể gọi model nhiều lần trong một lượt hội thoại (tool-calling, nén ngữ cảnh, tác vụ phụ trợ...).

### Bước 2.2 — Lưu API key vào Hermes

Có 2 cách nhập:

**Cách A — Ghi trực tiếp vào file `.env` (khuyến nghị, thao tác nhanh):**

```powershell
# File: %LOCALAPPDATA%\hermes\.env
notepad "$env:LOCALAPPDATA\hermes\.env"
```

Thêm dòng sau vào file (chọn MỘT trong hai biến, Hermes nhận diện cả hai):

```bash
GOOGLE_API_KEY=your_api_key_here
# hoặc
GEMINI_API_KEY=your_api_key_here
```

**Cách B — Dùng lệnh CLI (ghi vào đúng file tự động):**

```powershell
hermes config set GOOGLE_API_KEY your_api_key_here
```

> ⚠️ **Lưu ý bảo mật:** File `.env` chứa bí mật (API key, token) — **không commit lên Git**, không chia sẻ file này. `config.yaml` chỉ chứa cấu hình không bí mật (tên model, provider, base_url).

---

## SOP-03: Kết Nối Hermes Agent Với Gemini API

### Bước 3.1 — Cấu hình provider qua wizard tương tác (khuyến nghị)

```powershell
hermes model
```

Trong menu tương tác:
```
→ Chọn "More providers..." → "Google AI Studio"
→ Hermes tự kiểm tra tier của API key
→ Hiển thị danh sách model Gemini khả dụng
→ Chọn model (ví dụ: gemini-3-flash-preview)
```

### Bước 3.2 — Hoặc cấu hình thủ công qua `config.yaml`

Mở file cấu hình:

```powershell
notepad "$env:LOCALAPPDATA\hermes\config.yaml"
```

Thêm/sửa đoạn sau:

```yaml
model:
  default: gemini-3-flash-preview
  provider: gemini
  base_url: https://generativelanguage.googleapis.com/v1beta
```

> **Quan trọng — endpoint đúng:** Luôn dùng endpoint **native Gemini API**
> (`https://generativelanguage.googleapis.com/v1beta`), **không dùng** endpoint
> tương thích OpenAI (`.../v1beta/openai/`). Endpoint native cho phép Hermes
> dịch đầy đủ tool-calling, streaming, đa phương thức (multimodal) và
> metadata phản hồi đặc thù của Gemini (bao gồm `thoughtSignature` cho
> Gemini 3 khi gọi tool nhiều bước).

### Bước 3.3 — Danh sách model Gemini phổ biến

| Model | ID cấu hình | Ghi chú |
|---|---|---|
| Gemini 3.1 Pro Preview | `gemini-3.1-pro-preview` | Model preview mạnh nhất khi khả dụng |
| Gemini 3 Pro Preview | `gemini-3-pro-preview` | Suy luận & lập trình mạnh |
| Gemini 3 Flash Preview | `gemini-3-flash-preview` | **Mặc định khuyến nghị** — cân bằng tốc độ/năng lực |
| Gemini 3.1 Flash Lite Preview | `gemini-3.1-flash-lite-preview` | Nhanh nhất / rẻ nhất |
| (Alias tự động cập nhật) | `gemini-pro-latest` / `gemini-flash-latest` | Luôn theo bản Pro/Flash mới nhất của Google |
| Gemma 4 31B IT (đánh giá) | `gemma-4-31b-it` | Chỉ nên dùng để thử nghiệm, quota free-tier rất thấp |

> Model ID phải dùng **định dạng gốc của Gemini** (ví dụ `gemini-3-flash-preview`),
> **không** dùng định dạng kiểu OpenRouter (`google/gemini-3-flash-preview`) khi
> `provider: gemini`.

### Bước 3.4 — (Tùy chọn) Đăng nhập qua OAuth thay vì API key

Hermes có provider phụ `google-gemini-cli` dùng OAuth trình duyệt qua backend Cloud Code Assist (giống Gemini CLI của Google):

```powershell
hermes model
# → Chọn "Google Gemini (OAuth)"
```

> ⚠️ Google có thể coi việc dùng client OAuth của Gemini CLI từ phần mềm bên thứ ba là vi phạm chính sách. **Khuyến nghị dùng provider API key (`gemini`) làm đường an toàn nhất cho môi trường production.**

---

## SOP-04: Kiểm Tra Vận Hành (Verification)

### Bước 4.1 — Chạy chẩn đoán hệ thống

```powershell
hermes doctor
```

`hermes doctor` sẽ kiểm tra:
- Có tồn tại `GOOGLE_API_KEY` hoặc `GEMINI_API_KEY` hay không.
- Credential OAuth (nếu dùng `google-gemini-cli`) có hợp lệ không.
- Provider đang cấu hình có thể xác thực (resolve) được hay không.

### Bước 4.2 — Chạy hội thoại thử đầu tiên

```powershell
hermes            # CLI cổ điển
# hoặc
hermes --tui       # Giao diện TUI hiện đại (khuyến nghị)
```

Gõ một câu lệnh dễ kiểm chứng, ví dụ:

```text
Kiểm tra thư mục hiện tại và cho tôi biết file nào có vẻ là file chính của dự án.
```

**Tiêu chí "đạt":**
- Banner hiển thị đúng model/provider đã chọn (Gemini).
- Hermes phản hồi không lỗi.
- Agent có thể gọi công cụ (tool) khi cần (terminal, đọc file, tìm kiếm web).
- Cuộc hội thoại tiếp tục bình thường qua nhiều lượt.

### Bước 4.3 — Kiểm tra khôi phục phiên (session resume)

```powershell
hermes --continue    # hoặc: hermes -c
```

Phải quay lại đúng phiên vừa thực hiện. Nếu không được, kiểm tra `hermes sessions list` và đảm bảo đang ở đúng profile.

---

## SOP-05: Vận Hành Hằng Ngày (CLI/TUI)

### 5.1 — Các lệnh khởi động cơ bản

```powershell
hermes                                   # Phiên tương tác mặc định
hermes chat -q "Hello"                   # Chế độ một câu hỏi, không tương tác
hermes chat --model "gemini-3-flash-preview"   # Chỉ định model cụ thể
hermes chat --provider gemini            # Ép dùng provider Gemini
hermes chat --toolsets "web,terminal,skills"   # Chỉ định bộ công cụ
hermes -s <skill1>,<skill2>              # Nạp sẵn skill khi khởi động
hermes --continue                        # Tiếp tục phiên gần nhất
hermes --resume <session_id>             # Tiếp tục phiên theo ID
hermes chat --verbose                    # Chế độ debug chi tiết
```

### 5.2 — Chuyển đổi model/provider trong phiên đang chạy

```text
/model gemini-3-flash-preview
/model gemini-flash-latest
/model gemini-3-pro-preview
```

> Lưu ý: `/model` chỉ chuyển đổi giữa các provider/model **đã được cấu hình sẵn**.
> Muốn thêm provider mới (lần đầu), phải thoát phiên (`Ctrl+C` hoặc `/quit`) và chạy `hermes model` từ terminal.

### 5.3 — Slash command thông dụng

| Lệnh                   | Chức năng                                            |
| ---------------------- | ---------------------------------------------------- |
| `/help`                | Xem trợ giúp                                         |
| `/model`               | Xem/đổi model hiện tại                               |
| `/tools`               | Liệt kê công cụ khả dụng                             |
| `/status`              | Xem thông tin phiên (model/token/thời lượng)         |
| `/sessions`            | Mở bộ chọn phiên tương tác                           |
| `/usage`               | Chi tiết chi phí phiên (token vào/ra)                |
| `/compress`            | Nén ngữ cảnh thủ công khi gần đầy                    |
| `/background <prompt>` | Chạy tác vụ nền song song                            |
| `/reasoning high`      | Tăng mức độ suy luận                                 |
| `/title <tên>`         | Đặt tên phiên hiện tại                               |
| `/personality <tên>`   | Đổi phong cách trả lời (pirate, concise, teacher...) |

### 5.4 — Phím tắt quan trọng trên Windows

| Phím | Hành động |
|---|---|
| `Enter` | Gửi tin nhắn |
| `Ctrl+Enter` hoặc `Ctrl+J` | Xuống dòng (khuyến nghị trên **Windows Terminal** — `Alt+Enter` bị Windows Terminal chiếm dụng để toggle fullscreen) |
| `Ctrl+C` | Ngắt tác vụ đang chạy (bấm 2 lần trong 2 giây để thoát hẳn) |
| `Ctrl+G` hoặc `Ctrl+X Ctrl+E` | Mở nội dung ô nhập trong trình soạn thảo ngoài (mặc định: Notepad) |
| `Ctrl+V` | Dán văn bản (tự đính kèm ảnh clipboard nếu có) |
| `Tab` | Chấp nhận gợi ý tự động / autocomplete slash-command |

> `Ctrl+Z` (suspend nền) **không hỗ trợ trên Windows** — chỉ dùng được trên Unix.

### 5.5 — Cấu hình editor ngoài (cho `/edit`, `Ctrl+G`)

Mặc định Windows dùng Notepad. Đổi sang VS Code:

```powershell
$env:EDITOR = "code --wait"
```

Đặt vĩnh viễn trong `$PROFILE` PowerShell, hoặc qua **System Settings → Environment Variables** (User variable).

---

## SOP-06: Khai Thác Nâng Cao

### 6.1 — Auxiliary Model (model phụ trợ) cho tác vụ phụ

Một số tác vụ (phân tích ảnh, tóm tắt web, nén ngữ cảnh) mặc định dùng cùng model chính. Có thể định tuyến sang một model Gemini rẻ/nhanh hơn:

```yaml
# ~/.hermes/config.yaml (Windows: %LOCALAPPDATA%\hermes\config.yaml)
auxiliary:
  compression:
    model: "google/gemini-3-flash-preview"   # để trống = dùng model chính
```

### 6.2 — Fallback Provider (dự phòng khi Gemini lỗi/hết quota)

```yaml
fallback_providers:
  - provider: openrouter
    model: anthropic/claude-sonnet-4
  - provider: gemini
    model: gemini-3-flash-preview
```

> Có thể cấu hình tương tác bằng lệnh: `hermes fallback`

### 6.3 — Skills (gói quy trình có thể tái sử dụng)

```powershell
hermes skills browse                       # Xem tất cả skill khả dụng
hermes skills search kubernetes            # Tìm theo từ khóa
hermes skills install openai/skills/k8s    # Cài đặt (có quét bảo mật)
```

Sử dụng skill đã cài như một slash command:

```text
/k8s deploy the staging manifest
```

### 6.4 — MCP Servers (Model Context Protocol)

```yaml
# Thêm vào %LOCALAPPDATA%\hermes\config.yaml
mcp_servers:
  github:
    command: npx
    args: ["-y", "@modelcontextprotocol/server-github"]
    env:
      GITHUB_PERSONAL_ACCESS_TOKEN: "ghp_xxx"
```

### 6.5 — Chạy công cụ terminal an toàn hơn (sandbox)

```powershell
hermes config set terminal.backend docker    # Cách ly qua Docker
hermes config set terminal.backend ssh       # Chạy trên máy chủ từ xa
```

### 6.6 — Chế độ nén ngữ cảnh (Context Compression)

```yaml
compression:
  enabled: true
  threshold: 0.50    # Nén khi đạt 50% giới hạn ngữ cảnh
```

### 6.7 — Quick Commands (lệnh tắt không gọi LLM)

```yaml
quick_commands:
  status:
    type: exec
    command: systemctl status hermes-agent
  restart:
    type: alias
    target: /gateway restart
```

---

## SOP-07: Chạy Gateway (Bot Nhắn Tin) Tự Động Khi Đăng Nhập Windows

### Bước 7.1 — Cấu hình nền tảng nhắn tin

```powershell
hermes gateway setup
```

Chọn nền tảng (Telegram/Discord/Slack/WhatsApp/...), nhập token bot theo hướng dẫn tương tác. Gateway sẽ sử dụng provider Gemini đã cấu hình ở SOP-03.

### Bước 7.2 — Cài đặt chạy tự động khi đăng nhập (không cần quyền admin)

```powershell
hermes gateway install
```

Cơ chế hoạt động trên Windows:
1. Đăng ký **Scheduled Task** (`schtasks /Create /SC ONLOGON /RL LIMITED /TN HermesGateway`) — chạy khi đăng nhập, quyền chuẩn (không UAC).
2. Nếu chính sách nhóm (Group Policy) chặn schtasks, tự động fallback sang shortcut trong thư mục **Startup**.
3. Tiến trình chạy nền qua `pythonw.exe` (không cửa sổ console) — tránh bị tắt do broadcast `Ctrl+C` từ tiến trình khác.

### Bước 7.3 — Quản lý gateway

```powershell
hermes gateway status      # Xem trạng thái tổng hợp (schtasks + Startup + PID đang chạy)
hermes gateway start       # Khởi động ngay
hermes gateway stop        # Dừng (gửi tín hiệu dừng an toàn)
hermes gateway restart     # Khởi động lại
hermes gateway uninstall   # Gỡ bỏ toàn bộ (schtasks, shortcut, pid file)
```

---

## SOP-08: Cập Nhật & Gỡ Cài Đặt

### 8.1 — Cập nhật Hermes Agent

```powershell
hermes update
```

### 8.2 — Gỡ cài đặt (giữ lại dữ liệu cấu hình)

```powershell
hermes uninstall
```

Thao tác này xóa: Scheduled Task, shortcut Startup, shim `hermes.cmd`, thư mục `%LOCALAPPDATA%\hermes\hermes-agent\`, và dọn PATH. **Giữ nguyên** `config.yaml`, `.env`, `skills\`, `sessions\`, `logs\`.

### 8.3 — Gỡ cài đặt hoàn toàn (xóa cả dữ liệu)

```powershell
hermes uninstall
Remove-Item -Recurse -Force "$env:LOCALAPPDATA\hermes"
```

> ⚠️ **Cảnh báo:** Vì thư mục cài đặt và thư mục dữ liệu **chung gốc** `%LOCALAPPDATA%\hermes`, lệnh `Remove-Item -Recurse` trên toàn bộ thư mục này sẽ xóa luôn API key, session, log. Chỉ thực hiện khi chắc chắn muốn xóa sạch.

---

## 11. Xử Lý Sự Cố (Troubleshooting)

| Triệu chứng | Nguyên nhân khả dĩ | Cách khắc phục |
|---|---|---|
| `hermes: command not found` / `hermes` không nhận diện | PATH chưa được nạp lại | Mở cửa sổ PowerShell **mới**. Kiểm tra `Get-Command hermes` |
| `hermes doctor` báo thiếu `GOOGLE_API_KEY`/`GEMINI_API_KEY` | Chưa thêm key vào `.env` | Thực hiện lại **Bước 2.2**, sau đó chạy lại `hermes model` |
| `"This Google API key is on the free tier"` | Google Cloud project chưa bật billing | Bật billing cho project gắn với API key, tạo lại key nếu cần, chạy `hermes model` |
| `404 model not found` | Model không khả dụng với tài khoản/khu vực | Chạy lại `hermes model`, chọn model khác từ danh sách hiện tại |
| Tool calling lỗi schema với Gemini | Phiên bản Hermes cũ | Chạy `hermes update` rồi `hermes model` lại |
| Đã cấu hình endpoint OpenAI-compatible của Gemini nhầm | `.env` có `GEMINI_BASE_URL=.../v1beta/openai/` | Sửa lại thành `GEMINI_BASE_URL=https://generativelanguage.googleapis.com/v1beta` hoặc xóa dòng override |
| Ký tự tiếng Việt/CJK hiện thành `?` trong CLI | Lớp UTF-8 console chưa kích hoạt | Kiểm tra biến `HERMES_DISABLE_WINDOWS_UTF8` **không** được đặt là `1`; nếu console quá cũ, chuyển sang Windows Terminal |
| `/edit` không có phản hồi | Biến `EDITOR` chưa áp dụng cho shell hiện tại | Đóng/mở lại shell, hoặc đặt `EDITOR` ở cấp User trong System Properties → Environment Variables |
| `WinError 193: %1 is not a valid Win32 application` | Gọi trực tiếp script shebang thay vì shim `.cmd` | Dùng biến thể `.cmd` (ví dụ `npx.cmd`), không gọi đường dẫn cứng |
| Gateway không tự chạy lại sau khi khởi động lại máy | Group Policy chặn `ONLOGON` trigger của schtasks | Kiểm tra `schtasks /Query /TN HermesGateway /V /FO LIST`; hoặc cài lại với `HERMES_GATEWAY_FORCE_STARTUP=1` để dùng Startup folder |
| `agent-browser` báo lỗi phiên bản Node | PATH ưu tiên Node hệ thống cũ hơn Node do Hermes cài | Đưa `%LOCALAPPDATA%\hermes\node` lên trước trong PATH, hoặc gỡ Node hệ thống cũ nếu không dùng cho việc khác |
| Trình duyệt tool timeout | Chromium (Playwright) chưa cài xong lần đầu | Chạy `hermes doctor` để xem lệnh khắc phục cụ thể (`npx playwright install chromium`) |
| Provider auth sai / trả lời rỗng | Chọn sai provider/model hoặc auth hỏng | Chạy `hermes model` lại, xác nhận provider = `gemini` và key đúng |

### Quy trình khôi phục nhanh (Recovery Toolkit)

Khi có bất kỳ hành vi bất thường, thực hiện theo thứ tự:

```powershell
hermes doctor
hermes model
hermes setup
hermes sessions list
hermes --continue
hermes gateway status
```

---

## 12. Phụ Lục: Bảng Lệnh Tham Chiếu Nhanh

| Lệnh | Mô tả |
|---|---|
| `hermes` | Bắt đầu trò chuyện |
| `hermes --tui` | Bắt đầu trò chuyện ở giao diện TUI hiện đại |
| `hermes model` | Wizard chọn/cấu hình provider và model (đầy đủ, kể cả OAuth/API key mới) |
| `/model <tên>` | Chuyển model **trong phiên**, chỉ với provider đã cấu hình sẵn |
| `hermes tools` | Cấu hình bộ công cụ theo từng nền tảng |
| `hermes setup` | Wizard cấu hình toàn bộ (model, tool, gateway) |
| `hermes doctor` | Chẩn đoán lỗi cấu hình/hệ thống |
| `hermes update` | Cập nhật lên phiên bản mới nhất |
| `hermes uninstall` | Gỡ cài đặt (giữ dữ liệu) |
| `hermes gateway setup` | Cấu hình nền tảng nhắn tin (Telegram/Discord/...) |
| `hermes gateway install` | Đăng ký chạy gateway tự động khi đăng nhập Windows |
| `hermes gateway status/start/stop/restart` | Quản lý vòng đời gateway |
| `hermes --continue` / `hermes -c` | Tiếp tục phiên gần nhất |
| `hermes --resume <id>` | Tiếp tục phiên theo ID cụ thể |
| `hermes sessions list` | Liệt kê các phiên đã lưu |
| `hermes config set <key> <value>` | Ghi giá trị cấu hình (tự phân loại vào `.env` hoặc `config.yaml`) |
| `hermes fallback` | Cấu hình chuỗi provider dự phòng |
| `hermes skills browse/search/install` | Quản lý skill |

### Đường dẫn dữ liệu quan trọng trên Windows

| Đường dẫn | Nội dung |
|---|---|
| `%LOCALAPPDATA%\hermes\hermes-agent\` | Mã nguồn + venv (an toàn khi xóa & cài lại) |
| `%LOCALAPPDATA%\hermes\git\` | PortableGit (cung cấp `bash.exe`) |
| `%LOCALAPPDATA%\hermes\node\` | Node.js portable |
| `%LOCALAPPDATA%\hermes\bin\` | `uv.exe` |
| `%LOCALAPPDATA%\hermes\config.yaml` | Cấu hình không bí mật (model, provider, base_url...) |
| `%LOCALAPPDATA%\hermes\.env` | **Bí mật** — API key, token (Gemini, Telegram...) |
| `%LOCALAPPDATA%\hermes\skills\` | Skill đã cài |
| `%LOCALAPPDATA%\hermes\sessions\` | Lịch sử phiên |
| `%LOCALAPPDATA%\hermes\logs\` | Nhật ký hệ thống |

---

*Hết tài liệu SOP. Khi tài liệu gốc của Hermes Agent cập nhật (model mới, endpoint mới, quy trình cài đặt thay đổi), cần rà soát lại các mục 3, 5, 12 để đồng bộ.*
