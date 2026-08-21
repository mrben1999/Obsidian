---
type: sop
area:
owner:
version: 1
last_reviewed: 2026-08-10
tags:
  - sop
---

# 📋 SOP — Asset Management chuẩn

thiết kế theo hướng **CMDB/Asset Management chuẩn cho GLPI 11**, ưu tiên:

- Dễ nhập liệu cho HelpDesk/IT.
- Dropdown chuẩn hóa dữ liệu.
- Không tạo dữ liệu kiểu `8GB`, `8 GB`, `8 Gb` lẫn lộn.
- Dễ filter/report sau này.
- Có thể mở rộng khi GLPI Agent/Zabbix đưa dữ liệu vào.
- Tách rõ **loại Spare Part** và **thông số kỹ thuật**.

## 1. Kiến trúc tổng thể

Trong **Assets → Asset Definitions**, tôi đề xuất tạo **7 Asset Definition**:

|Asset Definition|Mục đích|
|---|---|
|**RAM**|Memory Module|
|**SSD**|Solid State Drive|
|**HDD**|Hard Disk Drive|
|**CPU**|Processor|
|**GPU**|Graphics Processing Unit|
|**NIC**|Network Interface Card|
|**PSU**|Power Supply Unit|

Tôi khuyên **không gom tất cả vào một Asset Definition `Spare Part`**.

Mô hình nên là:

```
Spare Parts
│
├── RAM
│   ├── DDR4
│   ├── DDR5
│   └── SO-DIMM / DIMM
│
├── SSD
│   ├── SATA
│   ├── NVMe
│   └── M.2
│
├── HDD
│   ├── SATA
│   └── SAS
│
├── CPU
│   ├── Intel
│   └── AMD
│
├── GPU
│   ├── NVIDIA
│   └── AMD
│
├── NIC
│   ├── 1GbE
│   ├── 2.5GbE
│   ├── 10GbE
│   └── Fiber
│
└── PSU
    ├── ATX
    ├── SFX
    └── Server PSU
```

---

# 2. RAM — Asset Definition

### Definition

```
Name: RAM
```

### Fields

|Field|Type|Dropdown / giá trị|
|---|---|---|
|Manufacturer|Dropdown|Manufacturer|
|Model|Text|—|
|Part Number|Text|—|
|Serial Number|Text|—|
|Capacity|Dropdown|RAM Capacity|
|Technology|Dropdown|RAM Technology|
|Form Factor|Dropdown|RAM Form Factor|
|Speed|Dropdown|RAM Speed|
|ECC|Dropdown|Yes / No|
|Registered|Dropdown|Yes / No|
|Voltage|Dropdown|RAM Voltage|

### RAM Capacity

```
4 GB
8 GB
16 GB
32 GB
64 GB
128 GB
256 GB
512 GB
```

### RAM Technology

```
DDR3
DDR3L
DDR4
DDR5
LPDDR3
LPDDR4
LPDDR4X
LPDDR5
LPDDR5X
```

### RAM Form Factor

```
DIMM
SO-DIMM
RDIMM
LRDIMM
UDIMM
```

### RAM Speed

```
1333 MHz
1600 MHz
1866 MHz
2133 MHz
2400 MHz
2666 MHz
2933 MHz
3200 MHz
3600 MHz
4800 MHz
5200 MHz
5600 MHz
6000 MHz
```

### ECC

```
Yes
No
```

### Registered

```
Yes
No
```

### Voltage

```
1.20 V
1.35 V
1.50 V
```

---

# 3. SSD — Asset Definition

```
Name: SSD
```

### Fields

|Field|Type|
|---|---|
|Manufacturer|Dropdown|
|Model|Text|
|Part Number|Text|
|Serial Number|Text|
|Capacity|Dropdown|
|Interface|Dropdown|
|Form Factor|Dropdown|
|Protocol|Dropdown|
|Read Speed|Text|
|Write Speed|Text|
|TBW|Text|

### SSD Capacity

```
120 GB
128 GB
240 GB
250 GB
256 GB
480 GB
500 GB
512 GB
960 GB
1 TB
2 TB
4 TB
8 TB
```

### Interface

```
SATA III
SAS
PCIe
```

### Form Factor

```
2.5"
M.2 2230
M.2 2242
M.2 2260
M.2 2280
M.2 22110
U.2
U.3
PCIe Add-in Card
```

### Protocol

```
AHCI
NVMe
```

---

# 4. HDD — Asset Definition

```
Name: HDD
```

### Fields

|Field|Type|
|---|---|
|Manufacturer|Dropdown|
|Model|Text|
|Part Number|Text|
|Serial Number|Text|
|Capacity|Dropdown|
|Interface|Dropdown|
|Form Factor|Dropdown|
|RPM|Dropdown|
|Sector Size|Dropdown|
|Drive Type|Dropdown|

### Capacity

```
500 GB
1 TB
2 TB
3 TB
4 TB
6 TB
8 TB
10 TB
12 TB
14 TB
16 TB
18 TB
20 TB
22 TB
24 TB
```

### Interface

```
SATA III
SAS
```

### Form Factor

```
2.5"
3.5"
```

### RPM

```
5400 RPM
5900 RPM
7200 RPM
10000 RPM
15000 RPM
```

### Sector Size

```
512n
512e
4Kn
```

### Drive Type

```
Desktop
NAS
Enterprise
Surveillance
```

---

# 5. CPU — Asset Definition

```
Name: CPU
```

### Fields

|Field|Type|
|---|---|
|Manufacturer|Dropdown|
|Model|Text|
|Part Number|Text|
|Serial Number|Text|
|Socket|Dropdown|
|Generation|Text|
|Core Count|Dropdown|
|Thread Count|Dropdown|
|Base Clock|Text|
|Max Turbo Clock|Text|
|TDP|Dropdown|
|Architecture|Dropdown|
|Integrated GPU|Dropdown|

### Manufacturer

```
Intel
AMD
Apple
ARM
Qualcomm
MediaTek
Other
```

### Socket

```
LGA 1151
LGA 1200
LGA 1700
LGA 1851
AM4
AM5
SP3
SP5
TR4
sTRX4
```

### Core Count

```
2
4
6
8
10
12
14
16
20
24
32
48
64
96
128
```

### Thread Count

```
2
4
6
8
12
16
20
24
32
40
48
64
96
128
192
256
```

### TDP

Tôi khuyên dùng các mức:

```
15 W
35 W
45 W
65 W
95 W
105 W
125 W
150 W
170 W
200 W
250 W
280 W
350 W
400 W
```

### Architecture

```
x86
x86_64
ARM
ARM64
```

### Integrated GPU

```
Yes
No
```

---

# 6. GPU — Asset Definition

```
Name: GPU
```

### Fields

|Field|Type|
|---|---|
|Manufacturer|Dropdown|
|Model|Text|
|Part Number|Text|
|Serial Number|Text|
|GPU Manufacturer|Dropdown|
|VRAM|Dropdown|
|VRAM Type|Dropdown|
|Interface|Dropdown|
|Bus Width|Dropdown|
|Power Connector|Dropdown|
|TDP|Text|
|Output|Dropdown|

### GPU Manufacturer

```
NVIDIA
AMD
Intel
```

### VRAM

```
2 GB
4 GB
6 GB
8 GB
10 GB
12 GB
16 GB
20 GB
24 GB
32 GB
48 GB
```

### VRAM Type

```
GDDR5
GDDR5X
GDDR6
GDDR6X
GDDR7
HBM2
HBM2e
HBM3
HBM3e
```

### Interface

```
PCIe x8
PCIe x16
```

### Bus Width

```
64-bit
128-bit
192-bit
256-bit
320-bit
384-bit
512-bit
```

### Power Connector

```
None
6-pin
8-pin
6-pin + 6-pin
6-pin + 8-pin
8-pin + 8-pin
12VHPWR
12V-2x6
```

### Output

```
HDMI
DisplayPort
DVI
VGA
USB-C
HDMI + DisplayPort
```

---

# 7. NIC — Asset Definition

```
Name: NIC
```

### Fields

|Field|Type|
|---|---|
|Manufacturer|Dropdown|
|Model|Text|
|Part Number|Text|
|Serial Number|Text|
|Interface Type|Dropdown|
|Speed|Dropdown|
|Port Count|Dropdown|
|Connector|Dropdown|
|Media|Dropdown|
|Bus Interface|Dropdown|
|MAC Address|Text|
|PoE|Dropdown|

### Interface Type

```
Ethernet
Fiber Ethernet
Wi-Fi
Bluetooth
```

### Speed

```
10 Mbps
100 Mbps
1 Gbps
2.5 Gbps
5 Gbps
10 Gbps
25 Gbps
40 Gbps
50 Gbps
100 Gbps
200 Gbps
400 Gbps
```

### Port Count

```
1
2
4
8
16
24
48
```

### Connector

```
RJ45
SFP
SFP+
SFP28
QSFP+
QSFP28
QSFP56
QSFP-DD
```

### Media

```
Copper
Fiber
Wireless
```

### Bus Interface

```
PCIe
M.2
USB
Onboard
OCP
```

### PoE

```
Yes
No
```

---

# 8. PSU — Asset Definition

```
Name: PSU
```

### Fields

|Field|Type|
|---|---|
|Manufacturer|Dropdown|
|Model|Text|
|Part Number|Text|
|Serial Number|Text|
|Wattage|Dropdown|
|Form Factor|Dropdown|
|Efficiency|Dropdown|
|Modular|Dropdown|
|Input Voltage|Dropdown|
|Connector|Dropdown|
|Redundant|Dropdown|

### Wattage

```
180 W
240 W
300 W
350 W
400 W
450 W
500 W
550 W
600 W
650 W
700 W
750 W
800 W
850 W
1000 W
1200 W
1300 W
1500 W
1600 W
1800 W
2000 W
2400 W
```

### Form Factor

```
ATX
SFX
SFX-L
TFX
Flex ATX
1U
2U
Server Hot-Swap
```

### Efficiency

```
80 PLUS
80 PLUS Bronze
80 PLUS Silver
80 PLUS Gold
80 PLUS Platinum
80 PLUS Titanium
```

### Modular

```
Non-Modular
Semi-Modular
Fully Modular
```

### Input Voltage

```
100-120 VAC
200-240 VAC
100-240 VAC
```

### Redundant

```
Yes
No
```

---

# 9. Bộ Dropdown dùng chung

Đây là phần tôi đặc biệt khuyên anh làm.

**Không nên tạo mỗi Asset Definition một bộ Dropdown riêng nếu cùng loại dữ liệu.**

Ví dụ:

```
Manufacturer
Capacity
Yes / No
Interface
Form Factor
```

nên được dùng chung.

Thiết kế:

```
GLPI Dropdowns
│
├── Manufacturer
│
├── Yes / No
│
├── Storage Capacity
│
├── RAM Capacity
│
├── RAM Technology
│
├── RAM Form Factor
│
├── RAM Speed
│
├── SSD Interface
│
├── SSD Form Factor
│
├── SSD Protocol
│
├── HDD Capacity
│
├── HDD RPM
│
├── HDD Form Factor
│
├── CPU Socket
│
├── CPU Core Count
│
├── CPU Thread Count
│
├── CPU TDP
│
├── GPU VRAM
│
├── GPU VRAM Type
│
├── GPU Interface
│
├── NIC Speed
│
├── NIC Connector
│
├── NIC Media
│
├── NIC Bus Interface
│
├── PSU Wattage
│
├── PSU Form Factor
│
├── PSU Efficiency
│
└── PSU Input Voltage
```

---

# 10. Naming Convention

Tôi đề xuất anh **không đặt tên field quá dài**.

Ví dụ:

```
Capacity
Technology
Speed
Form Factor
Interface
Protocol
Socket
Core Count
Thread Count
TDP
VRAM
VRAM Type
Port Count
Connector
Wattage
Efficiency
```

Không nên:

```
RAM Memory Module Capacity
RAM Memory Technology Type
RAM Memory Operating Speed
```

Vì khi hiển thị Asset sẽ rất dài.

---

# 11. Quan trọng: Text hay Dropdown?

Đây là nguyên tắc tôi đề xuất cho hệ thống của anh:

### Dùng Dropdown cho dữ liệu cần chuẩn hóa

```
Capacity
Technology
Interface
Form Factor
Speed
Socket
Core Count
VRAM
Wattage
Manufacturer
```

### Dùng Text cho dữ liệu biến thiên

```
Model
Part Number
Serial Number
MAC Address
Firmware
Base Clock
TBW
Read Speed
Write Speed
```

Ví dụ:

```
Capacity       → Dropdown
Manufacturer   → Dropdown

Model          → Text
Part Number    → Text
Serial Number  → Text
```

Điều này rất quan trọng đối với **CMDB**.

---

# 12. Quy tắc đặt giá trị Capacity

Anh nên **chuẩn hóa ngay từ đầu**.

Không sử dụng:

```
8GB
8 Gb
8 gb
8G
8 G
8 GB RAM
```

Chỉ dùng:

```
8 GB
16 GB
32 GB
64 GB
128 GB
256 GB
512 GB
1 TB
2 TB
4 TB
```

Tương tự:

```
3200 MHz
```

không dùng:

```
3200Mhz
3200 mhz
3200 MHz RAM
```

---

# 13. Cách đặt tên Spare Part thực tế

Đây là phần rất quan trọng khi anh đưa vào vận hành.

Tôi đề xuất:

```
[TYPE] - [MANUFACTURER] - [MODEL] - [KEY SPEC]
```

Ví dụ:

```
RAM - Samsung - M378A1K43DB2 - 8GB DDR4 3200
RAM - Kingston - KVR32N22S8/16 - 16GB DDR4 3200

SSD - Samsung - 870 EVO - 500GB SATA
SSD - Samsung - 980 PRO - 1TB NVMe

HDD - Seagate - ST2000DM008 - 2TB SATA 7200

CPU - Intel - Core i5-12400 - LGA1700
CPU - AMD - Ryzen 5 5600G - AM4

GPU - NVIDIA - RTX 3060 - 12GB
GPU - AMD - RX 6600 - 8GB

NIC - Intel - I350-T4 - 4x1GbE
NIC - Intel - X550-T2 - 2x10GbE

PSU - Dell - 0W3F7J - 750W
PSU - Corsair - RM750x - 750W Gold
```

Như vậy khi nhìn **Spare Parts list** là IT biết ngay đó là linh kiện gì.

---

# 14. Kiến trúc cuối cùng tôi khuyên anh triển khai

```
GLPI 11
│
├── Assets
│   │
│   ├── Computers
│   ├── Monitors
│   ├── Network Equipment
│   └── Custom Assets
│
└── Asset Definitions
    │
    └── Spare Parts
        │
        ├── RAM
        │   ├── Capacity
        │   ├── Technology
        │   ├── Speed
        │   ├── Form Factor
        │   └── ECC
        │
        ├── SSD
        │   ├── Capacity
        │   ├── Interface
        │   ├── Form Factor
        │   └── Protocol
        │
        ├── HDD
        │   ├── Capacity
        │   ├── Interface
        │   ├── RPM
        │   └── Form Factor
        │
        ├── CPU
        │   ├── Socket
        │   ├── Core Count
        │   ├── Thread Count
        │   ├── TDP
        │   └── Architecture
        │
        ├── GPU
        │   ├── VRAM
        │   ├── VRAM Type
        │   ├── Interface
        │   └── Bus Width
        │
        ├── NIC
        │   ├── Speed
        │   ├── Port Count
        │   ├── Connector
        │   ├── Media
        │   └── Bus Interface
        │
        └── PSU
            ├── Wattage
            ├── Form Factor
            ├── Efficiency
            ├── Modular
            └── Redundant
```

## Khuyến nghị quan trọng nhất

Với hệ thống **GLPI 11 + GLPI Agent + Zabbix** của anh, tôi sẽ chọn mô hình:

**Asset Definition = loại linh kiện**

**Dropdown = dữ liệu chuẩn hóa**

**Text = thông tin model/part number/serial**

Ví dụ:

```
RAM
 ├─ Manufacturer  → Dropdown
 ├─ Model         → Text
 ├─ Part Number   → Text
 ├─ Serial        → Text
 ├─ Capacity      → Dropdown
 ├─ Technology    → Dropdown
 ├─ Speed         → Dropdown
 └─ Form Factor   → Dropdown
```

Đây là cấu trúc tốt hơn nhiều so với việc để một field `Characteristics` dạng text rồi nhập thủ công, vì sau này anh có thể **filter, search, thống kê tồn kho, đối chiếu cấu hình máy và xây Dashboard** mà không phải xử lý dữ liệu bẩn.

**Lưu ý:** Trong GLPI 11, tên gọi và vị trí chính xác của **Type / Item type / Dropdown** trong màn hình Asset Definition có thể khác tùy phiên bản/build. Vì vậy phần trên là **thiết kế CMDB chuẩn**, còn khi triển khai thực tế anh nên tạo đúng loại field mà GLPI 11 cung cấp trong giao diện hiện tại, thay vì cố ép `Item type = Capacity` như một giá trị tự định nghĩa.
## Lịch sử cập nhật
| Version | Ngày | Người cập nhật | Nội dung thay đổi |
|---|---|---|---|
| 1.0 | | | Khởi tạo |
