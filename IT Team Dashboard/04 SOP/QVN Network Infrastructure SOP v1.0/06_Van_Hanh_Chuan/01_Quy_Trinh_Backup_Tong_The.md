# 💾 Phần 6.1 — Quy trình Backup tổng thể

## 1. Nguyên tắc 3-2-1
🔒 Áp dụng cho **toàn bộ** hệ thống trong bộ SOP này (AD, NPS, CBS350, FortiGate, UniFi):

> **3** bản sao dữ liệu — **2** loại phương tiện lưu trữ khác nhau — **1** bản lưu ở vị trí khác (off-site/tách biệt).

| Bản sao | Vị trí | Ví dụ |
|---|---|---|
| Bản 1 (gốc) | Trên chính thiết bị/server | Startup-config trên switch, System State trên DC01 |
| Bản 2 | Lưu trữ nội bộ khác (NAS/server backup riêng) | `\\NAS-Backup\Network-Config\` |
| Bản 3 | Off-site hoặc tách biệt hoàn toàn (ổ cứng rời cất tủ khác/cloud storage riêng có mã hoá) | Ổ cứng backup mang về nhà/tủ chống cháy |

## 2. Bảng tổng hợp lịch backup toàn hệ thống

| Hệ thống | Loại backup | Tần suất | Nơi lưu | Tài liệu chi tiết |
|---|---|---|---|---|
| AD DS (System State) | Full | Hàng ngày (1:00 AM) | D:\ADBackup → NAS | [[../01_Windows_Server_AD/07_Backup_Restore_AD]] |
| NPS Config | Export XML | Sau mỗi thay đổi + hàng tháng | NAS | [[../02_NPS_RADIUS/08_Checklist_Van_Hanh_NPS]] |
| Cisco CBS350 (từng switch) | Running-config | Sau mỗi thay đổi + hàng tuần | TFTP/SFTP server → NAS | [[../03_Cisco_CBS350/07_Backup_Firmware]] |
| FortiGate 200F | Full config (mã hoá) | Hàng tuần + trước mọi thay đổi lớn | Local PC → NAS | [[../04_FortiGate_200F/07_Backup_Restore_Config]] |
| UniFi Controller | Full backup (.unf) | Hàng ngày (auto) | Server Controller → NAS | [[../05_UniFi_Controller/06_Backup_Restore_UniFi]] |

## 3. Kiểm tra tính toàn vẹn backup (không chỉ "có file" mà phải "dùng được")
📌 Backup tồn tại không đồng nghĩa backup dùng được — lỗi phổ biến là phát hiện file backup hỏng/rỗng đúng lúc cần khôi phục khẩn cấp.

**Lịch diễn tập khôi phục (Restore Drill) khuyến nghị:**
| Hệ thống | Tần suất diễn tập |
|---|---|
| AD (khôi phục 1 object từ Recycle Bin) | Hàng tháng |
| CBS350 (restore config trên switch test/nếu có) | Hàng quý |
| FortiGate (restore config trên thiết bị test/nếu có) | Hàng quý |
| UniFi (restore trên Controller test/nếu có) | Hàng quý |
| Full DR Drill (toàn bộ hệ thống, giả lập mất DC hoàn toàn) | Hàng năm |

## 4. Vai trò script tự động hoá (khuyến nghị cho môi trường 1 IT Manager)
📌 Viết 1 script PowerShell tổng hợp chạy định kỳ (Scheduled Task trên server quản trị) để:
1. SSH vào từng CBS350, chạy lệnh backup, lưu file về NAS.
2. Gọi API/CLI FortiGate export config, lưu về NAS.
3. Kiểm tra UniFi Auto Backup đã tạo file mới, copy sang NAS.
4. Gửi email/thông báo tổng hợp kết quả backup hàng đêm cho IT Manager — giúp phát hiện sớm nếu 1 khâu nào đó lỗi mà không cần kiểm tra thủ công từng hệ thống mỗi ngày.

## 5. Checklist backup tổng thể hàng tuần
- [ ] AD System State — có bản mới trong 24-48h.
- [ ] NPS config export — có bản mới nếu có thay đổi tuần này.
- [ ] Toàn bộ CBS350 — có bản backup mới nếu có thay đổi.
- [ ] FortiGate — có bản backup mới nếu có thay đổi.
- [ ] UniFi Controller — Auto Backup chạy đều đặn.
- [ ] Đã copy toàn bộ backup tuần này ra vị trí lưu trữ off-site/tách biệt.
- [ ] Dung lượng lưu trữ NAS/backup còn đủ (không bị đầy làm gián đoạn backup tiếp theo).

➡️ Tiếp theo: [[02_Hardening_Baseline_Tong_The]]
