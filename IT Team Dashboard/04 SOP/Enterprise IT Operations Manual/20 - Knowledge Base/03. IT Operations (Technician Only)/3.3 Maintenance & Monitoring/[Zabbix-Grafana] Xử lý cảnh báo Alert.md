---
category: "3.3 Maintenance & Monitoring"
visibility: Technician / Supervisor / Super-Admin only
tags: [zabbix, grafana, monitoring, alert, technician]
---

# [Zabbix/Grafana] Hướng dẫn xử lý cảnh báo (Alert) từ hệ thống giám sát

## 1. Tóm tắt hiện tượng (Symptom)
Nhận được cảnh báo (Alert) từ Zabbix/Grafana qua email/Teams (ví dụ: "CPU usage > 90%", "Disk space low", "Host unreachable") và cần quy trình xử lý chuẩn thay vì xử lý ngẫu hứng từng lần.

## 2. Nguyên nhân (Root Cause)
Hệ thống giám sát phát hiện chỉ số vượt ngưỡng cấu hình sẵn — bản thân Alert chỉ là **triệu chứng**, cần điều tra thêm để xác định nguyên nhân gốc trước khi xử lý, tránh xử lý sai hướng (ví dụ chỉ tắt Alert mà không giải quyết vấn đề thật).

## 3. Các bước xử lý (Resolution)
1. **Xác nhận Alert còn hiệu lực:** vào Zabbix/Grafana kiểm tra trực tiếp, tránh trường hợp Alert cũ đã tự hết (flapping) nhưng thông báo tồn đọng.
2. **Phân loại mức độ nghiêm trọng:**
   - `Disaster/Critical` (ví dụ Host GLPI Server unreachable) → xử lý ngay lập tức, có thể áp dụng SLA "Rất cao" nội bộ.
   - `Warning` (ví dụ Disk space còn 20%) → lên kế hoạch xử lý trong ngày/vài ngày tới.
3. **Điều tra nguyên nhân cụ thể theo loại Alert:**
   - CPU cao bất thường → `top`/`htop` xem tiến trình nào chiếm tài nguyên.
   - Disk space thấp → `df -h`, `du -sh /*` tìm thư mục phình to bất thường (thường là log chưa purge, xem tài liệu `09. Monitoring/Disk`).
   - Host unreachable → kiểm tra mạng (`ping`, `traceroute`) trước khi kết luận server chết hẳn.
4. **Xử lý và ghi log:** tạo Ticket/Incident (dùng Template [[../../../Templates/Incident|Incident]] trong Deployment Manual) ghi lại nguyên nhân + cách xử lý.
5. **Đóng Alert trên Zabbix/Grafana** sau khi xác nhận đã khắc phục, không để Alert tồn đọng gây nhiễu loạn khi có cảnh báo mới thật sự quan trọng.

## 4. Thông tin bổ sung (Notes)
- Nếu 1 loại Alert lặp lại thường xuyên (ví dụ Disk space cảnh báo mỗi tuần trên cùng 1 server), đây là dấu hiệu cần tạo **Problem** (điều tra nguyên nhân gốc, xem Template Problem trong Deployment Manual) thay vì chỉ xử lý Incident lặp đi lặp lại.
- Tinh chỉnh ngưỡng cảnh báo (threshold) định kỳ nếu Alert quá nhạy gây báo động giả (false positive) thường xuyên — tránh hiện tượng "Alert fatigue" khiến kỹ thuật viên bỏ qua cả cảnh báo thật.

---
**Hoàn tất mục 3.3 Maintenance & Monitoring (2 bài). Category 3 hoàn tất (10 bài).**
