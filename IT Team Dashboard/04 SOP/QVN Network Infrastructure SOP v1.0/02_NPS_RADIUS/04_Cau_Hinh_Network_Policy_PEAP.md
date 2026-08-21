# 🛡️ Phần 2.4 — Network Policy — PEAP-MSCHAPv2

## 1. Điều kiện tiên quyết
- [ ] RADIUS Client đã khai báo ([[03_Cau_Hinh_RADIUS_Clients]]).
- [ ] Certificate đã sẵn sàng trên NPS ([[05_Trien_Khai_Certificate]]).
- [ ] Đã tạo AD Group tương ứng nhu cầu truy cập (VD: `GG-Mang-Day-SanXuat`, xem [[../01_Windows_Server_AD/05_Thiet_Ke_OU_GPO]]).

## 2. Dùng Wizard "Configure 802.1X" (khuyến nghị — theo đúng quy trình chính thức Microsoft)

1. Mở **Network Policy Server** console → **NPS (Local)**.
2. Trong **Standard Configuration**, chọn **RADIUS server for 802.1X Wireless or Wired Connections**.
3. Click **Configure 802.1X**.
4. **Select 802.1X Connections Type:**
   - Chọn **Secure Wired Connections** (cho mạng dây qua CBS350) — tạo riêng 1 policy.
   - Lặp lại wizard lần 2 chọn **Secure Wireless Connections** (cho Wi-Fi qua UniFi) — tạo policy riêng.
   - Đặt tên rõ ràng: `802.1X-Wired-SanXuat`, `802.1X-Wireless-Staff`.
5. **Specify 802.1X Switches** (hoặc Wireless Access Points): chọn RADIUS Client đã khai báo ở bước trước (VD: `SW-ACC-XUONG-01` cho policy Wired, `UNIFI-CTRL-01` cho policy Wireless).
6. **Configure an Authentication Method:** chọn **Microsoft: Protected EAP (PEAP)** → click **Configure**.
7. Trong **Edit Protected EAP Properties**:
   - **Certificate issued:** chọn certificate đã cấp cho NPS (`DC01.qvn.local`).
   - **EAP Types:** giữ **Secured password (EAP-MSCHAP v2)**.
   - **OK**.
8. **Specify User Groups:** thêm AD Group tương ứng (VD: `GG-Mang-Day-SanXuat` cho policy Wired).
9. **Configure Traffic Controls** (VLAN — xem chi tiết ở [[06_Tich_Hop_AD_Groups_VLAN]]): có thể bỏ qua ở bước này, cấu hình chi tiết VLAN sẽ chỉnh riêng trong Network Policy sau khi wizard tạo xong.
10. **Finish**.

## 3. Kiểm tra Policy được tạo tự động
Wizard tạo ra 2 loại policy:
- **Connection Request Policy** (dưới `Policies → Connection Request Policies`) — quyết định request nào NPS này sẽ xử lý.
- **Network Policy** (dưới `Policies → Network Policies`) — quyết định user có được phép và điều kiện gì.

```powershell
Get-NpsConnectionRequestPolicy | Select-Object PolicyName, Enabled
Get-NpsNetworkPolicy | Select-Object PolicyName, Enabled, ProcessingOrder
```

## 4. Thứ tự xử lý Policy (Processing Order) — quan trọng
📌 NPS xử lý Network Policy theo **thứ tự từ trên xuống**, dừng lại ở policy đầu tiên khớp điều kiện. Sắp xếp policy cụ thể (nhóm nhỏ, điều kiện chặt) **lên trên**, policy tổng quát (nếu có) xuống dưới.

Ví dụ thứ tự khuyến nghị:
1. `802.1X-Wired-SanXuat` (điều kiện: RADIUS Client = SW-ACC-XUONG-01, Group = GG-Mang-Day-SanXuat)
2. `802.1X-Wireless-Staff` (điều kiện: RADIUS Client = UNIFI-CTRL-01, Group = GG-Wifi-VanPhong)
3. Policy mặc định **Deny** cuối cùng — đảm bảo mọi request không khớp điều kiện nào đều bị từ chối (không để lọt request lạ).

Sắp xếp lại thứ tự qua GUI: chọn policy → click **Move Up**/**Move Down**, hoặc PowerShell:
```powershell
Set-NpsNetworkPolicy -Name "802.1X-Wired-SanXuat" -ProcessingOrder 1
```

## 5. Cấu hình chi tiết thêm cho Network Policy (Properties)

Mở lại policy vừa tạo → **Properties**:

- **Overview tab:**
  - **Policy enabled:** ✅ tích chọn.
  - **Grant Access:** chọn (nếu điều kiện khớp thì cho phép, thay vì Deny).
- **Constraints tab → Authentication Methods:** xác nhận chỉ **Microsoft: Protected EAP (PEAP)** được chọn — bỏ các phương thức yếu hơn (PAP, CHAP) nếu không thật sự cần.
- **Settings tab → RADIUS Attributes → Standard:** đây là nơi thêm thuộc tính gán VLAN động — xem [[06_Tich_Hop_AD_Groups_VLAN]].

## 6. Ví dụ qua PowerShell (tạo Network Policy thủ công, thay thế wizard nếu cần script hoá)
```powershell
New-NpsNetworkPolicy -Name "802.1X-Wired-SanXuat" `
  -Enabled $true `
  -ProcessingOrder 1 `
  -PolicyState Enabled `
  -AccessPermission Allow `
  -AuthMethod EAP `
  -EapType "Microsoft: Protected EAP (PEAP)" `
  -UserGroups "QVN\GG-Mang-Day-SanXuat"
```
📌 Cú pháp cmdlet NPS PowerShell có thể khác nhau chút ít tuỳ bản Windows Server — nếu cmdlet trên báo lỗi tham số, dùng Wizard GUI ở mục 2 làm phương án chính, đây là cách được Microsoft khuyến nghị và ít rủi ro sai sót hơn.

## 7. Kiểm tra hoạt động (test thực tế)
- [ ] ✅ Kết nối thử 1 máy trạm/laptop test vào port switch đã bật 802.1X (xem [[../03_Cisco_CBS350/05_8021X_RADIUS]]) — xác nhận đăng nhập AD thành công và được cấp đúng VLAN.
- [ ] ✅ Kiểm tra **Event Viewer → Custom Views → Server Roles → Network Policy and Access Services** trên NPS — log `Network Policy Server granted access` xuất hiện tương ứng.
- [ ] ✅ Thử tài khoản **không** thuộc group được phép → xác nhận bị **từ chối** đúng như thiết kế.

➡️ Tiếp theo: [[06_Tich_Hop_AD_Groups_VLAN]]
