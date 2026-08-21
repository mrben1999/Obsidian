---
tags: [glpi, sop]
---

# SOP: Tiếp nhận máy mới

Liên quan: [[Cấp laptop]] · [[Asset]] · [[Computer]]

## Checklist
- [ ] Kiểm tra hàng nhận đủ số lượng/đúng model theo đơn mua
- [ ] Ghi nhận Serial number vào GLPI ngay khi nhập kho
- [ ] Dán nhãn tài sản (asset tag) vật lý nếu công ty có quy định
- [ ] Cài đặt agent trước khi bàn giao cho người dùng

## Các bước thực hiện
1. Nhận hàng, đối chiếu phiếu giao hàng với đơn mua (PO).
2. Tạo asset trong GLPI: `Assets > Computers > Add`, trạng thái = "Mới nhập kho".
3. Cài GLPI Agent theo [[GLPI Agent]], xác nhận máy xuất hiện đúng trên GLPI.
4. Cài đặt phần mềm chuẩn theo checklist riêng của phòng ban.
5. Chuyển trạng thái = "Đang sử dụng" khi bàn giao — dùng mẫu [[Asset]].

## Sơ đồ
```mermaid
flowchart LR
    Nhap[Nhận hàng] --> Ghi[Ghi nhận GLPI] --> Agent[Cài Agent] --> BanGiao[Bàn giao - Asset template]
```

## Ghi chú thực tế
- Không bỏ qua bước ghi Serial ngay lúc nhập kho — để dồn về sau rất dễ nhầm lẫn giữa các máy cùng model.

**Tiếp theo:** [[Thu hồi máy]]
