# 💾 Phần 4.7 — Backup & Restore Config

## 1. Backup cấu hình thủ công

**Qua CLI:**
```
execute backup config tftp fgt-200f-01-2026-07-08.conf 10.10.10.50
```

**Qua Web GUI:** **System → Configuration → Backup** → chọn **Local PC** (mã hoá bằng mật khẩu nếu muốn) → tải file `.conf` về.

🔒 Khuyến nghị **luôn mã hoá file backup** (tick "Encrypt configuration file" khi backup qua GUI) vì file cấu hình FortiGate chứa nhiều thông tin nhạy cảm (password đã hash, secret key, cấu trúc mạng nội bộ chi tiết).

## 2. Tự động hoá backup định kỳ
📌 FortiGate hỗ trợ tự động gửi backup định kỳ qua **Automation** (FortiOS 6.4+) hoặc tích hợp với **FortiManager** nếu có — với quy mô 1 thiết bị đơn lẻ, phương án đơn giản là dùng **Scheduled Backup qua CLI script** kết hợp cron trên server quản trị (SSH vào FortiGate chạy lệnh backup định kỳ, lưu vào NAS/server nội bộ).

```
config system automation-trigger
    edit "weekly-backup-trigger"
        set trigger-type scheduled
        set trigger-frequency weekly
        set trigger-weekday sunday
        set trigger-hour 2
    next
end

config system automation-action
    edit "weekly-backup-action"
        set action-type config-backup
    next
end

config system automation-stitch
    edit "weekly-config-backup"
        set trigger "weekly-backup-trigger"
        set actions "weekly-backup-action"
    next
end
```
📌 Cú pháp `automation-*` có thể khác nhau tuỳ phiên bản FortiOS — xác nhận đúng cú pháp hỗ trợ trên thiết bị thật qua `config system automation-trigger ?` trước khi áp dụng; nếu không hỗ trợ, dùng phương án backup thủ công định kỳ theo checklist [[10_Checklist_Van_Hanh_FortiGate]].

## 3. Khôi phục cấu hình từ file backup

⚠️ **Rủi ro cao** — restore sẽ ghi đè toàn bộ cấu hình hiện tại và khởi động lại thiết bị.

**Qua CLI:**
```
execute restore config tftp fgt-200f-01-2026-07-08.conf 10.10.10.50
```

**Qua Web GUI:** **System → Configuration → Restore** → chọn file `.conf` đã backup → nhập mật khẩu giải mã (nếu có) → **OK**.

📌 Sau khi restore, thiết bị tự khởi động lại — thực hiện ngoài giờ sản xuất, chuẩn bị sẵn kế hoạch nếu restore không thành công (kết nối lại qua Console cable để xử lý khẩn cấp).

## 4. Backup License & Certificate riêng
📌 File backup cấu hình **không** bao gồm License key và một số Certificate tự tạo — lưu riêng các thông tin sau ở nơi an toàn:
- [ ] License key/Serial Number thiết bị.
- [ ] Certificate SSL Inspection (nếu có tạo riêng, dùng cho tính năng deep packet inspection HTTPS).
- [ ] Thông tin đăng ký FortiCare (email, thông tin tài khoản Fortinet Support Portal).

## 5. Kiểm tra tình trạng backup định kỳ
- [ ] ✅ Có bản backup mới nhất trong vòng 7 ngày gần nhất.
- [ ] ✅ File backup đã copy ra vị trí lưu trữ ngoài thiết bị (theo quy tắc 3-2-1, xem [[../06_Van_Hanh_Chuan/01_Quy_Trinh_Backup_Tong_The]]).
- [ ] ✅ Đã thử giải mã/mở thử 1 file backup để xác nhận không lỗi (không phải file rỗng/hỏng).

➡️ Tiếp theo: [[08_Hardening_FortiGate]]
