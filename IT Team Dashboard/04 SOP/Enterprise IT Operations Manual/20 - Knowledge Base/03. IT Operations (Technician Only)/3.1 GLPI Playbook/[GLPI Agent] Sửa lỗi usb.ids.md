---
category: "3.1 GLPI Playbook"
visibility: Technician / Supervisor / Super-Admin only
tags: [glpi-agent, usb.ids, inventory, technician]
---

# [GLPI Agent] Sửa lỗi liên quan file `usb.ids`

## 1. Tóm tắt hiện tượng (Symptom)
Khi GLPI Agent chạy task inventory, log agent (`--debug`) xuất hiện cảnh báo/lỗi liên quan đến file `usb.ids` (ví dụ không tìm thấy file, hoặc lỗi parse khi agent cố đọc database USB ID để nhận diện tên thiết bị USB cắm vào máy). Hậu quả: thiết bị USB xuất hiện trong inventory với tên dạng mã số (VID/PID) thay vì tên thân thiện (ví dụ "Logitech USB Mouse").

## 2. Nguyên nhân (Root Cause)
GLPI Agent dùng file cơ sở dữ liệu `usb.ids` (do dự án `usb-ids.gowdy.us` duy trì) để tra cứu tên thiết bị từ mã Vendor ID/Product ID khi quét USB. Trên một số bản cài Linux tối giản (Debian minimal, Docker image nhẹ) hoặc một số máy Windows thiếu gói cập nhật đi kèm, file này **không tồn tại** hoặc **đã lỗi thời**, khiến agent không parse được và ghi log lỗi/cảnh báo, dữ liệu vẫn gửi về được nhưng thiếu tên thiết bị.

## 3. Các bước xử lý (Resolution)
**Trên Linux:**
```bash
# Kiểm tra file usb.ids có tồn tại không
ls -la /usr/share/misc/usb.ids /usr/share/hwdata/usb.ids 2>/dev/null

# Nếu thiếu, cài gói cung cấp file này
apt install -y hwdata
# hoặc tải bản mới nhất thủ công nếu bản dày gói quá cũ
wget -O /usr/share/misc/usb.ids http://www.linux-usb.org/usb.ids
```

**Trên Windows:** GLPI Agent Windows đóng gói sẵn bản `usb.ids` riêng trong thư mục cài đặt (`C:\Program Files\GLPI-Agent\perl\vendor\lib\...`) — nếu lỗi xảy ra trên Windows, thường do bản agent quá cũ. Cập nhật agent lên bản mới nhất sẽ đi kèm file `usb.ids` mới hơn:
```powershell
msiexec /i GLPI-Agent-1.10-x64.msi /qn SERVER=https://glpi.qve.com/front/inventory.php REINSTALL=ALL REINSTALLMODE=vomus
```

**Chạy lại inventory để xác nhận hết lỗi:**
```bash
glpi-agent --debug --server=https://glpi.qve.com/front/inventory.php 2>&1 | grep -i "usb"
```

## 4. Thông tin bổ sung (Notes)
- Đây là lỗi **không nghiêm trọng** — inventory vẫn chạy và gửi dữ liệu về GLPI bình thường, chỉ ảnh hưởng tên hiển thị của thiết bị USB, không ảnh hưởng phần cứng chính (CPU/RAM/Disk) hay chức năng Ticket/SLA.
- Nếu dùng Docker/image tối giản để chạy agent, cân nhắc build sẵn `hwdata` vào image để tránh lặp lại lỗi này trên các container mới.
- Liên quan: [[[GLPI Agent] Sửa lỗi Network Discovery critical error]]
