# 📦 Enterprise Obsidian Starter Kit — IT Nhà máy May mặc

## Nội dung bộ kit

```
09 Templates/
├── 0.Chuẩn Metadata/
│   └── Metadata Convention.md          ← ĐỌC FILE NÀY TRƯỚC TIÊN
├── ITSM/
│   ├── Incident.md
│   ├── Change Request.md
│   ├── Release.md
│   ├── Problem Record.md
│   └── Service Request.md
├── Knowledge/
│   ├── Knowledge.md
│   └── FAQ.md
├── KPI/
│   └── KPI.md
├── Meeting/
│   └── Meeting.md
├── Project/
│   └── Project.md
├── Report/
│   ├── Daily Report.md
│   ├── Weekly Report.md
│   └── Monthly Report.md
├── SOP/
│   └── SOP.md
├── Task/
│   └── Task.md
├── Asset/
│   ├── Server Asset.md
│   └── Network Device.md
├── Security/
│   └── Security Incident.md
├── HR-IT/
│   ├── Onboarding IT.md
│   └── Offboarding IT.md
└── Vendor/
    └── Vendor Contract.md

00 Home/
├── Home.md                              ← Trang chủ vault
├── Dashboard/
│   └── Dashboard - Tổng quan.md         ← Dashboard chính (My Tasks, Team Tasks, KPI, Project Progress...)
├── Kanban/
│   ├── Kanban - Developer.md
│   ├── Kanban - Infrastructure.md
│   └── Kanban - Security.md
└── Setup Guide/
    └── QuickAdd & Templater Setup Guide.md
```

Tổng cộng: **22 template chuẩn** (vượt yêu cầu 20) + Homepage + Dashboard + 3 Kanban board + hướng dẫn cấu hình.

## Cách cài đặt (3 bước)

1. **Chép thư mục:**
   - Chép toàn bộ nội dung bên trong `09 Templates/` (các folder con) → đè/merge vào `09 Templates` hiện có trong vault của anh (khớp với cấu trúc anh đang có sẵn: ITSM, Knowledge, KPI, Meeting, Project, Report, SOP, Task, 0.Chuẩn Metadata).
   - Chép thư mục `00 Home/` vào gốc vault.

2. **Cài plugin bắt buộc** (Settings → Community Plugins → Browse):
   - **Dataview**
   - **Templater**
   - **Kanban**
   - **QuickAdd**

3. **Làm theo `QuickAdd & Templater Setup Guide.md`** trong `00 Home/Setup Guide/` để cấu hình:
   - Templater trỏ vào folder `09 Templates`
   - QuickAdd tạo các phím tắt "New Task", "New Incident"...

## Thứ tự đọc khuyến nghị
1. `0.Chuẩn Metadata/Metadata Convention.md` — hiểu quy ước field/tag trước khi dùng bất kỳ template nào.
2. `00 Home/Home.md` — trang chủ, mở lên mỗi ngày.
3. `00 Home/Setup Guide/QuickAdd & Templater Setup Guide.md` — cấu hình 1 lần duy nhất.

## Lưu ý quan trọng
- Các Dataview query trong Home/Dashboard/Project dùng field `#task`, `#incident`, `#change`... — đây là **tag**, nên khi tạo note nhớ giữ nguyên tag trong frontmatter (`tags: [task]`, `tags: [itsm, incident]`...) để query nhận diện đúng.
- Query "My Tasks" trong Dashboard cần anh sửa `[[Tên của bạn]]` thành tên thật (link tới note cá nhân của anh) để lọc đúng task của mình.
- Toàn bộ dữ liệu trong template là **placeholder/mock** — anh chỉ cần điền thực tế vào, không cần sửa cấu trúc.
