---
tags: [glpi, troubleshooting, inventory]
---

# Troubleshooting: Inventory

Liên quan: [[GLPI Agent]] · [[Rules]]

## Checklist chẩn đoán
- [ ] `systemctl status glpi-agent` trên máy trạm
- [ ] Chạy agent với `--debug` xem log chi tiết
- [ ] Kiểm tra endpoint inventory trả về đúng (không bị chặn SSL/firewall)
- [ ] Kiểm tra Rules có chặn/nhận diện sai không

## Bảng lỗi nhanh
| Triệu chứng | Nguyên nhân | Xử lý |
|---|---|---|
| Agent chạy nhưng không thấy asset | Rule chặn duplicate | Xem [[Rules]] |
| Lỗi SSL khi POST | Máy trạm chưa tin cậy CA nội bộ | Xem [[HTTPS]] |
| Máy bị nhân đôi bản ghi | Nhận diện theo MAC thay vì Serial | Đổi ưu tiên trong Rules |

**Xem tiếp:** [[Apache Troubleshooting]]
