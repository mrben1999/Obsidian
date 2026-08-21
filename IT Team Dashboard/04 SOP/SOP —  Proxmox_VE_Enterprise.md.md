---
type: SOP
area:
owner:
version: 1
last_reviewed: 2026-07-07
tags:
  - sop
---

#  TRIỂN KHAI VÀ CẤU HÌNH PROXMOX VE ENTERPRISE

---

## 1. TỔNG QUAN VÀ KIẾN TRÚC TIÊU CHUẨN (HLD)

Tài liệu này quy định quy trình chuẩn hóa (SOP) nhằm tải về, cài đặt, cấu hình và vận hành nền tảng ảo hóa **Proxmox Virtual Environment (PVE)** trong môi trường Doanh nghiệp. Quy trình đảm bảo các yếu tố: **Bảo mật (Security), Sẵn sàng cao (High Availability), và Khả năng dự phòng dữ liệu (Disaster Recovery).**

### 1.1. Các Mô Hình Triển Khai Tiêu Chuẩn

Tùy thuộc vào quy mô và nhu cầu của doanh nghiệp, chọn một trong ba mô hình kiến trúc sau:

| Tiêu chí                | Mô hình 1: Standalone Server   | Mô hình 2: Standard Cluster + Shared Storage | Mô hình 3: Hyper-Converged Infrastructure (HCI)     |
| :---------------------- | :----------------------------- | :------------------------------------------- | :-------------------------------------------------- |
| **Số lượng Node**       | 1 Node                         | Lớn hơn hoặc bằng 3 Nodes (để đạt Quorum)    | Lớn hơn hoặc bằng 3 Nodes (Khuyến nghị từ 5 Nodes)  |
| **Lưu trữ (Storage)**   | Local (ZFS / LVM-Thin)         | SAN (iSCSI/FC) hoặc NAS (NFS)                | **Ceph Cluster** (Phân tán trên các Node)           |
| **Tính năng HA**        | Không                          | Có (Yêu cầu Shared Storage)                  | Có (Tự động đồng bộ qua Ceph)                       |
| **Mạng lưới (Network)** | Tối thiểu 2 x 1G/10G (Bonding) | Tối thiểu 4 x 10G (LACP + Storage Separate)  | Tối thiểu 2 x 10G (Mesh) + 2 x 25G trở lên cho Ceph |
| **Phân khúc áp dụng**   | Chi nhánh nhỏ, Lab, Dev/Test   | Hệ thống Enterprise truyền thống             | Datacenter hiện đại, Scale-out liên tục             |

### 1.2. Sơ đồ Kiến trúc Hyper-Converged (HCI) 3-Node (Khuyến nghị cho Enterprise)

```mermaid
graph TD
    subgraph LAN_Network [Mạng Enterprise Co-location / Core Switch]
        SW_Core1((Core Switch A)) <--> SW_Core2((Core Switch B))
    end

    subgraph PVE_Cluster [Proxmox VE Full Mesh / Ceph Cluster]
        node1[Proxmox Node 1]
        node2[Proxmox Node 2]
        node3[Proxmox Node 3]
    end

    %% Network Connections
    SW_Core1 --- node1 & node2 & node3
    SW_Core2 --- node1 & node2 & node3

    %% Ceph Sync
    node1 <==>|25Gbps Full-Mesh Corosync/Ceph| node2
    node2 <==>|25Gbps Full-Mesh Corosync/Ceph| node3
    node3 <==>|25Gbps Full-Mesh Corosync/Ceph| node1
````

## 2. CHUẨN BỊ VÀ TẢI VỀ (DOWNLOAD & VERIFICATION)

### Lấy File ISO Gốc

- **Mục tiêu:** Đảm bảo tính toàn vẹn của bộ cài đặt, tránh mã độc.
    
- **Link tải bản Enterprise/Community ổn định:** [Proxmox VE Downloads](https://www.proxmox.com/en/downloads)
    
- **Phiên bản khuyến nghị:** Luôn sử dụng bản **LTS mới nhất** (Ví dụ: PVE 8.x mang Linux Kernel 6.x trở lên).
    

### Quy trình Xác thực SHA256 (Bắt buộc)

Chạy lệnh sau trên Terminal (Linux/macOS) hoặc PowerShell (Windows) để so sánh Checksum từ hãng:

Bash

```
# Trên Linux / macOS
sha256sum proxmox-ve_*.iso

# Trên Windows (PowerShell)
Get-FileHash .\proxmox-ve_*.iso -Algorithm SHA256
```

> [!WARNING] **CẢNH BÁO BẢO MẬT:** Tuyệt đối không tiến hành cài đặt nếu giá trị Hash sản sinh không trùng khớp với mã SHA256 công bố trên trang chủ Proxmox.

## 3. QUY TRÌNH CÀI ĐẶT (STEP-BY-STEP INSTALLATION)

### 3.1. Thiết lập BIOS/UEFI trên Server Phần cứng

1. Khởi động vào **BIOS/UEFI** (F2, F11, hoặc Del tùy dòng Dell/HP/Supermicro).
    
2. Bật công nghệ ảo hóa: **Intel VT-x / AMD-V** -> **Enabled**.
    
3. Bật tính năng chuyển hướng I/O: **Intel VT-d / AMD IOMMU** -> **Enabled**.
    
4. Chuyển đổi Boot Mode sang **UEFI Only**, tắt _Secure Boot_ nếu gặp lỗi nhận diện driver phần cứng bên thứ ba.
    
5. Cấu hình phần cứng RAID (nếu dùng Hardware RAID): Cấu hình ổ đĩa chạy RAID 10 hoặc RAID 1 cho OS. Nếu dùng **ZFS**, chuyển Controller sang chế độ **IT Mode / HBA Mode**.
    

### 3.2. Tiến trình Cài đặt OS

1. Cắm USB Boot (tạo bằng Rufus/Ventoy ở chế độ DD mode) hoặc Mount ISO qua IPMI/iDRAC/iLO.
    
2. Chọn **Install Proxmox VE (Graphical)**.
    
3. **Target Harddisk:**
    
    - Nếu dùng Hardware RAID/NVMe đơn lẻ: Chọn ổ đĩa, format `ext4` hoặc `XFS`.
        
    - Nếu dùng Software RAID ổn định cao: Chọn **ZFS (RAID1)** (yêu cầu tối thiểu 2 ổ đĩa có cùng dung lượng).
        
4. **Country, Time Zone, Layout:** Chọn `Vietnam`, `Asia/Ho_Chi_Minh`, `English (US)`.
    
5. **Management Network Configuration:**
    
    - **Management Interface:** Chọn Card mạng kết nối trực tiếp vào VLAN quản trị.
        
    - **Hostname:** Định dạng FQDN (Ví dụ: `pve01.enterprise.local`).
        
    - **IP Address:** Điền IP tĩnh cố định (VD: `10.10.10.11`).
        
    - **Netmask / Gateway / DNS Server:** Điền theo quy hoạch mạng hạ tầng.
        
6. Xác nhận lại thông tin tại trang **Summary** và nhấn **Install**. Hệ thống tự động Reboot sau khi hoàn tất.
    

## 4. CẤU HÌNH SAU CÀI ĐẶT & HARDENING (POST-INSTALLATION)

Thực hiện kết nối SSH vào IP của Node qua cổng `22` bằng quyền `root` để chạy các script tối ưu hạ tầng doanh nghiệp.

### 4.1. Chuyển đổi Repository từ Enterprise sang No-Subscription

Mặc định Proxmox yêu cầu License Enterprise để cập nhật. Đối với doanh nghiệp sử dụng bản Community, cần chuyển đổi để nhận bản vá bảo mật định kỳ.

Bash

```
# 1. Vô hiệu hóa Enterprise Repo
mv /etc/apt/sources.list.d/pve-enterprise.list /etc/apt/sources.list.d/pve-enterprise.list.bak

# 2. Thêm No-Subscription Repo thích hợp (Ví dụ cho PVE 8)
echo "deb [http://download.proxmox.com/debian/pve](http://download.proxmox.com/debian/pve) bookworm pve-no-subscription" > /etc/apt/sources.list.d/pve-no-subscription.list

# 3. Cập nhật hệ thống
apt update && apt dist-upgrade -y
```

### 4.2. Tối ưu hóa Mạng (Network Bonding cho High Availability)

Để tránh hiện tượng single point of failure (SPOF) ở card mạng, cấu hình **LACP (Link Aggregation Control Protocol - 802.3ad)**.

Truy cập **Web UI (`https://10.10.10.11:8006`)** -> **[Node Name]** -> **System** -> **Network**. Hoặc chỉnh sửa trực tiếp file `/etc/network/interfaces`:

Nginx

```
auto lo
iface lo inet loopback

iface enp3s0f0 inet manual
# Card mạng vật lý 1

iface enp3s0f1 inet manual
# Card mạng vật lý 2

auto bond0
iface bond0 inet manual
	bond-slaves enp3s0f0 enp3s0f1
	bond-miimon 100
	bond-mode 802.3ad
	bond-xmit-hash-policy layer2+3
# Khởi tạo Bond0 gộp hai card mạng chạy LACP

auto vmbr0
iface vmbr0 inet static
	address 10.10.10.11/24
	gateway 10.10.10.1
	bridge-ports bond0
	bridge-stp off
	bridge-fd 0
# Cầu nối mạng ảo gán cho các VM/CT sau này
```

Chạy lệnh áp dụng cấu hình mà không cần reboot: `ifreload -a` (Yêu cầu cài đặt gói `ifupdown2`).

### 4.3. Cấu hình Hệ thống Lưu trữ (Storage Standard)

- **LVM-Thin:** Dành cho lưu trữ cục bộ, tối ưu cho tốc độ của ổ SSD.
    
- **ZFS:** Cung cấp tính năng phục hồi dữ liệu, Snapshot nhanh, chạy RAID phần mềm ổn định.
    
- **Cấu hình NFS/iSCSI kết nối SAN:** Vào **Datacenter** -> **Storage** -> **Add** -> Chọn **NFS / iSCSI** -> Nhập IP Storage Controller của SAN/NAS để làm phân vùng chứa dữ liệu dùng chung cho Cluster (Phục vụ Live Migration).
    

### 4.4. Hardening & Bảo mật Hệ thống

1. **Giới hạn SSH:** Chỉ cho phép đăng nhập bằng SSH Key và đổi Port mặc định: Chỉnh sửa `/etc/ssh/sshd_config`:
    
    Ini, TOML
    
    ```
    Port 2222
    PermitRootLogin prohibit-password
    PasswordAuthentication no
    ```
    
2. **Kích hoạt Firewall mặc định trên Proxmox:**
    
    - Tại mức **Datacenter** -> **Firewall** -> Chọn **Options** -> Kích hoạt **Firewall: Yes**.
        
    - Tạo Rule chỉ cho phép dải IP quản trị truy cập vào Port `8006` (Web GUI) và `2222` (SSH).
        

## 5. CHIẾN LƯỢC SAO LƯU VÀ KHÔI PHỤC (BACKUP & DR STRATEGY)

Hệ thống Enterprise bắt buộc phải tuân thủ nguyên tắc sao lưu **3-2-1** (3 Bản sao, 2 Loại phương tiện lưu trữ, 1 Bản ngoài cơ sở). Khuyến nghị tích hợp hệ thống chuyên dụng **Proxmox Backup Server (PBS)**.

### 5.1. Mô hình Cấu hình Lịch trình Backup (Backup Schedule Setup)

Vào **Datacenter** -> **Backup** -> Chọn **Add**:

|**Thông số**|**Cấu hình Tiêu chuẩn**|**Ghi chú**|
|---|---|---|
|**Node**|All|Áp dụng toàn cụm|
|**Storage Target**|`PBS-Storage-Remote`|Lưu trữ sang máy chủ Backup chuyên dụng|
|**Selection Mode**|All Guests|Hoặc chọn theo Pool phòng ban|
|**Execution Time**|Hàng ngày vào lúc `01:00 AM`|Tránh giờ cao điểm làm việc|
|**Backup Mode**|**Snapshot**<br><br>[ ]|Đảm bảo không làm gián đoạn (Downtime) dịch vụ[ ]|
|**Compression**|ZSTD (Fast and good ratio)[ ]|Chế độ mặc định hiệu năng cao[ ]|

### 5.2. Chính sách Lưu trữ (Retention Policy)

Áp dụng chiến lược xoay vòng tại mục **Retention** của tác vụ Backup[ ]:

- `Keep Last`: 7 (Giữ 7 bản gần nhất)[ ]
    
- `Keep Daily`: 7 (Giữ 7 bản của 7 ngày gần nhất)[ ]
    
- `Keep Weekly`: 4 (Giữ 4 bản của 4 tuần gần nhất)[ ]
    
- `Keep Monthly`: 12 (Giữ 12 bản của 12 tháng gần nhất)[ ]
    

Code snippet

```
graph LR
    VM[Virtual Machine / CT] -->|VZDump / Snapshot| Local_Backup[(Local Storage ZFS)]
    VM -->|Deduplicated Incremental| PBS[(Proxmox Backup Server)]
    PBS -->|Sync Remote Job| Offsite_PBS[(Offsite DR Datacenter)]
```

## 6. QUY TRÌNH KIỂM TRA VÀ XÁC MINH (VERIFICATION)

Sau khi hoàn thành cấu hình, Kỹ sư triển khai phải thực hiện các bài test sau và ghi nhận kết quả vào biên bản nghiệm thu[ ]:

1. **Kiểm tra trạng thái Service:**
    
    Bash
    
    ```
    systemctl status pveproxy pvedaemon corosync
    ```
    
    _Yêu cầu:_ Tất cả dịch vụ ở trạng thái `active (running)` 
    
1. **Kiểm tra Network Failover:** Chạy lệnh ping liên tục từ máy ngoài vào IP Node, thực hiện rút đột ngột 1 trong 2 dây mạng thuộc nhóm **Bonding LACP**  _Yêu cầu:_ Hệ thống không mất gói (packet loss) hoặc chỉ mất tối đa 1 gói, dịch vụ Web GUI vẫn truy cập bình thường 
    
2. **Kiểm tra Khôi phục (Restore Test):** Thực hiện khôi phục thử nghiệm (Restore) một VM bất kỳ từ PBS sang một ID mới để kiểm tra tính toàn vẹn dữ liệu định kỳ mỗi tháng 
    

## 7. QUY TRÌNH QUAY LUI (ROLLBACK PROCEDURES)

Trong trường hợp Upgrade hệ thống hoặc chỉnh sửa file hệ thống lỗi gây sập Node[ ]:

1. **Khôi phục cấu hình Network mạng:** Nếu sau khi sửa file `/etc/network/interfaces` hệ thống mất mạng, kết nối trực tiếp qua KVM/IPMI và ghi đè lại file backup[ ]:
    
    Bash
    
    ```
    cp /etc/network/interfaces.bak /etc/network/interfaces
    ifreload -a
    ```
    
2. **Trường hợp lỗi Kernel sau khi Upgrade:** Khi Reboot, tại màn hình boot GRUB/systemd-boot, chọn **Advanced Options cho Proxmox VE**, chọn khởi động bằng **Kernel phiên bản cũ (vùng chạy ổn định trước đó)** để cứu hộ hệ thống 
    

## 8. CÁC LỆNH TROUBLESHOOTING NHANH CHO SYSADMIN

Khi hệ thống gặp sự cố Cluster hoặc Storage, sử dụng các lệnh sau để khoanh vùng lỗi[ ]:

Bash

```
# Xem trạng thái đồng bộ cụm Cluster (Nếu chạy từ 2 Node trở lên)
pvecm status

# Xem log thời gian thực của hệ thống ảo hóa
journalctl -f -u pvedaemon -u pveproxy

# Kiểm tra tình trạng kết nối các phân vùng Storage
pvesm status

# Kiểm tra hiệu năng IOPS và sức khỏe ổ đĩa ZFS (nếu có dùng ZFS)
zpool status
zpool iostat -v 5
```