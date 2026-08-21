---
type: reference
tags: [meta, convention]
---

# 📐 Quy ước Metadata & Tags — IT Nhà máy May mặc

> File này là "nguồn sự thật" (source of truth) cho toàn bộ vault. Mọi template trong `09 Templates` đều tuân theo quy ước bên dưới. Khi thêm field mới, **cập nhật file này trước**.

## 1. Nguyên tắc chung
- Tất cả field bắt buộc dùng **snake_case** hoặc **kebab-case** thống nhất (ở đây dùng kebab-case cho giá trị, camel/snake cho key).
- Ngày giờ theo định dạng `YYYY-MM-DD` (Obsidian Dataview đọc được ngay).
- Liên kết người/nhóm/dự án luôn dùng `[[Wikilink]]` để Dataview `link()` hoạt động và Graph View phản ánh đúng quan hệ.
- Mỗi note phải có field `type` — đây là field quan trọng nhất, dùng để lọc trong mọi Dataview query.

## 2. Danh sách `type` chuẩn (bắt buộc chọn 1)

| type | Dùng cho |
|---|---|
| `task` | Công việc cá nhân/nhóm |
| `daily-checklist` | Checklist công việc hằng ngày (tự động tạo) |
| `project` | Dự án |
| `meeting` | Biên bản họp |
| `sop` | Quy trình chuẩn |
| `incident` | Sự cố (ITSM) |
| `change-request` | Yêu cầu thay đổi (ITSM) |
| `release` | Bản phát hành/triển khai |
| `problem` | Vấn đề gốc rễ (Problem Management) |
| `service-request` | Yêu cầu dịch vụ IT |
| `knowledge` | Bài viết tri thức |
| `faq` | Câu hỏi thường gặp |
| `kpi` | Chỉ số KPI |
| `report-daily` | Báo cáo ngày |
| `report-weekly` | Báo cáo tuần |
| `report-monthly` | Báo cáo tháng |
| `asset-server` | Tài sản máy chủ |
| `asset-network` | Tài sản thiết bị mạng |
| `security-incident` | Sự cố an ninh |
| `onboarding-it` | Cấp phát IT nhân viên mới |
| `offboarding-it` | Thu hồi IT nhân viên nghỉ |
| `vendor` | Nhà cung cấp/hợp đồng |

## 3. Field chuẩn dùng chung

| Field | Kiểu | Ví dụ | Ghi chú |
|---|---|---|---|
| `type` | string | `incident` | bắt buộc |
| `status` | string | `in-progress` | xem bảng trạng thái bên dưới |
| `priority` | string | `P2` | P1 (khẩn cấp) → P4 (thấp) |
| `team` | string | `infrastructure` | `developer` \| `infrastructure` \| `security` |
| `assignee` | link | `[[Nguyen Van A]]` | người phụ trách |
| `reporter` | link | `[[Tran Thi B]]` | người tạo/báo cáo |
| `project` | link | `[[Project - ERP Rollout]]` | liên kết dự án cha |
| `area` | string | `production-line-3` | khu vực nhà máy nếu có |
| `created` | date | `2026-07-04` | ngày tạo |
| `due` | date | `2026-07-10` | hạn xử lý |
| `resolved` | date | | ngày đóng (incident/change/task) |
| `tags` | list | `[itsm, network]` | dùng cho tìm kiếm chéo |

## 4. Trạng thái (`status`) chuẩn theo nhóm

- **Task/Project:** `backlog` → `todo` → `in-progress` → `review` → `done` / `cancelled`
- **ITSM (Incident/Change/Problem/Service Request):** `new` → `investigating`/`approved` → `in-progress` → `resolved` → `closed`
- **Report:** không cần status, dùng `date`/`period`.

## 5. Priority chuẩn (ITSM)

| Mã | Ý nghĩa | SLA gợi ý |
|---|---|---|
| P1 | Khẩn cấp – ngừng sản xuất | 1 giờ phản hồi |
| P2 | Cao – ảnh hưởng 1 chuyền/khu vực | 4 giờ |
| P3 | Trung bình | 1 ngày |
| P4 | Thấp | 3 ngày |

## 6. Quy ước đặt tên file

- Task: `Task - <Tên ngắn>.md`
- Project: `Project - <Tên dự án>.md`
- Incident: `INC-<YYYYMMDD>-<số thứ tự> - <Tóm tắt>.md`
- Change Request: `CHG-<YYYYMMDD>-<số thứ tự> - <Tóm tắt>.md`
- Report: `Daily - YYYY-MM-DD.md`, `Weekly - YYYY-[W]WW.md`, `Monthly - YYYY-MM.md`

## 7. Tag namespace gợi ý

```
#team/developer #team/infrastructure #team/security
#area/production #area/office #area/warehouse
#itsm/incident #itsm/change #itsm/problem
#status/blocked #status/waiting-vendor
```

## 8. Checklist khi tạo note mới
- [ ] Đã chọn đúng `type`
- [ ] Đã gán `assignee`/`team`
- [ ] Đã đặt `priority` (nếu ITSM)
- [ ] Đã link `project` cha (nếu có)
- [ ] Tên file theo đúng convention ở mục 6
