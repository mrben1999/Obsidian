---
tags: [glpi, asset, nas]
---

# NAS — Quản lý thiết bị lưu trữ mạng

Liên quan: [[Camera]] · [[Files Backup]]

## Checklist
- [ ] Nhập thông tin NAS (Synology/QNAP...) dùng cho backup và lưu trữ camera
- [ ] Theo dõi dung lượng sử dụng định kỳ
- [ ] Liên kết bảo hành phần cứng + ổ đĩa

## Command / Cấu hình GLPI
`Assets > Network Equipment > Add > Type = NAS`, ghi rõ dung lượng tổng, cấu hình RAID.
Nếu NAS hỗ trợ SNMP, có thể thêm vào [[SNMP Discovery]] để theo dõi dung lượng tự động.

## Verify
Đối chiếu dung lượng còn trống trên NAS thực tế với ghi chú trong GLPI, cập nhật định kỳ hàng tháng.

## Troubleshooting
| Lỗi | Nguyên nhân | Cách xử lý |
|---|---|---|
| Dung lượng NAS đầy bất ngờ, ảnh hưởng [[Files Backup]] | Thiếu giám sát định kỳ | Thêm dung lượng NAS vào [[Disk]] |

**Tiếp theo:** [[License]]
