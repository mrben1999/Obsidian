# 🧯 Phần 4.9 — Troubleshooting FortiGate

## 1. Bảng sự cố thường gặp

| Triệu chứng | Nguyên nhân khả dĩ | Lệnh chẩn đoán | Cách xử lý |
|---|---|---|---|
| Không ra được Internet từ VLAN nội bộ | Sai routing/policy, WAN down | `get router info routing-table all`, `diagnose sys top` | Kiểm tra `get system interface physical`, kiểm tra Firewall Policy tương ứng |
| LDAP bind tới AD thất bại | Sai mật khẩu tài khoản dịch vụ, DNS không phân giải được DC | `diagnose test authserver ldap AD-QVN ...` | Đối chiếu lại [[04_Tich_Hop_LDAP_AD]], kiểm tra DNS FortiGate trỏ đúng |
| FSSO không nhận diện user | Collector Agent chưa chạy, sai port | `diagnose debug authd fsso list` | Kiểm tra service Collector Agent trên DC01 |
| Policy không match đúng như thiết kế | Thứ tự policy sai, hoặc address object sai | `diagnose firewall iprope list`, xem Forward Traffic log | Rà soát lại thứ tự trong [[06_Firewall_Policy_Chuan]] |
| Không đăng nhập được Web GUI quản trị | Trusted Hosts giới hạn sai, VLAN nguồn không đúng | Kiểm tra qua Console cable | Kết nối trực tiếp Console để sửa `trusthost1` nếu bị khoá nhầm |
| CPU/Memory cao bất thường | UTM scan tải nặng, session table đầy, có thể tấn công DDoS | `diagnose sys top`, `get system performance status` | Kiểm tra traffic bất thường, xem xét tạm tắt UTM không cần thiết để giảm tải khẩn cấp |

## 2. Kiểm tra kết nối tổng quát
```
diagnose sys top
get system performance status
execute ping 8.8.8.8
execute traceroute 8.8.8.8
```

## 3. Xem log traffic để chẩn đoán Policy
Qua Web GUI: **Log & Report → Forward Traffic** → lọc theo IP nguồn/đích → xem cột **Policy** để biết traffic đang match rule nào (hoặc bị Deny bởi implicit deny cuối cùng).

Qua CLI (debug flow — dùng khi cần chi tiết real-time):
```
diagnose debug flow filter addr 10.10.30.50
diagnose debug flow show console enable
diagnose debug flow trace start 20
diagnose debug enable
```
⚠️ Lệnh `diagnose debug flow` tạo tải xử lý bổ sung — chỉ bật khi cần điều tra cụ thể, luôn tắt sau khi xong:
```
diagnose debug flow trace stop
diagnose debug disable
```

## 4. Khôi phục quyền truy cập quản trị khi bị khoá (Lockout Recovery)
⚠️ Nếu vô tình cấu hình sai `trusthost1` hoặc quên mật khẩu quản trị:
1. Kết nối trực tiếp qua cổng **Console** (cáp RJ45-to-USB/DB9 tuỳ model).
2. Đăng nhập bằng tài khoản có quyền local (nếu vẫn nhớ) hoặc thực hiện **Factory Reset** (biện pháp cuối):
```
execute factory-reset
```
⚠️ Factory Reset xoá toàn bộ cấu hình — chỉ dùng khi không còn phương án nào khác, sau đó khôi phục từ file backup gần nhất theo [[07_Backup_Restore_Config]].

## 5. Quy trình xử lý "Toàn bộ nhà máy mất Internet"
1. ⚠️ Xác định phạm vi: chỉ 1 VLAN hay toàn bộ (kiểm tra `get system interface physical` xem WAN có up không).
2. Nếu WAN down: liên hệ ISP kiểm tra đường truyền, kiểm tra đèn tín hiệu modem/converter quang.
3. Nếu WAN up nhưng vẫn không ra Internet: kiểm tra `get router info routing-table all`, xác nhận default route còn đúng.
4. Kiểm tra CPU/Memory (`get system performance status`) — loại trừ khả năng thiết bị quá tải do tấn công.
5. Nếu nghi ngờ tấn công DDoS: cân nhắc bật tạm DoS Policy nghiêm ngặt hơn, hoặc liên hệ ISP để lọc traffic từ phía họ.
6. Ghi nhận toàn bộ vào [[../07_Phu_Luc/01_Bieu_Mau]] và [[../06_Van_Hanh_Chuan/04_Xu_Ly_Su_Co]].

➡️ Tiếp theo: [[10_Checklist_Van_Hanh_FortiGate]]
