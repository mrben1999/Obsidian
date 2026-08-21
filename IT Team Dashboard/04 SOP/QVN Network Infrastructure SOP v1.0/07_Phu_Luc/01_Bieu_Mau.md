# 📋 Phụ lục 1 — Biểu mẫu chuẩn

## 1. Biểu mẫu Checklist kiểm tra buổi sáng (hàng ngày)
```markdown
## Kiểm tra hệ thống — Ngày: ___________
- [ ] AD DS: Dịch vụ NTDS/DNS/Netlogon chạy bình thường
- [ ] AD DS: Backup System State đêm qua thành công
- [ ] NPS: Dịch vụ IAS đang chạy
- [ ] CBS350: Không có port lỗi/err-disabled bất thường
- [ ] FortiGate: CPU/Memory/Session trong ngưỡng bình thường
- [ ] UniFi: Toàn bộ AP ở trạng thái Connected
- [ ] Ghi chú bất thường (nếu có): ___________
- [ ] Người kiểm tra: ___________
```

## 2. Biểu mẫu Biên bản sự cố (Incident Report)
```markdown
## Biên bản sự cố
- Mã sự cố: INC-[YYYYMMDD]-[số thứ tự]
- Mức độ: ☐ P1 ☐ P2 ☐ P3 ☐ P4
- Hệ thống ảnh hưởng: ___________
- Thời gian phát hiện: ___________
- Thời gian bắt đầu xử lý: ___________
- Thời gian khắc phục xong: ___________
- Người xử lý: ___________

### Mô tả sự cố
___________

### Phạm vi ảnh hưởng
- Khu vực/bộ phận ảnh hưởng: ___________
- Số người dùng ảnh hưởng: ___________
- Có ảnh hưởng sản xuất trực tiếp không: ☐ Có ☐ Không

### Nguyên nhân gốc (Root Cause)
___________

### Biện pháp khắc phục tạm thời
___________

### Biện pháp khắc phục triệt để
___________

### Bài học kinh nghiệm / Đề xuất cập nhật SOP
___________
```

## 3. Biểu mẫu Change Request
```markdown
## Change Request
- Mã: CHG-[YYYYMMDD]-[số thứ tự]
- Loại: ☐ Standard ☐ Normal ☐ Emergency
- Hệ thống ảnh hưởng: ___________
- Ngày thực hiện dự kiến: ___________
- Người thực hiện: ___________

### Lý do thay đổi
___________

### Đánh giá rủi ro
Mức độ rủi ro: ☐ Thấp ☐ Trung bình ☐ Cao
Lý do đánh giá: ___________

### Kế hoạch thực hiện
1. ___________
2. ___________

### Kế hoạch Rollback
___________

### Backup trước khi thực hiện
- [ ] Đã backup — vị trí lưu: ___________

### Kết quả sau thực hiện
- [ ] Thành công  [ ] Thất bại (đã rollback)
- Ghi chú: ___________
```

## 4. Biểu mẫu Onboarding/Offboarding nhân sự (liên quan hệ thống mạng)
```markdown
## Onboarding/Offboarding — [Tên nhân viên]
- Loại: ☐ Onboarding ☐ Offboarding
- Ngày thực hiện: ___________
- Bộ phận: ___________

### Checklist Onboarding
- [ ] Tạo tài khoản AD đúng OU
- [ ] Thêm vào Security Group phù hợp (Wi-Fi/VLAN)
- [ ] Bàn giao thông tin đăng nhập qua kênh an toàn
- [ ] Join máy trạm vào domain (nếu có máy mới)

### Checklist Offboarding
- [ ] Vô hiệu hoá tài khoản AD
- [ ] Xoá khỏi toàn bộ Security Group
- [ ] Thu hồi thiết bị (nếu có)
- [ ] Chuyển tài khoản vào OU Disabled
```

## 5. Biểu mẫu diễn tập khôi phục (Restore Drill Log)
```markdown
## Restore Drill — [Hệ thống]
- Ngày diễn tập: ___________
- Người thực hiện: ___________
- Loại diễn tập: ☐ AD Object Restore ☐ CBS350 Config ☐ FortiGate Config ☐ UniFi Backup ☐ Full DR

### Kết quả
- [ ] Thành công trong thời gian: ___________
- [ ] Thất bại — lý do: ___________

### Vấn đề phát hiện & cải thiện quy trình
___________
```
