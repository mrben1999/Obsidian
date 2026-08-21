---
category: "4.2 Software"
visibility: Technician / Supervisor / Super-Admin only
tags: [word, excel, font, known-error, technician]
---

# [Office] Lỗi hiển thị font trong Word/Excel

## 1. Tóm tắt hiện tượng (Symptom)
Mở file Word/Excel từ đồng nghiệp hoặc từ hệ thống cũ, chữ hiển thị sai (ô vuông, ký tự lạ, hoặc tiếng Việt bị lỗi dấu như "Ã¡Ã " thay vì "á à").

## 2. Nguyên nhân (Root Cause)
2 nhóm nguyên nhân phổ biến:
- **Thiếu font chữ:** file dùng font đặc thù (thường gặp với font tiếng Việt kiểu cũ: VNI, TCVN3/ABC) chưa được cài trên máy đang mở file.
- **Sai bảng mã (encoding):** file cũ dùng bảng mã tiếng Việt kiểu cũ (TCVN3, VNI-Windows) thay vì Unicode chuẩn hiện tại, khi mở bằng font Unicode sẽ hiển thị sai ký tự hoàn toàn.

## 3. Các bước xử lý (Resolution)

**Trường hợp thiếu font (chữ hiện ô vuông):**
1. Xác định tên font bị thiếu: bôi đen đoạn chữ lỗi, xem tên font hiện trong thanh công cụ Word/Excel.
2. Tải và cài font đó (nếu là font công ty dùng phổ biến, nên có sẵn trong kho font chuẩn của IT — liên hệ nếu chưa có).
3. Cài font: chuột phải file font (`.ttf`/`.otf`) → **Install** (hoặc **Install for all users** nếu cần dùng chung cho mọi tài khoản trên máy).
4. Mở lại file Word/Excel để font áp dụng.

**Trường hợp sai bảng mã (chữ ra ký tự lạ dạng "Ã¡Ã "):**
1. Xác định bảng mã gốc của file (thường là TCVN3 hoặc VNI-Windows nếu file cũ từ nhiều năm trước).
2. Dùng công cụ chuyển mã tiếng Việt (ví dụ Unikey ở chế độ "Chuyển mã" thay vì chỉ gõ tiếng Việt) để convert file từ bảng mã cũ sang Unicode.
3. Nếu không có công cụ chuyển mã sẵn, thử mở file bằng đúng font gốc (VNI-Times, .VnTime...) trước — nếu hiển thị đúng, đây là file mã cũ cần convert theo bước 2, không phải lỗi thiếu font.

## 4. Thông tin bổ sung (Notes)
- Khuyến khích toàn bộ tài liệu công ty dùng font Unicode chuẩn (Times New Roman, Arial...) để tránh lặp lại vấn đề này khi chia sẻ file — nêu trong hướng dẫn nội bộ cho nhân viên soạn thảo văn bản.
- Với file quan trọng gặp lỗi mã không tự xử lý được, không tự ý sửa từng ký tự thủ công — báo IT hỗ trợ công cụ chuyển mã chuyên dụng để tránh sai sót thêm.
