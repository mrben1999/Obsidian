---
type: vendor
status: active
owner:
contract_start:
contract_end:
created: <% tp.date.now("YYYY-MM-DD") %>
tags: [vendor]
---

# 🤝 Vendor — <% tp.file.title %>

## Thông tin nhà cung cấp
- **Tên công ty:**
- **Dịch vụ/sản phẩm cung cấp:**
- **Người liên hệ:**
- **SĐT/Email:**

## Hợp đồng
- **Ngày bắt đầu:**
- **Ngày kết thúc:**
- **Giá trị hợp đồng:**
- **SLA cam kết:**

## Lịch sử làm việc
```dataview
LIST
FROM #incident OR #service-request
WHERE contains(tags, this.file.name)
```

## Đánh giá hiệu quả
- **Chất lượng dịch vụ:** ☐ Tốt ☐ Khá ☐ Cần cải thiện
- **Ghi chú:**

## Gia hạn/Chấm dứt
- [ ] Đã đánh giá trước khi gia hạn
