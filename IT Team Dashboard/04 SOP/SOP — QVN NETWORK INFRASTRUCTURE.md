---
type: SOP
area:
owner:
version: 1
last_reviewed: 2026-07-07
tags:
  - sop
---

# 📋 SOP — QVN NETWORK INFRASTRUCTURE

## 1. Mục đích
>- Đảm bảo tính sẵn sàng cao ($99.99\%$), tính bảo mật và toàn vẹn của dữ liệu trong môi trường sản xuất của nhà máy QVN.
    
- Thiết lập cơ chế phòng thủ chiều sâu thông qua quy trình Hardening nghiêm ngặt theo tiêu chuẩn CIS Benchmarks.
    
- Chuẩn hóa quy trình sao lưu (Backup) và phục hồi thảm họa (Disaster Recovery) nhằm giảm tối đa chỉ số RTO (Recovery Time Objective) và RPO (Recovery Point Objective).
    
- Cung cấp cẩm nang xử lý sự cố (Troubleshooting Playbook) từng bước theo mô hình OSI giúp cô lập lỗi nhanh chóng.

## 2. Phạm vi áp dụng
>SOP này quy định các thủ tục tiêu chuẩn áp dụng cho toàn bộ hạ tầng mạng lõi, mạng phân phối, mạng truy cập nhà xưởng (OT/Production), hệ thống Wifi công nghiệp, hệ thống tường lửa (Next-Gen Firewall) và các dịch vụ hạ tầng core (Active Directory, DNS, DHCP) thuộc sở hữu của Tập đoàn QVN. Đối tượng áp dụng bao gồm đội ngũ Kỹ sư Mạng (Network Engineers), Quản trị viên Hệ thống (System Administrators) và Đội ngũ Giám sát Vận hành (NOC/SOC Engineers).

## 3.Vai trò & trách nhiệm
| Vai trò                                                            | Trách nhiệm                                                                                                    |
| ------------------------------------------------------------------ | -------------------------------------------------------------------------------------------------------------- |
| - **Chief Infrastructure Officer (CIO) / Network Architect:** <br> | Phê duyệt kiến trúc bảo mật, chính sách backup và các thay đổi cấu hình lớn (Major Changes).                   |
| **- Senior Network Engineer:** <br>    <br>                        | Thực hiện hardening thiết bị, xử lý sự cố Layer 3/Routing/Core và giám sát tính toàn vẹn của cấu hình sao lưu. |
| **- System Administrator:** <br>    <br>                           | Chịu trách nhiệm vận hành, backup và hardening hệ thống Windows Server (AD, DNS, DHCP).                        |
| **- NOC Operator:**                                                | Thực hiện checklist kiểm tra định kỳ hàng ngày/hàng tuần, phát hiện cảnh báo sớm qua hệ thống giám sát.        |

## 4. QUY TRÌNH VẬN HÀNH & KIỂM TRA ĐỊNH KỲ (MAINTENANCE RUNBOOK)

Hệ thống giám sát trung tâm sử dụng **Zabbix** kết hợp **Grafana** để trực quan hóa dữ liệu hiệu năng của toàn bộ nhà máy QVN.

### 4.1. Sơ đồ luồng dữ liệu giám sát hệ thống (Monitoring Workflow)

Đoạn mã

```
graph TD
    A[Hạ tầng Nhà máy QVN] -->|SNMP v3 / Syslog Secure| B(Hệ thống Giám sát Zabbix Core)
    A -->|NetFlow v9| C(Flow Analyzer)
    B -->|API Integration| D[Bảng điều khiển Grafana Dashboard]
    B -->|Trigger Threshold Exceeded| E{Phân loại Cảnh báo}
    E -->|Critical / Disaster| F[Telegram/SMS Alert to Level 3 Engineer]
    E -->|Warning / Average| G[Ticket ITSM tự động tạo trên Jira Service Desk]
```

### 4.2. Checklist kiểm tra định kỳ (Periodic Auditing Checklists)

#### Checklist Hàng Ngày (Daily Operational Tasks)

Thực hiện vào đầu ca sáng (08:00 AM) và cuối ca chiều (05:00 PM) bởi NOC Operator.

|**STT**|**Thành phần**|**Nội dung kiểm tra**|**Trạng thái bình thường**|**Lệnh kiểm tra / Công cụ**|
|---|---|---|---|---|
|1|Cisco Core Switch|Kiểm tra CPU/Memory Utilization|CPU < 30%, Mem Free > 40%|`show processes cpu sorted \| exclude 0.00%`<br><br>  <br><br>`show memory statistics`|
|2|Cisco Core Switch|Kiểm tra nhiệt độ và nguồn (PSU)|Status: Operational / OK|`show environment power`<br><br>  <br><br>`show environment temperature`|
|3|Core Links (LACP)|Trạng thái bó cổng EtherChannel|State: Bundle (P) trên toàn bộ Member Ports|`show etherchannel summary`|
|4|NGFW FortiGate|Số lượng session hiện tại & CPU|CPU < 40%, Session < 50% Limit|`get system performance status`|
|5|Windows AD/DHCP|Kiểm tra trạng thái dịch vụ|Services: Running|PowerShell: `Get-Service adws,dns,dhcp`|
|6|UPS Datacenter|Dung lượng pin và tải nguồn|Battery Capacity = 100%, Load < 60%|Web GUI APC / Network Management Card|

#### Checklist Hàng Tuần (Weekly Operational Tasks)

Thực hiện vào ngày Thứ Sáu hàng tuần trước 04:00 PM.

- [ ] Kiểm tra log lỗi vật lý trên toàn bộ Access Switch nhà xưởng: `show interfaces counters errors` (Đảm bảo không có lỗi CRC tăng dần do nhiễu công nghiệp).
    
- [ ] Kiểm tra trạng thái đồng bộ thời gian NTP: `show ntp status` (Stratum đúng, đồng bộ về Core NTP Server).
    
- [ ] Kiểm tra dung lượng bộ nhớ lưu trữ các phân vùng Log trên Zabbix Server và FortiAnalyzer (Đảm bảo dung lượng trống > 30%).
    
- [ ] Rà soát danh sách cấp phát DHCP (IP Scope Exhaustion): Đảm bảo các dải IP cho thiết bị IoT/AGV trong nhà xưởng còn trống tối thiểu 20%.
    

## 5. QUY TRÌNH SAO LƯU & PHỤC HỒI CẤU HÌNH (BACKUP & DISASTER RECOVERY RUNBOOK)

Chính sách lưu trữ cấu hình mạng áp dụng nguyên tắc **3-2-1**: 3 bản sao, 2 loại phương tiện lưu trữ khác nhau (Local Disk & NAS), 1 bản lưu ngoài site (Cloud/DR Site).

### 5.1. Tự động hóa Backup thiết bị Cisco Core/Distribution qua Ansible

Kỹ sư mạng sử dụng script Ansible định kỳ chạy vào lúc 11:00 PM hàng ngày để lấy file `running-config` và đẩy về máy chủ lưu trữ an toàn (SFTP Server).

#### Ansible Playbook (`cisco_backup.yml`)

YAML

```
---
- name: QVN NETWORK INFRASTRUCTURE AUTOMATED BACKUP
  hosts: cisco_switches
  gather_facts: no
  connection: network_cli
  vars:
    backup_root: "/var/net_backups/cisco/{{ ansible_date_time.date }}"

  tasks:
    - name: Ensure backup directory exists locally
      delegate_to: localhost
      ansible.builtin.file:
        path: "{{ backup_root }}"
        state: directory
        mode: '0750'

    - name: Collect Cisco iOS running-config
      cisco.ios.ios_facts:
        gather_subset:
          - config

    - name: Save configuration to backup server
      delegate_to: localhost
      ansible.builtin.copy:
        content: "{{ ansible_facts.net_config }}"
        dest: "{{ backup_root }}/{{ inventory_hostname }}_config.cfg"
        mode: '0640'
```

### 5.2. Sao lưu trạng thái Active Directory & Cấu hình DHCP (Windows Server)

Môi trường Windows Server điều hành định danh cho toàn bộ máy trạm văn phòng và hệ thống ERP/MES.

#### Kịch bản PowerShell Backup DHCP Database định kỳ:

PowerShell

```
# QVN Windows Infrastructure Backup Script - DHCP Scope & DB
$BackupPath = "D:\Backups\DHCP\"
$DateStamp = Get-Date -Format "yyyyMMdd"
$TargetFolder = Join-Path $BackupPath $DateStamp

if (!(Test-Path $TargetFolder)) {
    New-Item -ItemType Directory -Force -Path $TargetFolder
}

# Export cấu hình DHCP đầy đủ
Backup-DhcpServer -ComputerName "QVN-DC-01" -Path $TargetFolder
Export-DhcpServer -ComputerName "QVN-DC-01" -File "$TargetFolder\dhcp_export.xml" -Force

# Ghi log sự kiện vào Event Viewer
Write-EventLog -LogName "Application" -Source "DHCP-Backup-Script" -EventID 1001 -EntryType Information -Message "DHCP Backup completed successfully for $DateStamp."
```

### 5.3. Quy trình phục hồi thảm họa thiết bị Switch Cisco (Disaster Recovery LLD)

Khi một thiết bị Switch Access tại khu vực nhà xưởng bị hư hỏng vật lý hoàn toàn do chập cháy nguồn điện công nghiệp:

Đoạn mã

```
sequenceDiagram
    participant ENG as Kỹ sư Mạng QVN
    participant TFTP as Máy chủ SFTP/TFTP
    participant NSW as Switch Mới (Thay thế)
    
    ENG->>NSW: Kết nối dây cáp Console (Baud 9600)
    ENG->>NSW: Đặt IP tạm thời cho cổng Management (Giả định: Fa0/0 hoặc Vlan 1)
    NSW->>NSW: Router(config)# interface vlan 1<br>Router(config-if)# ip address 10.250.1.2 255.255.255.0<br>Router(config-if)# no shutdown
    ENG->>NSW: Thực hiện lệnh download cấu hình từ SFTP Server
    NSW->>TFTP: Request file backup thông qua giao thức bảo mật
    TFTP-->>NSW: Truyền tải file cấu hình chuẩn: [hostname]_config.cfg
    ENG->>NSW: Kiểm tra tính toàn vẹn và ghi vào bộ nhớ NVRAM
    NSW->>NSW: Router# copy tftp://10.250.1.10/sw-factory-01.cfg running-config<br>Router# copy running-config startup-config
    ENG->>NSW: Khởi động lại thiết bị để kiểm tra nạp cấu hình hoàn chỉnh
```

## 6. QUY TRÌNH BẢO MẬT & HARDENING THIẾT BỊ (HARDENING GUIDE)

Áp dụng mô hình **Zero Trust Architecture** và **Defense in Depth** để triệt tiêu bề mặt tấn công.

### 6.1. Hardening thiết bị Switch Cisco Catalyst (CLI Standard)

Toàn bộ Switch phải tuân thủ bộ quy tắc an ninh nghiêm ngặt, vô hiệu hóa các giao thức truyền thông rõ (Clear-text), giới hạn truy cập quản trị thông qua Access-Control List (ACL).

Plaintext

```
! 1. Vô hiệu hóa dịch vụ phân giải tên miền local không an toàn
no ip domain-lookup

! 2. Kích hoạt mã hóa mạnh cho toàn bộ mật khẩu hệ thống
password encryption sign-on
service password-encryption

! 3. Tạo tài khoản cục bộ mật khẩu băm thuật toán SHA-256 (Secret 5/8)
username qvn-admin secret 9 $9$X7eR...[Chuỗi mã hóa an toàn]

! 4. Cấu hình SSH Version 2 và giới hạn thông số mã hóa cryptographic mạnh
ip domain-name qvn.vn
crypto key generate rsa modulus 4096
ip ssh version 2
ip ssh time-out 60
ip ssh authentication-retries 3

! 5. Cấu hình Access-List giới hạn các IP quản trị (Chỉ cho phép từ VLAN Management)
ip access-list standard ACL_MANAGEMENT_ACCESS
 permit 10.250.10.0 0.0.0.255
 deny any log

! 6. Áp dụng vào các đường ảo VTY, vô hiệu hóa hoàn toàn Telnet
line vty 0 4
 access-class ACL_MANAGEMENT_ACCESS in
 transport input ssh
 exec-timeout 10 0
 logging synchronous
line vty 5 15
 access-class ACL_MANAGEMENT_ACCESS in
 transport input ssh
 exec-timeout 10 0

! 7. Chống giả mạo DHCP trong mạng nhà xưởng (DHCP Snooping)
ip dhcp snooping
ip dhcp snooping vlan 10,20,30
interface Deployment-Core-Uplink
 ip dhcp snooping trust

! 8. Khóa bảo mật cổng lớp vật lý đối với máy trạm cố định (Port Security)
interface GigabitEthernet1/0/1
 switchport mode access
 switchport access vlan 20
 port-security
 port-security maximum 2
 port-security violation shutdown
 port-security aging time 10
 spanning-tree portfast
 spanning-tree bpduguard enable
```

### 6.2. Hardening hạ tầng Microsoft Active Directory & Core Services

#### Chính sách nhóm (Group Policy Object - GPO) bắt buộc áp dụng:

- **Account Lockout Policy:** Khóa tài khoản sau `5` lần nhập sai mật khẩu trong vòng `15` phút. Thời gian khóa tự động là `30` phút.
    
- **Password Complexity:** Độ dài tối thiểu `12` ký tự, bao gồm chữ hoa, chữ thường, số và ký tự đặc biệt. Thay đổi mật khẩu định kỳ tối đa `90` ngày.
    
- **Vô hiệu hóa giao thức cũ (Legacy Protocols):** Khóa hoàn toàn giao thức SMBv1 trên toàn hệ thống mạng bằng cách triển khai GPO Registry Keys:
    
    - Path: `HKLM:\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters`
        
    - Value Name: `SMB1`, Value Type: `DWORD`, Value Data: `0`
        

#### Hardening dịch vụ DNS chống giả mạo độc hại:

Kích hoạt tính năng bảo mật phản hồi DNS (DNS Cache Locking) và cấu hình khóa tỷ lệ $95\%$ thời gian TTL của bản ghi nhằm triệt tiêu hình thức tấn công _DNS Cache Poisoning_.

PowerShell

```
Set-DnsServerCache -CacheLockingPercent 95
```

## 7. QUY TRÌNH XỬ LÝ SỰ CỐ MẠNG & HỆ THỐNG (TROUBLESHOOTING PLAYBOOK)

Phương pháp tiếp cận xử lý sự cố phải tuân thủ nghiêm ngặt theo **Mô hình 7 lớp OSI**, đi từ Lớp Vật lý (Bottom-up) để tránh bỏ sót các nguyên nhân căn bản.

### 7.1. Ma trận phân loại mức độ nghiêm trọng của sự cố (Severity Matrix)

|**Cấp độ (Severity)**|**Định nghĩa**|**Tác động doanh nghiệp**|**Thời gian xử lý tối đa (SLA)**|
|---|---|---|---|
|**P1 - Critical**|Sập hoàn toàn mạng Core, đứt liên kết WAN chính, hệ thống ERP/MES ngưng hoạt động.|Nhà máy dừng sản xuất, thiệt hại > 500,000,000 VND / giờ.|**< 30 phút**|
|**P2 - Major**|Mất kết nối diện rộng tại một nhà xưởng (Access Switch mất nguồn hoặc lặp mạch STP).|Một dây chuyền sản xuất bị gián đoạn cục bộ.|**< 2 giờ**|
|**P3 - Minor**|Lỗi kết nối mạng Wifi của một nhóm người dùng, mất kết nối máy in, thiết bị ngoại vi.|Nhân viên văn phòng không làm việc được một phần công năng.|**< 8 giờ**|

### 7.2. Quy trình từng bước cô lập sự cố mất kết nối mạng diện rộng (P1/P2)

Khi nhận được cảnh báo hệ thống hoặc báo cáo từ bộ phận sản xuất về hiện tượng mất kết nối:

#### Bước 1: Thu thập triệu chứng mạng (Symptoms Gathering)

Thực hiện ping liên tục đến Gateway mặc định của vùng bị ảnh hưởng và máy chủ đích. Xem log tập trung tại máy chủ Syslog Server (`FortiAnalyzer`).

#### Bước 2: Kiểm tra Lớp Vật lý & Lớp 2 (Physical & Layer 2 Validation)

Tru cập thiết bị Switch phân phối vùng kết nối trực tiếp với nhà xưởng và thực thi các lệnh chẩn đoán sau:

Plaintext

```
! Kiểm tra trạng thái vật lý cổng kết nối quang Uplink
QVN-Core-SW01# show interfaces gigabitethernet 1/0/49
! Output mong muốn: GigabitEthernet1/0/49 is up, line protocol is up
! Nếu status là down/down -> Kiểm tra cáp, module quang SFP, nguồn điện converter.

! Kiểm tra bộ đếm lỗi cổng xem có nhiễu điện từ trường công nghiệp gây mất gói không
QVN-Core-SW01# show interfaces gigabitethernet 1/0/49 counters errors
! Nếu CRC errors tăng liên tục -> Lỗi cáp quang suy hao hoặc đầu tiếp xúc patch cord bẩn.

! Kiểm tra vòng lặp mạng (Loop L2) gây bão Broadcast
QVN-Core-SW01# show spanning-tree vlan 10
! Đảm bảo trạng thái Spanning-tree ổn định, không có hiện tượng Forwarding/Listening thay đổi liên tục (Topology change counter không tăng nhanh).
```

#### Bước 3: Kiểm tra Lớp 3 & Định tuyến (Layer 3 & Routing Validation)

Nếu lớp 2 ổn định, kiểm tra bảng định tuyến động (OSPF/BGP) và tính năng lọc gói của Firewall:

Plaintext

```
! Kiểm tra trạng thái thiết lập láng giềng định tuyến OSPF với Firewall
QVN-Core-SW01# show ip ospf neighbor
! Trạng thái chuẩn phải là: FULL/DR hoặc FULL/BDR

! Thực hiện traceroute để kiểm tra gói tin bị chặn hay drop ở chặng nào
QVN-Core-SW01# traceroute ip 10.100.1.50 numeric
```

#### Bước 4: Kiểm tra log Tường lửa bảo mật (Firewall Policy Audit)

Đăng nhập vào CLI FortiGate NGFW để thực hiện capture gói tin trực tiếp theo thời gian thực (Real-time Packet Capture) xem có bị drop do cơ chế IPS hoặc Policy chặn không:

Plaintext

```
# diagnose sniffer packet any 'host 10.20.10.15 and port 443' 4 10 a
# diagnose debug flow filter addr 10.20.10.15
# diagnose debug flow trace start 100
# diagnose debug enable
! Đoạn mã trên hiển thị chi tiết hành trình gói tin đi qua các tầng xử lý của CPU ASIC và lý do cho phép (allow) hay từ chối (deny/drop).
```

## 8. QUY TRÌNH QUẢN LÝ THAY ĐỔI (CHANGE MANAGEMENT POLICY)

Mọi thay đổi cấu hình hạ tầng mạng hệ thống (như cấu hình thêm VLAN, thay đổi định tuyến, cập nhật OS/Firmware) phải tuân thủ quy trình kiểm soát thay đổi (RFC - Request For Change).

1. **Bước chuẩn bị:** Thực hiện tạo Ticket RFC trên Jira Service Desk trước tối thiểu `48` giờ so với thời gian bảo trì (Maintenance Window).
    
2. **Kế hoạch dự phòng (Rollback Plan):** Bắt buộc phải viết sẵn kịch bản khôi phục lại trạng thái cũ bằng lệnh CLI cụ thể nếu việc thực thi gặp lỗi quá thời gian bảo trì cho phép (`30` phút).
    

## 9. BIỂU MẪU KIỂM TRA ĐỊNH KỲ TÍCH HỢP OBSIDIAN (CHECKLIST REUSABLE TEMPLATE)

> [!IMPORTANT]
> 
> Sao chép đoạn mã bên dưới vào một file ghi chú độc lập có tên `Daily_Network_Checklist.md` trong Vault Obsidian của bạn để sử dụng tính năng Checkbox động hàng ngày.

Markdown

```
## 📅 QVN NETWORK INFRASTRUCTURE DAILY CHECKLIST
- [ ] **Kiểm tra CORE Switch:** CPU Utilization < 30% [ ] Có | [ ] Không
- [ ] **Kiểm tra trạng thái liên kết WAN:** Kênh MPLS Viettel và kênh FTTH Backup đều UP [ ] Có | [ ] Không
- [ ] **Kiểm tra Log NGFW FortiGate:** Không có cảnh báo tấn công Brute-Force hoặc DDoS mức High trở lên [ ] Đúng | [ ] Sai
- [ ] **Kiểm tra Sao lưu tự động:** File cấu hình đã xuất về thư mục `/var/net_backups/` an toàn [ ] Thành công | [ ] Thất bại
- [ ] **Kiểm tra dịch vụ Active Directory:** Lệnh `dcdiag /test:Connectivity` trả về kết quả PASS [ ] Thành công | [ ] Thất bại

---
*Ký tên Người thực hiện:* ...........................  
*Thời gian hoàn tất:* `$= date("YYYY-MM-DD HH:mm")`
```


## Lưu ý / Cảnh báo an toàn
>

## Tài liệu tham chiếu
- Cisco Enterprise Campus Infrastructure Design Guide v4.0_
    
- _Center for Internet Security (CIS) Benchmarks for Cisco IOS & Windows Server 2022_
    
- _QVN Network Architecture High-Level Design (HLD) v1.2_

## Lịch sử cập nhật
| Version | Ngày | Người cập nhật | Nội dung thay đổi |
|---|---|---|---|
| 1.0 | | | Khởi tạo |
