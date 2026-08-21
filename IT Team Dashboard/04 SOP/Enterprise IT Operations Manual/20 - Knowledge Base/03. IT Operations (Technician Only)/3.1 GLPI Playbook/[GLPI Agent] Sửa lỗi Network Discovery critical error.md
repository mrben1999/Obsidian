---
category: "3.1 GLPI Playbook"
visibility: Technician / Supervisor / Super-Admin only
tags: [glpi-agent, network-discovery, glpi-inventory-plugin, technician]
---

# [GLPI Agent] Sửa lỗi "Network Discovery critical error"

## 1. Tóm tắt hiện tượng (Symptom)
Khi chạy Task **Discovery** (quét mạng qua SNMP) trong plugin **GLPI Inventory**, task báo trạng thái lỗi nghiêm trọng dạng "critical error" thay vì hoàn tất bình thường, không tìm thấy thiết bị nào dù dải IP khai báo chắc chắn có thiết bị đang hoạt động.

## 2. Nguyên nhân (Root Cause)
Trong GLPI 11, Network Discovery **không còn nằm trong core** mà thuộc plugin **GLPI Inventory** (xem thêm [[../../../05. Inventory/SNMP Discovery]] trong bộ tài liệu Deployment Manual). Lỗi "critical error" thường xuất phát từ 1 trong 3 nguyên nhân gốc, theo thứ tự phổ biến nhất:
1. **Không có local agent nào cùng subnet** với dải IP cần quét — agent thực thi task Discovery bắt buộc phải đứng cùng VLAN/subnet với thiết bị cần quét, nếu không sẽ không gửi/nhận được gói SNMP.
2. **Module Perl phụ thuộc bị thiếu** trên máy chạy agent (`Net::SNMP` hoặc các module liên quan) — thường gặp khi agent cài trên Linux tối giản chưa cài đủ dependency của GLPI Inventory task.
3. **Community string SNMP sai/thiết bị chặn** — agent kết nối được tới subnet nhưng bị timeout toàn bộ do sai community string hoặc ACL trên switch chặn nguồn quét.

## 3. Các bước xử lý (Resolution)
**Bước 1 — Xác nhận agent thực thi task cùng subnet:**
```bash
# Trên máy chạy agent, kiểm tra IP hiện tại
ip a
# Ping thử 1 thiết bị trong dải cần quét để xác nhận cùng layer 2/3
ping 10.10.10.254
```
Nếu agent không cùng subnet → chuyển task sang agent khác đặt đúng VLAN, hoặc dựng thêm 1 agent relay tại VLAN đó.

**Bước 2 — Kiểm tra module Perl phụ thuộc (Linux):**
```bash
perl -MNet::SNMP -e 'print "OK\n"'
# Nếu báo lỗi "Can't locate Net/SNMP.pm":
apt install -y libnet-snmp-perl
```

**Bước 3 — Test SNMP thủ công trước khi chạy lại task:**
```bash
apt install -y snmp
snmpwalk -v2c -c QV_readonly 10.10.10.254
```
Nếu lệnh trên cũng timeout/lỗi → vấn đề nằm ở phía thiết bị (sai community string, ACL chặn) chứ không phải agent — xem lại cấu hình switch theo [[../../../05. Inventory/SNMP Discovery]].

**Bước 4 — Chạy lại task Discovery trong GLPI Inventory plugin**, theo dõi log task chi tiết (không chỉ xem trạng thái tổng, mà mở log chi tiết từng IP để xác định IP nào gây lỗi cụ thể).

## 4. Thông tin bổ sung (Notes)
- Log chi tiết agent giúp chẩn đoán nhanh hơn nhiều so với chỉ nhìn trạng thái "critical error" chung chung — luôn bật `--debug` khi troubleshoot.
- Bài viết liên quan: [[[GLPI Agent] Sửa lỗi usb.ids]] · [[[GLPI Agent] Sửa lỗi configuration already sent]]
