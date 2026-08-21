---
type: dashboard
tags: [dashboard, manager]
---

# 👔 Dashboard Quản lý Team — IT Manager

> Dashboard dành riêng cho vai trò quản lý: theo dõi khối lượng công việc, việc quá hạn, và tiến độ dự án trên toàn bộ các team (Development, Infrastructure, Security).

## 1️⃣ ⚠️ Việc quá hạn — toàn team (cần xử lý / nhắc nhở ngay)
```dataview
TABLE team as "Nhóm", assignee as "Phụ trách", priority as "Ưu tiên", due as "Hạn"
FROM #task
WHERE due AND due < date(today) AND status != "done" AND status != "cancelled"
SORT team ASC, due ASC
```

## 2️⃣ 📊 Khối lượng công việc theo nhân viên (Workload)
```dataview
TABLE length(rows) as "Số task đang mở"
FROM #task
WHERE status != "done" AND status != "cancelled"
GROUP BY assignee
SORT length(rows) DESC
```

## 3️⃣ 📈 Trạng thái công việc — Development
```dataview
TABLE length(rows) as "Số lượng"
FROM #task
WHERE team = "developer"
GROUP BY status
```

## 4️⃣ 📈 Trạng thái công việc — Infrastructure
```dataview
TABLE length(rows) as "Số lượng"
FROM #task
WHERE team = "infrastructure"
GROUP BY status
```

## 5️⃣ 📈 Trạng thái công việc — Security
```dataview
TABLE length(rows) as "Số lượng"
FROM #task
WHERE team = "security"
GROUP BY status
```

## 6️⃣ 🗓️ Task tạo mới trong 7 ngày qua (theo trạng thái)
```dataview
TABLE length(rows) as "Số lượng"
FROM #task
WHERE created >= date(today) - dur(7 days)
GROUP BY status
```

## 7️⃣ 📁 Dự án sắp đến hạn (trong 30 ngày tới)
```dataview
TABLE status as "Trạng thái", owner as "Chủ trì", team as "Nhóm", due as "Hạn"
FROM #project
WHERE due <= date(today) + dur(30 days) AND status != "done"
SORT due ASC
```

## 8️⃣ 🔥 Incident theo mức độ ưu tiên (30 ngày gần nhất)
```dataview
TABLE length(rows) as "Số lượng"
FROM #incident
WHERE created >= date(today) - dur(30 days)
GROUP BY priority
SORT priority ASC
```

## 9️⃣ 🕓 Task chưa gán người phụ trách (assignee trống) — cần phân công
```dataview
TABLE team as "Nhóm", priority as "Ưu tiên", created as "Ngày tạo"
FROM #task
WHERE !assignee AND status != "done" AND status != "cancelled"
SORT created ASC
```

## 🔟 ⏳ Task chưa có hạn xử lý (due trống) — nên bổ sung
```dataview
TABLE team as "Nhóm", assignee as "Phụ trách", priority as "Ưu tiên", status as "Trạng thái"
FROM #task
WHERE !due AND status != "done" AND status != "cancelled"
SORT team ASC
```

---
🔗 Liên quan: [[Dashboard - Tổng quan]] · [[Kanban - Developer]] · [[Kanban - Infrastructure]] · [[Kanban - Security]]
