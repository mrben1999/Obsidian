---
type: report-daily
date: <% tp.date.now("YYYY-MM-DD") %>
author:
team:
tags: [report, daily]
---

# 📅 Daily Report — <% tp.date.now("YYYY-MM-DD") %>

## Việc đã hoàn thành hôm nay
```dataview
LIST
FROM #task
WHERE status = "done" AND resolved = date(<% tp.date.now("YYYY-MM-DD") %>)
```

## Việc đang xử lý
```dataview
TABLE status as "Trạng thái", priority as "Ưu tiên", due as "Hạn"
FROM #task
WHERE status = "in-progress" AND assignee = this.author
```

## Sự cố phát sinh trong ngày
```dataview
TABLE priority as "Ưu tiên", status as "Trạng thái"
FROM #incident
WHERE created = date(<% tp.date.now("YYYY-MM-DD") %>)
```

## Vướng mắc / Cần hỗ trợ
>

## Kế hoạch ngày mai
- [ ]
