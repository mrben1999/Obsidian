---
category: "3.1 GLPI Playbook"
visibility: Technician / Supervisor / Super-Admin only
tags: [glpi-agent, cache, inventory, technician]
---

# [GLPI Agent] Sửa lỗi "The agent is requesting a configuration that has already been sent..."

## 1. Tóm tắt hiện tượng (Symptom)
Trong log agent (`--debug`), xuất hiện thông báo dạng: *"The agent is requesting a configuration that has already been sent, but it does not have a local copy of it"* (hoặc tương tự) — agent chạy nhưng không gửi được inventory mới, dữ liệu trên GLPI không cập nhật dù agent báo "đã chạy xong".

## 2. Nguyên nhân (Root Cause)
GLPI Server lưu trạng thái phiên làm việc (session state) đã cấp cho agent để tối ưu băng thông (tránh gửi lại toàn bộ config mỗi lần). Lỗi này xảy ra khi:
- Agent bị **xóa/reset cache cục bộ** (thư mục lưu trạng thái phiên) nhưng server vẫn nhớ đã từng cấp config cho agent đó → 2 bên bị lệch trạng thái ("desync").
- Thường gặp nhất khi **clone VM/máy ảo template** đã cài sẵn agent — máy con kế thừa cùng agent ID/cache với máy gốc, gây xung đột trạng thái trên server.

## 3. Các bước xử lý (Resolution)
**Cách 1 — Xóa cache cục bộ của agent, để agent tự xin cấp lại config mới hoàn toàn:**
```bash
# Linux
systemctl stop glpi-agent
rm -rf /var/lib/glpi-agent/*
systemctl start glpi-agent
```
```powershell
# Windows
net stop "GLPI Agent"
Remove-Item -Recurse -Force "C:\ProgramData\GLPI-Agent\*"
net start "GLPI Agent"
```

**Cách 2 — Nếu lỗi xảy ra hàng loạt trên các máy clone từ cùng 1 template VM:**
1. Không cài/kích hoạt agent trên máy template gốc trước khi clone.
2. Sau khi clone xong, cài agent mới hoàn toàn trên từng máy (đảm bảo agent tự sinh ID duy nhất), hoặc chạy script xóa cache (Cách 1) trên từng máy con ngay sau khi clone.

**Bước xác nhận:**
```bash
glpi-agent --debug --server=https://glpi.qve.com/front/inventory.php
```
Log phải thể hiện agent nhận config mới thành công, không còn thông báo lỗi trên.

## 4. Thông tin bổ sung (Notes)
- Đây là lỗi khá phổ biến trong môi trường ảo hóa dùng nhiều VM clone (ví dụ phòng Lab/máy ảo test tại Quảng Việt) — nên đưa bước "xóa cache agent sau khi clone" vào quy trình chuẩn dựng VM từ template.
- Nếu lỗi vẫn lặp lại sau khi xóa cache, kiểm tra thêm agent ID có bị hardcode trùng trong file cấu hình `agent.cfg` không (`ls /etc/glpi-agent/`).
- Bài liên quan: [[[GLPI Agent] Sửa lỗi Network Discovery critical error]]
