---
tags: [glpi, sop]
---

# SOP: Thanh lý tài sản

Liên quan: [[Bảo hành]] · [[Computer]] · [[Assets Reports]]

## Checklist
- [ ] Xác nhận thiết bị đủ điều kiện thanh lý (hết khấu hao/hỏng không sửa được)
- [ ] Xóa dữ liệu an toàn trước khi thanh lý (wipe disk)
- [ ] Có phê duyệt của Ban Giám đốc/Kế toán cho tài sản giá trị lớn
- [ ] Cập nhật trạng thái GLPI = "Đã thanh lý" (không xóa cứng bản ghi)

## Các bước thực hiện
1. Đề xuất thanh lý qua Ticket loại "Change" (dùng mẫu [[Change]] nếu ảnh hưởng hệ thống đang chạy).
2. Qua bước [[Approval]] của Kế toán/Ban Giám đốc.
3. Xóa dữ liệu an toàn (wipe theo chuẩn công ty, không chỉ format thường).
4. Chuyển trạng thái GLPI = "Đã thanh lý", giữ nguyên lịch sử ticket/bảo hành để phục vụ audit.
5. Đối chiếu số liệu với [[Assets Reports]] gửi phòng Kế toán khấu trừ sổ sách.

## Ghi chú thực tế
Không xóa cứng asset khỏi GLPI dù đã thanh lý — giữ lại lịch sử phục vụ audit và tránh mất dấu vết khi có tranh chấp/kiểm toán sau này.

---
**Hoàn tất chương SOP.** Tiếp theo: [[LDAP Troubleshooting]]
