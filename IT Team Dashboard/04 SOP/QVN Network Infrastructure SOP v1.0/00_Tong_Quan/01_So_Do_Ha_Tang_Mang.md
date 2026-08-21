# 🗺️ Sơ đồ hạ tầng mạng tổng thể

## 1. Sơ đồ vật lý/logic tổng thể

```mermaid
flowchart TB
    INTERNET((Internet / ISP))
    FGT[FortiGate 200F<br/>Firewall & Gateway]
    CORE[Cisco CBS350<br/>Core/Distribution Switch]
    SRV_SW[Cisco CBS350<br/>Server Switch - VLAN 10]
    AP_SW[Cisco CBS350<br/>Access Switch - Xưởng]

    DC1[(Windows Server 2012 R2<br/>AD DS + DNS + NPS<br/>10.10.10.10)]
    UNIFI[(UniFi Controller<br/>10.10.10.20)]

    AP1[[UniFi AP - Văn phòng]]
    AP2[[UniFi AP - Xưởng may]]
    AP3[[UniFi AP - Kho]]

    PC_OFFICE[Máy trạm Văn phòng<br/>VLAN 20]
    PC_PROD[Máy trạm/Kiosk Xưởng<br/>VLAN 30]
    PC_MGMT[Máy trạm Quản lý IT<br/>VLAN 99]

    INTERNET --- FGT
    FGT --- CORE
    CORE --- SRV_SW
    CORE --- AP_SW
    SRV_SW --- DC1
    SRV_SW --- UNIFI
    AP_SW --- AP1
    AP_SW --- AP2
    AP_SW --- AP3
    AP_SW --- PC_OFFICE
    AP_SW --- PC_PROD
    CORE --- PC_MGMT

    FGT -.LDAP/RADIUS.-> DC1
    AP_SW -.802.1X RADIUS.-> DC1
    UNIFI -.RADIUS Auth.-> DC1
```

📌 **Ghi chú:** Đây là sơ đồ tham chiếu mẫu. Khi triển khai thực tế tại nhà máy, cập nhật số lượng switch/AP theo đúng hiện trạng và lưu bản cập nhật tại đây — đây là **nguồn sự thật duy nhất** cho sơ đồ mạng.

## 2. Luồng xác thực tổng thể (Authentication Flow)

```mermaid
sequenceDiagram
    participant Client as Thiết bị người dùng
    participant SW as Cisco CBS350 (802.1X Authenticator)
    participant AP as UniFi AP (Wireless)
    participant FGT as FortiGate 200F
    participant NPS as Windows NPS (RADIUS Server)
    participant AD as Active Directory

    Client->>SW: Kết nối cổng mạng (EAPoL Start)
    SW->>NPS: RADIUS Access-Request
    NPS->>AD: Kiểm tra username/password/group
    AD-->>NPS: Kết quả xác thực + group membership
    NPS-->>SW: RADIUS Access-Accept (kèm VLAN nếu có)
    SW-->>Client: Cấp quyền truy cập VLAN tương ứng

    Client->>AP: Kết nối Wi-Fi (WPA2/3-Enterprise)
    AP->>NPS: RADIUS Access-Request
    NPS->>AD: Kiểm tra username/password/group
    AD-->>NPS: Kết quả xác thực
    NPS-->>AP: RADIUS Access-Accept
    AP-->>Client: Cấp quyền truy cập mạng Wi-Fi

    FGT->>AD: LDAP Bind (tra cứu user/group) hoặc FSSO polling
    AD-->>FGT: Thông tin user/group cho Firewall Policy
```

## 3. Phân vùng mạng theo chức năng (Network Segmentation)

```mermaid
flowchart LR
    subgraph VLAN10["VLAN 10 - Server"]
        DC[AD/DNS/NPS Server]
        UNIFICTRL[UniFi Controller]
    end
    subgraph VLAN20["VLAN 20 - Văn phòng"]
        OFFICE[Máy trạm văn phòng]
    end
    subgraph VLAN30["VLAN 30 - Sản xuất/Xưởng"]
        MES_TERM[Kiosk MES / Dashboard]
    end
    subgraph VLAN40["VLAN 40 - Wi-Fi nhân viên"]
        WIFI_STAFF[Thiết bị Wi-Fi nhân viên]
    end
    subgraph VLAN50["VLAN 50 - Guest"]
        GUEST[Khách/Đối tác]
    end
    subgraph VLAN99["VLAN 99 - Quản trị IT"]
        MGMT[Máy IT Manager / Quản trị thiết bị]
    end

    FGT{{FortiGate 200F}}
    VLAN10 --- FGT
    VLAN20 --- FGT
    VLAN30 --- FGT
    VLAN40 --- FGT
    VLAN50 --- FGT
    VLAN99 --- FGT
```

## 4. Nguyên tắc thiết kế phân vùng
- **VLAN 10 (Server):** Cô lập hoàn toàn, chỉ truy cập từ VLAN 99 (quản trị) và các VLAN cần dịch vụ (DNS/AD/RADIUS) theo policy giới hạn.
- **VLAN 30 (Sản xuất):** Không cho phép truy cập Internet trực tiếp trừ khi có nhu cầu cụ thể (cập nhật phần mềm MES) — giảm bề mặt tấn công cho hệ thống vận hành sản xuất.
- **VLAN 50 (Guest):** Cô lập hoàn toàn khỏi các VLAN nội bộ khác, chỉ ra Internet.
- **VLAN 99 (Quản trị IT):** Là VLAN duy nhất có quyền truy cập giao diện quản trị (SSH/HTTPS) của FortiGate, CBS350, UniFi Controller.

> Xem chi tiết địa chỉ IP/VLAN tại [[02_Bang_Dia_Chi_IP_VLAN]].
