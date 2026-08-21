---
type: dashboard
tags:
---

# 📊 Dashboard Tổng quan IT

## 1️⃣ My Tasks (thay giá trị `assignee` theo tên bạn)
```dataview
TABLE priority as "Ưu tiên", status as "Trạng thái", due as "Hạn"
FROM #task
WHERE assignee = [[Tên của bạn]] AND status != "done"
SORT due ASC
```

## 2️⃣ Team Tasks — theo nhóm
### Developer
```dataview
TABLE assignee as "Phụ trách", status as "Trạng thái", due as "Hạn"
FROM #task
WHERE team = "developer" AND status != "done"
SORT due ASC
```

### Infrastructure
```dataview
TABLE assignee as "Phụ trách", status as "Trạng thái", due as "Hạn"
FROM #task
WHERE team = "infrastructure" AND status != "done"
SORT due ASC
```

### Security
```dataview
TABLE assignee as "Phụ trách", status as "Trạng thái", due as "Hạn"
FROM #task
WHERE team = "security" AND status != "done"
SORT due ASC
```

## 3️⃣ KPI theo nhóm
```dataview
TABLE team as "Nhóm", target as "Mục tiêu", actual as "Thực tế", period as "Kỳ"
FROM #kpi
SORT period DESC
```

## 4️⃣ Tiến độ dự án (Project Progress)
```dataview
TABLE status as "Trạng thái", owner as "Chủ trì",
  length(filter(file.inlinks, (l) => contains(l.file.tags, "task") and l.status = "done")) as "Task xong",
  due as "Hạn"
FROM #project
```

## 5️⃣ Incident 30 ngày gần nhất theo mức độ
```dataview
TABLE length(rows) as "Số lượng"
FROM #incident
WHERE created >= date(today) - dur(30 days)
GROUP BY priority
SORT priority ASC
```

## 6️⃣ Service Request chưa xử lý
```dataview
TABLE requester as "Người yêu cầu", priority as "Ưu tiên", created as "Ngày tạo"
FROM #service-request
WHERE status != "closed" AND status != "resolved"
SORT created ASC
```
