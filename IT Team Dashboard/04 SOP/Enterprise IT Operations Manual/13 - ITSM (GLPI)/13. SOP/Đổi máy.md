---
tags: [glpi, sop]
---

# SOP: Đổi máy (luân chuyển/nâng cấp)

Liên quan: [[Laptop]] · [[Asset]]

## Checklist
- [ ] Xác định lý do đổi máy (hỏng, nâng cấp, luân chuyển chi nhánh)
- [ ] Backup dữ liệu từ máy cũ trước khi thu hồi
- [ ] Cập nhật GLPI: gỡ máy cũ, gán máy mới, cập nhật vị trí/Entity nếu đổi chi nhánh

## Các bước thực hiện
1. Tạo ticket "Đổi máy", ghi rõ lý do.
2. Backup dữ liệu cá nhân từ máy cũ (theo hướng dẫn chuẩn của công ty — OneDrive/thư mục chia sẻ).
3. Cài đặt/migrate dữ liệu sang máy mới.
4. Thu hồi máy cũ theo [[Thu hồi máy]].
5. Bàn giao máy mới theo mẫu [[Asset]], cập nhật GLPI đầy đủ (đặc biệt nếu đổi Entity do luân chuyển chi nhánh HN ↔ HCM).

## Ghi chú thực tế
Trường hợp luân chuyển giữa 2 chi nhánh, nhớ cập nhật lại Entity thủ công nếu rule tự động theo IP/TAG chưa bắt kịp — xem [[Entities]].

**Tiếp theo:** [[Bảo hành]]
