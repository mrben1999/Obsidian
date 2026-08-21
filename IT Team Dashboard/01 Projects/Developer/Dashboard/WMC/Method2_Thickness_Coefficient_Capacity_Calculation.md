# PHƯƠNG PHÁP TÍNH TỶ LỆ SỬ DỤNG SỨC CHỨA KỆ VẢI (CÓ ĐỘ DÀY KHÁC NHAU)
## METHOD 2: THICKNESS GROUP COEFFICIENT (STANDARD ROLL EQUIVALENT)

Tài liệu này hướng dẫn chi tiết cách áp dụng **Hệ số quy đổi cuộn chuẩn** dựa trên độ dày vải để tính toán chính xác tỷ lệ lấp đầy kho bãi thực tế, giải quyết triệt để sai số giữa các loại vải dày/mỏng khác nhau.

---

## I. TIẾNG VIỆT (VIETNAMESE VERSION)

### 1. Ý tưởng cốt lõi (Concept)
Nếu việc đo đạc bán kính/thể tích của từng cuộn vải quá phức tạp, chúng ta sẽ phân nhóm toàn bộ danh mục vải theo độ dày và gán cho mỗi nhóm một **Hệ số chiếm dụng ($k$)**. 

Ta chọn một loại vải tiêu chuẩn/trung bình làm mốc quy ước ($k = 1.0$):
*   **Nhóm vải mỏng (Ví dụ: Voan, Silk, Mesh):** $k = 0.6$ (1 cuộn chỉ chiếm không gian bằng 60% cuộn tiêu chuẩn).
*   **Nhóm vải trung bình/chuẩn (Ví dụ: Thun, Cotton, Kate):** $k = 1.0$ (Mốc tiêu chuẩn làm cơ sở so sánh).
*   **Nhóm vải dày (Ví dụ: Kaki, Jean, Dạ, Canvas):** $k = 1.5$ đến $1.8$ (1 cuộn chiếm chỗ tương đương 150% - 180% cuộn tiêu chuẩn).

### 2. Công thức tính toán (Formulas)
*   **Bước 1: Xác định sức chứa thiết kế của kệ ($C_{chuẩn}$):** 
    Là số lượng cuộn vải *tiêu chuẩn* tối đa mà một kệ hoặc phân khu có thể chứa được.
*   **Bước 2: Tính số cuộn quy đổi thực tế ($Rolls_{quy\_đổi}$):**
    $$Rolls_{quy\_đổi} = \sum_{i=1}^{n} (Rolls_{thực\_tế\_i} \times k_i)$$
*   **Bước 3: Tính tỷ lệ lấp đầy ($U_{\%}$):**
    $$U_{\%} = \frac{Rolls_{quy\_đổi}}{C_{chuẩn}} \times 100\%$$

### 3. Ví dụ minh họa thực tế
Giả sử tại **Kệ A**, sức chứa thiết kế tối đa là **1,500 cuộn tiêu chuẩn**. Thực tế đang lưu trữ các loại vải sau:

| Loại vải | Độ dày | Số lượng thực tế (Rolls) | Hệ số quy đổi ($k$) | Số lượng quy đổi ($Rolls_{quy\_đổi}$) |
| :--- | :--- | :---: | :---: | :---: |
| **Vải Jean** | Dày | 400 | 1.6 | $400 \times 1.6 = 640$ |
| **Vải Cotton** | Trung bình | 500 | 1.0 | $500 \times 1.0 = 500$ |
| **Vải Voan** | Mỏng | 400 | 0.6 | $400 \times 0.6 = 240$ |
| **Tổng cộng** | | **1,300 cuộn** | | **1,380 cuộn quy đổi** |

*   **Nếu tính theo số cuộn vật lý thuần túy:** $\frac{1,300}{1,500} = \mathbf{86.67\%}$
*   **Tính theo tỷ lệ quy đổi thực tế:** $U_{\%} = \frac{1,380}{1,500} \times 100\% = \mathbf{92.0\%}$

> **Ý nghĩa thực tế:** Vì vải Jean dày chiếm diện tích lớn, hệ thống báo **92.0%** (gần đầy kệ) sẽ chính xác hơn nhiều so với con số 86.67%, giúp thủ kho tránh việc tiếp tục điều phối xếp thêm hàng vào phân khu này.

---

## II. TIẾNG ANH (ENGLISH VERSION)

### 1. Concept
If measuring the physical radius or volume of every single roll is too complex for our current workflow, we can categorize our fabric catalog into specific thickness groups and assign a **Storage Occupancy Coefficient ($k$)** to each group. 

We will establish a standard, medium-thickness fabric as the baseline benchmark ($k = 1.0$):
*   **Thin Fabrics (e.g., Chiffon, Silk, Mesh):** $k = 0.6$ *(1 roll occupies only 60% of a standard roll's space).*
*   **Medium/Standard Fabrics (e.g., Cotton, Jersey, Kate):** $k = 1.0$ *(The baseline benchmark).*
*   **Thick Fabrics (e.g., Denim, Fleece, Canvas, Wool):** $k = 1.5$ to $1.8$ *(1 roll occupies 150% to 180% of a standard roll's space).*

### 2. Step-by-Step Calculation
*   **Step 1: Define the Designed Shelf Capacity ($C_{std}$):**
    The maximum number of *standard* rolls that a specific rack or zone can hold (e.g., Rack A can hold a maximum of 1,500 standard rolls).
*   **Step 2: Calculate the Total Equivalent Rolls ($Rolls_{eq}$):**
    $$Rolls_{eq} = \sum_{i=1}^{n} (Physical\ Rolls_i \times k_i)$$
*   **Step 3: Calculate the Capacity Utilization Rate ($U_{\%}$):**
    $$U_{\%} = \frac{Rolls_{eq}}{C_{std}} \times 100\%$$

### 3. Practical Example for Discussion
Let's look at **Rack A**, which has a designed maximum capacity of **1,500 standard rolls**. Currently, it physically stores a mix of different fabrics:

| Fabric Type | Thickness Group | Physical Quantity (Rolls) | Conversion Coefficient ($k$) | Equivalent Rolls ($Rolls_{eq}$) |
| :--- | :--- | :---: | :---: | :---: |
| **Denim** | Thick | 400 | 1.6 | $400 \times 1.6 = 640$ |
| **Cotton** | Medium (Std) | 500 | 1.0 | $500 \times 1.0 = 500$ |
| **Chiffon** | Thin | 400 | 0.6 | $400 \times 0.6 = 240$ |
| **Total** | | **1,300 physical rolls** | | **1,380 Equivalent Rolls** |

*   **Raw Physical Count Method:** $\frac{1,300}{1,500} = \mathbf{86.67\%}$
*   **Proposed Equivalent Method:** $U_{\%} = \frac{1,380}{1,500} \times 100\% = \mathbf{92.0\%}$

---

## III. ĐỀ XUẤT LỘ TRÌNH TRIỂN KHAI (IMPLEMENTATION ROADMAP)

1.  **Master Data Alignment (Đồng nhất dữ liệu gốc):** 
    Phòng quản lý sản xuất/kỹ thuật ngồi lại để quy ước và nhập hệ số ($k$) cho từng Category/Mã vải vào hệ thống ERP/WMS.
2.  **Database/Query Integration (Tích hợp tính toán tự động):** 
    Tích hợp trực tiếp công thức nhân hệ số quy đổi ($Rolls_{thực\_tế} \times k$) vào câu lệnh truy vấn dữ liệu tồn kho (SQL/ERP) trước khi đẩy lên Dashboard để tự động hiển thị số liệu thời gian thực.
