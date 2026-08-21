---
type: kpi
team:
owner:
period: <% tp.date.now("YYYY-MM") %>
target:
actual:
unit:
created: <% tp.date.now("YYYY-MM-DD") %>
tags: [kpi]
---

# 📊 KPI — <% tp.file.title %>

## Định nghĩa chỉ số
> KPI này đo lường điều gì và tại sao quan trọng?

## Công thức tính
>

## Mục tiêu vs Thực tế

| Kỳ | Mục tiêu | Thực tế | Đạt? |
|---|---|---|---|
| `= this.period` | `= this.target` | `= this.actual` | `= choice(this.actual >= this.target, "✅", "❌")` |

## Xu hướng lịch sử
```dataview
TABLE period as "Kỳ", target as "Mục tiêu", actual as "Thực tế"
FROM #kpi
WHERE contains(file.tags, "kpi") AND owner = this.owner
SORT period ASC
```

## Ghi chú / Nguyên nhân lệch mục tiêu
>

## Hành động cải thiện
- [ ]
