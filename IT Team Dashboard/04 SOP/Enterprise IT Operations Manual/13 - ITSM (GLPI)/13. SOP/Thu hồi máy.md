---
tags: [glpi, sop]
---

# SOP: Thu hồi máy

Liên quan: [[Tiếp nhận máy mới]] · [[Asset]] · [[07 Sync]]

## Checklist
- [ ] Thu hồi đầy đủ thiết bị (máy, sạc, chuột, màn hình nếu có)
- [ ] Backup/xóa dữ liệu cá nhân theo chính sách công ty
- [ ] Cập nhật trạng thái GLPI, gỡ người sử dụng
- [ ] Xác nhận tài khoản AD đã bị khóa (liên kết offboarding)

## Các bước thực hiện
1. Nhận thông báo nghỉ việc/luân chuyển từ HR.
2. Lập biên bản thu hồi theo mẫu [[Asset]].
3. Cập nhật GLPI: gỡ người sử dụng, trạng thái = "Bảo trì" hoặc "Sẵn sàng cấp lại".
4. Xác nhận tài khoản AD nhân viên đã bị disable — [[07 Sync]] sẽ tự khóa tài khoản GLPI tương ứng trong vòng 1 giờ.
5. Xóa dữ liệu cá nhân trên máy (theo chính sách bảo mật), cài lại nếu cấp cho người khác.

## Ghi chú thực tế
Việc thu hồi cần đồng bộ chặt với HR — nên có checklist chung "Ngày cuối làm việc" giữa HR và IT để không sót thiết bị.

**Tiếp theo:** [[Cấp laptop]]
