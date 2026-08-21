# 📅 Phần 6.3 — Kiểm tra định kỳ (tổng hợp lịch toàn hệ thống)

## 1. Lịch kiểm tra hàng ngày (tổng hợp)

| Hệ thống | Việc kiểm tra |
|---|---|
| AD DS | Dịch vụ NTDS/DNS/Netlogon chạy, backup đêm qua thành công |
| NPS | Dịch vụ IAS chạy, không cảnh báo bất thường |
| CBS350 | Không port lỗi/err-disabled bất thường |
| FortiGate | CPU/Memory/Session trong ngưỡng bình thường |
| UniFi | Toàn bộ AP Connected |

📌 Toàn bộ mục hàng ngày nên gộp thành **1 checklist buổi sáng** (10-15 phút) — xem mẫu tại [[../07_Phu_Luc/01_Bieu_Mau]].

## 2. Lịch kiểm tra hàng tuần (tổng hợp)

| Thứ | Hệ thống | Việc kiểm tra |
|---|---|---|
| Thứ 2 | AD DS | `dcdiag /v`, rà soát tài khoản locked-out |
| Thứ 3 | NPS | Rà soát log Access-Reject bất thường |
| Thứ 4 | CBS350 | Rà soát port err-disabled, RADIUS rejected users |
| Thứ 5 | FortiGate | Rà soát Forward Traffic log, FortiGuard update |
| Thứ 6 | UniFi | Rà soát RF Environment, Wireless Clients lạ |
| Cuối tuần | Backup tổng thể | Copy toàn bộ backup ra vị trí lưu trữ ngoài (xem [[01_Quy_Trinh_Backup_Tong_The]]) |

## 3. Lịch kiểm tra hàng tháng (tổng hợp)

- [ ] Rà soát tài khoản AD không hoạt động > 60 ngày.
- [ ] Rà soát thành viên nhóm quản trị (Domain Admins, GG-IT-Admin) trên toàn hệ thống.
- [ ] Kiểm tra hạn Certificate PEAP (NPS) còn > 30 ngày.
- [ ] Kiểm tra firmware/bản vá tất cả thiết bị (AD, CBS350, FortiGate, UniFi AP).
- [ ] Diễn tập khôi phục 1 phần (theo lịch tại [[01_Quy_Trinh_Backup_Tong_The]] mục 3).
- [ ] Đổi mật khẩu Guest Portal (nếu áp dụng).
- [ ] Rà soát Firewall Policy FortiGate — dọn rule thừa.

## 4. Lịch kiểm tra hàng quý

- [ ] Security Review toàn diện (xem [[02_Hardening_Baseline_Tong_The]] mục 5).
- [ ] Diễn tập restore config trên CBS350/FortiGate (nếu có thiết bị test).
- [ ] Rà soát sơ đồ mạng ([[../00_Tong_Quan/01_So_Do_Ha_Tang_Mang]]) — cập nhật nếu có thay đổi vật lý.
- [ ] Đánh giá lại nhu cầu băng thông/hiệu năng — có cần nâng cấp thiết bị không.

## 5. Lịch kiểm tra hàng năm

- [ ] Full DR Drill — diễn tập khôi phục toàn bộ hệ thống từ backup (giả lập mất DC hoàn toàn).
- [ ] Đánh giá lộ trình nâng cấp Windows Server 2012 R2 (xem rủi ro EOL tại [[../01_Windows_Server_AD/08_Hardening_AD]]).
- [ ] Rà soát toàn bộ license/hợp đồng hỗ trợ (FortiCare, Cisco, Ubiquiti) — gia hạn trước khi hết hạn.
- [ ] Đánh giá lại toàn bộ tài liệu SOP này — cập nhật theo thay đổi hạ tầng thực tế trong năm.

## 6. Bảng tổng hợp trách nhiệm (môi trường 1 IT Manager)
📌 Với quy mô 1 người vận hành, toàn bộ trách nhiệm dồn vào IT Manager — khuyến nghị dùng công cụ nhắc lịch (calendar, task management) để không bỏ sót các mục kiểm tra định kỳ, đặc biệt các mục hàng tháng/quý/năm dễ bị quên khi bận công việc hàng ngày.

➡️ Tiếp theo: [[04_Xu_Ly_Su_Co]]
