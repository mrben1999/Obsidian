---
tags: [glpi, asset, software]
---

# Software — Danh mục phần mềm cài đặt

Liên quan: [[License]] · [[GLPI Agent]]

## Checklist
- [ ] Xác nhận Agent có quét software (không tắt cờ `--no-software`)
- [ ] Rà soát phần mềm lạ/không được phép định kỳ
- [ ] Đối chiếu số lượng cài đặt với [[License]] đã mua

## Command
Dữ liệu Software được Agent tự động gửi về, không cần nhập tay. Xem tại `Assets > Software`.
Để rà soát phần mềm không mong muốn:
```sql
SELECT s.name, COUNT(*) AS so_may
FROM glpi_softwareversions sv
JOIN glpi_softwares s ON sv.softwares_id = s.id
JOIN glpi_items_softwareversions isv ON isv.softwareversions_id = sv.id
GROUP BY s.name ORDER BY so_may DESC;
```

## Verify
So sánh danh sách Top phần mềm cài nhiều nhất với danh sách phần mềm được phép của công ty (whitelist).

## Troubleshooting
| Lỗi | Nguyên nhân | Cách xử lý |
|---|---|---|
| Danh sách Software rỗng dù Agent đã cài | Cờ `--no-software` bật nhầm | Kiểm tra lại tham số khi deploy agent |
| Phát hiện phần mềm crack/không rõ nguồn gốc | Nhân viên tự cài không qua IT | Xử lý theo chính sách bảo mật công ty, xem [[Audit]] |

**Tiếp theo:** [[SIM]]
