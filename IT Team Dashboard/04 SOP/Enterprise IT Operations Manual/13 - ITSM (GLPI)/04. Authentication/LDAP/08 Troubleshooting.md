---
tags: [glpi, authentication, ldap, troubleshooting]
---

# 08 Troubleshooting — LDAP chuyên sâu

Liên quan: [[07 Sync]] · [[../../14. Troubleshooting/LDAP Troubleshooting]]

## Checklist chẩn đoán theo thứ tự
- [ ] Kiểm tra kết nối mạng/DNS tới Domain Controller
- [ ] Kiểm tra bind account còn hiệu lực (chưa hết hạn/bị khóa)
- [ ] Kiểm tra BaseDN và filter
- [ ] Kiểm tra chứng chỉ TLS/LDAPS
- [ ] Kiểm tra mapping thuộc tính

## Command chẩn đoán
```bash
# 1. DNS/network
nslookup dc01.quangviet.local
telnet dc01.quangviet.local 636

# 2. Bind account
ldapwhoami -x -H ldaps://dc01.quangviet.local:636 -D "svc-glpi-ldap@quangviet.local" -W

# 3. Kiểm tra chứng chỉ
openssl s_client -connect dc01.quangviet.local:636 -showcerts </dev/null | openssl x509 -noout -dates
```

## Bảng lỗi thường gặp

| Triệu chứng | Nguyên nhân khả dĩ | Cách xử lý |
|---|---|---|
| "Kết nối thất bại" ngay từ bước Test | Sai host/port, firewall chặn | `telnet` kiểm tra port, xem [[../../10. Security/Firewall]] |
| Bind OK nhưng import 0 user | BaseDN/filter sai, hoặc thiếu delegate | Xem lại [[02 Delegation]] và filter tại [[03 LDAP Basic Config]] |
| Import được user nhưng thiếu email/tên | Sai mapping thuộc tính | Đối chiếu bằng `ldapsearch` xem thuộc tính thật sự trả về |
| Đăng nhập AD đúng mật khẩu nhưng GLPI báo sai | `login_field` map sai (dùng UPN thay vì sAMAccountName hoặc ngược lại) | Kiểm tra định dạng username nhân viên đang dùng để login |
| LDAPS lỗi định kỳ theo chu kỳ vài tháng | Chứng chỉ Domain Controller hết hạn | Theo dõi qua [[../../09. Monitoring/Certificates Monitoring]] |
| Nested group không nhận diện thành viên | LDAP mặc định không duyệt nested group | Bật "Sử dụng nested group" trong cấu hình directory |

## Ghi chú thực tế
- Luôn debug theo đúng thứ tự trên — nhảy cóc sang bước sau (vd sửa mapping) khi bước trước (bind account) chưa OK sẽ tốn thời gian oan.
- Giữ log `ldapsearch` mỗi lần troubleshoot để so sánh khi sự cố lặp lại.

**Xem thêm:** [[../../14. Troubleshooting/LDAP Troubleshooting]]

---
**Hoàn tất chương LDAP.** Tiếp theo: [[../AD Groups]]
