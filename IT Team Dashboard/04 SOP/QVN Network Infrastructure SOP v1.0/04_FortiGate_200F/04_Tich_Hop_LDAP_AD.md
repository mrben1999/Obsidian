# 🔗 Phần 4.4 — Tích hợp LDAP/Active Directory

## 1. Mục đích
Tích hợp LDAP cho phép FortiGate: (a) xác thực quản trị viên bằng tài khoản AD thay vì tài khoản cục bộ, và (b) áp dụng Firewall Policy theo AD Group (Identity-Based Policy) khi kết hợp với FSSO/RADIUS (xem [[05_Tich_Hop_RADIUS_FSSO]]).

## 2. Tạo tài khoản dịch vụ cho LDAP Bind (đã tạo tại AD)
📌 Sử dụng tài khoản `svc-fortigate-ldap` đã tạo theo [[../01_Windows_Server_AD/08_Hardening_AD]] mục 4 — quyền Read-only, không phải Domain Admin.

## 3. Cấu hình LDAP Server trên FortiGate

```
config user ldap
    edit "AD-QVN"
        set server "10.10.10.10"
        set server-port 389
        set cnid "sAMAccountName"
        set dn "DC=qvn,DC=local"
        set type regular
        set username "CN=svc-fortigate-ldap,OU=QVN-ServiceAccounts,DC=qvn,DC=local"
        set password ENC_PASSWORD_HERE
        set group-member-check user-attr
        set group-search-base "OU=SecurityGroups,OU=QVN-Groups,DC=qvn,DC=local"
    next
end
```

| Tham số | Ý nghĩa |
|---|---|
| `cnid` | Thuộc tính LDAP dùng làm username đăng nhập — `sAMAccountName` khớp đúng username kiểu `an.nguyen` dùng trong AD |
| `dn` | Base DN của domain — gốc tìm kiếm LDAP |
| `type regular` | Bind bằng tài khoản dịch vụ cụ thể (không dùng anonymous bind) |
| `group-search-base` | Giới hạn phạm vi tìm kiếm Group — trỏ đúng OU chứa các Security Group đã tạo |

🔒 Khuyến nghị dùng **LDAPS (port 636)** thay vì LDAP thường (389) nếu AD đã cấu hình chứng chỉ hỗ trợ (xem [[../01_Windows_Server_AD/08_Hardening_AD]] mục 7) — đổi `set server-port 636` và bật `set secure ldaps`.

## 4. Test kết nối LDAP
```
diagnose test authserver ldap AD-QVN an.nguyen MatKhauCuaAnNguyen
```
✅ Kết quả trả về "Authentication OK" xác nhận LDAP bind thành công và user tồn tại đúng trong AD.

## 5. Tạo User Group trên FortiGate ánh xạ AD Group
📌 FortiGate cần "biết" các AD Group nào sẽ dùng cho Firewall Policy — tạo User Group tham chiếu tới LDAP Group tương ứng.

```
config user group
    edit "FGT-GRP-IT-Admin"
        set member "AD-QVN"
        config match
            edit 1
                set server-name "AD-QVN"
                set group-name "CN=GG-IT-Admin,OU=SecurityGroups,OU=QVN-Groups,DC=qvn,DC=local"
            next
        end
    next
    edit "FGT-GRP-Office"
        set member "AD-QVN"
        config match
            edit 1
                set server-name "AD-QVN"
                set group-name "CN=GG-Wifi-VanPhong,OU=SecurityGroups,OU=QVN-Groups,DC=qvn,DC=local"
            next
        end
    next
end
```

## 6. Cấu hình đăng nhập quản trị FortiGate bằng tài khoản AD
```
config system admin
    edit "it-manager"
        set remote-auth enable
        set wildcard enable
        set accprofile "super_admin"
        set vdom "root"
        set wildcard-fqdn "QVN"
    next
end
```
📌 Cú pháp remote-admin qua LDAP/wildcard có thể khác biệt nhỏ tuỳ phiên bản FortiOS — nếu lệnh trên không nhận đúng tham số trên thiết bị thật, dùng Web GUI: **System → Administrators → Create New → Match all users in a group** → chọn `FGT-GRP-IT-Admin`, gán quyền `super_admin`.

🔒 Sau khi xác nhận đăng nhập AD hoạt động ổn định, cân nhắc **vô hiệu hoá** tài khoản `admin` cục bộ mặc định (giữ lại 1 tài khoản local dự phòng có mật khẩu cực mạnh, lưu an toàn, chỉ dùng khi AD/LDAP gặp sự cố — không xoá hẳn để tránh mất quyền truy cập hoàn toàn nếu AD sập).

## 7. Kiểm tra
- [ ] ✅ `diagnose test authserver ldap` trả về thành công với tài khoản test.
- [ ] ✅ Đăng nhập Web GUI FortiGate bằng tài khoản AD (`it-manager`) thành công.
- [ ] ✅ User Group ánh xạ đúng AD Group — kiểm tra qua **Monitor → Firewall User Monitor** khi có phiên đăng nhập.

➡️ Tiếp theo: [[05_Tich_Hop_RADIUS_FSSO]]
