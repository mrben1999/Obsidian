# 🏛️ Phần 1.1 — Tổng quan kiến trúc Active Directory

## 1. Vai trò của AD trong hạ tầng nhà máy
Active Directory (AD DS) là **nguồn xác thực trung tâm (Single Source of Identity)** cho toàn bộ hạ tầng: đăng nhập máy trạm, xác thực Wi-Fi/mạng dây qua NPS/RADIUS, xác thực quản trị FortiGate/CBS350, và phân quyền truy cập tài nguyên nội bộ.

```mermaid
flowchart TB
    AD[(Active Directory<br/>DC01 - 10.10.10.10)]
    DNS[DNS Service]
    NPS[NPS/RADIUS]
    GPO[Group Policy]
    USERS[User & Computer Objects]

    AD --- DNS
    AD --- NPS
    AD --- GPO
    AD --- USERS

    NPS -.xác thực 802.1X/Wi-Fi.-> SW[Cisco CBS350]
    NPS -.xác thực Wi-Fi.-> AP[UniFi AP]
    AD -.LDAP Bind.-> FGT[FortiGate 200F]
```

## 2. Thành phần triển khai
| Thành phần | Vai trò | Ghi chú |
|---|---|---|
| **AD DS (Active Directory Domain Services)** | Lưu trữ user, group, computer, OU, GPO | Cài trên Windows Server 2012 R2 |
| **DNS Server** | Phân giải tên miền nội bộ, hỗ trợ AD hoạt động (SRV record) | Cài kèm khi triển khai AD DS |
| **NPS (Network Policy Server)** | RADIUS Server xác thực 802.1X/Wi-Fi | Xem chi tiết [[../02_NPS_RADIUS/01_Tong_Quan_NPS_RADIUS]] |
| **Group Policy (GPO)** | Áp đặt chính sách bảo mật, cấu hình lên máy trạm/máy chủ | |

## 3. Mô hình rừng/miền (Forest/Domain) áp dụng
- Quy mô nhà máy vừa và nhỏ (1 IT Manager vận hành) → khuyến nghị **1 Forest — 1 Domain**, không triển khai multi-domain phức tạp không cần thiết.
- Tên miền nội bộ mẫu: `qvn.local` (⚠️ khuyến nghị dùng domain nội bộ dạng `.local` hoặc subdomain riêng, **không dùng trùng domain public thật của công ty** để tránh xung đột DNS/certificate).

| Thông số | Giá trị mẫu |
|---|---|
| Forest/Domain name | `qvn.local` |
| NetBIOS name | `QVN` |
| Domain Functional Level | Windows Server 2012 R2 |
| Forest Functional Level | Windows Server 2012 R2 |

## 4. Vì sao vẫn dùng Windows Server 2012 R2
📌 Windows Server 2012 R2 đã hết vòng đời hỗ trợ mở rộng chính thức từ Microsoft (End of Extended Support: 10/10/2023). Nếu nhà máy đang vận hành bản này, tài liệu SOP này vẫn hướng dẫn đầy đủ theo thực tế hạ tầng hiện có, nhưng **khuyến nghị mạnh** lên kế hoạch nâng cấp lên phiên bản Windows Server còn được hỗ trợ (2019/2022) trong lộ trình trung hạn — xem ghi chú rủi ro tại [[08_Hardening_AD]] mục "Rủi ro vòng đời hệ điều hành".

## 5. Kiến trúc Domain Controller khuyến nghị
- **Tối thiểu 1 DC** (môi trường nhỏ) — nhưng khuyến nghị **2 DC** nếu ngân sách cho phép, để đảm bảo tính sẵn sàng (nếu DC01 lỗi, DC02 vẫn phục vụ xác thực, tránh toàn bộ mạng — kể cả 802.1X — bị gián đoạn).
- Nếu chỉ có 1 DC (thực tế phổ biến ở quy mô nhà máy vừa): **bắt buộc có kế hoạch backup/restore rõ ràng** (xem [[07_Backup_Restore_AD]]) vì đây là **single point of failure** cho toàn bộ xác thực mạng có dây/không dây.

## 6. Luồng tài liệu tiếp theo
1. [[02_Cai_Dat_Windows_Server_2012_R2]] — Cài hệ điều hành nền
2. [[03_Trien_Khai_AD_DS]] — Cài vai trò AD DS, dcpromo
3. [[04_Cau_Hinh_DNS_Cho_AD]] — Cấu hình DNS
4. [[05_Thiet_Ke_OU_GPO]] — Thiết kế OU/GPO theo cơ cấu nhà máy
5. [[06_Quan_Ly_User_Group]] — Vận hành user/group hàng ngày
6. [[07_Backup_Restore_AD]] — Backup/Restore
7. [[08_Hardening_AD]] — Hardening bảo mật
8. [[09_Checklist_Van_Hanh_AD]] — Checklist tổng hợp
