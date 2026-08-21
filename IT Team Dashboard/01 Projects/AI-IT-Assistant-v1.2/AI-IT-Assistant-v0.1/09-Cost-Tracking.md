# 09 — Cost Tracking

## Mục tiêu

Giữ chi phí gần $0 trong v0.1.

## Theo dõi

| Item | Provider | Cost | Free quota | Usage | Notes |
|---|---|---:|---:|---:|---|
| AI model | | | | | |
| Git | | | | | |
| Cloud | | | | | |
| Storage | | | | | |
| Automation | | | | | |

## Rules

- Không bật dịch vụ trả phí nếu chưa biết cost.
- Kiểm tra billing trước khi dùng API.
- Ưu tiên local/free tier.
- Nếu phát sinh tiền, ghi lại lý do và giá trị nhận được.

## Cost gate

Chỉ tăng ngân sách khi:

1. use case đã chứng minh;
2. biết chi phí dự kiến;
3. có giới hạn spending;
4. giá trị mang lại lớn hơn chi phí.
