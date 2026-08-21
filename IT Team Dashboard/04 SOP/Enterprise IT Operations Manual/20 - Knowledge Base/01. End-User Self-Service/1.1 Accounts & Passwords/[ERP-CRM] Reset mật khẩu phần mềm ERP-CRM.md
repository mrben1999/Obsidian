---
category: "1.1 Accounts & Passwords"
visibility: Public (toàn công ty)
tags: [erp, crm, password, misa, bravo]
---

# [ERP/CRM] Hướng dẫn reset mật khẩu phần mềm ERP/CRM

## 1. Tóm tắt hiện tượng (Symptom)
Không đăng nhập được vào phần mềm ERP/CRM nội bộ (ví dụ Misa, Bravo, hoặc CRM bán hàng riêng của công ty) do quên mật khẩu hoặc mật khẩu hết hạn — khác với mật khẩu Windows/AD.

## 2. Nguyên nhân (Root Cause)
Một số phần mềm ERP/CRM tại Quảng Việt **không** liên kết xác thực với Active Directory mà quản lý tài khoản/mật khẩu riêng biệt trong chính phần mềm đó — vì vậy đổi mật khẩu Windows sẽ **không** ảnh hưởng đến mật khẩu ERP/CRM, và ngược lại.

## 3. Các bước xử lý (Resolution)
1. Xác định đúng phần mềm đang gặp sự cố (Misa/Bravo/CRM riêng) — mỗi phần mềm có quy trình reset khác nhau, không tự ý thao tác nếu không chắc.
2. Tạo Ticket trên GLPI Self-Service Portal, chọn danh mục **"Tài khoản > Reset password"**, ghi rõ tên phần mềm cần reset.
3. Kỹ thuật viên IT sẽ xác minh danh tính qua điện thoại nội bộ trước khi thực hiện reset (theo quy trình bảo mật).
4. Sau khi reset, bạn sẽ được cấp mật khẩu tạm thời và bắt buộc đổi lại ngay lần đăng nhập đầu.

## 4. Thông tin bổ sung (Notes)
- IT không thể reset mật khẩu ERP/CRM qua điện thoại/chat — luôn cần xác minh trực tiếp để tránh rủi ro giả mạo (social engineering).
- Với phần mềm kế toán Misa/Bravo, nếu vẫn còn lỗi sau khi reset, xem thêm [[../../04. Troubleshooting Known Errors/4.2 Software/[Misa-Bravo] Lỗi phần mềm kế toán|bài lỗi phần mềm kế toán thường gặp]].
