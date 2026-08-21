---
tags: [glpi, troubleshooting, cron]
---

# Troubleshooting: Cron

Liên quan: [[04 SOP/Enterprise IT Operations Manual/13 - ITSM (GLPI)/08. Automation/Cron]] · [[04 SOP/Enterprise IT Operations Manual/13 - ITSM (GLPI)/09. Monitoring/Cron]]

## Checklist chẩn đoán
- [ ] `crontab -u www-data -l` — dòng gọi cron.php tồn tại?
- [ ] `systemctl status cron` — service cron hệ thống chạy?
- [ ] Chạy tay `php front/cron.php` xem lỗi trực tiếp
- [ ] Kiểm tra bảng `glpi_crontasks` cột `lastrun`

## Bảng lỗi nhanh
| Triệu chứng | Nguyên nhân | Xử lý |
|---|---|---|
| Không tác vụ nào chạy | Thiếu crontab hoặc sai path PHP | Thêm lại dòng cron, kiểm tra `which php` |
| 1 tác vụ luôn lỗi | Dữ liệu quá lớn/timeout | Giảm batch size tác vụ đó |
| Tác vụ chạy nhưng chậm dần | Log/dữ liệu tích lũy không purge | Bật purgelogs định kỳ |

**Xem tiếp:** [[Mail Troubleshooting]]
