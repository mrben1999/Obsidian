---
type: report-weekly
week: <% tp.date.now("YYYY-[W]WW") %>
author:
team:
tags: [report, weekly]
---

# 📈 Weekly Report — Tuần <% tp.date.now("WW, YYYY") %>

## Tổng quan tuần
- **Số task hoàn thành:**
- **Số incident xử lý:**
- **Số change triển khai:**

## Task hoàn thành trong tuần
```dataview
TABLE priority as "Ưu tiên", assignee as "Phụ trách"
FROM #task
WHERE status = "done" AND resolved >= date(today) - dur(7 days)
```

## Incident nổi bật
```dataview
TABLE priority as "Ưu tiên", status as "Trạng thái", area as "Khu vực"
FROM #incident
WHERE created >= date(today) - dur(7 days)
SORT priority ASC
```

## KPI tuần
>

## Vấn đề tồn đọng
- [ ]

## Kế hoạch tuần sau
- [ ]
