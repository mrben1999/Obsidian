# 🔒 Phần 6.2 — Hardening Baseline tổng thể

## 1. Nguyên tắc bảo mật xuyên suốt toàn hệ thống

| Nguyên tắc | Áp dụng cụ thể |
|---|---|
| **Default Deny** | FortiGate Firewall Policy, NPS Network Policy — luôn có rule Deny mặc định cuối cùng |
| **Least Privilege** | Tài khoản dịch vụ (svc-*) chỉ quyền tối thiểu cần thiết, không dùng Domain Admin |
| **Defense in Depth** | Nhiều lớp bảo vệ: 802.1X (switch) + Firewall Policy (FortiGate) + Guest Isolation (UniFi) cho cùng 1 mục tiêu cô lập Guest |
| **Quản trị tập trung, cô lập** | Chỉ VLAN 99 truy cập giao diện quản trị mọi thiết bị mạng |
| **Không dùng tài khoản/mật khẩu mặc định** | Áp dụng cho AD Administrator, CBS350 `cisco`, FortiGate `admin`, UniFi `ubnt` |
| **Mã hoá khi có thể** | LDAPS thay LDAP, SSH thay Telnet, HTTPS thay HTTP, SNMPv3 thay SNMPv2 |

## 2. Bảng tổng hợp Hardening theo từng hệ thống (tham chiếu nhanh)

| Hệ thống | Việc đã làm | Chi tiết |
|---|---|---|
| AD DS | Password Policy 12 ký tự, đổi tên Administrator, Audit Policy, AD Recycle Bin | [[../01_Windows_Server_AD/08_Hardening_AD]] |
| NPS | Shared Secret riêng biệt từng RADIUS Client, Firewall giới hạn nguồn | [[../02_NPS_RADIUS/08_Checklist_Van_Hanh_NPS]] |
| CBS350 | Xoá tài khoản mặc định, SSH only, Port Security, BPDU Guard | [[../03_Cisco_CBS350/09_Checklist_Van_Hanh_CBS350]] |
| FortiGate | Quản trị chỉ từ VLAN 99, 2FA, Trusted Hosts, tắt quản trị WAN | [[../04_FortiGate_200F/08_Hardening_FortiGate]] |
| UniFi | RADIUS thay PSK, Guest Isolation, đổi tài khoản mặc định AP | [[../05_UniFi_Controller/08_Checklist_Van_Hanh_UniFi]] |

## 3. Ma trận truy cập quản trị (Admin Access Matrix)

| Thiết bị | Ai được quản trị | Từ đâu | Phương thức |
|---|---|---|---|
| AD DS/DC01 | IT Manager (tài khoản Domain Admin riêng, không dùng hàng ngày) | VLAN 99 | RDP có giới hạn IP nguồn |
| NPS | IT Manager | VLAN 99 (cùng server DC01) | Local console/RDP |
| CBS350 | IT Manager | VLAN 99 | SSH |
| FortiGate | IT Manager (qua AD sau khi tích hợp LDAP) | VLAN 99 | HTTPS/SSH + 2FA |
| UniFi Controller | IT Manager | VLAN 99 (hoặc VLAN 10 nơi đặt Controller) | HTTPS |

🔒 Không có thiết bị nào trong bảng trên được phép quản trị trực tiếp từ VLAN Office/Production/Wifi-Staff/Guest.

## 4. Rủi ro nền tảng cần theo dõi dài hạn
⚠️ **Windows Server 2012 R2 End of Extended Support** — rủi ro không thể khắc phục hoàn toàn bằng cấu hình, chỉ giảm thiểu. Xem chi tiết và khuyến nghị lộ trình tại [[../01_Windows_Server_AD/08_Hardening_AD]] mục 1.

## 5. Đánh giá bảo mật định kỳ (Security Review) — khuyến nghị hàng quý
- [ ] Rà soát toàn bộ tài khoản quản trị trên mọi thiết bị — không có tài khoản thừa.
- [ ] Rà soát Firewall Policy FortiGate — dọn rule không dùng đến.
- [ ] Rà soát Network Policy NPS — khớp đúng AD Group hiện tại.
- [ ] Kiểm tra bản vá/firmware mọi thiết bị — không có thiết bị nào chậm cập nhật quá 90 ngày (trừ trường hợp có lý do rõ ràng, ghi nhận riêng).
- [ ] Xem lại log truy cập quản trị bất thường trên toàn bộ hệ thống.
- [ ] Đối chiếu tài liệu này với thực tế cấu hình — cập nhật nếu có sai lệch (xem [[../00_Tong_Quan/03_Quy_Uoc_Tai_Lieu]] mục 6).

➡️ Tiếp theo: [[03_Kiem_Tra_Dinh_Ky]]
