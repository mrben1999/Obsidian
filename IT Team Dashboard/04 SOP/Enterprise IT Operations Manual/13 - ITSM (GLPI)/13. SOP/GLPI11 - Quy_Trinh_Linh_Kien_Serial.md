# Quy trình quản lý linh kiện có Serial trong GLPI 11
### Mua → Nhập kho → Xuất kho → Gắn PC → Thay thế → RMA → Thanh lý

> Áp dụng cho các linh kiện có Serial riêng (SSD, HDD, RAM, CPU...) mà anh cần theo dõi
> từng cái một, thay vì gộp chung kiểu "10 cái SSD" như Consumables.

---

## 0. Nguyên tắc thiết kế trong GLPI 11

GLPI **không có sẵn** một loại tài sản "Linh kiện tồn kho có Serial" giống Consumables (Consumables chỉ quản lý theo *số lượng*, không theo Serial). Từ **GLPI 11**, tính năng **Asset Definitions** (Generic Asset trước đây là plugin, nay đã tích hợp vào core) cho phép anh **tự tạo một loại tài sản mới** để lấp đúng khoảng trống này.

→ Giải pháp chuẩn: tạo loại tài sản tùy chỉnh tên **"Linh kiện kho" (Spare Part)**, mỗi Serial = 1 bản ghi tài sản riêng, đi qua vòng đời trạng thái (Status) giống hệt sơ đồ anh đã vạch ra.

Khi linh kiện được lắp vào máy, GLPI Agent Inventory sẽ tự nhận diện nó trong tab **Components** của Computer — nhưng đây là 2 hệ thống dữ liệu **độc lập nhau**: tài sản "Linh kiện kho" do anh tạo tay, và "Component" do Agent tự quét. GLPI 11 không tự động nối 2 cái này lại — việc liên kết phải làm thủ công qua **Ticket + Historical**, đúng như anh đã nhận định.

---

## 1. Bước 0 — Cấu hình một lần (Setup)

Làm 1 lần duy nhất trước khi vận hành quy trình.

### 1.1. Tạo loại tài sản "Linh kiện kho"
`Setup → Asset Definitions → Add`

- **System name**: `SparePart` (tên kỹ thuật, không dấu, không đổi được sau này)
- **Name hiển thị**: "Linh kiện kho" (số ít) / "Linh kiện kho" (số nhiều)
- Bật các **Capacities** cần dùng:
  - ✅ **Has infocom** → để nhập ngày mua, nhà cung cấp, invoice, giá trị, bảo hành, ngày thanh lý
  - ✅ **Has state** → để gán trạng thái nghiệp vụ (In Stock/Installed/RMA...)
  - ✅ **Has document** → đính kèm hóa đơn, phiếu bảo hành
  - ✅ **Is linkable to Tickets/Changes/Problems** → bắt buộc, vì đây là cách anh nối linh kiện với Ticket xuất/nhập kho và RMA
  - ✅ **Has history/log** → để có tab Historical theo dõi mọi thay đổi
  - ✅ **Has notes**

- Tuỳ chỉnh **form fields** hiển thị: Name, Serial, Inventory number, Manufacturer, Model, Location, Status, Group, Technician in charge, Comment (đúng bộ field anh liệt kê ở Phase 1).

### 1.2. Tạo bộ trạng thái nghiệp vụ (Status)
`Administration → Dropdowns → State (Status)`

Tạo các state phản ánh đúng sơ đồ quy trình:

| State | Ý nghĩa |
|---|---|
| `In Stock` | Đang nằm trong kho linh kiện |
| `Reserved` | Đã gán cho 1 Ticket, chờ xuất kho *(tuỳ chọn)* |
| `Installed` | Đã lắp vào PC, đang hoạt động |
| `Defective` | Bị lỗi, chờ xử lý |
| `RMA` | Đang gửi bảo hành cho nhà cung cấp |
| `Retired` | Đã thanh lý/loại bỏ |

### 1.3. Tạo Location cho kho
`Administration → Dropdowns → Location` → tạo `IT Spare Parts > Storage` giống cây thư mục anh đã vẽ.

### 1.4. Danh mục Manufacturer/Model
`Administration → Dropdowns → Manufacturer`, và Model tương ứng (Samsung 870 EVO 500GB...) để không phải gõ tay mỗi lần.

---

## 2. PHASE 1 — Mua linh kiện

`Assets → Linh kiện kho → Add` (tạo lần lượt hoặc dùng **template** để tạo nhanh nhiều bản ghi cùng lúc)

Với mỗi Serial, nhập:

| Trường | Vị trí trong GLPI 11 |
|---|---|
| Name | VD: `SSD-001` |
| Manufacturer / Model | Samsung / 870 EVO 500GB |
| Serial | S6A001 |
| Status | `In Stock` |
| Location | `IT Spare Parts > Storage` |
| Purchase date, Supplier, Order number, Invoice, Value, Warranty | Tab **Financial and Administrative Information** (Infocom) — GLPI 11 hỗ trợ đầy đủ các trường này sẵn |

> **Mẹo tăng tốc**: dùng **Template** (`Setup → Templates`) để tạo 10 bản ghi SSD giống hệt nhau chỉ khác Serial trong vài click, thay vì gõ tay từng cái.

---

## 3. PHASE 2 — Nhập kho

Về bản chất, "nhập kho" chính là bước tạo tài sản ở Phase 1 với `Status = In Stock` và `Location = IT Spare Parts > Storage`. Không cần thao tác thêm — đây là điểm khác biệt so với Consumables (vốn cần thao tác "nhập số lượng" riêng).

Kiểm tra nhanh tồn kho: `Assets → Linh kiện kho`, lọc theo `Status = In Stock` → ra danh sách toàn bộ SSD còn trong kho, kèm Serial.

---

## 4. PHASE 3 — Xuất kho (theo Ticket)

1. **Tạo Ticket** (`Helpdesk → Tickets → New`) mô tả yêu cầu, VD: *"SSD failure — PC IT-leminh"*.
2. Trong Ticket, tab **Items** (Yếu tố liên quan): gắn:
   - Computer bị lỗi (`IT-leminh`)
   - Linh kiện kho sẽ dùng để thay (`SSD-002`, Serial `S6A002`)
3. Vào lại tài sản `SSD-002` → đổi `Status` từ `In Stock` sang `Reserved` (hoặc thẳng `Installed` nếu anh không cần bước trung gian) và `Location` sang PC/user nhận (`IT-leminh`).
4. Tab **Historical** của cả Ticket và của `SSD-002` sẽ tự ghi lại: ai đổi, đổi lúc nào, từ giá trị gì sang giá trị gì — đây chính là "sổ nhật ký xuất kho" anh cần, không phải tạo thủ công ở đâu khác.

---

## 5. PHASE 4 — Gắn linh kiện vào PC

1. Kỹ thuật viên thay ổ vật lý.
2. Chạy lại **GLPI Agent Inventory** trên PC (hoặc chờ chu kỳ quét tự động).
3. Vào `Assets → Computers → IT-leminh → tab Components → Hard Drive`: GLPI sẽ tự hiển thị ổ mới được nhận diện — `Samsung 870 EVO 500GB, Serial S6A002`. Đây là dữ liệu **auto-detect từ Agent**, GLPI 11 tự làm, không cần thao tác tay.
4. Quay lại tài sản `SSD-002` (Linh kiện kho) → đổi `Status = Installed`, và ghi chú (tab **Notes** hoặc **Comment**) tham chiếu số Ticket: *"Installed on IT-leminh, Ticket #2026-00125"*.
5. Đóng Ticket, gắn **Solution** ghi rõ hành động đã làm.

> ⚠️ **Giới hạn cần biết**: bước 3 (Component tự động) và bước 4 (đổi Status thủ công) là **hai thao tác tách rời**. GLPI không tự sync "Component vừa phát hiện" với "tài sản Linh kiện kho tương ứng" — anh (hoặc quy trình IT) phải chủ động cập nhật Status sau khi có kết quả inventory. Đây là lý do bước ghi chú số Ticket vào tài sản là bắt buộc để giữ được truy vết.

---

## 6. PHASE 5 — Thay ổ cũ

Khi ổ cũ (`Samsung 860 PRO`, Serial `S5GBNE0N106672R`) được gỡ ra:

1. Sau lần chạy Inventory kế tiếp, tab **Components** của PC sẽ tự động **không còn hiển thị** ổ cũ nữa (vì Agent không còn thấy nó trên máy) — GLPI phản ánh đúng cấu hình hiện tại.
2. Nếu ổ cũ trước đó **cũng** được quản lý như một tài sản "Linh kiện kho" riêng (khuyến nghị làm vậy ngay từ đầu, kể cả với linh kiện gỡ ra từ máy cũ), anh vào tài sản đó → đổi `Status` sang `Defective` hoặc `In Stock` (nếu ổ vẫn còn dùng được, đưa lại kho) tuỳ tình trạng thực tế.
3. Ghi Historical/Note tham chiếu Ticket: *"Removed from IT-leminh, replaced by S6A002, Ticket #2026-00125"*.

---

## 7. PHASE 6 — RMA (bảo hành với nhà cung cấp)

Khi `SSD-002` (S6A002) bị lỗi:

1. **Không xoá** tài sản khỏi GLPI. Đổi `Status: Installed → Defective`.
2. Tạo **Ticket RMA** mới, mô tả sự cố, gắn kèm:
   - Tài sản `SSD-002` (tab Items)
   - Thông tin **Supplier/Contract** nếu anh có quản lý qua module `Management → Contracts` (GLPI hỗ trợ liên kết Contract ↔ nhà cung cấp ↔ tài sản, hữu ích khi cần tra hạn bảo hành/điều khoản bảo hành với nhà phân phối)
   - Thông tin bảo hành đã có sẵn trong tab **Infocom** của `SSD-002` (Purchase date, Warranty duration) — không cần gõ lại
3. Đổi `Status: Defective → RMA`.

---

## 8. PHASE 7 — Kết quả RMA

**Trường hợp 1 — RMA thành công (được đổi hàng):**
1. Tạo tài sản "Linh kiện kho" **mới** cho ổ thay thế, VD `SSD-002B`, Serial `S6B002`, `Status = In Stock`.
2. Đổi `SSD-002` (ổ lỗi cũ) sang `Status = Retired`, ghi chú lý do: *"Replaced under RMA by S6B002"*.
3. Đóng Ticket RMA, gắn Solution tham chiếu 2 Serial (cũ/mới) để giữ truy vết đầy đủ.

**Trường hợp 2 — RMA thất bại (nhà cung cấp từ chối bảo hành):**
1. Đổi `Status: RMA → Defective`, ghi chú: *"Warranty rejected"*.
2. Sau đó chuyển tiếp sang Phase 8 (Thanh lý).

---

## 9. PHASE 8 — Thanh lý

`Assets → Linh kiện kho → SSD-002 → tab Financial and Administrative Information`

1. Đổi `Status = Retired` (hoặc tên tương đương anh đặt ở bước 1.2).
2. Điền trường **Decommission date** trong tab Infocom — GLPI 11 có sẵn field này, là một phần chính thức của vòng đời tài sản (Asset Lifecycle), phục vụ tính TCO sau này.
3. Ghi lý do thanh lý vào **Comment**/**Notes**: *"Failed / End of life"*.
4. **Không nên xoá (delete)** bản ghi — chỉ đưa vào trạng thái Retired. Nếu thật sự cần dọn dẹp, dùng chức năng "Put in trash" (is_deleted) thay vì xoá vĩnh viễn, để vẫn giữ được lịch sử phục vụ báo cáo/audit.

---

## 10. Sơ đồ tổng thể (ánh xạ đúng vào thao tác trong GLPI 11)

```
                 ┌──────────────┐
                 │     MUA      │  → Assets > Linh kiện kho > Add (+ tab Infocom)
                 └──────┬───────┘
                        ▼
                ┌───────────────┐
                │ NHẬP KHO      │  → Status = In Stock, Location = IT Spare Parts
                └───────┬───────┘
                        ▼
             ┌──────────────────────┐
             │  Có Ticket yêu cầu?  │
             └──────────┬───────────┘
                       YES
                        ▼
                ┌───────────────┐
                │ TICKET        │  → Helpdesk > Tickets > New, tab Items
                └───────┬───────┘
                        ▼
                ┌───────────────┐
                │ XUẤT KHO      │  → Status = Reserved/Installed, Location = PC
                └───────┬───────┘
                        ▼
                ┌───────────────┐
                │ GẮN VÀO PC    │  → thay ổ vật lý
                └───────┬───────┘
                        ▼
                ┌───────────────┐
                │ AGENT INVENTORY│  → tự động, không thao tác tay
                └───────┬───────┘
                        ▼
           Computer > tab Components > Hard Drive
                        │
                 Status = Installed (cập nhật tay ở Linh kiện kho)
                        │
             ┌──────────┴─────────┐
             │                    │
           OK                  FAILED
             │                    │
             ▼                    ▼
        (giữ nguyên)            RMA Ticket → Status = Defective → RMA
                                  │
                       ┌──────────┴─────────┐
                       │                    │
                    SUCCESS              REJECTED
                       │                    │
                       ▼                    ▼
             Tạo tài sản mới (In Stock)   Status = Defective
             Ổ cũ → Status = Retired            │
                                                  ▼
                                            Status = Retired
                                            + Infocom.Decommission date
```

---

## 11. Bảng tổng hợp: Status ↔ Hành động trong GLPI 11

| Status | Ý nghĩa | Nơi cập nhật | Kích hoạt bởi |
|---|---|---|---|
| `In Stock` | Trong kho, chưa dùng | Tab chính của Linh kiện kho | Sau khi nhập kho / RMA thành công (hàng thay thế) |
| `Reserved` | Đã gán cho Ticket, chờ lắp | Tab chính | Khi gắn vào tab Items của Ticket |
| `Installed` | Đang hoạt động trên PC | Tab chính (thủ công) | Sau khi Agent Inventory xác nhận đã lắp |
| `Defective` | Lỗi, chờ xử lý | Tab chính | User/KTV báo lỗi qua Ticket |
| `RMA` | Đang gửi bảo hành | Tab chính | Tạo Ticket RMA, gắn Contract/Supplier |
| `Retired` | Đã thanh lý | Tab chính + Infocom.Decommission date | Hết đời hoặc RMA bị từ chối |

---

## 12. Giới hạn của GLPI 11 cần lưu ý khi vận hành quy trình

- **Không tự động liên kết** giữa "Linh kiện kho" (tài sản tự tạo) và "Component" (Agent tự quét) — phải cập nhật Status thủ công sau mỗi lần Inventory, kèm ghi chú số Ticket để giữ truy vết.
- **Không có sẵn quy trình RMA native** — RMA được mô phỏng bằng tổ hợp Status + Ticket + Contract, không phải một module riêng.
- Việc **tính TCO** (Total Cost of Ownership) chính xác phụ thuộc vào việc nhập đủ và đúng tab Infocom (giá mua, giá trị, ngày thanh lý) cho từng Serial — nếu bỏ trống, báo cáo tài chính sẽ thiếu dữ liệu.
- Nên **bắt buộc mọi thay đổi Status** đi kèm 1 Ticket tham chiếu (kể cả nội bộ, không cần end-user tạo) để tab **Historical** trở thành nhật ký đầy đủ, tránh tình trạng "không rõ vì sao Serial này đổi trạng thái".
