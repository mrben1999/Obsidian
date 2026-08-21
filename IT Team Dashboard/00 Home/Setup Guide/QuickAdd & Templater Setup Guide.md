---
type: guide
tags:
  - quickadd
  - templater
  - itsm
---

# ⚙️ Hướng dẫn cấu hình Templater + QuickAdd

## A. Cài đặt Templater

1. Cài plugin **Templater** (Community Plugins → tìm "Templater").
2. Vào **Settings → Templater**:
   - **Template folder location:** `09 Templates`
   - Bật **Trigger Templater on new file creation** (để field `<% tp.date.now(...) %>` tự chạy).
   - Bật **Enable folder templates** rồi map từng folder với template tương ứng, ví dụ:

| Folder | Template mặc định |
|---|---|
| `01 Task` (hoặc nơi bạn lưu task) | `09 Templates/Task/Task.md` |
| `02 Project` | `09 Templates/Project/Project.md` |
| `03 ITSM/Incident` | `09 Templates/ITSM/Incident.md` |
| `03 ITSM/Change` | `09 Templates/ITSM/Change Request.md` |
| `04 Meeting` | `09 Templates/Meeting/Meeting.md` |
| `05 KPI` | `09 Templates/KPI/KPI.md` |
| `06 Report/Daily` | `09 Templates/Report/Daily Report.md` |

> Lưu ý: tất cả template trong bộ này đã dùng cú pháp Templater (`<% tp.date.now(...) %>`, `<% tp.file.title %>`). Nếu bạn không cài Templater, các dòng này sẽ hiển thị nguyên văn — vẫn dùng được, chỉ cần tự gõ tay ngày tháng.

## B. Cài đặt QuickAdd

1. Cài plugin **QuickAdd**.
2. Vào **Settings → QuickAdd → Manage Macros/Choices**, tạo các **Template Choice** sau (loại: *Template*):

| Tên Choice | Template dùng | Thư mục đích |
|---|---|---|
| 🆕 New Task | `09 Templates/Task/Task.md` | `02 Tasks/1.Plan` |
| 🆕 New Daily CheckList | `09 Templates/Daily-CheckList/Daily CheckList.md` | `00 Home/Daily CheckList` |
| 🆕 New Incident | `09 Templates/ITSM/Incident.md` | `03 ITSM/Incident` |
| 🆕 New Change Request | `09 Templates/ITSM/Change Request.md` | `03 ITSM/Change` |
| 🆕 New Meeting | `09 Templates/Meeting/Meeting.md` | `04 Meeting` |
| 🆕 New Project | `09 Templates/Project/Project.md` | `02 Project` |
| 🆕 New Daily Report | `09 Templates/Report/Daily Report.md` | `06 Report/Daily` |
| 🆕 New Service Request | `09 Templates/ITSM/Service Request.md` | `03 ITSM/Service Request` |

> ⚡ **Phân công task nhanh:** template `Task.md` đã tích hợp sẵn Templater prompt — khi tạo task mới qua QuickAdd, Obsidian sẽ tự hỏi liên tiếp: **mức ưu tiên (P1–P4)** → **nhóm phụ trách (Development/Infrastructure/Security)** → **tên người được giao (assignee)**. Anh chỉ cần chọn/gõ, không phải tự điền tay vào frontmatter. Hạn xử lý mặc định là *hôm nay + 3 ngày*, có thể sửa lại sau khi tạo.

3. Với mỗi Choice, trong phần **File Name Format**, đặt theo convention (mục 6 trong Metadata Convention), ví dụ:
   - Task: `Task - {{VALUE:Tên task}}`
   - Incident: `INC-{{DATE:YYYYMMDD}}-{{VALUE:số thứ tự}} - {{VALUE:Tóm tắt}}`
4. Bật **"Set as command"** để mỗi Choice xuất hiện trong Command Palette (Ctrl/Cmd + P), giúp tạo note bằng phím tắt.
5. Gợi ý gán phím tắt nhanh (Hotkeys):
   - `Ctrl/Cmd + Alt + T` → New Task
   - `Ctrl/Cmd + Alt + I` → New Incident
   - `Ctrl/Cmd + Alt + M` → New Meeting

## C. Kiểm tra hoạt động
- Tạo thử 1 Task bằng QuickAdd → kiểm tra frontmatter có tự điền `created` đúng ngày hôm nay không.
- Nếu field ngày không tự điền, kiểm tra lại: Templater đã bật **"Trigger Templater on new file creation"** và QuickAdd Choice đang trỏ đúng path template.

## D. Plugin cần cài thêm cho Dashboard/Kanban hoạt động
- **Dataview** (bắt buộc — để chạy mọi query trong Home/Dashboard/Report/Project).
- **Kanban** (bắt buộc — để mở 3 board trong `00 Home/Kanban`).
- (Tuỳ chọn) **Calendar**, **Tasks plugin** nếu muốn thêm view lịch/task nâng cao.

## E. Tự động tạo Checklist mỗi ngày (chọn 1 trong 2 cách)

Vault đã có sẵn template chuẩn tại `09 Templates/Daily-CheckList/Daily CheckList.md`, ghi vào thư mục `00 Home/Daily CheckList/` với tên file `YYYY-MM-DD.md`. Có 2 cách để nó **tự sinh ra mỗi ngày** mà không cần bấm tay:

### Cách 1 — Dùng plugin Periodic Notes (đơn giản, khuyên dùng)
1. Cài plugin **Periodic Notes**.
2. Vào **Settings → Periodic Notes → Daily Notes**, bật lên và cấu hình:
   - **Folder:** `00 Home/Daily CheckList`
   - **Template:** `09 Templates/Daily-CheckList/Daily CheckList`
   - **Format:** `YYYY-MM-DD`
   - Bật **"Open daily note on startup"** → mỗi lần mở Obsidian, ghi chú hôm nay sẽ tự được tạo (nếu chưa có) và mở ra ngay.
3. (Tuỳ chọn) Gán hotkey cho lệnh **"Open today's daily note"** để mở lại nhanh trong ngày.

### Cách 2 — Dùng Templater Startup Template (không cần cài thêm plugin)
1. Vào **Settings → Templater → Trigger Templater on new file creation** (đã bật ở mục A).
2. Kéo xuống mục **Startup templates**, bấm **Add New** và trỏ tới:
   `09 Templates/System/Auto-Create Daily CheckList.md`
3. Mỗi khi mở Obsidian, Templater sẽ tự chạy script này: kiểm tra file `00 Home/Daily CheckList/<hôm nay>.md` đã tồn tại chưa — nếu chưa thì tự tạo từ template `Daily CheckList`.
4. Lưu ý: cách này chỉ chạy **khi khởi động app**, nên nếu để Obsidian mở qua đêm không tắt, cần đóng/mở lại app (hoặc chạy tay lệnh **New Daily CheckList** trong QuickAdd) để checklist ngày mới xuất hiện.

> Dù dùng cách nào, mục **"✅ Checklist hôm nay"** ở [[Home]] cũng sẽ tự hiển thị link tới checklist của ngày hôm đó nhờ Dataview.
