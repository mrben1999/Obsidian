# 🔐 Phần 4.5 — Tích hợp RADIUS & FSSO

## 1. So sánh 2 phương án tích hợp AD với FortiGate

| Phương án | Cách hoạt động | Dùng khi nào |
|---|---|---|
| **RADIUS** | User chủ động đăng nhập (VD: VPN, Captive Portal) → FortiGate gửi request tới NPS | Xác thực VPN, đăng nhập Captive Portal cho Guest có kiểm soát |
| **FSSO (Fortinet Single Sign-On)** | FortiGate "âm thầm" nhận biết user đã đăng nhập Windows/AD (qua Collector Agent) mà không cần đăng nhập lại | Áp Firewall Policy theo user tự động khi user đã đăng nhập máy trạm domain — trải nghiệm liền mạch, không yêu cầu đăng nhập thêm lần nào |

📌 Với kiến trúc nhà máy này: dùng **FSSO** cho luồng chính (máy trạm văn phòng/sản xuất đã login domain), và **RADIUS** cho các luồng cần đăng nhập tường minh (VPN từ xa, nếu có).

## 2. Cấu hình RADIUS Server trên FortiGate

```
config user radius
    edit "NPS-QVN"
        set server "10.10.10.10"
        set secret MatKhauSharedSecretFortiGate123
        set auth-type auto
    next
end
```
🔒 Shared Secret này phải khớp với RADIUS Client khai báo cho FortiGate trên NPS — nhớ khai báo thêm RADIUS Client `FGT-200F-01` (IP `10.10.10.1`) trên NPS theo [[../02_NPS_RADIUS/03_Cau_Hinh_RADIUS_Clients]] nếu dùng phương án này cho VPN.

Test kết nối:
```
diagnose test authserver radius NPS-QVN pap an.nguyen MatKhauCuaAnNguyen
```

## 3. Cài đặt FortiAuthenticator/FSSO Collector Agent (cho FSSO)
📌 FSSO cần một **Collector Agent** cài trên máy Windows trong domain (có thể cài trực tiếp trên DC01 ở quy mô nhỏ, hoặc máy riêng) — Collector Agent theo dõi sự kiện đăng nhập AD (Event Log Security Log) và gửi thông tin user↔IP về FortiGate theo thời gian thực.

**Các bước tổng quát (thực hiện trên DC01 hoặc server Windows riêng):**
1. Tải **FSSO Collector Agent** từ Fortinet Support Portal (yêu cầu tài khoản đã đăng ký thiết bị).
2. Cài đặt, trong quá trình cài chọn **DC Agent mode** hoặc **Polling mode**:
   - **Polling mode** (khuyến nghị cho môi trường 1 IT Manager — đơn giản hơn, không cần cài thêm DC Agent trên từng DC): Collector Agent định kỳ polling Event Log của DC để lấy thông tin đăng nhập.
   - **DC Agent mode**: cần cài thêm agent trực tiếp trên từng Domain Controller — phức tạp hơn, phù hợp môi trường nhiều DC.
3. Khai báo domain `qvn.local` và tài khoản dịch vụ có quyền đọc Security Event Log.

## 4. Cấu hình FortiGate nhận thông tin từ FSSO Collector Agent
```
config user fsso
    edit "FSSO-QVN"
        set server "10.10.10.10"
        set password MatKhauFSSOCollector123
        set port 8000
    next
end
```
📌 Port `8000` là port mặc định giao tiếp giữa FortiGate và FSSO Collector Agent — xác nhận lại port thực tế đã cấu hình khi cài Collector Agent (có thể tuỳ chỉnh).

## 5. Tạo FSSO Group tương ứng AD Group
```
config user adgrp
    edit "FSSO-GRP-Office"
        set server-name "FSSO-QVN"
        set group-name "QVN/QVN-Groups/SecurityGroups/GG-Wifi-VanPhong"
    next
end
```

## 6. Sử dụng trong Firewall Policy
📌 Sau khi cấu hình xong, User Group (LDAP) và FSSO Group đều có thể dùng trong `config firewall policy` ở mục `set groups` — xem chi tiết [[06_Firewall_Policy_Chuan]].

## 7. Kiểm tra FSSO hoạt động
```
diagnose debug authd fsso list
```
✅ Danh sách hiển thị các phiên user↔IP hiện tại mà FortiGate nhận được từ Collector Agent — xác nhận user đã đăng nhập máy trạm xuất hiện đúng với IP tương ứng.

Qua Web GUI: **Monitor → Firewall User Monitor** — xem danh sách user đang được FSSO nhận diện theo thời gian thực.

## 8. Sự cố thường gặp FSSO
| Triệu chứng | Nguyên nhân | Cách xử lý |
|---|---|---|
| FortiGate không nhận được user nào từ FSSO | Collector Agent chưa chạy, sai port/password | Kiểm tra service Collector Agent trên DC01, đối chiếu port/password |
| User bị "mất" khỏi danh sách sau một thời gian | Polling interval quá dài, hoặc user logoff | Kiểm tra cấu hình polling interval trong Collector Agent |
| FSSO nhận đúng user nhưng Policy không áp dụng | FSSO Group chưa khớp đúng tên group AD | Kiểm tra chính xác `group-name` (phân biệt hoa/thường, đúng cấu trúc OU) |

➡️ Tiếp theo: [[06_Firewall_Policy_Chuan]]
