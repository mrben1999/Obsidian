---
tags: [glpi, inventory, network-discovery]
---

# Bandwidth & Scan Range — Tối ưu phạm vi & băng thông quét

Liên quan: [[Network Discovery]]

## Checklist
- [ ] Giới hạn số luồng quét đồng thời (threads)
- [ ] Chia nhỏ dải IP lớn thành nhiều task nếu mạng yếu
- [ ] Đặt lịch quét ngoài giờ cao điểm

## Command / Cấu hình GLPI
Trong Task Discovery, tham số nâng cao:
```
threads = 10          # giảm nếu mạng yếu, tăng nếu hạ tầng khỏe
timeout = 1s per host
```
Với dải `/16` lớn, chia thành nhiều task `/24` chạy so le giờ thay vì 1 task khổng lồ.

## Verify
Theo dõi băng thông qua công cụ giám sát mạng (nếu có) trong lúc task chạy — đảm bảo không gây nghẽn cho traffic nghiệp vụ.

## Troubleshooting
| Lỗi | Nguyên nhân | Cách xử lý |
|---|---|---|
| Nhân viên báo mạng chậm giờ quét | Threads quá cao, quét giờ hành chính | Giảm threads, chuyển lịch ngoài giờ |
| Task chạy quá lâu không xong | Dải IP quá lớn trong 1 task | Chia nhỏ theo từng `/24` |

**Tiếp theo:** [[04 SOP/Enterprise IT Operations Manual/13 - ITSM (GLPI)/05. Inventory/Printer]] (nghiệp vụ chi tiết) hoặc [[Computer]] để bắt đầu chương quản lý tài sản.
