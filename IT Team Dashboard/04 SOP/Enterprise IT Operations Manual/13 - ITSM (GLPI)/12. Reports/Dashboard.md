---
tags: [glpi, reports, dashboard]
---

# Dashboard — Bảng điều khiển trực quan

Liên quan: [[04 SOP/Enterprise IT Operations Manual/13 - ITSM (GLPI)/12. Reports/KPI]] · [[SQL]] · [[04 SOP/Enterprise IT Operations Manual/13 - ITSM (GLPI)/00. Home]]

## Checklist
- [ ] Tạo dashboard riêng cho Ban Giám đốc
- [ ] Tạo dashboard riêng cho đội Helpdesk vận hành
- [ ] Phân quyền hiển thị theo Profile

## Command / Cấu hình GLPI
`Trang chủ > Dashboard > Dashboard > Add a new dashboard` — "QuangViet - Tổng quan điều hành".

| Đối tượng | Widget đề xuất |
|---|---|
| Ban Giám đốc | Tổng ticket mở, biểu đồ trạng thái, ticket theo chi nhánh, Top 5 vấn đề lặp lại |
| Helpdesk vận hành | Ticket quá hạn SLA, ticket chưa gán KTV, hiệu suất theo từng KTV |

## Verify
Đăng nhập bằng Profile Supervisor và Technician, xác nhận mỗi vai trò thấy đúng dashboard mặc định gán riêng.

## Troubleshooting
| Lỗi | Nguyên nhân | Cách xử lý |
|---|---|---|
| Widget "Không có dữ liệu" | Filter entity/thời gian quá hẹp | Kiểm tra lại filter mặc định của widget |
| Dashboard load chậm | Quá nhiều widget nặng | Tách thành nhiều dashboard theo mục đích |

**Tiếp theo:** [[Inventory Reports]]
