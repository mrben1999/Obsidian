---
type: sop
area:
owner:
version: 1
last_reviewed: 2026-08-08
tags:
  - sop
---

# 📋 SOP — Nhập mới linh kiện có Serial vào GLPI 11 — Spare Part

## Mục đích
>Chuẩn hóa việc nhập mới SSD/HDD/RAM và các linh kiện có Serial vào **Spare Part** trong GLPI 11, bảo đảm mỗi linh kiện có thể truy xuất xuyên suốt vòng đời: **Mua → Nhập kho → Xuất kho → Gắn PC → Thay thế → RMA → Thanh lý**.

## Đối tượng áp dụng:
>IT Asset Management, Infra, HelpDesk, Technician.

---
## 1. Quy tắc đặt tên Asset

### 1.1. Không dùng Serial làm Name

Không đặt:

```
Name = S5GBNE0N106672R
```

Thay vào đó sử dụng mã Asset nội bộ:

```
SP-SSD-000001
SP-SSD-000002

SP-HDD-000001
SP-HDD-000002

SP-RAM-000001
SP-RAM-000002

SP-SSD-000001 
SP-HDD-000001 
SP-RAM-000001
SP-PSU-000001
```

### 1.2. Quy tắc

```
SP-<TYPE>-<NUMBER>
```

Ví dụ:

|Field|Giá trị|
|---|---|
|Name|`SP-SSD-000001`|
|Manufacturer|`Samsung`|
|Model|`860 PRO`|
|Serial|`S5GBNE0N106672R`|

### 1.3. Ý nghĩa

```
Name
  ↓
Mã Asset nội bộ GLPI

Serial
  ↓
Serial vật lý của linh kiện
```

**Không được đánh đồng hai thông tin này.**

---

# 2. Status — Trạng thái vòng đời

## 2.1. Bộ Status chuẩn

Chỉ sử dụng các Status sau:

```
IN STOCK
RESERVED
INSTALLED
RMA
REPAIR
RECEIVED FROM RMA
RETIRED
DISPOSED
LOST
```

## 2.2. Luồng chuẩn

### Luồng sử dụng bình thường

```
IN STOCK
    ↓
RESERVED
    ↓
INSTALLED
```

### Luồng bảo hành

```
INSTALLED
    ↓
RMA
    ↓
REPAIR
    ↓
RECEIVED FROM RMA
    ↓
IN STOCK
```

### Luồng loại bỏ

```
RMA
    ↓
RETIRED
    ↓
DISPOSED
```

## 2.3. Không tạo Status cho các tình huống nhỏ

Không tạo:

```
SSD đang chờ kỹ thuật
SSD chờ anh A
SSD chờ chị B
SSD đã tháo
SSD đã lấy ra
SSD đang để IT
```

Thông tin này phải được quản lý bằng:

|Thông tin|GLPI dùng|
|---|---|
|Đang ở đâu|`Location`|
|Ngăn nào|`Storage Bin`|
|Ai đang xử lý|`Technician in charge`|
|Đang xử lý sự cố nào|`Ticket / Problem / Change`|
|Diễn biến|`Comments / Historical`|

---

# 3. Location — Vị trí

`Location` dùng để xác định **vị trí vật lý/tổ chức của linh kiện**.

Ví dụ:

```
QVN
└── B Area
    └── B-TP-F1
        └── R06 - IT
```

### Khi linh kiện đang trong kho

```
Location:
QVN > B Area > B-TP-F1 > R06 - IT

Storage Bin:
IT-STORAGE-SSD-01
```

### Khi linh kiện được gắn vào PC

```
Status:
INSTALLED

Location:
Location của PC
```

> **Nguyên tắc:**  
> `Location` = linh kiện đang thuộc khu vực nào.  
> `Storage Bin` = linh kiện nằm chính xác ở ngăn/kệ nào.

---

# 4. Type — Loại linh kiện

## 4.1. Bộ Type chuẩn

Đề xuất chỉ sử dụng:

```
SSD
HDD
RAM
```

Không nên tạo quá nhiều Type như:

```
SATA SSD
NVMe SSD
M.2 SSD
```

Các thông tin này nên thể hiện bằng:

```
Type
Interface
Form Factor
Capacity
```

---

## 4.2. Ví dụ SSD SATA

```
Type         = SSD
Manufacturer = Samsung
Model        = 860 PRO
Capacity     = 512 GB
Interface    = SATA
Form Factor  = 2.5"
```

## 4.3. Ví dụ NVMe

```
Type         = SSD
Manufacturer = Samsung
Model        = 980 PRO
Capacity     = 1 TB
Interface    = NVMe / PCIe
Form Factor  = M.2 2280
```

## 4.4. Ví dụ RAM

```
Type         = RAM
Manufacturer = Hynix
Model        = DDR4-3200
Capacity     = 16 GB
Interface    = DDR4
Form Factor  = DIMM
```

---

# 5. Manufacturer — Nhà sản xuất

Đây là **Master Data** và cần được chuẩn hóa.

Ví dụ:

```
Samsung
KingMax
Hynix
Kingston
WD
Toshiba
Seagate
Crucial
```

Không để Technician/HelpDesk nhập tùy ý:

```
Samsung
SAMSUNG
Samsung Electronics
Samsung Electronics Co.
SAMSUNG CO LTD
```

Nếu không chuẩn hóa, báo cáo có thể bị phân mảnh:

```
Samsung       135
SAMSUNG        28
Kingston       72
KINGSTON       11
```

→ **Sai số liệu thống kê.**

### Quy tắc

> Technician/HelpDesk **chọn Manufacturer có sẵn**, không tự tạo Manufacturer mới.

Nếu chưa có Manufacturer:

```
Technician
    ↓
Yêu cầu Admin/IT Asset Management
    ↓
Admin tạo Manufacturer chuẩn
```

---

# 6. Model — Model linh kiện

Model cũng phải được chuẩn hóa.

Ví dụ:

```
860 PRO
870 EVO
DT01ACA100
DDR4-3200 DIMM
```

Không nên cho Technician tự ý sửa Model của Asset đã tồn tại.

Nếu nhập sai:

```
860 EVO
```

trong khi thực tế là:

```
860 PRO
```

→ Admin/IT Asset Management thực hiện chỉnh sửa.

---

# 7. Serial — Serial vật lý

Đây là **Field quan trọng nhất đối với Spare Part có Serial**.

Ví dụ:

```
Name:
SP-SSD-000001

Serial:
S5GBNE0N106672R
```

### Serial phải Unique

Không được tồn tại:

```
SP-SSD-000001
Serial = S5GBNE0N106672R

SP-SSD-000002
Serial = S5GBNE0N106672R
```

Nếu cùng một Serial xuất hiện lần thứ hai:

```
→ Kiểm tra Asset đã tồn tại
→ Không tạo Asset mới
```

### Nguyên tắc

```
Name
  ↓
Mã Asset GLPI

Serial
  ↓
Serial vật lý duy nhất của linh kiện
```

---

# 8. Inventory Number

Không nhất thiết bắt buộc đối với mọi Spare Part.

Nếu doanh nghiệp sử dụng Asset Number riêng:

```
Name:
SP-SSD-000001

Inventory number:
QVN-SP-SSD-000001

Serial:
S5GBNE0N106672R
```

Ba thông tin phải được phân biệt:

```
Name
    ≠
Inventory Number
    ≠
Serial
```

---

# 9. Part Number

`Part Number` là mã linh kiện do **nhà sản xuất** quy định.

Ví dụ Samsung 860 PRO:

```
Model:
860 PRO

Part Number:
MZ-76P512B

Serial:
S5GBNE0N106672R
```

Ba thông tin có ý nghĩa khác nhau:

```
Model
 ↓
860 PRO

Part Number
 ↓
MZ-76P512B

Serial
 ↓
S5GBNE0N106672R
```

**Không được dùng Part Number thay cho Serial.**

---

# 10. Capacity — Dung lượng

Phải thống nhất cách ghi đơn vị.

### Không sử dụng lẫn lộn

```
512
512GB
512 GB
0.5TB
500GB
```

### Chuẩn đề xuất

```
512 GB
1 TB
2 TB
4 TB
4 GB
8 GB
16 GB
32 GB
```

Ví dụ:

```
SSD = 512 GB
HDD = 1 TB
RAM = 16 GB
```

> Nếu GLPI Custom Field hiện tại là Text, quy định format trên và áp dụng thống nhất.

---

# 11. Interface

Sử dụng tập giá trị chuẩn:

```
SATA
NVMe
PCIe
DDR4
DDR5
```

Ví dụ:

### Samsung 860 PRO

```
Type      = SSD
Interface = SATA
```

### Samsung 980 PRO

```
Type      = SSD
Interface = NVMe
```

### Hynix DDR4

```
Type      = RAM
Interface = DDR4
```

---

# 12. Form Factor

Chuẩn hóa các giá trị:

```
2.5"
3.5"
M.2 2242
M.2 2260
M.2 2280
DIMM
SO-DIMM
```

Ví dụ:

```
Samsung 860 PRO
Form Factor = 2.5"
```

hoặc:

```
Samsung 980 PRO
Form Factor = M.2 2280
```

---

# 13. Storage Bin — Vị trí chính xác trong kho

Đây là Field **rất quan trọng** đối với mô hình kho linh kiện.

Ví dụ đơn giản:

```
IT-SSD-01
IT-SSD-02
IT-HDD-01
IT-RAM-01
```

Hoặc theo vị trí vật lý:

```
R06-CAB01-S01
R06-CAB01-S02
R06-CAB02-S01
```

Ví dụ:

```
Location:
QVN > B Area > B-TP-F1 > R06 - IT

Storage Bin:
R06-CAB01-S02
```

Khi đó:

```
Location
    ↓
Kho nào / khu vực nào

Storage Bin
    ↓
Ngăn nào / vị trí chính xác nào
```

---

# 14. Technician in charge

**Không bắt buộc.**

Chỉ sử dụng khi linh kiện đang có người chịu trách nhiệm xử lý, ví dụ:

```
RMA
REPAIR
Special handling
```

Ví dụ:

```
Status:
RMA

Technician in charge:
Nguyen Van A
```

Đối với linh kiện bình thường trong kho:

```
Technician in charge = NULL
```

---

# 15. Group in charge

Có thể sử dụng:

```
IT Asset Management
IT Infrastructure
HelpDesk
IT Hardware
```

Đối với linh kiện trong kho, đề xuất:

```
Group in charge:
IT Asset Management
```

---

# 16. Group

`Group` dùng để **phân nhóm tài sản**, không thay thế `Type`.

Đề xuất:

```
Storage
Memory
Network
Power
```

Ví dụ:

### SSD

```
Type  = SSD
Group = Storage
```

### RAM

```
Type  = RAM
Group = Memory
```

---

# 17. Comments

`Comments` được dùng để ghi nhận **ghi chú nghiệp vụ**, không thay thế các Field chính.

## Khi nhập kho

```
2026-08-07:
Nhập kho từ PO QVN-2026-00125.
Warranty 36 months.
```

## Khi RMA

```
2027-04-12:
SSD lỗi SMART.
Ticket #12345.
Đã gửi RMA nhà cung cấp.
```

### Không sử dụng Comments để thay thế

```
Status
Location
Serial
Storage Bin
Ticket
```

Thông tin nào có Field riêng → **phải nhập vào Field tương ứng**.

---

# 18. Chuẩn 17 Fields của Spare Part

Sau khi chuẩn hóa, cấu trúc đề xuất:

|#|Field|Chuẩn|
|---|---|---|
|1|**Name**|`SP-SSD-000001`|
|2|**Status**|`IN STOCK`|
|3|**Location**|`QVN > B Area > B-TP-F1 > R06 - IT`|
|4|**Type**|`SSD`|
|5|**Manufacturer**|`Samsung`|
|6|**Model**|`860 PRO`|
|7|**Serial**|`S5GBNE0N106672R`|
|8|**Inventory number**|`QVN-SP-SSD-000001`|
|9|**Technician in charge**|`NULL`|
|10|**Group in charge**|`IT Asset Management`|
|11|**Group**|`Storage`|
|12|**Comments**|Ghi chú nghiệp vụ|
|13|**Part Number**|`MZ-76P512B`|
|14|**Capacity**|`512 GB`|
|15|**Interface**|`SATA`|
|16|**Form Factor**|`2.5"`|
|17|**Storage Bin**|`R06-CAB01-S02`|

---

# 19. Mẫu nhập SSD mới

## Thông tin linh kiện

```
Name:
SP-SSD-000001

Status:
IN STOCK

Location:
QVN > B Area > B-TP-F1 > R06 - IT

Type:
SSD

Manufacturer:
Samsung

Model:
860 PRO

Serial:
S5GBNE0N106672R

Inventory number:
QVN-SP-SSD-000001

Technician in charge:
NULL

Group in charge:
IT Asset Management

Group:
Storage

Part Number:
MZ-76P512B

Capacity:
512 GB

Interface:
SATA

Form Factor:
2.5"

Storage Bin:
R06-CAB01-S02
```

### Comments

```
2026-08-07:
Nhập kho từ PO QVN-2026-00125.
Warranty 36 months.
```

---

# 20. Phân tách thông tin kỹ thuật và thông tin mua hàng

**Không đưa ngày mua, nhà cung cấp, bảo hành... vào Custom Fields nếu GLPI đã có vùng quản lý tương ứng.**

Kiến trúc chuẩn:

```
                    SPARE PART
                        │
        ┌───────────────┼────────────────┐
        │               │                │
        ▼               ▼                ▼
 Technical Identity   Financial       Operational
        │             /Procurement       │
        │                  │             │
 Manufacturer             Supplier       Ticket
 Model                    Purchase Date  Problem
 Part Number              Order Date     Change
 Serial                   Delivery Date  History
 Capacity                 Purchase Value
 Interface                Warranty
 Form Factor              Warranty Date
        │
        ▼
 Warehouse / Lifecycle
        │
 Status
 Location
 Storage Bin
```

---

# 21. Không đưa Purchase Date vào 17 Fields

Đối với quy trình:

```
Mua SSD
    ↓
Nhập kho
    ↓
Xuất kho
    ↓
Gắn PC
    ↓
Thay thế
    ↓
RMA
    ↓
Thanh lý
```

Không tạo thêm:

```
Purchase Date
Supplier
Warranty
Warranty Duration
Purchase Value
```

nếu GLPI đã cung cấp **Financial and administrative information**.

Các thông tin này nên nằm ở vùng quản lý tài chính/hành chính của GLPI:

```
Supplier
Purchase date
Order date
Delivery date
Purchase value
Warranty
Warranty duration
Warranty date
Decommission date
```

Trong khi Spare Part Fields tập trung vào:

```
Manufacturer
Model
Part Number
Serial
Capacity
Interface
Form Factor
Status
Location
Storage Bin
```

---

# 22. Ngày sản xuất linh kiện

**Không thiết kế quy trình dựa trên giả định GLPI Agent luôn lấy được ngày sản xuất.**

Đối với SSD/HDD/RAM được gắn trong PC:

```
GLPI Agent
    ↓
Inventory
    ↓
Component information
```

Agent có thể thu thập những thông tin mà thiết bị/firmware/OS cung cấp.

Tuy nhiên:

```
Manufacturing Date
```

không phải lúc nào cũng được thiết bị expose.

Do đó:

```
Ngày mua
    ↓
Financial & Administrative Information

Ngày bắt đầu sử dụng
    ↓
Lifecycle / nghiệp vụ

Ngày sản xuất
    ↓
Chỉ nhập khi có nguồn đáng tin cậy
```

**Không suy đoán ngày sản xuất từ BIOS Release Date.**

---

# 23. Quy tắc kiểm soát dữ liệu

Đối với Spare Part có Serial, IT Asset Management áp dụng 5 nguyên tắc:

### Rule 01 — Name

```
Name = mã Asset nội bộ
```

Không dùng Serial.

### Rule 02 — Serial

```
Serial = Serial vật lý
```

Mỗi linh kiện có Serial phải được nhận diện duy nhất.

### Rule 03 — Manufacturer / Model

Chỉ sử dụng dữ liệu chuẩn từ Master Data.

```
Không tự tạo:
SAMSUNG
Samsung Electronics
Samsung Electronics Co.
```

nếu đã có:

```
Samsung
```

### Rule 04 — Status

Không tạo Status tùy tiện.

Chỉ dùng Status chuẩn:

```
IN STOCK
RESERVED
INSTALLED
RMA
REPAIR
RECEIVED FROM RMA
RETIRED
DISPOSED
LOST
```

### Rule 05 — Location / Storage Bin

Không ghi vị trí kho vào Comments.

Phải sử dụng:

```
Location
Storage Bin
```

---

# 24. Checklist trước khi Save

IT/HelpDesk kiểm tra:

```
[ ] Name đúng format SP-XXX-XXXXXX
[ ] Status đúng
[ ] Location đúng
[ ] Type đúng
[ ] Manufacturer chọn đúng Master Data
[ ] Model đúng
[ ] Serial đúng với tem vật lý
[ ] Serial chưa tồn tại trên GLPI
[ ] Inventory Number đúng quy ước nếu có
[ ] Group in charge đúng
[ ] Group đúng
[ ] Part Number đúng nếu có
[ ] Capacity đúng format
[ ] Interface đúng
[ ] Form Factor đúng
[ ] Storage Bin đúng
[ ] Comments có thông tin nhập kho nếu cần
```

---

# 25. Nguyên tắc vàng của Spare Part

> **Không dùng một Field để chứa nhiều loại thông tin khác nhau.**

Ví dụ **không nên**:

```
Comments:
SSD Samsung 860 PRO 512GB SATA, mua ngày 07/08/2026,
đang ở tủ R06, bảo hành 36 tháng, Serial S5GB...
```

Thay vào đó:

```
Manufacturer → Samsung
Model        → 860 PRO
Serial       → S5GBNE0N106672R
Capacity     → 512 GB
Interface    → SATA
Location     → R06 - IT
Storage Bin  → R06-CAB01-S02
Status       → IN STOCK
```

Còn:

```
Purchase Date
Supplier
Warranty
Warranty Duration
Purchase Value
```

→ quản lý tại **Financial and administrative information**.

---

## 26. Mô hình dữ liệu cuối cùng

Toàn bộ hệ thống Spare Part của anh nên được hiểu theo mô hình:

```
                    ┌──────────────────┐
                    │    SPARE PART    │
                    └────────┬─────────┘
                             │
             ┌───────────────┼────────────────┐
             │               │                │
             ▼               ▼                ▼
       IDENTIFICATION    WAREHOUSE        FINANCIAL
             │               │                │
       Name            Status             Supplier
       Manufacturer    Location           Purchase Date
       Model           Storage Bin        Order Date
       Part Number                         Delivery Date
       Serial                               Warranty
       Capacity                             Value
       Interface
       Form Factor
             │
             └───────────────┬────────────────┘
                             │
                             ▼
                       OPERATIONAL
                             │
                  Ticket / Problem / Change
                             │
                             ▼
                          HISTORY
                             │
          ┌──────────────────┼─────────────────┐
          ▼                  ▼                 ▼
       IN STOCK          INSTALLED             RMA
          │                  │                 │
          │                  ▼                 ▼
          │                PC            REPAIR / RMA
          │                  │                 │
          └──────────────┬───┘                 ▼
                         │              RECEIVED FROM RMA
                         │                       │
                         └───────────────────────┘
                                 │
                                 ▼
                              RETIRED
                                 │
                                 ▼
                              DISPOSED
```

### Kết luận chuẩn hóa

**17 Fields của `Spare Part` chỉ nên chịu trách nhiệm chính cho _Identity + Technical + Warehouse_.**

**Financial and administrative information** chịu trách nhiệm cho **Mua hàng + Bảo hành + Giá trị + Vòng đời tài chính**.

**Ticket / Problem / Change / Historical** chịu trách nhiệm cho **quá trình vận hành và thay đổi**.

Đây là cách tách dữ liệu sạch nhất để sau này anh có thể làm báo cáo kiểu:

```
Có bao nhiêu SSD đang tồn kho?
Có bao nhiêu SSD đã gắn PC?
SSD nào đang RMA?
SSD nào đã thay thế?
SSD nào đang ở tủ nào?
SSD nào đang nằm trong PC nào?
SSD này mua từ nhà cung cấp nào?
SSD đã sử dụng bao lâu?
SSD còn bảo hành không?
SSD đã qua bao nhiêu lần RMA?
```

mà **không phải đọc và phân tích Comments thủ công**.

## Lịch sử cập nhật
| Version | Ngày | Người cập nhật | Nội dung thay đổi |
|---|---|---|---|
| 1.0 | | | Khởi tạo |
