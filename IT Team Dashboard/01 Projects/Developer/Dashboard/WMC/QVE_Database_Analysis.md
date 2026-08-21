# BÁO CÁO PHÂN TÍCH QUY HOẠCH CƠ SỞ DỮ LIỆU & KIẾN TRÚC HỆ THỐNG ERP QVE
## CHUYÊN GIA PHÂN TÍCH HỆ THỐNG (SYSTEM ANALYST / SOLUTION ARCHITECT REPORT)

---

### 1. TÓM TẮT MỤC TIÊU & CHỈ SỐ (KPI) HỆ THỐNG

#### 1.1. Tổng quan hệ thống
Dựa trên phân tích cấu trúc schema của cơ sở dữ liệu `qve` với tổng cộng **365 bảng**, đây là một hệ thống **ERP (Enterprise Resource Planning) chuyên sâu cho ngành Dệt may - May mặc (Garment/Textile Industry)** với quy mô cực kỳ lớn và tích hợp chặt chẽ. Hệ thống quản trị toàn diện từ khâu Thiết kế mẫu (Sample), Phát triển đơn hàng (Sales Order / Job Order), Tính toán định mức (BOM), Hoạch định nhu cầu vật tư (MRP), Mua hàng (Purchasing), Quản lý kho nguyên vật liệu và thành phẩm (Inventory & WMS), Tiến độ và tiền lương sản xuất theo công đoạn (Production Payroll), Giao nhận - Xuất nhập khẩu (Shipping) cho đến Kế toán tài chính (Financial Accounting).

#### 1.2. Chỉ số hiệu năng (KPI) & Chỉ số nghiệp vụ cốt lõi
Để hệ thống vận hành tối ưu, kiến trúc cần hướng tới các chỉ số đo lường sau:

| Mã KPI | Tên chỉ số đo lường | Mục tiêu thiết kế hệ thống | Cách thức tối ưu trên DB |
| :--- | :--- | :--- | :--- |
| **KPI-01** | **Query Latency (Độ trễ truy vấn)** | 95% số truy vấn báo cáo tài chính & tồn kho < 500ms. | Đánh Index phủ (Covering Index), Partitioning theo tháng/năm. |
| **KPI-02** | **BOM Processing Time** | Thời gian nổ nhu cầu vật tư (MRP) cho đơn hàng >100,000 sản phẩm < 10 giây. | Sử dụng CTE (Common Table Expressions) và xử lý bất đồng bộ (Queue). |
| **KPI-03** | **Data Consistency (Tính nhất quán)** | 100% cân đối giữa Kho vật tư (IV), Kho thành phẩm (FG) và Sổ cái kế toán (ACC). | Áp dụng Database Transaction chặt chẽ, kiểm tra đối chiếu tự động bằng Trigger/Event. |
| **KPI-04** | **Database Lock Rate** | Tránh xảy ra tình trạng Deadlock khi ghi nhận sản lượng công đoạn (PY) đồng thời từ hàng ngàn công nhân. | Thiết kế cấu trúc bảng mỏng, sử dụng ghi nhận dạng Append-only rồi tổng hợp định kỳ. |

---

### 2. PHÂN TÍCH CHI TIẾT (PHÂN NHÓM PHÂN HỆ & MỐI QUAN HỆ)

Cơ sở dữ liệu gồm **365 bảng** được chia thành **19 phân hệ chức năng độc lập** dưới đây. Sự phân chia này giúp các Agent lập trình hoạt động độc lập theo kiến trúc Microservices hoặc Modular Monolith.

#### 2.1. Danh sách 19 Phân hệ và Bảng dữ liệu tương ứng

##### 1. Phân hệ Kế toán Tài chính (ACC - Financial Accounting)
* **Mô tả:** Quản lý hệ thống tài khoản kế toán, số dư tài khoản, các bút toán sổ nhật ký, voucher giao dịch kế toán và báo cáo tài chính.
* **Danh sách bảng (14 bảng):** `accbal`, `accbat00`, `account`, `accrec`, `accstmnt`, `acctrx`, `accvch`, `accxgen`, `accxref`, `accxsng`, `accxsub`, `acjdstr`, `acjurnal`, `acmdept`.

##### 2. Phân hệ Hệ thống lõi NextGen (SYS_NG - System Platform & Security)
* **Mô tả:** Quản trị cấu hình hệ thống, bảo mật phân quyền người dùng, phân quyền module, quy tắc nhập liệu, lịch sử thao tác, và tài liệu đính kèm.
* **Danh sách bảng (38 bảng):** `ngafield`, `ngaobject`, `ngaprofile`, `ngattachdtl`, `ngattachfile`, `ngbackup`, `ngclicklog`, `ngcmpny`, `ngcodemap`, `ngdeletelog`, `ngdocapprove`, `ngdocapproveconfig`, `ngdocbox`, `ngdocboxcontent`, `ngdoclock`, `ngevents`, `ngfield`, `nggrpacs`, `nggxbox`, `ngimportconfig`, `nginputrule`, `nglabel`, `nglabelpaper`, `ngmaster`, `ngmastercode`, `ngmodule`, `ngmssgbx`, `ngobject`, `ngobjectext`, `ngpaper`, `ngprofile`, `ngrluser`, `ngrole`, `ngstation`, `ngtable`, `ngtask`, `nguser`, `ngusrgrp`.

##### 3. Phân hệ Hoạch định công suất & Lịch sản xuất (CP - Capacity Planning)
* **Mô tả:** Quản lý kế hoạch công suất nhà máy, dự báo sản lượng, phân phối lịch làm việc, thiết lập dây chuyền và tài nguyên sản xuất garment.
* **Danh sách bảng (19 bảng):** `cpbk`, `cpbkforecast`, `cpbkgrant`, `cpbkgroup`, `cpbkprealc`, `cpcldrtmp`, `cpcldrtmpdtl`, `cpfactoryeq`, `cpfactorygrant`, `cpinstruction`, `cpjobprogress`, `cpjobschedule`, `cpplan`, `cprequest`, `cprequestmachine`, `cprequestship`, `cpresource`, `cprscldr`, `cpsysid`.

##### 4. Phân hệ Quản lý mua hàng (PU - Purchasing)
* **Mô tả:** Đơn mua hàng (PO) nguyên vật liệu phụ liệu, L/C (Thư tín dụng), chi phí phụ trội mua hàng và phân bổ giao dịch mua hàng.
* **Danh sách bảng (18 bảng):** `puiasm`, `puichrg`, `puijalc`, `puijalc2`, `puinvcharge`, `pulcodr`, `pumlcdt`, `puochrg`, `puoitem`, `puomstr`, `puprepay`, `pupyitem`, `purvalc2`, `purvinv`, `purvitm`, `purvjalc`, `purvtrx`, `purvtrx2`.

##### 5. Phân hệ Quản lý kho nguyên vật liệu (IV - Inventory Management)
* **Mô tả:** Quản lý xuất - nhập - tồn nguyên vật liệu, thẻ kho, lịch sử giao dịch nguyên vật liệu, phân bổ và quản lý theo lô hàng.
* **Danh sách bảng (18 bảng):** `ivaddoc`, `ivaddtls`, `ivadlot`, `ivisdtls`, `ivisjalc`, `ivismatr`, `ivissdoc`, `ivskalc2`, `ivskalog`, `ivskbin`, `ivskcrd`, `ivskcrd2`, `ivskhst`, `ivskitm`, `ivskjalc`, `ivsktrx`, `ivsktrx2`, `ivwpmatr`.

##### 6. Phân hệ Quản lý kho thành phẩm (FG - Finished Goods)
* **Mô tả:** Theo dõi thành phẩm, đóng gói thùng carton (Carton Packing), phiếu đóng gói, xuất nhập kho thành phẩm và chuyển kho hàng thành phẩm dệt may.
* **Danh sách bảng (33 bảng):** `fg_ctn`, `fg_ctn_dtls`, `fg_ctn_trx`, `fg_item`, `fg_item_stock`, `fg_item_stock_asm`, `fg_item_trx`, `fg_item_trx_asm`, `fg_mvnote`, `fg_mvnote_ctns`, `fg_mvnote_ctntypes`, `fg_mvnote_item_asm`, `fg_mvnote_item_colors`, `fg_mvnote_item_dim3s`, `fg_mvnote_item_sizes`, `fg_mvnote_items`, `fgcbin`, `fgcdtl`, `fgctn`, `fgctrx`, `fglasm`, `fglot`, `fgltrx`, `fglxasm`, `fglxcst`, `fgmcarton`, `fgmiasm`, `fgmicolor`, `fgmidim3`, `fgmisizx`, `fgmitem`, `fgmpacking`, `fgmvnote`.

##### 7. Phân hệ Đơn đặt hàng sản xuất, BOM & Tính giá (JO/JOY - Job Orders & BOM)
* **Mô tả:** Quản lý chi tiết đơn hàng sản xuất (Job Orders), định mức nguyên vật liệu (BOM), sơ đồ Marker cắt, tỷ lệ size/color và giá thành.
* **Danh sách bảng (26 bảng):** `johprc`, `jomasm`, `jomprc`, `jooinst`, `jooinv`, `jooivitm`, `joomftr`, `joomlord`, `joomlstn`, `joomstr`, `jooprc`, `jooprdn`, `jooship`, `jorvtrx`, `jorvtrx2`, `jowpprcs`, `jowpprcs2`, `joybmclr`, `joybmship`, `joybmsze`, `joybol`, `joybom`, `joycway`, `joymarker`, `joymcapp`, `joymratio`.

##### 8. Phân hệ Lập kế hoạch nhu cầu nguyên vật liệu (MR/MPP - MRP & Cutting)
* **Mô tả:** Phân tích nhu cầu vật tư dự kiến cho đơn hàng (MRP), xử lý hao hụt vật tư, quản lý định mức cắt dập dệt may.
* **Danh sách bảng (19 bảng):** `mppctns`, `mppdtls`, `mppitems`, `mppmstr`, `mraadj`, `mrbcnd`, `mrbill`, `mrbmatr`, `mrbmcnd`, `mrbmsze`, `mrbord`, `mrjmarker`, `mrjmatr`, `mrjmdtl`, `mrjmrkasm`, `mrsmdtl`, `msmrcvr`, `msmrpri`, `msrstone`.

##### 9. Phân hệ Tiền lương sản xuất & Tiến độ công đoạn (PY - Payroll & Progress)
* **Mô tả:** Theo dõi tiến độ gia công cắt may, sơ đồ quy trình công đoạn sản xuất, ghi nhận sản lượng lao động của công nhân và tính lương sản phẩm.
* **Danh sách bảng (15 bảng):** `pycarton`, `pycolormap`, `pydim3map`, `pyfactory`, `pyhstcut`, `pyhstwrk`, `pylinemap`, `pylupdate`, `pyordmap`, `pyprocessmap`, `pysizemap`, `pyworkorder`, `pywrkord`, `pywrkprogress`, `pywrkstp`.

##### 10. Phân hệ Giao nhận & Xuất khẩu (SH - Shipping & Logistics)
* **Mô tả:** Chứng từ giao nhận, chi tiết container đóng gói xuất khẩu, chi phí vận chuyển hàng hóa quốc tế và nội địa.
* **Danh sách bảng (18 bảng):** `shdmstr`, `sheform`, `shefprt`, `shidtls`, `shifrmt`, `shmcharg`, `shmucc`, `shpasm`, `shpcolor`, `shpctns`, `shpcvshp`, `shpdim3`, `shpdtls`, `shpprc`, `shpsize`, `shpstyle`, `shucmstr`, `shucrctrl`.

##### 11. Phân hệ Quản lý đơn hàng mẫu (SM - Sample Orders)
* **Mô tả:** Đơn thiết kế mẫu thử nghiệm trước sản xuất đại trà, BOM mẫu, hướng dẫn kỹ thuật mẫu và kết quả thử nghiệm mẫu.
* **Danh sách bảng (16 bảng):** `smdndtl`, `smdnhdr`, `smintry`, `smoasm`, `smobom`, `smoinst`, `smomstr`, `smosktch`, `smossmsr`, `smstype`, `smybmsze`, `smycolor`, `smycway`, `smydim3`, `smyprc`, `smysize`.

##### 12. Danh mục dùng chung toàn hệ thống (SY - System Master Data)
* **Mô tả:** Danh mục dùng chung bao gồm Khách hàng (Customers), Nhà cung ứng (Suppliers), Bảng mã màu (Colors), Bảng mã size, Đơn vị tính (Units), Tỷ giá tiền tệ.
* **Danh sách bảng (51 bảng):** `sycadres`, `sycagnt`, `sycbank`, `syccust`, `sycexpr`, `sycmftr`, `sycmpny`, `sycodemap`, `sycsupp`, `syedesc`, `syexadrs`, `sygccard`, `sygcolor`, `sygcrft`, `sygcrlk`, `sygcser`, `syggcrf`, `syggmsr`, `sygmatr`, `sygmcls`, `sygmcust`, `sygmdsc`, `sygmesr`, `sygmimg`, `sygmprice`, `sygmpricedtl`, `sygmsupp`, `sygmusg`, `sygprcs`, `sygsize`, `sygstyle`, `sygtype`, `syimage`, `syinfmt`, `symchrg`, `symcnty`, `symcurr`, `symfxhst`, `symport`, `symprtm`, `symptrm`, `symquot`, `symshmd`, `symstone`, `symunit`, `syndivs`, `synmloc`, `synstim`, `syprfmt`, `syrclss`, `syrremk`.

##### 13. Phân hệ Quản lý vị trí kho (WM - Warehouse Management)
* **Mô tả:** Phân chia vị trí tủ kệ kho (Location Bin), tác vụ bốc xếp (Picking/Putaway tasks), cấu trúc định tuyến dòng hàng trong kho bãi.
* **Danh sách bảng (10 bảng):** `wmaccss`, `wmitmctrl`, `wmopdtl`, `wmopitm`, `wmopord`, `wmoptkcmp`, `wmoptsk`, `wmsrcls`, `wmsrloc`, `wmtskasm`.

##### 14. Phân hệ Đơn hàng bán & Báo giá (SA/SAY - Sales Orders)
* **Mô tả:** Quản lý báo giá cho khách hàng, đơn đặt hàng xuất khẩu thương mại, hóa đơn bán hàng và cơ chế phân bổ giao dịch bán hàng.
* **Danh sách bảng (27 bảng):** `sabackup`, `sacasm`, `sahasm`, `sahpack`, `sahprc`, `sahquot`, `saiasm`, `salcodr`, `samcust`, `samlcdt`, `saoinvc`, `saomstr`, `saoship`, `saostyle`, `saotrx`, `saotrx2`, `sapasm`, `saprgrm`, `sayartno`, `sayasm`, `saycolor`, `saydim3`, `sayprc`, `sayscrft`, `saysize`, `saysktch`, `sayssmsr`.

##### 15. Phân hệ Ghi nợ & Ghi có thương mại (DN - Debit & Credit Notes)
* **Mô tả:** Quản lý việc phát hành Debit Notes và Credit Notes đối với các khoản điều chỉnh giá trị hóa đơn xuất/nhập khẩu.
* **Danh sách bảng (6 bảng):** `dncntrl`, `dncntype`, `dnmdtls`, `dnmstr`, `dntmplt`, `dntype`.

##### 16. Phân hệ Tính giá thành sản phẩm (JC - Job Costing)
* **Mô tả:** Bảng kiểm soát chi phí thực tế phát sinh (vật tư, nhân công, máy móc) cho từng Job Order cụ thể so với định mức.
* **Danh sách bảng (10 bảng):** `jccdtls`, `jccjalc`, `jccsheet`, `jcmprcs`, `jcmtype`, `jcqitems`, `jcqmatrs`, `jcqmkup`, `jcqmstr`, `jcqsktch`.

##### 17. Phân hệ Quản lý Hạn ngạch (QU - Quota Management)
* **Mô tả:** Quản lý hạn ngạch xuất khẩu hàng dệt may vào các thị trường đặc thù quốc tế, theo dõi số dư hạn ngạch và cấp phép.
* **Danh sách bảng (6 bảng):** `qumtype`, `quqpbal`, `quqpool`, `quqptrx`, `qureq`, `qursv`.

##### 18. Phân hệ Thanh toán tích hợp (FNPY - Payment Integration)
* **Mô tả:** Chi tiết thanh toán tích hợp, chi phí hoàn thiện sản phẩm cuối cùng và đối chiếu hóa đơn thanh toán.
* **Danh sách bảng (7 bảng):** `fnpydis`, `fnpyialc`, `fnpyinvc`, `fnpyinvc2`, `fnpyitems`, `fnpymnt`, `fnpymnt2`.

##### 19. Phân hệ Quản lý bán thành phẩm phân xưởng (WK/WKO - Work in Progress)
* **Mô tả:** Quản lý bán thành phẩm tại tổ cắt/may/hoàn thiện, thẻ kho bán thành phẩm và giao nhận nội bộ giữa các công đoạn phân xưởng.
* **Danh sách bảng (14 bảng):** `wk_ivskcrd`, `wk_ivskcrd2`, `wk_lotid`, `wkoasm`, `wkochrg`, `wkoclosematr`, `wkomstr`, `wkoprcs`, `wkoprice`, `wkosktch`, `wkprepay`, `wkpyitem`, `wkrvtrx`, `wkrvtrx2`.

---

### 3. BIỂU ĐỒ GỢI Ý & LUỒNG DỮ LIỆU LIÊN PHÂN HỆ

#### 3.1. Sơ đồ Luồng đi dữ liệu cốt lõi (Data Flow Diagram)
Dưới đây là mô tả luồng đi dữ liệu khi một Đơn hàng Thương mại chuyển đổi thành Đơn hàng sản xuất và đối chiếu Kế toán:

```
[Khách hàng]
     │
     ▼ (Báo giá & Đơn bán hàng)
[SA Phân hệ - saomstr / saotrx] ──────► [SM Phân hệ - Đơn hàng Mẫu]
     │
     ▼ (Nhu cầu Sản xuất)
[JO Phân hệ - joomstr] ────────────────► [JOYBOM - Định mức kỹ thuật]
     │                                           │
     ▼ (Yêu cầu Vật tư)                          ▼ (Phân tích MRP)
[PY Phân hệ - pyworkorder]               [MR/MPP Phân hệ]
     │                                           │
     ▼ (Sản xuất & Công đoạn)                    ▼ (Đơn mua hàng PO)
[PY Tiến độ - pywrkprogress]             [PU Phân hệ - puomstr / puoitem]
     │                                           │
     ▼ (Thành phẩm hoàn thành)                   ▼ (Nhập kho Nguyên vật liệu)
[FG Phân hệ - fgmitem / fgctn]           [IV Phân hệ - ivsktrx / ivskitm]
     │                                           │
     └───────────────────┬───────────────────────┘
                         │ (Bút toán tự động)
                         ▼
             [ACC Phân hệ - accvch / acctrx] ◄── [Sổ cái / Sổ nhật ký]
```

#### 3.2. Mối quan hệ thực thể (Entity Relationship Analysis)
Các bảng trong DB liên kết chặt chẽ thông qua các Primary Key và Foreign Key logic:
1. **Liên kết Sales Order & Production Order:**
   * `saomstr.OrderNo` (Khóa chính) ── (1:N) ──► `saotrx.OrderNo` (Khóa ngoại)
   * `saomstr.OrderNo` ── (1:N) ──► `joomstr.OrderNo` / `joybom.OrderNo` (Liên kết sang Kế hoạch & Định mức sản xuất)
2. **Liên kết Định mức BOM & Quản lý Kho:**
   * `joybom.MatrCode` (Mã nguyên vật liệu) ── (N:1) ──► `sygmatr.MatrCode` (Danh mục vật tư hệ thống)
   * `sygmatr.MatrCode` ── (1:N) ──► `ivskitm.ItmID` / `ivismatr.MatrCode` (Thẻ kho và phân bổ nguyên vật liệu)
3. **Liên kết Tiến độ & Tiền lương sản phẩm:**
   * `pyworkorder.WrkOrder` (Mã lệnh sản xuất) ── (1:N) ──► `pywrkprogress.WrkOrder` (Tiến độ chi tiết từng tổ/nhóm)
4. **Liên kết Kế toán tài chính:**
   * `accvch` (Voucher Header: `Journal`, `VoucherNo`) ── (1:N) ──► `acctrx` (Chi tiết bút toán Sổ cái: `Journal`, `VoucherNo`, `Trxno`)

---

### 4. INSIGHT & ĐỀ XUẤT KIẾN TRÚC CỐT LÕI

#### 4.1. Đánh giá & "Insight" kỹ thuật
1. **Vấn đề Mã hóa ký tự (Encoding - Big5):**
   * **Phát hiện:** Các bảng đều đang cấu hình bộ mã `big5 COLLATE big5_chinese_ci`. Đây là bộ mã hóa tiếng Trung truyền thống (Traditional Chinese) phổ biến tại Đài Loan và Hồng Kông, xuất phát từ việc hệ thống được xây dựng bởi các nhà phát triển hoặc đối tác Đài Loan.
   * **Rủi ro:** Khi vận hành tại Việt Nam hoặc các thị trường quốc tế, việc lưu trữ tiếng Việt có dấu hoặc ký tự đặc biệt sẽ gây ra lỗi hiển thị (lỗi font `???` hoặc ký tự rác).
   * **Đề xuất hành động:** Tiến hành Migrate toàn bộ cơ sở dữ liệu sang `utf8mb4` và collation `utf8mb4_unicode_ci` để hỗ trợ đa ngôn ngữ toàn diện (Tiếng Việt, Tiếng Anh, Tiếng Trung giản thể/phồn thể).
2. **Chiến lược Phân vùng dữ liệu (Partitioning) & Indexing:**
   * **Bảng lịch sử giao dịch siêu lớn:** Các bảng ghi nhận lịch sử như `acctrx` (Kế toán), `ivsktrx` (Giao dịch kho nguyên vật liệu), `fgctrx` (Giao dịch kho thành phẩm) và `pywrkprogress` (Tiến độ công đoạn) sẽ phình to rất nhanh với tốc độ hàng triệu bản ghi mỗi tháng.
   * **Đề xuất hành động:**
     * Thực hiện **Range Partitioning** theo cột thời gian (ví dụ `TrxDate` hoặc `SysCreateDate`) theo chu kỳ 1 tháng hoặc 1 quý một vùng chứa.
     * Đánh **Composite Index (Index phủ)** trên `acctrx` cho bộ ba `(Account, Dept, TrxDate)` để tối ưu hóa tối đa các câu lệnh kết chuyển số dư cuối kỳ.

#### 4.2. Thiết kế mẫu 1 Table Cốt lõi & Đặc tả API mẫu
Dưới đây là thiết kế mẫu chuẩn hóa cho bảng quản lý Lệnh sản xuất (`pyworkorder`) và API liên quan để Agent lập trình triển khai ngay lập tức.

##### Bảng `pyworkorder` (Lệnh sản xuất chi tiết)
| Tên cột | Kiểu dữ liệu | Khóa | Giá trị mặc định | Ghi chú |
| :--- | :--- | :--- | :--- | :--- |
| `FactoryID` | `INT` | `PK` | | ID nhà xưởng / Phân xưởng |
| `WrkOrder` | `VARCHAR(14)` | `PK` | | Mã lệnh sản xuất (Khóa chính) |
| `OrderNo` | `VARCHAR(14)` | `FK` | | Liên kết đơn hàng thương mại (`saomstr.OrderNo`) |
| `Style` | `VARCHAR(30)` | `IDX` | | Mã phong cách / Mã hàng thiết kế |
| `Status` | `CHAR(1)` | | `'A'` | Trạng thái lệnh (A: Active, C: Closed, P: Pending) |
| `SysLMDate` | `DATETIME` | | `CURRENT_TIMESTAMP` | Thời gian sửa đổi gần nhất |

##### Đặc tả RESTful API mẫu: Quản lý Lệnh sản xuất
* **API 1: Lấy danh sách Lệnh sản xuất**
  * **Endpoint:** `GET /api/v1/production/work-orders`
  * **Tham số query:** `factoryId`, `status`, `page`, `limit`
  * **Phản hồi (200 OK):**
    ```json
    {
      "success": true,
      "data": [
        {
          "factoryId": 1,
          "workOrder": "WO20260716001",
          "orderNo": "ORD202607011",
          "style": "TSHIRT-POLO-01",
          "status": "A",
          "lastUpdate": "2026-07-16T14:10:00Z"
        }
      ],
      "pagination": { "page": 1, "limit": 10, "total": 150 }
    }
    ```
* **API 2: Cập nhật Tiến độ công đoạn sản xuất**
  * **Endpoint:** `POST /api/v1/production/work-orders/progress`
  * **Payload:**
    ```json
    {
      "workOrder": "WO20260716001",
      "processId": "SEWING-02",
      "workerId": "EMP9088",
      "quantityCompleted": 120,
      "timestamp": "2026-07-16T14:10:00Z"
    }
    ```

---
