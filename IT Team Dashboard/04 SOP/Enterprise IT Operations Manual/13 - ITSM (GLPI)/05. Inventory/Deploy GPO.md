---
tags: [glpi, inventory, deployment]
---

# Deploy GPO — Triển khai Agent qua Active Directory

Liên quan: [[GLPI Agent]] · [[Deploy PDQ]] · [[Deploy Intune]]

## Checklist
- [ ] Đưa file MSI vào Software Distribution Point
- [ ] Tạo GPO Startup Script
- [ ] Thí điểm trên OU nhỏ trước khi rollout toàn công ty

## Command
```powershell
New-Item -Path "\\dc01\SoftwareDeploy\GLPIAgent" -ItemType Directory
Copy-Item "GLPI-Agent-1.10-x64.msi" "\\dc01\SoftwareDeploy\GLPIAgent\"
```
Script `Install-GLPIAgent.ps1` (gán vào GPO Startup):
```powershell
$installed = Test-Path "C:\Program Files\GLPI-Agent\glpi-agent.exe"
if (-not $installed) {
    Start-Process msiexec.exe -ArgumentList `
      "/i \\dc01\SoftwareDeploy\GLPIAgent\GLPI-Agent-1.10-x64.msi /qn SERVER=https://glpi.quangviet.local/front/inventory.php TAG=QV-HN" -Wait
}
```
Gán vào `Computer Configuration > Policies > Windows Settings > Scripts > Startup`, link vào OU thí điểm (`OU=IT`) trước.

## Verify
```powershell
gpupdate /force
gpresult /r   # xác nhận GPO đã áp dụng
```
Kiểm tra `C:\Program Files\GLPI-Agent\glpi-agent.exe` tồn tại, và máy xuất hiện trên GLPI.

## Troubleshooting
| Lỗi | Nguyên nhân | Cách xử lý |
|---|---|---|
| GPO không áp dụng | Máy chưa reboot hoặc sai OU link | `gpresult /r` kiểm tra |
| Agent cài nhưng không chạy | Antivirus/EDR chặn tiến trình | Thêm exception cho `glpi-agent.exe` |

**Tiếp theo:** [[Deploy PDQ]]
