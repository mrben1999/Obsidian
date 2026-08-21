# 🕒 Phụ lục 2 — Lịch sử thay đổi tài liệu

> Ghi nhận mọi thay đổi lớn của tài liệu SOP này (không phải lịch sử thay đổi cấu hình thiết bị — xem [[01_Bieu_Mau]] mục 3 cho Change Request cấu hình).

## Bảng lịch sử

| Ngày | Phiên bản | Người thực hiện | Nội dung thay đổi |
|---|---|---|---|
| 2026-07-08 | v1.0 | IT Manager | Phát hành lần đầu — đầy đủ 6 phần: AD, NPS, CBS350, FortiGate, UniFi, Vận hành chuẩn |

## Quy tắc cập nhật
1. Mọi thay đổi hạ tầng thực tế (đổi IP, thêm VLAN, đổi thiết bị, nâng cấp firmware/OS) phải phản ánh vào tài liệu tương ứng **trong vòng 24 giờ** (theo nguyên tắc tại [[../00_Tong_Quan/03_Quy_Uoc_Tai_Lieu]] mục 6).
2. Thay đổi nhỏ (sửa lỗi chính tả, làm rõ câu chữ) không cần tăng version, nhưng vẫn ghi 1 dòng vào bảng trên nếu đáng chú ý.
3. Thay đổi lớn (thêm/bớt cả 1 phần, đổi kiến trúc mạng) → tăng version (v1.1, v2.0...) và ghi rõ lý do.
4. Giữ nguyên các dòng lịch sử cũ — không xoá, chỉ thêm dòng mới ở cuối bảng.

## Mẫu dòng cập nhật
```markdown
| YYYY-MM-DD | v1.x | [Tên người thực hiện] | [Mô tả ngắn gọn thay đổi, kèm link tới phần liên quan] |
```
