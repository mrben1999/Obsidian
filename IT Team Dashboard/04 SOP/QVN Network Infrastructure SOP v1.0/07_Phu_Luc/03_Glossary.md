# 📖 Phụ lục 3 — Glossary (Thuật ngữ mạng)

| Thuật ngữ | Giải thích |
|---|---|
| **AD (Active Directory)** | Dịch vụ thư mục của Microsoft, lưu trữ và quản lý user/computer/group tập trung |
| **AD DS** | Active Directory Domain Services — vai trò server cung cấp dịch vụ AD |
| **RADIUS** | Giao thức xác thực tập trung (Remote Authentication Dial-In User Service), dùng cho 802.1X/VPN |
| **NPS** | Network Policy Server — RADIUS Server của Microsoft |
| **802.1X** | Chuẩn xác thực truy cập mạng theo cổng (port-based network access control) |
| **PEAP** | Protected EAP — phương thức EAP tạo kênh TLS trước khi xác thực, dùng phổ biến với MSCHAPv2 |
| **EAP** | Extensible Authentication Protocol — khung giao thức xác thực dùng trong 802.1X |
| **VLAN** | Virtual LAN — phân đoạn mạng logic trên cùng hạ tầng vật lý |
| **Trunk Port** | Cổng switch cho phép nhiều VLAN đi qua cùng 1 đường dây |
| **Access Port** | Cổng switch chỉ thuộc 1 VLAN duy nhất, dùng cho thiết bị đầu cuối |
| **STP/RSTP** | Spanning Tree Protocol/Rapid STP — giao thức chống loop mạng Layer 2 |
| **LACP** | Link Aggregation Control Protocol — gộp nhiều link vật lý thành 1 logic |
| **LDAP** | Lightweight Directory Access Protocol — giao thức truy vấn dịch vụ thư mục (AD) |
| **LDAPS** | LDAP over SSL/TLS — phiên bản mã hoá của LDAP |
| **FSSO** | Fortinet Single Sign-On — cơ chế FortiGate nhận diện user đã đăng nhập AD mà không cần đăng nhập lại |
| **NGFW** | Next-Generation Firewall — firewall thế hệ mới, tích hợp IPS/AV/Web Filter... |
| **UTM** | Unified Threat Management — bộ tính năng bảo mật tổng hợp trên firewall |
| **DHCP** | Dynamic Host Configuration Protocol — giao thức cấp phát IP tự động |
| **DNS** | Domain Name System — dịch vụ phân giải tên miền |
| **SRV Record** | Bản ghi DNS đặc biệt giúp client tìm dịch vụ (VD: Domain Controller) |
| **DSRM** | Directory Services Restore Mode — chế độ khởi động đặc biệt để khôi phục AD |
| **System State** | Tập hợp dữ liệu hệ thống quan trọng (AD DB, SYSVOL, Registry) dùng để backup/restore |
| **MAB** | MAC Authentication Bypass — xác thực dựa trên địa chỉ MAC thay vì 802.1X thật |
| **Guest VLAN** | VLAN dự phòng cho thiết bị không hỗ trợ 802.1X |
| **BPDU Guard** | Tính năng bảo vệ port khỏi thiết bị gửi BPDU trái phép (chống loop) |
| **Port Security** | Tính năng giới hạn số lượng/loại MAC address được phép trên 1 port switch |
| **Zone (FortiGate)** | Nhóm các Interface có cùng mức chính sách bảo mật |
| **Firewall Policy** | Luật kiểm soát traffic đi qua firewall (nguồn, đích, dịch vụ, hành động) |
| **Captive Portal** | Trang đăng nhập bắt buộc trước khi truy cập mạng Wi-Fi (thường dùng cho Guest) |
| **WPA2/3-Enterprise** | Chuẩn bảo mật Wi-Fi dùng xác thực RADIUS (khác WPA2-Personal dùng PSK) |
| **RSSI** | Chỉ số cường độ tín hiệu Wi-Fi nhận được |
| **PoE** | Power over Ethernet — cấp nguồn điện qua cáp mạng (dùng cho AP, camera IP...) |
| **Syslog** | Giao thức chuẩn gửi log hệ thống tới server tập trung |
| **SNMP** | Simple Network Management Protocol — giao thức giám sát thiết bị mạng |
| **MES** | Manufacturing Execution System — hệ thống điều hành thực thi sản xuất |
| **RTO/RPO** | Recovery Time Objective/Recovery Point Objective — mục tiêu thời gian khôi phục/điểm khôi phục dữ liệu sau sự cố |
