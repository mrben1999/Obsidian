# 🔌 Phần 2.3 — Cấu hình RADIUS Clients

## 1. Danh sách RADIUS Client cần khai báo (theo hạ tầng nhà máy)

| Tên (Friendly Name) | Địa chỉ IP | Loại thiết bị | Dùng cho |
|---|---|---|---|
| `SW-CORE-01` | 10.10.99.2 | Cisco CBS350 | 802.1X mạng dây |
| `SW-ACC-XUONG-01` | 10.10.99.4 | Cisco CBS350 | 802.1X mạng dây khu xưởng |
| `UNIFI-CTRL-01` | 10.10.10.20 | UniFi Controller | RADIUS profile cho SSID (nếu UniFi gửi request từ Controller) |
| `AP-VANPHONG-01` | (theo IP AP thực tế) | UniFi AP | RADIUS trực tiếp từ AP (tuỳ chế độ UniFi) |

📌 UniFi có thể gửi RADIUS request từ **địa chỉ IP của từng AP** hoặc **từ Controller** tuỳ phiên bản/kiểu triển khai — xác nhận thực tế bằng log NPS khi test lần đầu (xem [[07_Troubleshooting_NPS]]), sau đó khai báo đúng RADIUS Client tương ứng.

## 2. Thêm RADIUS Client qua GUI

1. Mở **Network Policy Server** console → **RADIUS Clients and Servers** → chuột phải **RADIUS Clients** → **New**.
2. **Friendly name:** `SW-CORE-01`.
3. **Address (IP or DNS):** `10.10.99.2`.
4. **Shared secret:** chọn **Manual**, nhập chuỗi mạnh (khuyến nghị ≥ 20 ký tự, sinh ngẫu nhiên) — 🔒 lưu lại an toàn, sẽ cần nhập y hệt trên switch/AP.
5. Tab **Advanced** → **Vendor name**: giữ **RADIUS Standard** (CBS350/UniFi đều dùng chuẩn RADIUS, không cần vendor riêng trừ khi dùng VSA đặc thù).
6. **OK**.

## 3. Thêm RADIUS Client qua PowerShell (khuyến nghị để lưu script tái sử dụng)
```powershell
New-NpsRadiusClient -Name "SW-CORE-01" -Address "10.10.99.2" `
  -SharedSecret "Xy9#mK2pL8vQ4nR7wZ1t" -VendorName "RADIUS Standard"

New-NpsRadiusClient -Name "SW-ACC-XUONG-01" -Address "10.10.99.4" `
  -SharedSecret "Bq3#nJ7kM9pX2vT5wY8u" -VendorName "RADIUS Standard"

New-NpsRadiusClient -Name "UNIFI-CTRL-01" -Address "10.10.10.20" `
  -SharedSecret "Fr6#hL4mN8qW1zX3vB9k" -VendorName "RADIUS Standard"
```

🔒 **Mỗi RADIUS Client nên có Shared Secret riêng biệt** (không dùng chung 1 secret cho toàn bộ thiết bị) — nếu 1 thiết bị bị lộ secret, chỉ cần đổi secret của riêng thiết bị đó, không ảnh hưởng toàn hệ thống.

## 4. Ghi lại Shared Secret vào kho lưu trữ an toàn
📌 Tạo 1 file/kho lưu trữ mật khẩu chuyên dụng (KeePass hoặc tương tự) lưu Shared Secret theo từng RADIUS Client — **không lưu trong tài liệu này ở dạng plaintext lâu dài**, giá trị mẫu trên chỉ minh hoạ, phải thay bằng secret thật khi triển khai và lưu ở nơi bảo mật.

## 5. Kiểm tra danh sách RADIUS Client đã khai báo
```powershell
Get-NpsRadiusClient | Select-Object Name, Address, VendorName
```

- [ ] ✅ Đủ danh sách RADIUS Client tương ứng thiết bị thực tế.
- [ ] ✅ Không có RADIUS Client thừa/không rõ nguồn gốc (rà soát bảo mật định kỳ).

➡️ Tiếp theo: [[05_Trien_Khai_Certificate]] (cần certificate trước khi tạo Network Policy PEAP)
