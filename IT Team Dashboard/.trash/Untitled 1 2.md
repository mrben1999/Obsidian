---
type: report-daily
date: 2026-07-06
author:
team:
tags:
  - report
  - daily
---

# 📅 Daily Report — 2026-07-06

## Việc đã hoàn thành hôm nay
```dataview
LIST
FROM #task
WHERE status = "done" AND resolved = date(2026-07-06)
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
WHERE created = date(2026-07-06)
```

## Vướng mắc / Cần hỗ trợ
>

## Kế hoạch ngày mai
- [ ]
