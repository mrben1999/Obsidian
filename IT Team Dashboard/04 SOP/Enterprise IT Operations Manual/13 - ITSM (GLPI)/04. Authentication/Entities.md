---
tags: [glpi, authentication, entities]
---

# Entities — Cấu trúc thực thể theo chi nhánh

Liên quan: [[Group Mapping]] · [[Rules]] · [[02. Architecture]]

## Checklist
- [ ] Thiết kế cây Entity theo tổ chức thực tế Quảng Việt
- [ ] Tạo rule tự động gán Entity theo OU/IP/TAG
- [ ] Test với user và asset mẫu từng chi nhánh

## Cây Entity đề xuất
```
Quảng Việt (gốc)
├── Chi nhánh Hà Nội
│   ├── Phòng Kinh doanh
│   └── Phòng Kế toán
└── Chi nhánh Hồ Chí Minh
    ├── Phòng Kinh doanh
    └── Kho vận (WH)
```

## Command / Cấu hình GLPI
`Administration > Entities > Add` — tạo lần lượt từ gốc xuống.

Rule gán Entity theo OU (`Administration > Rules > Rules for assigning an item to an entity`):
| Điều kiện | Entity |
|---|---|
| DN chứa `OU=QuangViet_HN` | Quảng Việt > Chi nhánh Hà Nội |
| DN chứa `OU=QuangViet_HCM` | Quảng Việt > Chi nhánh Hồ Chí Minh |

## Verify
Import thử 1 user từ mỗi OU, kiểm tra Entity gán đúng trong `Administration > Users`.

## Troubleshooting
| Lỗi | Nguyên nhân | Cách xử lý |
|---|---|---|
| User bị gán vào Entity gốc thay vì chi nhánh con | Rule không match hoặc thứ tự sai | Kiểm tra lại DN thật của user bằng `ldapsearch` |
| Asset và User cùng nhân viên nhưng khác Entity | Rule Entity cho Asset (theo IP, xem [[Rules]]) không đồng bộ logic với rule User | Thống nhất tiêu chí phân chia Entity giữa 2 loại rule |

**Tiếp theo:** [[Profiles]]
