---
tags: [glpi, installation, redis]
---

# 05 Redis — Cache & Session

Liên quan: [[04 MariaDB]] · [[07 GLPI]] · [[09. Monitoring/RAM]]

## Checklist
- [ ] Cài Redis server
- [ ] Giới hạn bind chỉ localhost (bảo mật)
- [ ] Đặt maxmemory + eviction policy
- [ ] Cấu hình GLPI dùng Redis làm cache

## Command
```bash
apt install -y redis-server
sed -i 's/^bind .*/bind 127.0.0.1 -::1/' /etc/redis/redis.conf
sed -i 's/^# maxmemory .*/maxmemory 256mb/' /etc/redis/redis.conf
sed -i 's/^# maxmemory-policy .*/maxmemory-policy allkeys-lru/' /etc/redis/redis.conf
systemctl restart redis-server
```
Trong GLPI (`glpi/config/config_db.php` hoặc qua giao diện `Setup > General > Performance`), khai báo Redis làm cache engine:
```php
$CFG_GLPI['cache_db'] = 'redis://127.0.0.1:6379';
```

## Verify
```bash
redis-cli ping   # phải trả PONG
redis-cli info memory | grep used_memory_human
```

## Troubleshooting
| Lỗi | Nguyên nhân | Cách xử lý |
|---|---|---|
| GLPI vẫn chậm dù đã cấu hình Redis | Chưa bật cache trong giao diện GLPI | Kiểm tra lại `Setup > General > Performance` |
| Redis bị OOM-killed | `maxmemory` đặt cao hơn RAM thực tế | Giảm `maxmemory`, theo dõi tại [[09. Monitoring/RAM]] |
| Redis lộ ra ngoài mạng | Bind sai địa chỉ | Đảm bảo chỉ `bind 127.0.0.1` |

**Tiếp theo:** [[06 SSL]]
