---
tags: [glpi, reports, licenses]
---

# Licenses Reports — Báo cáo bản quyền phần mềm

Liên quan: [[License]] · [[Software]]

## Checklist
- [ ] Báo cáo license sắp hết hạn (30-60-90 ngày)
- [ ] Báo cáo license bị sử dụng vượt số lượng mua
- [ ] Gửi báo cáo cho IT Manager trước khi gia hạn hợp đồng

## Command
```sql
SELECT name, number, expire
FROM glpi_licenses
WHERE expire IS NOT NULL AND expire < NOW() + INTERVAL 60 DAY
ORDER BY expire ASC;
```

## Verify
Đối chiếu danh sách license sắp hết hạn với hợp đồng nhà cung cấp, đảm bảo gia hạn kịp thời trước ngày hết hạn.

## Troubleshooting
| Lỗi | Nguyên nhân | Cách xử lý |
|---|---|---|
| License hết hạn không ai xử lý kịp | Không có báo cáo định kỳ | Đưa query trên vào [[Reports Automation]] chạy tự động hàng tuần |

**Tiếp theo:** [[Warranty]]
