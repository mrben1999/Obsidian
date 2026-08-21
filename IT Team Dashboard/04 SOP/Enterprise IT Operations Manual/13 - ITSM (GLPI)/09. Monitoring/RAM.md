---
tags: [glpi, monitoring, ram]
---

# RAM — Giám sát bộ nhớ

Liên quan: [[CPU]] · [[05 Redis]]

## Checklist
- [ ] Theo dõi RAM sử dụng bởi Apache/PHP-FPM, MariaDB, Redis
- [ ] Đảm bảo swap không bị dùng liên tục (dấu hiệu thiếu RAM thật)
- [ ] Cảnh báo khi RAM khả dụng thấp

## Command
```bash
free -h
ps aux --sort=-%mem | head -10
vmstat 1 5
```

## Verify
`free -h` cột "available" nên còn tối thiểu 20% tổng RAM trong điều kiện vận hành bình thường.

## Troubleshooting
| Lỗi | Nguyên nhân | Cách xử lý |
|---|---|---|
| Swap dùng liên tục | RAM vật lý không đủ | Tăng RAM VM hoặc giảm `innodb_buffer_pool_size` tại [[04 MariaDB]] |
| MariaDB chiếm RAM quá nhiều | `innodb_buffer_pool_size` đặt quá cao | Điều chỉnh lại còn ~50-60% RAM |

**Tiếp theo:** [[SSL Monitoring]]
