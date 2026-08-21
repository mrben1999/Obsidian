# 💾 Phần 5.6 — Backup & Restore UniFi

## 1. Backup thủ công qua Controller

1. Đăng nhập UniFi Network Application (`https://10.10.10.20:8443`).
2. **Settings** → **System** → **Backups** (hoặc **Maintenance** tuỳ phiên bản giao diện).
3. Click **Download Backup** — tải file `.unf` (định dạng backup UniFi) về máy quản trị.

📌 File backup `.unf` chứa toàn bộ cấu hình: SSID, VLAN mapping, RADIUS Profile, danh sách AP đã adopt, Guest Portal settings.

## 2. Lập lịch backup tự động
1. **Settings** → **System** → **Auto Backup**.
2. Bật **Scheduled Backups**, chọn tần suất (khuyến nghị **Daily**), số bản backup giữ lại (VD: giữ 14 bản gần nhất).
3. Chỉ định thư mục lưu trên server chạy Controller.

📌 Vì backup tự động lưu **cùng server** với Controller, vẫn cần copy định kỳ ra vị trí lưu trữ ngoài (NAS/server backup riêng) theo quy tắc 3-2-1 — xem [[../06_Van_Hanh_Chuan/01_Quy_Trinh_Backup_Tong_The]].

## 3. Khôi phục từ file backup

⚠️ Restore sẽ ghi đè toàn bộ cấu hình hiện tại của Controller.

1. **Settings** → **System** → **Backups** → **Restore**.
2. Chọn file `.unf` cần khôi phục → **Upload** → **Restore**.
3. Controller sẽ khởi động lại dịch vụ, các AP sẽ tự động đồng bộ lại cấu hình sau khi Controller online trở lại.

📌 Sau khi restore, AP có thể mất vài phút để "provisioning" lại cấu hình mới — không rút nguồn AP trong thời gian này.

## 4. Backup khi thay Controller mới/di chuyển sang server khác
📌 Khi cần chuyển Controller sang máy chủ mới (nâng cấp phần cứng, đổi hệ điều hành):
1. Backup đầy đủ theo mục 1 trên Controller cũ.
2. Cài UniFi Network Application mới trên server đích (theo [[02_Cai_Dat_Controller_Adopt_AP]] mục 2).
3. Trong Setup Wizard của Controller mới, chọn **Restore from backup file** thay vì tạo mới từ đầu.
4. Sau khi restore xong, đảm bảo Controller mới dùng **cùng IP** (`10.10.10.20`) hoặc cập nhật lại địa chỉ Controller trên từng AP (`set-inform`, xem [[02_Cai_Dat_Controller_Adopt_AP]] mục 5) nếu đổi IP.

## 5. Kiểm tra tình trạng backup định kỳ
- [ ] ✅ Auto Backup đang hoạt động, có bản backup mới trong vòng 24-48 giờ.
- [ ] ✅ Đã copy ít nhất 1 bản backup/tuần ra vị trí lưu trữ ngoài server Controller.
- [ ] ✅ Đã thử restore trên môi trường test (nếu có) ít nhất 1 lần để xác nhận quy trình hoạt động — không đợi đến khi có sự cố thật mới biết backup có dùng được hay không.

➡️ Tiếp theo: [[07_Troubleshooting_UniFi]]
