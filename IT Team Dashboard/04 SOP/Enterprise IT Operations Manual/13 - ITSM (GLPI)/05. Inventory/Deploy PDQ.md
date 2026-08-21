---
tags: [glpi, inventory, deployment]
---

# Deploy PDQ — Triển khai Agent qua PDQ Deploy

Liên quan: [[Deploy GPO]] · [[Deploy Intune]]

## Checklist
- [ ] Có sẵn PDQ Deploy server trong mạng nội bộ
- [ ] Tạo Package cài GLPI Agent
- [ ] Chọn nhóm máy target, deploy thử trước khi mass-deploy

## Command
Trong PDQ Deploy: **New Package** → Install file: `GLPI-Agent-1.10-x64.msi`
Parameters: `/qn SERVER=https://glpi.quangviet.local/front/inventory.php TAG=QV-HN`

Deploy qua PDQ giúp theo dõi trạng thái real-time (Success/Failed) cho từng máy — phù hợp khi cần rollout nhanh mà chưa muốn phụ thuộc chu kỳ GPO refresh.

## Verify
Trong PDQ Deploy Console: xem cột "Status" của deployment — 100% Success trước khi coi là hoàn tất.
Đối chiếu số lượng máy trên GLPI có tăng tương ứng.

## Troubleshooting
| Lỗi | Nguyên nhân | Cách xử lý |
|---|---|---|
| Deploy "Failed - Access Denied" | Tài khoản PDQ Deploy thiếu quyền admin cục bộ trên máy đích | Dùng tài khoản domain admin hoặc cấp quyền tương ứng |
| Máy target không thấy trong danh sách PDQ | Máy không cùng domain hoặc PDQ Scanner chưa quét | Chạy lại "Scan" trong PDQ Inventory trước |

**Tiếp theo:** [[Deploy Intune]]
