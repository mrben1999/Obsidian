---
tags: [glpi, sop]
---

# SOP: Xử lý bảo hành thiết bị

Liên quan: [[Warranty]] · [[Thanh lý]]

## Checklist
- [ ] Kiểm tra thiết bị còn trong hạn bảo hành trên GLPI trước khi gửi sửa
- [ ] Liên hệ nhà cung cấp/hãng theo đúng kênh bảo hành
- [ ] Cập nhật trạng thái GLPI = "Bảo trì" trong thời gian gửi bảo hành
- [ ] Ghi log lịch sử sửa chữa vào ghi chú asset

## Các bước thực hiện
1. Kỹ thuật viên phát hiện thiết bị lỗi, kiểm tra hạn bảo hành trong GLPI (tab Tài chính).
2. Nếu còn bảo hành: liên hệ nhà cung cấp, tạo phiếu gửi bảo hành.
3. Cập nhật trạng thái asset = "Bảo trì", ghi rõ ngày gửi, đơn vị nhận bảo hành trong ghi chú.
4. Khi nhận lại: cập nhật trạng thái = "Đang sử dụng", ghi log kết quả sửa chữa.
5. Nếu hết bảo hành và không đáng sửa: chuyển sang quy trình [[Thanh lý]].

## Ghi chú thực tế
Dùng báo cáo [[Warranty]] để chủ động biết trước thiết bị nào sắp hết hạn, tránh trường hợp lỗi rồi mới phát hiện đã hết bảo hành.

**Tiếp theo:** [[Thanh lý]]
