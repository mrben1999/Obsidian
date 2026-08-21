---
category: "3.3 Maintenance & Monitoring"
visibility: Technician / Supervisor / Super-Admin only
tags: [maintenance, server-room, ups, technician]
---

# [SOP] Lịch kiểm tra định kỳ phòng Server

## 1. Tóm tắt hiện tượng (Symptom)
Cần lịch trình chuẩn để kiểm tra định kỳ phòng Server (nhiệt độ, UPS, tình trạng thiết bị) nhằm phát hiện sớm rủi ro trước khi xảy ra sự cố nghiêm trọng.

## 2. Nguyên nhân (Root Cause)
Đây là quy trình phòng ngừa (preventive maintenance) — phần lớn sự cố hạ tầng nghiêm trọng (server hỏng do quá nhiệt, mất điện đột ngột) đều có dấu hiệu cảnh báo sớm nếu kiểm tra định kỳ đúng cách.

## 3. Các bước xử lý (Resolution) — Checklist theo tần suất

**Hàng ngày (đầu giờ làm việc):**
- [ ] Quan sát nhanh đèn báo trạng thái UPS (không có đèn đỏ/vàng cảnh báo)
- [ ] Kiểm tra nhiệt độ phòng server qua cảm biến/màn hình hiển thị (ngưỡng chuẩn 18-24°C)
- [ ] Kiểm tra nhanh dashboard giám sát (Zabbix/Grafana) không có Alert mới nghiêm trọng

**Hàng tuần:**
- [ ] Kiểm tra log hệ thống server chính, tìm dấu hiệu lỗi bất thường
- [ ] Kiểm tra dung lượng ổ đĩa còn trống trên các server quan trọng
- [ ] Vệ sinh sơ bộ (hút bụi quạt tản nhiệt bên ngoài, không mở case)

**Hàng tháng:**
- [ ] Kiểm tra tải UPS thực tế so với công suất định mức, ước tính thời gian dự phòng còn lại
- [ ] Test chuyển nguồn dự phòng (nếu có máy phát điện/nguồn kép) theo lịch phối hợp với bộ phận cơ điện
- [ ] Rà soát danh sách thiết bị trong Rack, đối chiếu với GLPI (`Assets > Racks`)

**Hàng quý:**
- [ ] Diễn tập Disaster Recovery (restore thử trên staging)
- [ ] Kiểm tra hạn bảo hành các thiết bị hạ tầng quan trọng (server, UPS, switch core)

## 4. Thông tin bổ sung (Notes)
- Ghi log kết quả kiểm tra mỗi lần (kể cả khi không phát hiện vấn đề) — dữ liệu lịch sử giúp phát hiện xu hướng xấu dần theo thời gian (ví dụ nhiệt độ tăng dần qua từng tháng).
- Phát hiện bất thường ở bất kỳ bước nào → tạo Ticket ngay, không chờ đến chu kỳ kiểm tra tiếp theo.
