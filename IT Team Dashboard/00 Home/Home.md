---
type: home
tags: [home]
---

# 🏭 IT Nhà máy May mặc — Trung tâm điều hành

## 🔗 Truy cập nhanh
- [[Dashboard - Tổng quan]]
- [[Dashboard - Quản lý Team]]
- [[Kanban - Developer]]
- [[Kanban - Infrastructure]]
- [[Kanban - Security]]
- [[Metadata Convention]]
- [[QuickAdd & Templater Setup Guide]]

## ✅ Checklist hôm nay
```dataview
LIST
FROM "00 Home/Daily CheckList"
WHERE file.day = date(today)
```
> Nếu không thấy checklist hôm nay ở trên: mở thư mục **00 Home/Daily CheckList** hoặc chạy lệnh **New Daily CheckList** trong QuickAdd. Xem cách thiết lập tự động tại [[QuickAdd & Templater Setup Guide]].

## 📌 Việc của tôi (thay `assignee` bằng tên bạn trong query bên dưới)
```dataview
TABLE priority as "Ưu tiên", status as "Trạng thái", due as "Hạn", project as "Dự án"
FROM #task
WHERE status != "done" AND status != "cancelled"
SORT priority ASC, due ASC
```

## 🔥 Incident đang mở (ưu tiên P1-P2)
```dataview
TABLE priority as "Ưu tiên", status as "Trạng thái", area as "Khu vực", assignee as "Phụ trách"
FROM #incident
WHERE status != "closed" AND (priority = "P1" OR priority = "P2")
SORT priority ASC
```

## 🔧 Change Request sắp triển khai
```dataview
TABLE status as "Trạng thái", planned_date as "Ngày dự kiến", assignee as "Phụ trách"
FROM #change
WHERE status != "closed"
SORT planned_date ASC
```

## 📊 KPI tháng này
```dataview
TABLE target as "Mục tiêu", actual as "Thực tế", team as "Nhóm"
FROM #kpi
WHERE period = date(today).year + "-" + string(date(today).month)
```

## 📁 Dự án đang chạy
```dataview
TABLE status as "Trạng thái", owner as "Chủ trì", due as "Hạn"
FROM #project
WHERE status = "in-progress"
```
