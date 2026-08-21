---
category: "3.2 Infrastructure & Server"
visibility: Technician / Supervisor / Super-Admin only
tags: [firewall, security, technician]
---

# [Firewall] Hướng dẫn quản trị Firewall cơ bản

## 1. Tóm tắt hiện tượng (Symptom)
Cần mở/đóng port, thêm rule truy cập mới, hoặc kiểm tra log Firewall khi điều tra sự cố mạng/bảo mật.

## 2. Nguyên nhân (Root Cause)
Đây là hướng dẫn vận hành — Firewall là điểm kiểm soát truy cập trung tâm giữa mạng nội bộ Quảng Việt và Internet/giữa các VLAN nội bộ, mọi thay đổi rule cần thận trọng và ghi log lại.

## 3. Các bước xử lý (Resolution)
**Quy trình thêm rule mới (bắt buộc qua Change Request):**
1. Tạo Change Request trong GLPI (Template "Change") mô tả rõ: port/dải IP cần mở, lý do nghiệp vụ, thời gian áp dụng.
2. Qua phê duyệt IT Manager trước khi thao tác trên Firewall thật (kể cả với thay đổi nhỏ).
3. Thực hiện thay đổi trên Firewall, ghi lại rule ID/tên rule vào Change Request để dễ rollback.
4. Test lại kết nối sau khi áp dụng, đóng Change Request kèm kết quả xác nhận.

**Kiểm tra nhanh Firewall server GLPI (UFW, ở tầng OS — không thay thế Firewall hạ tầng chính):**
```bash
ufw status verbose
ufw allow from 192.168.1.0/24 to any port 22 proto tcp
```

## 4. Thông tin bổ sung (Notes)
- **Không** tự ý mở port ra Internet (0.0.0.0/0) cho bất kỳ dịch vụ nội bộ nào (kể cả tạm thời để "test nhanh") — đây là vi phạm chính sách bảo mật nghiêm trọng.
- Mọi rule Firewall nên có ghi chú rõ mục đích + ngày tạo + người tạo — tránh tình trạng "rule mồ côi" không ai biết dùng để làm gì sau nhiều năm.
- Liên quan: [[[Network] Sơ đồ mạng và Danh sách IP tĩnh]]

---
**Hoàn tất mục 3.2 Infrastructure & Server (3 bài).**
