---
tags: [glpi, helpdesk, templates]
---

# Templates — Mẫu Ticket dựng sẵn

Liên quan: [[Categories]] · [[Business Rules]] · [[SLA]]

## Checklist
- [ ] Tạo template cho các yêu cầu thường gặp nhất
- [ ] Điền sẵn Category, Priority, nhóm phụ trách trong mỗi template
- [ ] Đưa template lên Self-Service Portal cho nhân viên chọn nhanh

## Command / Cấu hình GLPI
`Setup > Dropdowns > Ticket templates > Thêm mới`

Ví dụ template "Reset password":
| Trường | Giá trị mặc định |
|---|---|
| Category | Tài khoản > Reset password |
| Priority | Trung bình |
| Nhóm phụ trách | IT-HelpdeskLevel1 |

## Verify
Tạo ticket thử từ template, xác nhận các trường tự điền đúng, không cần nhập tay lại.

## Troubleshooting
| Lỗi | Nguyên nhân | Cách xử lý |
|---|---|---|
| Template không hiện trên Self-Service | Chưa gán quyền hiển thị cho Profile Self-Service | Kiểm tra lại phạm vi hiển thị của template |

**Tiếp theo:** [[Business Rules]]
