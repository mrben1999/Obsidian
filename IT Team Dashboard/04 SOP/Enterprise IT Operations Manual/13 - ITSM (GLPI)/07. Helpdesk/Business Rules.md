---
tags: [glpi, helpdesk, business-rules]
---

# Business Rules — Quy tắc nghiệp vụ xử lý Ticket

Liên quan: [[Templates]] · [[SLA]] · [[Escalation]]

## Checklist
- [ ] Liệt kê kịch bản nghiệp vụ cần tự động hóa
- [ ] Tạo rule đúng thứ tự ưu tiên (cụ thể → chung)
- [ ] Test bằng ticket giả lập trước khi áp dụng

## Command / Cấu hình GLPI
`Administration > Rules > Business rules for tickets`

| # | Điều kiện | Hành động |
|---|---|---|
| 1 | Category = Mạng | Nhóm = IT-NetworkTeam, SLA = Cao |
| 2 | Category = Tài khoản > Reset password | Nhóm = IT-HelpdeskLevel1 |
| 3 | Entity = Chi nhánh HCM | Gán kỹ thuật viên khu vực HCM |
| 4 (mặc định) | (không điều kiện) | Nhóm = IT-HelpdeskLevel1 |

## Verify
Dùng chức năng "Test rules", nhập dữ liệu mẫu, xem preview hành động trước khi lưu.

## Troubleshooting
| Lỗi | Nguyên nhân | Cách xử lý |
|---|---|---|
| Ticket không được gán nhóm nào | Thiếu rule catch-all cuối danh sách | Bổ sung rule mặc định |
| 2 rule xung đột hành động | Cả 2 đều tick "tiếp tục xử lý" | Chỉ tick khi thực sự cần cộng dồn |

**Tiếp theo:** [[SLA]]
