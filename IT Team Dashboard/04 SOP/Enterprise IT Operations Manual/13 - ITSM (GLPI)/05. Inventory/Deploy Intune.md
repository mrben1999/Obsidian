---
tags: [glpi, inventory, deployment]
---

# Deploy Intune — Triển khai Agent qua Microsoft Intune

Liên quan: [[Deploy PDQ]] · [[Linux Agent]]

## Checklist
- [ ] Đóng gói MSI thành `.intunewin`
- [ ] Tạo Win32 App trong Intune
- [ ] Gán vào nhóm thiết bị/người dùng phù hợp
- [ ] Theo dõi trạng thái cài đặt qua Intune Console

## Command
```powershell
IntuneWinAppUtil.exe -c "C:\Source\GLPIAgent" -s "GLPI-Agent-1.10-x64.msi" -o "C:\Output"
```
Trong Intune Admin Center: **Apps > Windows > Add > Win32 app**
- Install command: `msiexec /i "GLPI-Agent-1.10-x64.msi" /qn SERVER=https://glpi.quangviet.local/front/inventory.php TAG=QV-Remote`
- Uninstall command: `msiexec /x "{PRODUCT-GUID}" /qn`
- Detection rule: file tồn tại `C:\Program Files\GLPI-Agent\glpi-agent.exe`

## Verify
Intune Console > **Apps > Monitor > Device install status** — xác nhận trạng thái "Installed" cho các thiết bị được gán.

## Troubleshooting
| Lỗi | Nguyên nhân | Cách xử lý |
|---|---|---|
| App báo "Failed" hàng loạt | Sai Detection rule | Kiểm tra lại đường dẫn file detection |
| Thiết bị remote (ngoài VPN) không gửi được inventory | Endpoint GLPI không public | Cân nhắc reverse proxy có kiểm soát hoặc bắt buộc VPN trước khi agent chạy |

**Phù hợp cho:** laptop nhân viên làm việc từ xa của Quảng Việt không thường xuyên vào mạng nội bộ.

**Tiếp theo:** [[Linux Agent]]
