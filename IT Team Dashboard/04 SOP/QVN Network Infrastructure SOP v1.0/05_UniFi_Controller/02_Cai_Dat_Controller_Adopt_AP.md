# 🚀 Phần 5.2 — Cài đặt Controller & Adopt AP

## 1. Phương án triển khai Controller
| Phương án | Ưu điểm | Phù hợp |
|---|---|---|
| **UniFi Network Application** cài trên server/VM nội bộ (Windows/Linux) | Toàn quyền kiểm soát, không phụ thuộc cloud | Khuyến nghị cho nhà máy — dữ liệu ở lại on-premise |
| **UniFi Cloud Key/Cloud Gateway** (thiết bị phần cứng chuyên dụng) | Không cần duy trì server riêng | Phù hợp nếu không muốn cài trên server có sẵn |
| **UniFi Cloud-hosted** (Ubiquiti hosting) | Không cần hạ tầng riêng | ⚠️ Không khuyến nghị cho dữ liệu nhạy cảm nhà máy — phụ thuộc cloud bên ngoài |

📌 Theo nguyên tắc **on-premise ưu tiên** trong [[../00_Tong_Quan/03_Quy_Uoc_Tai_Lieu]], khuyến nghị cài **UniFi Network Application** trên máy chủ/VM nội bộ, IP `10.10.10.20` theo bảng chuẩn.

## 2. Cài đặt UniFi Network Application (trên Windows Server, ví dụ VM riêng)
1. Cài **Java Runtime Environment (JRE)** phiên bản tương thích (kiểm tra yêu cầu tại thời điểm cài theo tài liệu chính thức Ubiquiti cho phiên bản UniFi đang dùng).
2. Cài **MongoDB** (UniFi Controller dùng làm database) — phiên bản tương thích theo tài liệu Ubiquiti.
3. Tải bộ cài **UniFi Network Application** từ trang chính thức Ubiquiti (ui.com) → cài đặt theo wizard.
4. Sau khi cài xong, truy cập `https://10.10.10.20:8443` để vào giao diện cấu hình lần đầu (Setup Wizard).

## 3. Setup Wizard lần đầu
1. Đặt tên hệ thống (VD: `QVN-UniFi-Controller`).
2. Tạo tài khoản Admin quản trị Controller (⚠️ đặt mật khẩu mạnh, không dùng chung mật khẩu với hệ thống khác).
3. Chọn **Skip** phần liên kết tài khoản Ubiquiti Cloud (nếu muốn giữ hoàn toàn on-premise, không đồng bộ cloud) — hoặc liên kết nếu nhà máy chấp nhận dùng thêm tính năng quản lý từ xa qua cloud Ubiquiti (cân nhắc chính sách bảo mật nội bộ trước khi bật).
4. Hoàn tất wizard.

## 4. Adopt Access Point vào Controller

### Bước 1 — Kết nối vật lý AP
1. Cắm AP vào port PoE trên switch CBS350 (port đã cấu hình Trunk theo [[../03_Cisco_CBS350/03_Cau_Hinh_VLAN]] mục 6).
2. Chờ AP khởi động (đèn LED chuyển trạng thái chờ adopt — thường nhấp nháy trắng/xanh tuỳ model).

### Bước 2 — Adopt qua giao diện Controller
1. Đăng nhập UniFi Network Application (`https://10.10.10.20:8443`).
2. Vào mục **Devices** — AP mới sẽ xuất hiện ở trạng thái **Pending Adoption**.
3. Click **Adopt**.
4. Chờ AP tải cấu hình và khởi động lại (vài phút) — sau đó chuyển trạng thái **Connected**.

### Bước 3 — Đặt tên AP theo quy ước
```
AP-VanPhong-01
AP-XuongMay-01
AP-Kho-01
```
Đổi tên qua: **Devices** → chọn AP → **Configuration** → **General** → **Name**.

## 5. Nếu AP không tự nhận Controller (Layer 3 Adoption)
📌 Nếu Controller và AP không cùng Layer 2 broadcast domain (VD: AP ở VLAN khác qua Layer 3 routing), cần cấu hình thủ công địa chỉ Controller trên AP qua SSH:
```
set-inform http://10.10.10.20:8080/inform
```
(SSH vào AP bằng tài khoản mặc định `ubnt`/`ubnt` — ⚠️ đổi ngay sau khi adopt thành công).

## 6. Kiểm tra sau khi Adopt
- [ ] ✅ Tất cả AP hiển thị trạng thái **Connected** (màu xanh) trong Controller.
- [ ] ✅ Đã đổi tên AP theo đúng quy ước vị trí.
- [ ] ✅ Firmware AP đã cập nhật lên bản mới nhất được Controller đề xuất (nếu có).

➡️ Tiếp theo: [[03_Tao_Wireless_Network_RADIUS]]
