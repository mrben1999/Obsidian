---
type: task
status: todo
priority: <% tp.system.suggester(["🔴 P1 - Khẩn cấp","🟠 P2 - Cao","🟡 P3 - Trung bình","🟢 P4 - Thấp"], ["P1","P2","P3","P4"], false, "Chọn mức ưu tiên") %>
team: <% tp.system.suggester(["Development","Infrastructure","Security"], ["developer","infrastructure","security"], false, "Chọn nhóm phụ trách") %>
assignee: "[[<% tp.system.prompt("Người phụ trách (assignee) - gõ tên như trong Vault") %>]]"
project:
created: <% tp.date.now("YYYY-MM-DD HH:mm") %>
due: <% tp.date.now("YYYY-MM-DD", 3) %>
resolved:
tags:
  - task
---

# ✅ <% tp.file.title %>

## 🎯 Mục tiêu
>

---

# 📋 Mô tả
>

---

# ✅ Checklist công việc
- [ ]
- [ ]
- [ ]

---

# 📝 Ghi chú
>

---

# 📌 Kết quả
- [ ]
- [ ]

---

# 🔗 Liên kết
- Project::
- Incident/Change liên quan::
