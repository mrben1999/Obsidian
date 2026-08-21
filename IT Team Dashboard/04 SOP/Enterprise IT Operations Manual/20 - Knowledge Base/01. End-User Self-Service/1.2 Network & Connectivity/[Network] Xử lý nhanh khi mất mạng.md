---
category: "1.2 Network & Connectivity"
visibility: Public (toàn công ty)
tags: [network, troubleshooting, self-service]
---

# [Network] Xử lý nhanh khi mất mạng

## 1. Tóm tắt hiện tượng (Symptom)
Máy tính hiện biểu tượng "No Internet" hoặc "Limited connectivity", không mở được website/phần mềm cần mạng.

## 2. Nguyên nhân (Root Cause)
Phần lớn trường hợp mất mạng tại chỗ ngồi là do lỗi cục bộ (cáp mạng lỏng, WiFi bị rớt, IP hết hạn — DHCP lease expired) chứ không phải toàn bộ hệ thống mạng công ty bị sự cố. Kiểm tra vài bước cơ bản trước khi báo IT giúp tiết kiệm thời gian cho cả hai bên.

## 3. Các bước xử lý (Resolution)
1. Nếu dùng cáp mạng (LAN): kiểm tra đèn tín hiệu trên cổng mạng, thử rút-cắm lại cáp.
2. Nếu dùng WiFi: tắt WiFi rồi bật lại, hoặc kết nối lại mạng `QuangViet-Office` (xem [[[WiFi] Kết nối WiFi công ty]]).
3. Khởi động lại kết nối mạng bằng lệnh (Windows, mở Command Prompt):
   ```
   ipconfig /release
   ipconfig /renew
   ```
4. Thử truy cập 1 website bất kỳ để xác nhận đã có mạng lại chưa.
5. Nếu vẫn không được, hỏi đồng nghiệp ngồi gần có bị tương tự không:
   - Chỉ mình bạn bị → nhiều khả năng lỗi thiết bị/cáp mạng cá nhân, tạo Ticket ưu tiên Trung bình.
   - Cả khu vực/phòng ban đều bị → có thể sự cố switch/hạ tầng, tạo Ticket ưu tiên **Cao**, ghi rõ "cả phòng bị mất mạng" để IT ưu tiên xử lý.

## 4. Thông tin bổ sung (Notes)
- Không tự ý bấm nút reset trên switch/router trong phòng mạng — luôn báo IT xử lý.
- Nếu là sự cố diện rộng (nhiều phòng ban), IT thường đã biết và đang xử lý — vẫn nên tạo Ticket để có ghi nhận chính thức phục vụ thống kê SLA.
