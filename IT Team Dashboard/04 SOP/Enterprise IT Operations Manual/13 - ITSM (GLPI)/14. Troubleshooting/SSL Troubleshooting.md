---
tags: [glpi, troubleshooting, ssl]
---

# Troubleshooting: SSL

Liên quan: [[06 SSL]] · [[SSL Monitoring]]

## Checklist chẩn đoán
- [ ] `openssl s_client -connect glpi.quangviet.local:443` — kiểm tra chain
- [ ] Kiểm tra `Listen 443` trong `ports.conf`
- [ ] Kiểm tra root CA đã cài trên máy trạm chưa

## Bảng lỗi nhanh
| Triệu chứng | Nguyên nhân | Xử lý |
|---|---|---|
| `SSL_ERROR_RX_RECORD_TOO_LONG` | Port 443 chưa Listen đúng | Kiểm tra `ports.conf` |
| "Not trusted" trên trình duyệt | Thiếu root CA trên máy trạm | Deploy qua GPO |
| Redirect loop | Redirect ở 2 tầng | Chỉ redirect 1 tầng |

**Xem tiếp:** [[Permission Troubleshooting]]
