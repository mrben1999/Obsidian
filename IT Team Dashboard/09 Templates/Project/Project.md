---
type: project
status: in-progress
priority: P2
team:
owner:
start_date: <% tp.date.now("YYYY-MM-DD") %>
due:
created: <% tp.date.now("YYYY-MM-DD") %>
tags: [project]
---

# 📁 Project — <% tp.file.title %>

## Mục tiêu dự án
>

## Phạm vi
- **Trong phạm vi:**
- **Ngoài phạm vi:**

## Mốc thời gian (Milestones)
| Mốc | Ngày dự kiến | Trạng thái |
|---|---|---|
| | | ☐ |

## Task thuộc dự án này
```dataview
TABLE status as "Trạng thái", priority as "Ưu tiên", assignee as "Phụ trách", due as "Hạn"
FROM #task
WHERE project = this.file.link
SORT due ASC
```

## Rủi ro
| Rủi ro | Mức độ | Giải pháp giảm thiểu |
|---|---|---|
| | | |

## Ghi chú
>
