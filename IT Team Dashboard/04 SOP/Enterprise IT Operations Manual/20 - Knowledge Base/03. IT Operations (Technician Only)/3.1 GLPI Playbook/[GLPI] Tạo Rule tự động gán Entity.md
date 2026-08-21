---
category: "3.1 GLPI Playbook"
visibility: Technician / Supervisor / Super-Admin only
tags: [glpi, rules, entity, technician]
---

# [GLPI] Hướng dẫn tạo Rule tự động gán Entity cho Asset

## 1. Tóm tắt hiện tượng (Symptom)
Máy tính/thiết bị mới import qua inventory bị gán sai Entity (ví dụ máy ở chi nhánh HCM lại bị gán vào Entity gốc "Quảng Việt" thay vì "Chi nhánh HCM"), cần cấu hình lại Rule để tự động phân loại đúng.

## 2. Nguyên nhân (Root Cause)
GLPI không tự "đoán" Entity theo vị trí vật lý — cần cấu hình **Rule Engine** (`Administration > Rules`) để hệ thống tự động gán Entity dựa trên tiêu chí cụ thể (IP, Tag agent, tên miền OU của user...) mỗi khi có asset mới được import.

## 3. Các bước xử lý (Resolution)
1. Vào `Administration > Rules > Rules for assigning an item to an entity`.
2. Nhấn **Add**, đặt tên rule rõ ràng, ví dụ "Auto-assign Entity - HCM branch by IP".
3. Tab **Criteria**, thêm điều kiện: `IP address` → `is included in` → `10.20.20.0/24`.
4. Tab **Actions**, thêm hành động: `Entity` → `Assign` → chọn "Quảng Việt > Chi nhánh Hồ Chí Minh".
5. Lưu lại, kéo-thả sắp xếp thứ tự rule (rule cụ thể theo IP/Tag nên nằm **trên** rule mặc định catch-all).
6. Dùng nút **"Test"** trong màn hình rule — chọn "Simulate", nhập giá trị IP mẫu để xem trước kết quả trước khi áp dụng thật.

## 4. Thông tin bổ sung (Notes)
- Nếu dùng TAG khi cài agent (ví dụ `--tag=QV-HCM`), có thể tạo rule đơn giản hơn dựa theo Tag thay vì IP — ổn định hơn với thiết bị di động (laptop) hay đổi IP.
- Rule chạy theo thứ tự trên xuống, dừng ở rule đầu tiên khớp (trừ khi tick "Continue processing rules") — luôn đặt rule cụ thể lên trên, rule mặc định (không điều kiện) xuống cuối cùng.
- Đọc thêm chi tiết đầy đủ tại tài liệu Deployment Manual: `05. Inventory/Rules` và `04. Authentication/Entities`.
