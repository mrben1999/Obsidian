---
type: sop
area:
owner:
version: 1
last_reviewed: 2026-07-16
tags:
  - sop
---
Để áp dụng trọn vẹn bộ prompt này cho Hermes AI, anh có thể triển khai theo **2 cách tối ưu** dưới đây:

## 🛠️ Cách 1: Tạo "Thư viện Persona" trong dự án (Khuyên dùng)

Vì Hermes AI có công cụ **File Operations** (Đọc/Ghi/Sửa file) và **Context Engine** (Động cơ ngữ cảnh), cách đơn giản và hiệu quả nhất là lưu bộ prompt này thành các file tài liệu ngay trong thư mục dự án để Hermes tự đọc và "hóa thân" vào vai trò đó.

### Bước 1: Khởi tạo thư mục chứa Agent cho Hermes

Anh tạo một thư mục chuyên dụng trong dự án của mình (ví dụ: `.hermes_agents/` hoặc `docs/agents/`).

### Bước 2: Chuyển đổi định dạng file prompt

Thay vì dùng định dạng cấu trúc của Claude Code, anh hãy lưu các file dưới dạng Markdown thuần túy (`.md`) để làm "chỉ dẫn hệ thống" cho Hermes.

_Ví dụ cấu trúc file `docs/agents/backend-dev.md` dành cho Hermes:_

Markdown

```
# PROFILE: BACKEND DEVELOPER AGENT
Nhiệm vụ: Chuyên viết, sửa API, business logic, database schema, và các tác vụ phía server.

## Bối cảnh dự án (CHỈNH THEO STACK DỰ ÁN CỦA ANH)
- Stack: Node.js + Express + PostgreSQL (Prisma ORM).
- Kiến trúc layered: routes/ → controllers/ → services/ → repositories/.

## Quy trình bắt buộc cho Hermes:
1. Sử dụng công cụ "File Operations" để đọc `docs/plan/` và cấu trúc code hiện tại trong `src/` để bám đúng convention.
2. Kiểm tra `package.json` xem các dependency đã có sẵn chưa trước khi cài mới.
3. Viết code tách rõ layer và validate input đầy đủ.
4. Tự chạy lệnh test hoặc lint qua công cụ "Terminal & Processes" trước khi báo cáo hoàn thành.
...
```

### Bước 3: Cách gọi lệnh hoạt động với Hermes

Khi chat với Hermes CLI, anh chỉ cần chỉ định file vai trò kèm theo yêu cầu:

> _"Hãy đọc chỉ dẫn vai trò trong file `docs/agents/backend-dev.md` và thực hiện task: Thêm API PATCH /tasks/:id/tags"_

Hermes sẽ kích hoạt công cụ đọc file, nạp toàn bộ quy tắc, tiêu chuẩn đầu ra, điều kiện dừng của vai trò đó vào ngữ cảnh hiện tại và xử lý task cực kỳ chính xác.

## 🌐 Cách 2: Áp dụng bộ điều phối (Orchestration Workflow) trực tiếp cho Hermes

Nếu anh muốn Hermes tự mình đóng vai trò là một **Trưởng trưởng nhóm (Lead/Planner)** để tự động điều phối toàn bộ pipeline từ thiết kế đến review, anh hãy copy và gửi trực tiếp prompt sau cho Hermes AI khi bắt đầu một tính năng lớn:

> ### 🤖 Prompt Điều phối Dự án dành cho Hermes AI
> 
> Tôi cần xây dựng tính năng: **"[MÔ TẢ TÍNH NĂNG CỦA ANH VÀO ĐÂY]"**.
> 
> Bạn sẽ đóng vai trò là Điều phối viên kiêm Fullstack Engineer. Hãy thực hiện tuần tự theo quy trình dưới đây bằng cách sử dụng linh hoạt các công cụ CLI của bạn (Web Search, Terminal, File Operations):
> 
> 1. **Bước 1 (System Analyst)**: Phân tích nghiệp vụ, làm rõ actor và use case. Sử dụng công cụ File để tạo file thiết kế kiến trúc tại `docs/architecture/ten-tinh-nang.md`. **Dừng lại xin xác nhận của tôi trước khi sang bước 2.**
>     
> 2. **Bước 2 (Planner)**: Thiết kế API contract chi tiết và chia nhỏ thành các checklist task cụ thể lưu tại `docs/plan/ten-tinh-nang.md`. **Dừng lại xin xác nhận.**
>     
> 3. **Bước 3 (Backend Dev)**: Thực hiện viết code API, xử lý database theo đúng kế hoạch. Tự chạy lệnh lint/test qua Terminal để đảm bảo pass 100%.
>     
> 4. **Bước 4 (Frontend Dev)**: Sử dụng API contract đã thống nhất để phát triển UI/UX, xử lý các trạng thái loading/error.
>     
> 5. **Bước 5 (QA & Reviewer)**: Tự kiểm tra lại toàn bộ mã nguồn vừa viết, viết bổ sung unit test cho các luồng quan trọng và tối ưu hóa hiệu năng/bảo mật.
>     
> 
> Báo cáo ngắn gọn tiến độ sau mỗi bước. Nếu có bất kỳ xung đột nào về kiến trúc hoặc logic, hãy dừng lại hỏi tôi ngay lập tức!

## 💡 Mẹo nhỏ cho anh khi dùng với Hermes AI:

- **Tận dụng tính năng Skills & Memory**: Hermes AI có sẵn công cụ số 12 (`Skills`) và số 14 (`Memory`). Sau khi anh hướng dẫn Hermes chạy chuẩn một workflow, anh có thể ra lệnh: _"Lưu quy trình điều phối sub-agent này thành một Skill cố định của bạn"_ để các phiên làm việc sau Hermes tự động nhớ và áp dụng mà không cần prompt lại từ đầu.
    
- **Cấu hình Fallback**: Đừng quên chuẩn bị sẵn API key dự phòng của OpenRouter hoặc cài Local LM Studio như hướng dẫn cài đặt của anh , phòng trường hợp khi Hermes xử lý chuỗi tác vụ dài (Agent Pipeline) có thể ngốn lượng token lớn của Gemini.
    

Anh đã tạo sẵn các thư mục dự án code của mình chưa, và anh muốn bắt đầu áp dụng thử bộ prompt này cho tính năng cụ thể nào trước tiên ạ?