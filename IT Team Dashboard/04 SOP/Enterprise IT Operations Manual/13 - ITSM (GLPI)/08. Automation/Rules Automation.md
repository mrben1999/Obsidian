---
tags: [glpi, automation, rules]
---

# Rules Automation — Tối ưu & giám sát bộ Rules

Liên quan: [[Rules]] · [[Business Rules]]

## Checklist
- [ ] Rà soát định kỳ rule nào ít khi match (có thể dư thừa)
- [ ] Rà soát rule nào match quá nhiều (có thể quá rộng, gây sai lệch)
- [ ] Tài liệu hóa mọi thay đổi rule (ai sửa, khi nào, lý do)

## Command
```sql
-- Không có bảng log match trực tiếp trong GLPI mặc định,
-- theo dõi gián tiếp qua log hệ thống hoặc qua số ticket/asset theo từng nhóm/entity
SELECT groups_id_assign, COUNT(*) FROM glpi_tickets GROUP BY groups_id_assign;
```

## Verify
So sánh kết quả phân bổ ticket/asset theo nhóm với kỳ vọng thiết kế ban đầu của rule — lệch nhiều là dấu hiệu cần rà soát lại rule.

## Troubleshooting
| Lỗi | Nguyên nhân | Cách xử lý |
|---|---|---|
| Một nhóm nhận quá nhiều ticket không đúng chuyên môn | Rule quá rộng match nhầm | Thu hẹp điều kiện rule trong [[Business Rules]] |

**Tiếp theo:** [[Actions]]
