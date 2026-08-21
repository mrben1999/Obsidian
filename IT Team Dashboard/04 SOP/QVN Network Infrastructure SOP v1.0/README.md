# 📘 QVN Network Infrastructure SOP v1.0

**Bộ Quy trình Vận hành Chuẩn (SOP) Hạ tầng Mạng** dành riêng cho nhà máy may mặc — biên soạn theo chuẩn doanh nghiệp, bám sát tài liệu chính thức của Cisco và Microsoft.

## Phạm vi tài liệu

| Phần | Nội dung | Thư mục |
|---|---|---|
| 1 | Windows Server 2012 R2 + Active Directory | `01_Windows_Server_AD/` |
| 2 | Windows NPS + RADIUS | `02_NPS_RADIUS/` |
| 3 | Cisco CBS350 (Firmware 3.5.3.3) | `03_Cisco_CBS350/` |
| 4 | FortiGate 200F tích hợp AD/RADIUS | `04_FortiGate_200F/` |
| 5 | UniFi Controller xác thực qua RADIUS | `05_UniFi_Controller/` |
| 6 | Vận hành, backup, hardening, kiểm tra định kỳ, xử lý sự cố | `06_Van_Hanh_Chuan/` |

Ngoài ra:
- `00_Tong_Quan/` — sơ đồ hạ tầng mạng tổng thể, bảng địa chỉ IP/VLAN, quy ước tài liệu.
- `07_Phu_Luc/` — biểu mẫu, bảng liên hệ escalation, glossary.

## Cách dùng trong Obsidian

1. Giải nén toàn bộ thư mục `QVN Network Infrastructure SOP v1.0/` vào vault Obsidian (hoặc mở trực tiếp làm vault riêng).
2. Cài plugin **Mermaid** (đã tích hợp sẵn trong Obsidian core từ bản mới — không cần cài thêm) để hiển thị sơ đồ mạng dạng biểu đồ.
3. Bắt đầu từ `00_Tong_Quan/01_So_Do_Ha_Tang_Mang.md` để nắm kiến trúc tổng thể trước khi đi vào từng phần.
4. Dùng chức năng **Graph View** của Obsidian để xem quan hệ liên kết giữa các tài liệu (các file có backlink chéo qua `[[...]]`).
5. Mỗi phần đều có file **Checklist** cuối cùng — in ra hoặc dùng trực tiếp trong Obsidian (checkbox `- [ ]`) khi thực hiện thao tác trên thiết bị thật.

## Nguyên tắc biên soạn tài liệu này

- Mọi lệnh CLI được trình bày đều đối chiếu theo tài liệu chính thức: **Cisco Business 350 Series CLI Guide**, **Fortinet FortiOS Administration Guide**, **Microsoft Learn — Network Policy Server**.
- Ký hiệu `⚠️` đánh dấu bước rủi ro cao (có thể gây gián đoạn dịch vụ nếu làm sai).
- Ký hiệu `📌` đánh dấu ghi chú đặc thù cho môi trường nhà máy (kiosk, mạng xưởng, thiết bị cấu hình thấp).
- Mọi địa chỉ IP, tên miền, VLAN trong tài liệu là **giá trị mẫu** theo `00_Tong_Quan/02_Bang_Dia_Chi_IP_VLAN.md` — khi triển khai thực tế, thay bằng giá trị thật của nhà máy và cập nhật lại bảng này làm nguồn tham chiếu duy nhất.
- Tài liệu áp dụng nguyên tắc **"1 người vận hành"** (single IT Manager) — ưu tiên quy trình rõ ràng, từng bước, có thể làm theo mà không cần hỏi thêm ai.

## Phiên bản
- **v1.0** — Phát hành lần đầu.
- Khi hạ tầng thay đổi (đổi firmware, đổi model thiết bị, đổi IP/VLAN), cập nhật trực tiếp tài liệu và ghi lại lịch sử tại `07_Phu_Luc/02_Lich_Su_Thay_Doi.md`.
