---
category: "4.2 Software"
visibility: Technician / Supervisor / Super-Admin only
tags: [misa, bravo, accounting-software, known-error, technician]
---

# [Misa/Bravo] Các lỗi thường gặp với phần mềm kế toán

## 1. Tóm tắt hiện tượng (Symptom)
Phần mềm kế toán (Misa SME/Misa AMIS, Bravo) báo lỗi không kết nối được server dữ liệu, treo khi mở báo cáo lớn, hoặc lỗi in ấn hóa đơn/chứng từ.

## 2. Nguyên nhân (Root Cause)
Các lỗi phổ biến theo từng nhóm:
- **Lỗi kết nối server dữ liệu:** phần mềm kế toán chạy mô hình client-server, máy trạm cần kết nối tới server database nội bộ — lỗi thường do mất mạng LAN, sai địa chỉ server, hoặc dịch vụ SQL Server trên server chưa chạy.
- **Treo khi mở báo cáo lớn:** thường do dữ liệu tích lũy nhiều năm chưa được archive, hoặc máy trạm cấu hình yếu so với yêu cầu phần mềm.
- **Lỗi in ấn:** driver máy in không tương thích với template in của phần mềm, hoặc thiếu font chữ chuyên dụng cho hóa đơn.

## 3. Các bước xử lý (Resolution)

**Lỗi kết nối server dữ liệu:**
1. Kiểm tra máy trạm có truy cập được server qua mạng LAN không (`ping <IP server kế toán>`).
2. Trên server, kiểm tra dịch vụ SQL Server đang chạy:
   ```powershell
   Get-Service -Name "MSSQLSERVER" | Select Status
   # Nếu Stopped:
   Start-Service -Name "MSSQLSERVER"
   ```
3. Kiểm tra cấu hình kết nối trong phần mềm kế toán trên máy trạm (Tools/Cấu hình > Kết nối dữ liệu) có đúng IP/tên server không.

**Treo khi mở báo cáo lớn:**
1. Đóng hẳn phần mềm qua Task Manager nếu bị treo hoàn toàn, mở lại.
2. Đề xuất bộ phận Kế toán thu hẹp phạm vi báo cáo (theo quý thay vì theo năm) nếu dữ liệu quá lớn.
3. Với tình trạng lặp lại thường xuyên, báo cáo IT Manager để cân nhắc nâng cấu hình máy trạm hoặc làm việc với nhà cung cấp phần mềm về tối ưu hiệu năng.

**Lỗi in ấn hóa đơn/chứng từ:**
1. Kiểm tra driver máy in đã cập nhật bản mới nhất từ hãng.
2. Thử in file PDF xuất từ phần mềm ra máy in khác để xác định lỗi do máy in cụ thể hay do phần mềm.
3. Kiểm tra đã cài đủ font chuyên dụng cho mẫu hóa đơn (một số mẫu hóa đơn điện tử yêu cầu font riêng do nhà cung cấp phần mềm chỉ định).

## 4. Thông tin bổ sung (Notes)
- Phần mềm kế toán liên quan trực tiếp số liệu tài chính — **không** tự ý can thiệp vào dữ liệu/database khi chưa chắc chắn, nếu nghi ngờ lỗi dữ liệu (không chỉ lỗi kết nối/hiển thị), liên hệ ngay bộ phận hỗ trợ kỹ thuật của Misa/Bravo theo hợp đồng bản quyền.
- Ghi lại đầy đủ mã lỗi cụ thể hiển thị (nếu có) khi tạo Ticket hỗ trợ với nhà cung cấp — giúp xử lý nhanh hơn nhiều so với mô tả chung chung "phần mềm bị lỗi".

---
**Hoàn tất mục 4.2 Software (3 bài). Category 4 hoàn tất (5 bài).**
