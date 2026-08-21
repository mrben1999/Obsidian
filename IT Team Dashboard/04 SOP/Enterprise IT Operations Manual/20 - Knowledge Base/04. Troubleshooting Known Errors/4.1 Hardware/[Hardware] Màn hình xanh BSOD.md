---
category: "4.1 Hardware"
visibility: Technician / Supervisor / Super-Admin only
tags: [hardware, bsod, windows, technician, known-error]
---

# [Hardware] Màn hình xanh (BSOD - Blue Screen of Death)

## 1. Tóm tắt hiện tượng (Symptom)
Windows đột ngột hiện màn hình xanh kèm mã lỗi (ví dụ `MEMORY_MANAGEMENT`, `IRQL_NOT_LESS_OR_EQUAL`, `DPC_WATCHDOG_VIOLATION`), sau đó tự khởi động lại — có thể xảy ra ngẫu nhiên hoặc lặp lại thường xuyên khi làm một thao tác cụ thể.

## 2. Nguyên nhân (Root Cause)
BSOD xảy ra khi Windows gặp lỗi nghiêm trọng ở tầng kernel không thể tự phục hồi — nguyên nhân phổ biến theo mã lỗi:
- **Liên quan RAM** (`MEMORY_MANAGEMENT`, `PAGE_FAULT_IN_NONPAGED_AREA`): RAM lỗi vật lý hoặc driver xung đột.
- **Liên quan Driver** (`IRQL_NOT_LESS_OR_EQUAL`, `SYSTEM_SERVICE_EXCEPTION`): driver phần cứng (card mạng, card đồ họa) lỗi thời/xung đột.
- **Liên quan ổ đĩa** (`KERNEL_DATA_INPAGE_ERROR`): ổ cứng/SSD sắp hỏng hoặc cáp kết nối lỏng.

## 3. Các bước xử lý (Resolution)
1. **Ghi lại mã lỗi cụ thể** hiện trên màn hình xanh (chụp ảnh nếu kịp) — đây là thông tin quan trọng nhất để tra đúng nguyên nhân, không xử lý chung chung theo triệu chứng "máy xanh màn hình".
2. **Xem chi tiết log lỗi (sau khi máy khởi động lại):**
   ```
   eventvwr.msc → Windows Logs → System → tìm event màu đỏ (Error) trùng thời điểm crash
   ```
   Hoặc dùng công cụ chuyên dụng **BlueScreenView** (Nirsoft) để đọc file dump `.dmp` tại `C:\Windows\Minidump`.
3. **Chạy Windows Memory Diagnostic** để loại trừ nguyên nhân RAM:
   ```
   mdsched.exe
   ```
   Chọn "Restart now and check for problems", để chạy qua đêm nếu máy quan trọng cần chắc chắn.
4. **Cập nhật/rollback driver** nếu lỗi liên quan driver cụ thể (thường thấy tên driver ngay trong thông tin lỗi, ví dụ `nvlddmkm.sys` = driver NVIDIA):
   - Cập nhật lên bản mới nhất từ trang chủ hãng, hoặc
   - Rollback về driver cũ hơn nếu lỗi xuất hiện ngay sau khi update Windows/driver gần đây.
5. **Kiểm tra ổ đĩa** nếu nghi ngờ liên quan storage:
   ```
   chkdsk C: /f /r
   ```
   (yêu cầu khởi động lại để chạy)

## 4. Thông tin bổ sung (Notes)
- Nếu BSOD xảy ra **ngay sau khi cài Windows Update** hoặc cài driver/phần mềm mới, ưu tiên gỡ/rollback thứ vừa cài trước khi điều tra sâu hơn — đây là nguyên nhân phổ biến nhất trong thực tế.
- BSOD lặp lại nhiều lần dù đã update driver và test RAM/ổ đĩa không phát hiện lỗi → nhiều khả năng lỗi phần cứng (RAM/mainboard) không phát hiện được qua test phần mềm thông thường, cần gửi bảo hành kiểm tra chuyên sâu.
- Liên quan: [[[Hardware] Máy tính không lên nguồn]]
