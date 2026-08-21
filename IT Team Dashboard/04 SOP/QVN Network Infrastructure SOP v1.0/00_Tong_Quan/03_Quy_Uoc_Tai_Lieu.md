# 📐 Quy ước tài liệu & ký hiệu

## 1. Ký hiệu dùng xuyên suốt bộ SOP

| Ký hiệu | Ý nghĩa |
|---|---|
| ⚠️ | Bước rủi ro cao — có thể gây gián đoạn dịch vụ/mất kết nối nếu thao tác sai. Luôn có phương án rollback trước khi thực hiện. |
| 📌 | Ghi chú đặc thù cho môi trường nhà máy may mặc (kiosk, mạng xưởng, thiết bị cấu hình thấp, vận hành 1 người). |
| ✅ | Bước xác nhận/kiểm tra kết quả sau khi thực hiện. |
| 🔒 | Liên quan bảo mật — tuân thủ nghiêm ngặt, không bỏ qua dù đang gấp. |
| 💾 | Bước liên quan sao lưu (backup) — bắt buộc trước khi thay đổi cấu hình quan trọng. |

## 2. Định dạng khối lệnh CLI

- Lệnh CLI trình bày trong khối code, có chú thích dòng lệnh khi cần:
```
switchxxxxxx# configure terminal
switchxxxxxx(config)# vlan 30
```
- `switchxxxxxx` là prompt mẫu của Cisco CBS350 (theo đúng tài liệu Cisco Business 350 CLI Guide) — trên thiết bị thật, prompt sẽ hiển thị đúng hostname đã đặt (VD: `SW-ACC-XUONG-01#`).
- Lệnh PowerShell luôn ghi rõ cần chạy với quyền **Administrator**.
- Lệnh FortiOS CLI bắt đầu bằng `config`, kết thúc bằng `end` theo đúng cú pháp FortiOS.

## 3. Quy tắc trình bày SOP từng bước

Mỗi quy trình thao tác trong tài liệu này tuân theo cấu trúc chuẩn:

```markdown
### [Tên bước] — [Mục tiêu]
**Điều kiện tiên quyết:**
**Rủi ro (nếu có):** ⚠️
**Các bước thực hiện:**
1. ...
2. ...
**Kiểm tra kết quả:** ✅
**Rollback (nếu lỗi):**
```

## 4. Quy ước đặt tên file trong vault Obsidian
- File đánh số thứ tự 2 chữ số ở đầu tên (`01_`, `02_`...) để giữ đúng thứ tự đọc trong Obsidian File Explorer.
- Không dùng khoảng trắng đặc biệt/ký tự Unicode lạ trong tên file (an toàn cho sync/backup).
- Liên kết chéo giữa các tài liệu dùng cú pháp Wikilink `[[Tên file không đuôi .md]]` để Obsidian nhận diện và hiển thị trong Graph View.

## 5. Đối tượng sử dụng tài liệu
- **Người vận hành chính:** IT Manager (1 người duy trì toàn bộ hạ tầng).
- **Người dùng tham khảo:** Nhân sự IT mới được bàn giao, đối tác kỹ thuật hỗ trợ khi cần (kèm điều kiện bảo mật — xem [[../06_Van_Hanh_Chuan/05_Change_Management]]).

## 6. Mức độ ưu tiên khi có xung đột giữa tài liệu và thực tế thiết bị
Nếu cấu hình thực tế trên thiết bị khác với tài liệu này (do thay đổi khẩn cấp chưa kịp cập nhật tài liệu):
1. **Thiết bị thực tế luôn là nguồn đúng tại thời điểm hiện tại.**
2. Ngay sau khi xử lý xong, **cập nhật lại tài liệu này trong vòng 24 giờ** — không để tài liệu lệch thực tế kéo dài, vì đây là nguồn duy nhất khi cần bàn giao/khôi phục sau sự cố.
