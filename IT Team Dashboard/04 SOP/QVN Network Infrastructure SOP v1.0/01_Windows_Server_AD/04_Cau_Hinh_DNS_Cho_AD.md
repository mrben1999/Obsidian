# 🌐 Phần 1.4 — Cấu hình DNS cho AD

## 1. Vai trò DNS trong AD
AD DS phụ thuộc hoàn toàn vào DNS để hoạt động (client tìm Domain Controller qua DNS SRV record `_ldap._tcp.qvn.local`). DNS Server đã được cài kèm tự động khi promote AD DS ở bước [[03_Trien_Khai_AD_DS]].

## 2. Kiểm tra Zone DNS đã tạo tự động
```powershell
Get-DnsServerZone
```
✅ Xác nhận có các zone:
- `qvn.local` (Forward Lookup Zone — Active Directory-Integrated)
- `_msdcs.qvn.local`
- Reverse Lookup Zone (nếu tạo thủ công, xem mục 4)

## 3. Cấu hình Forwarders (chuyển tiếp truy vấn ra ngoài)
📌 DNS nội bộ chỉ biết giải quyết tên miền `qvn.local` — với các tên miền Internet (VD: cập nhật Windows Update, truy vấn NTP...), cần cấu hình Forwarders trỏ ra DNS public hoặc DNS do FortiGate cung cấp.

**Qua GUI:** DNS Manager → chuột phải vào tên server → **Properties** → tab **Forwarders** → **Edit** → thêm `8.8.8.8`, `1.1.1.1` (hoặc DNS nội bộ ISP nếu có).

**Qua PowerShell:**
```powershell
Set-DnsServerForwarder -IPAddress 8.8.8.8, 1.1.1.1
```

## 4. Tạo Reverse Lookup Zone (khuyến nghị cho troubleshooting)
```powershell
Add-DnsServerPrimaryZone -NetworkID "10.10.10.0/24" -ReplicationScope "Forest"
Add-DnsServerPrimaryZone -NetworkID "10.10.20.0/24" -ReplicationScope "Forest"
Add-DnsServerPrimaryZone -NetworkID "10.10.30.0/24" -ReplicationScope "Forest"
```
📌 Reverse zone giúp tra ngược IP → hostname, rất hữu ích khi xem log NPS/RADIUS hoặc điều tra sự cố mạng.

## 5. Cấu hình DNS Client trên toàn bộ máy trạm/thiết bị
- Tất cả máy trạm/server trong domain phải trỏ **Preferred DNS Server** về `10.10.10.10` (DC01).
- Trên FortiGate/CBS350/UniFi Controller (không join domain) vẫn nên dùng DNS nội bộ này để phân giải hostname nội bộ khi cần (VD: cấu hình LDAP server bằng hostname thay vì IP).

## 6. Bật/Kiểm tra Scavenging (dọn record DNS cũ)
📌 Trong môi trường DHCP cấp phát động (VLAN Office, Wifi-Staff), record DNS cũ có thể tồn đọng nếu không dọn định kỳ, gây nhầm lẫn khi tra cứu.
```powershell
Set-DnsServerScavenging -ScavengingState $true -ScavengingInterval 7.00:00:00 -RefreshInterval 7.00:00:00 -NoRefreshInterval 7.00:00:00
```

## 7. Kiểm tra sức khoẻ DNS
```powershell
# Kiểm tra các SRV record quan trọng của AD
nslookup -type=srv _ldap._tcp.qvn.local
nslookup -type=srv _kerberos._tcp.qvn.local

# Test phân giải tên miền nội bộ
Resolve-DnsName dc01.qvn.local
```
- [ ] ✅ SRV record `_ldap._tcp.qvn.local` trả về đúng `dc01.qvn.local`.
- [ ] ✅ Forwarders hoạt động — test bằng `Resolve-DnsName google.com`.

## 8. Sự cố DNS thường gặp
| Triệu chứng | Nguyên nhân thường gặp | Cách xử lý |
|---|---|---|
| Máy trạm không join được domain | DNS client trỏ sai (không phải 10.10.10.10) | Sửa lại DNS Server trên máy trạm/DHCP scope |
| `dcdiag` báo lỗi DNS | Thiếu SRV record hoặc zone chưa AD-Integrated | Kiểm tra lại `Get-DnsServerZone`, đảm bảo Replication Scope đúng |
| Không ra được Internet dù DNS nội bộ hoạt động | Forwarders chưa cấu hình/sai | Kiểm tra `Get-DnsServerForwarder`, test lại |

➡️ Tiếp theo: [[05_Thiet_Ke_OU_GPO]]
