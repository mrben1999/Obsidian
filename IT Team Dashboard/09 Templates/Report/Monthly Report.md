---
type: report-monthly
month: <% tp.date.now("YYYY-MM") %>
author:
team:
tags: [report, monthly]
---

# 📊 Monthly Report — Tháng <% tp.date.now("MM/YYYY") %>

## Tổng quan KPI tháng
```dataview
TABLE target as "Mục tiêu", actual as "Thực tế"
FROM #kpi
WHERE period = this.month
```

## Thống kê Incident theo mức độ
```dataview
TABLE length(rows) as "Số lượng"
FROM #incident
WHERE created >= date(this.month + "-01") AND created <= date(this.month + "-01") + dur(30 days)
GROUP BY priority
```

## Change Request đã triển khai
```dataview
TABLE status as "Trạng thái", assignee as "Phụ trách"
FROM #change
WHERE created >= date(this.month + "-01")
```

## Đánh giá & Bài học kinh nghiệm
>

## Kế hoạch tháng tới
- [ ]
