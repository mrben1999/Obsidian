---
tags: [glpi, backup, disaster-recovery]
---

# Disaster Recovery — Kế hoạch khôi phục sau thảm họa

Liên quan: [[Restore]] · [[02. Architecture]]

## Checklist
- [ ] Xác định RTO (Recovery Time Objective) và RPO (Recovery Point Objective)
- [ ] Chuẩn bị server dự phòng (có thể là VM template sẵn)
- [ ] Diễn tập DR tối thiểu mỗi 6 tháng
- [ ] Tài liệu hóa quy trình từng bước, không phụ thuộc trí nhớ 1 cá nhân

## Mục tiêu đề xuất cho Quảng Việt
| Chỉ số | Mục tiêu |
|---|---|
| RTO (thời gian khôi phục tối đa) | 4 giờ |
| RPO (mất dữ liệu tối đa chấp nhận được) | 24 giờ (= chu kỳ backup hàng ngày) |

## Command / Quy trình DR tóm tắt
```mermaid
flowchart TD
    Disaster[Sự cố: server chính hỏng] --> Provision[Dựng VM mới theo 03. Installation]
    Provision --> RestoreDB[[Restore|Restore DB + Files]]
    RestoreDB --> DNS[Trỏ lại DNS/IP glpi.quangviet.local]
    DNS --> Verify[Verify toàn bộ chức năng]
    Verify --> GoLive[Thông báo Go-live lại cho toàn công ty]
```

## Verify
Diễn tập DR định kỳ: dựng 1 VM test hoàn toàn từ đầu theo tài liệu `03. Installation`, restore backup gần nhất, đo thời gian thực tế so với RTO mục tiêu (4 giờ).

## Troubleshooting
| Lỗi | Nguyên nhân | Cách xử lý |
|---|---|---|
| Diễn tập DR mất hơn 4 giờ | Thiếu chuẩn bị sẵn VM template/script tự động hóa cài đặt | Viết script tự động hóa `03. Installation` thay vì làm tay từng bước khi có sự cố thật |
| Không rõ ai chịu trách nhiệm khi có sự cố ngoài giờ | Thiếu quy trình phân công trực | Bổ sung lịch trực IT vào [[../13. SOP]] |

---
**Hoàn tất chương Backup & Disaster Recovery.** Tiếp theo: [[Dashboard]]
