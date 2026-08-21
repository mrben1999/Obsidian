# 🧱 Phần 4.6 — Firewall Policy chuẩn

## 1. Nguyên tắc thiết kế Policy
- **Default Deny:** Không có policy "Allow All" — mọi luồng traffic phải có policy tường minh cho phép, phần còn lại mặc định bị chặn.
- **Thứ tự xử lý từ trên xuống** — policy cụ thể đặt trên, policy tổng quát đặt dưới.
- **Least Privilege theo VLAN/Group** — mỗi VLAN chỉ được phép đúng những gì cần thiết cho chức năng của nó.

## 2. Bảng Policy tổng thể khuyến nghị

| # | Nguồn (Zone) | Đích (Zone) | Dịch vụ | Hành động | Ghi chú |
|---|---|---|---|---|---|
| 1 | zone-mgmt | Any | HTTPS, SSH | Allow | Quản trị thiết bị mạng |
| 2 | zone-office | zone-server | DNS, LDAP, RADIUS | Allow | Máy trạm văn phòng cần xác thực/DNS |
| 3 | zone-production | zone-server | DNS, HTTP/HTTPS (nội bộ) | Allow | Kiosk truy cập Dashboard/MES |
| 4 | zone-wifi-staff | zone-server | DNS, RADIUS | Allow | Wi-Fi nhân viên |
| 5 | zone-office | wan1 (Internet) | HTTP, HTTPS | Allow (theo Group AD) | Giới hạn theo `FGT-GRP-Office`, có Web Filter |
| 6 | zone-production | wan1 (Internet) | HTTPS (giới hạn) | Allow có kiểm soát | Chỉ cho phép domain cập nhật phần mềm MES cụ thể, không mở rộng |
| 7 | zone-wifi-staff | wan1 (Internet) | HTTP, HTTPS | Allow (theo Group AD) | Tương tự Office |
| 8 | zone-guest | wan1 (Internet) | HTTP, HTTPS | Allow | Rate-limit băng thông |
| 9 | zone-guest | zone-server, zone-office, zone-production, zone-wifi-staff, zone-mgmt | Any | **Deny** | Cô lập hoàn toàn Guest khỏi nội bộ |
| 10 | Any | zone-mgmt | Any | **Deny** (trừ rule 1) | Chỉ zone-mgmt tự nó mới vào được chính nó |
| 99 | Any | Any | Any | **Deny** (implicit) | Policy mặc định cuối cùng — luôn tồn tại sẵn trên FortiGate |

## 3. Ví dụ cấu hình CLI — Policy cho phép Office ra Internet (theo AD Group)

```
config firewall policy
    edit 5
        set name "Office-to-Internet"
        set srcintf "vlan20-office"
        set dstintf "wan1"
        set srcaddr "all"
        set dstaddr "all"
        set action accept
        set schedule "always"
        set service "HTTP" "HTTPS"
        set groups "FGT-GRP-Office"
        set nat enable
        set utm-status enable
        set webfilter-profile "default"
        set logtraffic all
    next
end
```
📌 `set groups "FGT-GRP-Office"` giới hạn policy chỉ áp dụng cho user thuộc group đã ánh xạ AD (xem [[04_Tich_Hop_LDAP_AD]]) — yêu cầu FortiGate nhận diện được user qua FSSO hoặc Captive Portal xác thực.

## 4. Ví dụ Policy cô lập Guest khỏi nội bộ

```
config firewall policy
    edit 9
        set name "Guest-Deny-Internal"
        set srcintf "vlan50-guest"
        set dstintf "vlan10-server" "vlan20-office" "vlan30-production" "vlan40-wifistaff" "vlan99-mgmt"
        set srcaddr "all"
        set dstaddr "all"
        set action deny
        set schedule "always"
        set service "ALL"
        set logtraffic all
    next
end
```
⚠️ Đặt policy Deny này **trước** (số thứ tự nhỏ hơn) bất kỳ policy Allow tổng quát nào có thể vô tình khớp traffic từ Guest.

## 5. Ví dụ Policy giới hạn Production ra Internet (chỉ domain cụ thể)
```
config firewall address
    edit "MES-Vendor-Update-Domain"
        set type fqdn
        set fqdn "update.mes-vendor.com"
    next
end

config firewall policy
    edit 6
        set name "Production-Limited-Internet"
        set srcintf "vlan30-production"
        set dstintf "wan1"
        set srcaddr "all"
        set dstaddr "MES-Vendor-Update-Domain"
        set action accept
        set schedule "always"
        set service "HTTPS"
        set nat enable
        set logtraffic all
    next
end
```
📌 Thay `update.mes-vendor.com` bằng domain thực tế của nhà cung cấp phần mềm MES/thiết bị cần cập nhật — nguyên tắc là **whitelist theo domain cụ thể**, không mở toàn bộ Internet cho VLAN Production.

## 6. Web Filter & Application Control (UTM) khuyến nghị
```
config webfilter profile
    edit "default"
        set options block-invalid-url
        config ftgd-wf
            config filters
                edit 1
                    set category 26 (Malicious Websites)
                    set action block
                next
                edit 2
                    set category 7 (Gambling)
                    set action block
                next
            end
        end
    next
end
```
📌 Số category cụ thể tuỳ theo phiên bản FortiGuard category list hiện hành — kiểm tra qua Web GUI **Security Profiles → Web Filter** để chọn đúng danh mục cần chặn (Malicious/Phishing luôn nên chặn ở mọi VLAN có Internet).

## 7. Kiểm tra Policy
```
show firewall policy
diagnose firewall iprope list 100004
```
- [ ] ✅ Không có policy "Allow Any-Any" ngoài ý muốn.
- [ ] ✅ Guest hoàn toàn không truy cập được VLAN nội bộ (test thực tế bằng ping/traceroute từ máy Guest).
- [ ] ✅ Traffic log (`Log & Report → Forward Traffic`) ghi nhận đúng policy match cho từng luồng test.
- [ ] ✅ UTM (Web Filter/Antivirus/IPS) đã bật ở các policy có Internet.

➡️ Tiếp theo: [[07_Backup_Restore_Config]]
