---
category: "4.1 Hardware"
visibility: Technician / Supervisor / Super-Admin only
tags: [hardware, power, technician, known-error]
---

# [Hardware] Máy tính không lên nguồn (No Power / No POST)

## 1. Tóm tắt hiện tượng (Symptom)
Nhấn nút nguồn nhưng máy tính hoàn toàn không phản ứng (không đèn, không quạt, không tiếng bíp) — hoặc quạt/đèn có chạy nhưng không lên hình (không POST).

## 2. Nguyên nhân (Root Cause)
Chia thành 2 nhóm nguyên nhân cần phân biệt rõ trước khi xử lý:
- **Không lên nguồn hoàn toàn:** thường do nguồn điện (adapter/PSU hỏng, dây nguồn lỏng), hoặc bo mạch chủ gặp sự cố.
- **Có nguồn nhưng không POST (không lên hình):** thường do RAM lỏng/hỏng, hoặc xung đột phần cứng mới lắp thêm.

## 3. Các bước xử lý (Resolution)

**Trường hợp A — Hoàn toàn không lên nguồn:**
1. Kiểm tra dây nguồn/adapter đã cắm chắc chắn cả 2 đầu (ổ điện và máy).
2. Thử ổ điện khác để loại trừ nguyên nhân do ổ điện/nguồn điện khu vực.
3. Với laptop: rút sạc, tháo pin (nếu tháo được), giữ nút nguồn 30 giây để xả điện tồn (drain residual power), sau đó cắm sạc lại và bật máy (không cần pin).
4. Với PC để bàn: kiểm tra công tắc nguồn phía sau bộ nguồn (PSU) đang ở vị trí "I" (On), thử đổi dây nguồn PSU.
5. Nếu vẫn không lên → nhiều khả năng hỏng PSU/adapter hoặc bo mạch chủ, cần gửi bảo hành/thay thế linh kiện — xem quy trình bảo hành trong Deployment Manual (`13. SOP/Bảo hành`).

**Trường hợp B — Có nguồn (quạt/đèn chạy) nhưng không lên hình (không POST) — cách kích nguồn/test RAM:**
1. Rút toàn bộ thiết bị ngoại vi không cần thiết (USB, ổ cứng rời...), chỉ để màn hình + bàn phím.
2. **Test RAM:** nếu máy có nhiều thanh RAM, tháo ra chỉ để lại 1 thanh, thử khởi động; nếu không lên, đổi sang thanh khác/khe cắm khác để loại trừ RAM hỏng hoặc khe cắm lỗi.
3. Vệ sinh chân RAM bằng tẩy/cồn isopropyl nếu nghi ngờ tiếp xúc kém (chân RAM bị oxy hóa), lắp lại chắc chắn nghe tiếng "click".
4. Lắng nghe số tiếng bíp khi khởi động (beep code) — số tiếng bíp thường tương ứng loại lỗi cụ thể theo hãng mainboard (tra cứu theo hãng: Dell/HP/ASUS...).
5. Nếu có card màn hình rời, thử tháo ra dùng cổng xuất hình onboard (nếu có) để loại trừ nguyên nhân do card rời.

## 4. Thông tin bổ sung (Notes)
- Không tự ý tháo/sửa bên trong PSU (bộ nguồn) — có điện áp cao tồn dư ngay cả khi đã rút điện, nguy hiểm nếu không có chuyên môn điện tử.
- Ghi lại đầy đủ triệu chứng cụ thể (số tiếng bíp, đèn báo màu gì, đứng ở bước nào) vào Ticket trước khi gửi bảo hành — giúp trung tâm bảo hành chẩn đoán nhanh hơn.
- Liên quan: [[[Hardware] Màn hình xanh BSOD]]
