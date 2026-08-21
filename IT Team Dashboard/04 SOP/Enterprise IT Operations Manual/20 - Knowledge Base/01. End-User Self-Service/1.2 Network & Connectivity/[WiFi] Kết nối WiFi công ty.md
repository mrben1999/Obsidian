---
category: "1.2 Network & Connectivity"
visibility: Public (toàn công ty)
tags: [wifi, network, self-service]
---

# [WiFi] Hướng dẫn kết nối WiFi công ty

## 1. Tóm tắt hiện tượng (Symptom)
Máy tính/điện thoại không kết nối được vào mạng WiFi nội bộ công ty (SSID `QuangViet-Office`), hoặc kết nối được nhưng không truy cập được Internet/tài nguyên nội bộ.

## 2. Nguyên nhân (Root Cause)
WiFi công ty dùng xác thực **WPA2-Enterprise** liên kết trực tiếp với tài khoản AD (không dùng chung 1 mật khẩu cho toàn công ty như mạng WiFi thông thường) — vì vậy cần nhập đúng username/password AD thay vì hỏi người khác xin "mật khẩu WiFi".

## 3. Các bước xử lý (Resolution)
1. Trên máy tính/điện thoại, vào danh sách WiFi, chọn mạng **`QuangViet-Office`**.
2. Khi được hỏi thông tin đăng nhập, nhập:
   - Username: tài khoản AD của bạn (ví dụ `nguyenvana`, không cần `@quangviet.local`)
   - Password: mật khẩu AD hiện tại (giống mật khẩu đăng nhập máy tính/email)
3. Nếu hệ thống hỏi xác nhận chứng chỉ (certificate), chọn **"Trust"/"Accept"** (đây là chứng chỉ CA nội bộ hợp lệ của công ty).
4. Đợi vài giây để kết nối và nhận IP.

## 4. Thông tin bổ sung (Notes)
- Nếu vừa đổi mật khẩu AD ([[[AD] Đổi mật khẩu Windows-AD]]), thiết bị di động cần **quên mạng WiFi cũ và kết nối lại** để cập nhật mật khẩu mới — máy tính Windows domain-joined thường tự cập nhật, không cần làm lại.
- Khách đến làm việc dùng mạng riêng **`QuangViet-Guest`** (không cần tài khoản AD, có mật khẩu công khai đổi hàng tuần — liên hệ lễ tân).
- Vẫn không kết nối được → xem [[[Network] Xử lý nhanh khi mất mạng]] hoặc tạo Ticket danh mục "Mạng > Mất kết nối".
