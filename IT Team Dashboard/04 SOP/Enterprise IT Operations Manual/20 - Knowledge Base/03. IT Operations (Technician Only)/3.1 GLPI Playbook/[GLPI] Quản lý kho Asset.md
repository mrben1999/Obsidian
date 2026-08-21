---
category: "3.1 GLPI Playbook"
visibility: Technician / Supervisor / Super-Admin only
tags: [glpi, asset, stock, technician]
---

# [GLPI] Hướng dẫn quản lý kho Asset (thiết bị chưa cấp phát)

## 1. Tóm tắt hiện tượng (Symptom)
Cần biết cách quản lý thiết bị đang nằm trong kho IT (chưa bàn giao cho ai) trong GLPI, tránh nhầm lẫn với thiết bị đang sử dụng khi báo cáo/kiểm kê.

## 2. Nguyên nhân (Root Cause)
Đây là hướng dẫn nghiệp vụ (không phải sự cố) — GLPI không có khái niệm "kho" riêng biệt như phần mềm quản lý kho chuyên dụng, mà dùng trường **Status (Trạng thái)** trên từng Asset để mô phỏng vòng đời, kết hợp Location để đánh dấu vị trí vật lý là "Kho IT".

## 3. Các bước xử lý (Resolution)
**Thiết lập trạng thái chuẩn (thực hiện 1 lần khi setup hệ thống):**
`Setup > Dropdowns > Status`, đảm bảo có đủ các trạng thái: `New (Mới nhập kho) → In use (Đang sử dụng) → In repair (Bảo trì) → Waiting for disposal (Chờ thanh lý) → Disposed (Đã thanh lý)`.

**Nhập thiết bị mới vào kho:**
1. `Assets > Computers > Add` (hoặc loại asset tương ứng).
2. Nhập Serial, Model, để trống trường **User** (chưa gán ai).
3. Trạng thái = **New**, Location = **"Quảng Việt > Kho IT"**.

**Khi cấp phát thiết bị từ kho cho nhân viên:**
1. Mở Asset tương ứng, gán trường **User** = tên nhân viên.
2. Đổi Location = vị trí ngồi thực tế của nhân viên.
3. Đổi Status = **In use**.

**Tra cứu nhanh danh sách thiết bị còn trong kho (chưa cấp phát):**
Vào `Assets > Computers`, dùng bộ lọc tìm kiếm: `Status = New` AND `Location = Kho IT` — hoặc `User is empty`.

## 4. Thông tin bổ sung (Notes)
- Luôn cập nhật Status ngay khi cấp phát/thu hồi — nếu để trễ, báo cáo tồn kho sẽ sai lệch với thực tế, gây khó khăn khi lập kế hoạch mua sắm mới.
- Với số lượng thiết bị kho lớn, có thể tạo thêm Saved Search (lưu bộ lọc trên) để tra cứu nhanh mà không cần nhập lại filter mỗi lần.

---
**Hoàn tất mục 3.1 GLPI Playbook (5 bài).**
