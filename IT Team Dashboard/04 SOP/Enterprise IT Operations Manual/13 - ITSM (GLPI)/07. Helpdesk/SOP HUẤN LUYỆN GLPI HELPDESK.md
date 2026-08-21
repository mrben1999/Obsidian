---
type: sop
area:
owner: Tô Nguyễn Hải Đăng
version: 1
last_reviewed: 2026-08-17
tags:
  - sop
---
# BỘ SOP HUẤN LUYỆN GLPI HELPDESK

## 📋 Mục Lục  

- 1. [Giới Thiệu Chung](#giới-thiệu-chung)
- 2. [SOP Cho Người Dùng Cuối](#sop-cho-người-dùng-cuối)
- 3. [SOP Cho IT Staff](#sop-cho-it-staff)
- 4. [Quy Trình Quản Lý Ticket](#quy-trình-quản-lý-ticket)
- 5. [Các Tình Huống Phổ Biến](#các-tình-huống-phổ-biến)

---

## 🎯 Giới Thiệu Chung

### GLPI Helpdesk là gì?  

- • **Định nghĩa**: Hệ thống quản lý yêu cầu hỗ trợ kỹ thuật tập trung
- • **Mục đích**: Giúp người dùng báo cáo vấn đề và IT Staff giải quyết vấn đề một cách có hệ thống
- • **Lợi ích**:

  
- Theo dõi tất cả yêu cầu trong một nơi  
- Đảm bảo không có yêu cầu nào bị bỏ sót  
- Cấp báo cáo chi tiết về hiệu suất hỗ trợ

### Các Vai Trò Chính  
| Vai Trò | Quyền Hạn | Trách Vụ |  
|---------|----------|---------|  
| **Người Dùng Cuối** | Tạo, xem ticket của mình | Báo cáo vấn đề chi tiết |  
| **Technician** | Tạo, xem, cập nhật ticket | Giải quyết và theo dõi |  
| **Manager** | Quản lý toàn bộ, báo cáo | Giám sát, phân công |  
| **Admin** | Toàn quyền hệ thống | Cấu hình, bảo trì |

---

## 👥 SOP CHO NGƯỜI DÙNG CUỐI

### I. Truy Cập Hệ Thống

#### Bước 1: Mở Trình Duyệt Web  
```  

- 1. Mở Firefox, Chrome hoặc Edge
- 2. Nhập URL: https://helpdesk.company.com

  
(hoặc địa chỉ mà IT cung cấp)  

- 3. Ấn Enter

  
```

#### Bước 2: Đăng Nhập  
```  

- 1. Nhập Tên Đăng Nhập (Username)

  
- Thường là email hoặc ID nhân viên  
- VD: john.doe@company.com  
  

- 2. Nhập Mật Khẩu

  
- Chữ hoa, chữ thường, số, ký tự đặc biệt  
- Không chia sẻ mật khẩu cho ai  
  

- 3. Ấn nút [LOGIN] hoặc Enter

  
```

**Lưu Ý**:  

- • ⚠️ Nếu quên mật khẩu → Ấn "Forgot Password"
- • ⚠️ Nếu không thể đăng nhập → Liên hệ IT ngay

---

### II. Tạo Ticket Mới (Báo Cáo Vấn Đề)

#### Bước 1: Điều Hướng Tạo Ticket  
```  
Giao Diện Chính:  
├── Menu bên trái → [+ NEW TICKET]  
└── Hoặc: Click nút [CREATE] → "New Ticket"  
```

#### Bước 2: Điền Thông Tin Vấn Đề

**📝 FORM TICKET TIÊU CHUẨN:**

```  
┌─────────────────────────────────────────┐  
│ PHẦN BẮT BUỘC (*) │  
├─────────────────────────────────────────┤  
│ │  
│ 1. TIÊU ĐỀ (Title) * │  
│ ├─ Ngắn gọn, dễ hiểu │  
│ ├─ VD ❌ "Máy tính lỗi" │  
│ └─ VD ✅ "Không thể kết nối WiFi │  
│ trên máy Dell XPS-001" │  
│ │  
│ 2. MÔ TẢ CHI TIẾT (Description) * │  
│ ├─ Nêu rõ vấn đề hiện đang gặp phải │  
│ ├─ Khi nào vấn đề bắt đầu? │  
│ ├─ Đã thử giải pháp nào chưa? │  
│ └─ VD ✅: │  
│ "Kể từ hôm nay sáng 8h, máy │  
│ không kết nối được WiFi. │  
│ Đã restart router nhưng vẫn │  
│ không được. Cần hỗ trợ gấp │  
│ vì đang cần làm việc." │  
│ │  
│ 3. DANH MỤC (Category) * │  
│ ├─ Hardware (Phần cứng) │  
│ ├─ Software (Phần mềm) │  
│ ├─ Network (Mạng) │  
│ ├─ Printer (In ấn) │  
│ ├─ Email/Communication │  
│ └─ Other (Khác) │  
│ │  
│ 4. ĐỘ ƯU TIÊN (Priority) * │  
│ ├─ Low (Thấp) - Có thể chờ 3-5 ngày │  
│ ├─ Medium (Bình thường) - 1-2 ngày │  
│ ├─ High (Cao) - Cùng ngày │  
│ └─ Urgent (Khẩn cấp) - Ngay lập tức │  
│ │  
│ 5. THIẾT BỊ (Equipment/Item) [Tùy chọn] │  
│ ├─ Nếu có: Chọn tên máy tính/ │  
│ │ thiết bị của bạn │  
│ └─ Cách chọn: │  
│ [Search] → Gõ tên → Chọn │  
│ │  
│ 6. NGƯỜI THEO DÕI (Watchers) │  
│ ├─ Có thể thêm đồng nghiệp │  
│ ├─ Họ sẽ nhận thông báo cập nhật │  
│ └─ Ấn [+ Add Watcher] │  
│ │  
└─────────────────────────────────────────┘  
```

#### Bước 3: Đính Kèm Tệp (Nếu Cần)

```  

- 1. Scroll xuống phần "Documents"
- 2. Ấn nút [CHOOSE FILES]
- 3. Chọn ảnh/tệp từ máy của bạn
- 4. Ấn [Open] hoặc [Upload]

📎 Loại tệp được hỗ trợ:  
✅ Ảnh: PNG, JPG, GIF (< 10MB)  
✅ Tài liệu: PDF, DOCX, XLSX  
✅ Log files: TXT, LOG  
❌ Tệp thực thi: EXE, BAT

💡 Mẹo: Ảnh screenshot giúp rất nhiều!  
• Windows: Win + Shift + S  
• Mac: Cmd + Shift + 4  
• Linux: Print Screen  
```

#### Bước 4: Gửi Ticket

```  
Ở cuối form:  
├─ Nút [SUBMIT] - Gửi ticket ngay  
├─ Nút [SAVE DRAFT] - Lưu bản nháp  
└─ Nút [CANCEL] - Hủy bỏ

⏱️ Thời gian xử lý sau khi gửi:  
• Priority Low: 3-5 ngày làm việc  
• Priority Medium: 1-2 ngày làm việc  
• Priority High: Cùng ngày  
• Priority Urgent: Trong 4 giờ  
```

**✅ KIỂM TRA TRƯỚC KHI GỬI:**  

- • [ ] Tiêu đề rõ ràng?
- • [ ] Mô tả đủ chi tiết?
- • [ ] Chọn Category đúng?
- • [ ] Chọn Priority phù hợp?
- • [ ] Đã đính kèm ảnh/file cần thiết?

---

### III. Theo Dõi Ticket Của Bạn

#### Bước 1: Xem Danh Sách Ticket

```  
Menu bên trái:  
├─ [MY TICKETS] hoặc [MY ISSUES]  
└─ Hoặc: [TICKETS] → Lọc "Assigned to me"  
```

#### Bước 2: Hiểu Các Trạng Thái Ticket

```  
┌─────────────────────────────────────────────┐  
│ TRẠNG THÁI TICKET │  
├─────────────────────────────────────────────┤  
│ │  
│ 🟡 NEW (Mới) │  
│ → Ticket vừa được tạo, chưa ai xử lý │  
│ → Có thể mất 1-2 giờ để được nhận │  
│ │  
│ 🟠 ASSIGNED (Được phân công) │  
│ → Technician đã nhận ticket │  
│ → Sẽ bắt đầu xử lý sớm │  
│ │  
│ 🔵 IN PROGRESS (Đang xử lý) │  
│ → Technician đang làm việc │  
│ → Bạn sẽ nhận thông báo khi có cập nhật │  
│ │  
│ 🟣 PENDING (Chờ Xử Lý) │  
│ → Cần thêm thông tin từ bạn │  
│ → Hãy trả lời nhanh để tiếp tục │  
│ │  
│ 🟢 RESOLVED (Đã Giải Quyết) │  
│ → Technician cho rằng vấn đề đã xong │  
│ → Bạn cần xác nhận có hoạt động không │  
│ │  
│ ⚫ CLOSED (Đóng) │  
│ → Ticket hoàn thành │  
│ → Bạn vẫn có thể xem chi tiết │  
│ │  
└─────────────────────────────────────────────┘  
```

#### Bước 3: Xem Chi Tiết Ticket

```  

- 1. Click vào Ticket ID (VD: #12345)
- 2. Màn hình sẽ hiển thị:

  
├─ Thông tin chính  
├─ Lịch sử tương tác  
├─ Ghi chú từ IT Staff  
└─ Tệp đính kèm  
```

---

### IV. Giao Tiếp Trong Ticket

#### Bước 1: Thêm Bình Luận

```  
Cuối trang ticket:  

- 1. Scroll xuống tìm phần "Comments" hoặc "Reply"
- 2. Click vào ô nhập liệu
- 3. Gõ phản hồi của bạn:

✅ VD TỐTS:  
"Vấn đề đã được giải quyết!  
Máy đã kết nối WiFi được rồi.  
Cảm ơn bạn! 👍"  
  
❌ VD KHÔNG TỐT:  
"ok thanks"  
  

- 4. Ấn [SUBMIT COMMENT] hoặc [SEND]

  
```

#### Bước 2: Đính Kèm Tệp Trong Ghi Chú

```  

- 1. Trong phần comment, tìm biểu tượng 📎
- 2. Ấn để chọn tệp
- 3. Chọn tệp từ máy
- 4. Ấn [Open]
- 5. Ấn [Submit] sau khi tệp được upload

  
```

#### Bước 3: Nhận Thông Báo Cập Nhật

```  
📧 Bạn sẽ nhận được email khi:  
✓ Ticket được gán cho Technician  
✓ Technician thêm bình luận  
✓ Trạng thái thay đổi  
✓ Ticket cần thêm thông tin từ bạn

🔔 Cách kiểm tra:  
• Gmail, Outlook hoặc email công ty  
• Cũng có thể log vào GLPI xem  
```

---

### V. Khi Vấn Đề Được Giải Quyết

#### Bước 1: Xác Nhận Giải Pháp

```  
Khi ticket chuyển sang "RESOLVED":

- 1. Kiểm tra vấn đề có thực sự xong?

  
□ Thử lại hoạt động  
□ Kiểm tra trên thiết bị  
  

- 2. Nếu OK → Thêm comment:

  
"Vấn đề đã hoàn toàn giải quyết. Cảm ơn!"  
  

- 3. Nếu vẫn lỗi → Comment:

  
"Vấn đề vẫn còn, chưa hoàn toàn được giải quyết.  
[Mô tả lại vấn đề]"  
```

#### Bước 2: Đóng Ticket

```  
Sau khi xác nhận OK:

- 1. Tìm nút [CLOSE TICKET]
- 2. Nếu cần → Chọn lý do đóng:

  
• Resolved  
• Completed  
• Cannot Reproduce  
  

- 3. Ấn [CONFIRM]

✅ Ticket đã đóng, lưu vào lịch sử  
```

#### Bước 3: Để Lại Đánh Giá (Rating)

```  
Một số hệ thống yêu cầu đánh giá:

- 1. Tìm phần "Survey" hoặc "Rate"
- 2. Chọn số sao ⭐⭐⭐⭐⭐
- 3. Ghi vài dòng feedback (tùy chọn)

  
VD: "Technician rất nhiệt tình và giúp nhanh"  

- 4. Ấn [SUBMIT]

  
```

---

### VI. Các Lỗi Thường Gặp & Cách Khắc Phục

| Lỗi | Nguyên Nhân | Giải Pháp |  
|-----|-----------|----------|  
| Không thể đăng nhập | Mật khẩu sai / Hết hạn tài khoản | Ấn "Forgot Password" hoặc gọi IT |  
| Ticket không được gửi | Form chưa điền đủ | Kiểm tra các trường có dấu * |  
| Không nhận email thông báo | Email không được đăng ký | Yêu cầu IT cập nhật email |  
| Không tìm thấy ticket cũ | Ticket đã bị xóa / Lọc sai | Tìm theo Ticket ID |  
| Không thể upload tệp | Tệp quá lớn hoặc định dạng sai | Nén file hoặc chuyển sang PDF |

---

## 🛠️ SOP CHO IT STAFF (Technician & Manager)

### I. Truy Cập & Quyền Hạn

#### Bước 1: Đăng Nhập Với Quyền Technician

```  

- 1. URL: https://helpdesk.company.com
- 2. Nhập Username & Password (quyền cao hơn người dùng)
- 3. Ấn [LOGIN]

Giao diện sẽ khác với người dùng cuối:  
├─ Menu quản lý rộng hơn  
├─ Có access quản lý tất cả ticket  
├─ Có báo cáo & thống kê  
└─ Có cài đặt hệ thống  
```

#### Bước 2: Hiểu Quyền Hạn

```  
TECHNICIAN (Kỹ Thuật Viên):  
├─ Xem: Tất cả ticket gán cho họ + ticket công khai  
├─ Thực hiện: Giải quyết vấn đề, cập nhật ticket  
├─ Không: Xóa ticket, quản lý user, báo cáo cao cấp  
└─ Mục tiêu: Xử lý vấn đề khách hàng

MANAGER (Quản Lý):  
├─ Xem: Tất cả ticket trong bộ phận / công ty  
├─ Thực hiện: Phân công, báo cáo, cập nhật chính sách  
├─ Quản lý: Team members, workflow, SLA  
└─ Mục tiêu: Giám sát hiệu suất, đảm bảo SLA  
```

---

### II. Dashboard & Tổng Quan

#### Bước 1: Hiểu Dashboard

```  
Trang chủ sau khi đăng nhập:

┌────────────────────────────────────┐  
│ 📊 DASHBOARD TECHNICIAN │  
├────────────────────────────────────┤  
│ │  
│ 🔴 Urgent (Khẩn cấp) [5] │  
│ → Yêu cầu xử lý trong 4 giờ │  
│ → Click để xem & ưu tiên xử lý │  
│ │  
│ 🟠 High Priority [12] │  
│ → Yêu cầu xử lý hôm nay │  
│ │  
│ 🟡 Medium Priority [24] │  
│ → Yêu cầu xử lý 1-2 ngày │  
│ │  
│ 🟢 Low Priority [8] │  
│ → Yêu cầu xử lý 3-5 ngày │  
│ │  
│ ⏰ MY TASKS (Công việc của tôi) │  
│ → Assigned to me: [15] │  
│ → In Progress: [4] │  
│ → Pending: [2] │  
│ │  
│ 📈 TODAY'S STATISTICS │  
│ → Resolved: 7 │  
│ → Created: 12 │  
│ → Closed: 5 │  
│ │  
└────────────────────────────────────┘  
```

#### Bước 2: Sử Dụng Các Widget

```  

- • Click trực tiếp vào số để xem danh sách chi tiết
- • Tìm phần "Filter" để lọc theo:

  
• Status (Trạng thái)  
• Priority (Độ ưu tiên)  
• Category (Danh mục)  
• Assigned to (Gán cho)  
• Date Range (Khoảng thời gian)  
```

---

### III. Quản Lý Ticket - Technician

#### Bước 1: Tiếp Nhận Ticket

```  
FLOW HÀNG NGÀY:

- 1. Mở GLPI lúc 8h sáng
- 2. Kiểm tra Dashboard
- 3. Ưu tiên xử lý:

  
⭐ URGENT tickets trước  
⭐ HIGH tickets  
⭐ Các ticket chờ lâu (> 3 ngày)  
```

#### Bước 2: Xem Ticket Chi Tiết

```  
Từ danh sách → Click vào Ticket ID (VD: #12456)

Màn hình ticket sẽ hiển thị:

┌─────────────────────────────────────┐  
│ 🎫 TICKET #12456 │  
├─────────────────────────────────────┤  
│ │  
│ Status: 🟡 NEW │  
│ Priority: 🔴 HIGH │  
│ Category: Network │  
│ Submitted by: John Doe │  
│ Created: 2024-01-15 09:30 │  
│ │  
│ TITLE: Không kết nối WiFi │  
│ │  
│ DESCRIPTION: │  
│ "Kể từ hôm nay sáng 8h, máy │  
│ không kết nối được WiFi..." │  
│ │  
│ EQUIPMENT: Dell XPS (Dept: HR) │  
│ │  
│ ATTACHMENTS: │  
│ • error_screenshot.png │  
│ • network_logs.txt │  
│ │  
│ 📝 CONVERSATION HISTORY │  
│ ├─ User: [Initial Request] │  
│ ├─ Tech: [Will update] │  
│ └─ ... │  
│ │  
└─────────────────────────────────────┘  
```

#### Bước 3: Chuyển Trạng Thái Thành "ASSIGNED"

```  
Khi vừa tiếp nhận ticket:

- 1. Tìm nút [ASSIGN] hoặc dropdown Status
- 2. Chọn: Status → ASSIGNED (hoặc IN PROGRESS)
- 3. Nếu chưa gán cho mình → Chọn "Assigned to: [Tên bạn]"
- 4. Ấn [UPDATE] hoặc [SAVE]

✅ Người dùng sẽ nhận được email thông báo  
```

#### Bước 4: Thực Hiện Troubleshooting

```  
🔧 CÁC BƯỚC KHẮC PHỤC VẤN ĐỀ TIÊU CHUẨN:

LỚP 1 - KIỂM TRA CƠ BẢN:  
├─ Thiết bị có bật không?  
├─ Kết nối điện / mạng có tốt?  
├─ Driver / Software có cập nhật?  
└─ Restart thiết bị được không?

LỚP 2 - KIỂM TRA SÂU:  
├─ Xem Log của hệ thống  
├─ Kiểm tra Settings  
├─ Test kết nối mạng  
└─ Kiểm tra quyền truy cập

LỚP 3 - GIẢI PHÁP:  
├─ Cài đặt lại driver  
├─ Reset cấu hình  
├─ Tái triển khai hệ thống  
└─ Thay thế phần cứng nếu cần

⚠️ LƯU Ý:  
• Luôn ghi lại từng bước thực hiện  
• Nếu vẫn không giải quyết → Escalate  
```

#### Bước 5: Ghi Chú Trong Ticket

```  
Sau mỗi hành động, PHẢI thêm comment:

- 1. Scroll xuống "Comments" hoặc "Activity"
- 2. Click ô nhập liệu
- 3. Ghi lại:

VD TỐTS:  
"14:30 - Đã liên hệ user, lỗi WiFi trên máy  
Dell XPS.  
- Checked: Router bật, có signal  
- Action: Restart network adapter  
- Result: User report connection restored  
- Status: Monitoring for 2 hours  
  
Nếu lỗi tái phát → Escalate to Network Team"

- 4. Ấn [SUBMIT COMMENT]

💡 LỢI ÍCH:  
• Manager có thể xem được công việc  
• User được cập nhật tình hình  
• Có trail audit cho kiểm toán  
• Dễ handover nếu cần  
```

#### Bước 6: Cập Nhật Trạng Thái Ticket

```  
PROGRESS CỦA TICKET:

NEW → ASSIGNED → IN PROGRESS →  
PENDING/WAITING → RESOLVED → CLOSED

CÁCH CẬP NHẬT:

- 1. Click dropdown "Status"
- 2. Chọn trạng thái mới

┌────────────────────────────────────┐  
│ STATUS DEFINITIONS │  
├────────────────────────────────────┤  
│ │  
│ NEW (Mới) │  
│ → Chưa ai làm gì │  
│ → Tự động khi user tạo ticket │  
│ │  
│ ASSIGNED (Được Phân Công) │  
│ → Technician đã xác nhận │  
│ → Sắp bắt đầu xử lý │  
│ │  
│ IN PROGRESS (Đang Xử Lý) │  
│ → Đang làm việc chủ động │  
│ → Có cập nhật từ tech │  
│ │  
│ WAITING/PENDING (Chờ Xử Lý) │  
│ → Chờ thông tin từ user │  
│ → Chờ phần cứng/tài nguyên │  
│ → Auto-escalate nếu chờ quá lâu │  
│ │  
│ ON HOLD (Tạm Dừng) │  
│ → Chờ quyết định/phê duyệt │  
│ → User đang thử giải pháp │  
│ │  
│ SOLVED/RESOLVED (Đã Giải Quyết) │  
│ → Tech cho rằng vấn đề xong │  
│ → Chờ user xác nhận │  
│ → Không bị đóng tự động │  
│ │  
│ CLOSED (Đóng) │  
│ → User xác nhận OK hoặc │  
│ → Timeout (quá 7 ngày bình luận) │  
│ → Ticket lưu trữ │  
│ │  
└────────────────────────────────────┘

- 3. Ấn [UPDATE] để lưu

  
```

---

### IV. Escalation (Chuyên Giao) & Assignment

#### Bước 1: Khi Nào Cần Escalate?

```  
❌ BẠN NÊN ESCALATE NẾU:

- 1. Vượt ngoài khả năng của bạn

  
→ Cần expertise từ team khác  
→ VD: Database issue → Database team

- 2. Cần phê duyệt từ quản lý

  
→ Thay đổi lớn  
→ Yêu cầu ngân sách

- 3. Cần Hardware mới

  
→ Phải order từ vendor  
→ Cần approval từ Manager

- 4. Khách hàng không hợp tác

  
→ Không thể remote access  
→ Từ chối thực hiện bước troubleshoot

- 5. Quá thời gian SLA

  
→ Vẫn không giải quyết được  
→ Cần level cao hơn  
```

#### Bước 2: Cách Escalate

```  
CÁCH 1 - Sử dụng Escalation:

- 1. Mở ticket
- 2. Tìm dropdown "Escalation" hoặc "Escalate"
- 3. Chọn mục đích escalate:

  
• Escalate to Manager  
• Escalate to Specialist Team  
• Escalate to Vendor  

- 4. Nhập lý do: "Database connection timeout,

  
need DBA expertise"  

- 5. Ấn [CONFIRM]

✅ Manager & team liên quan sẽ nhận thông báo

CÁCH 2 - Gán lại (Reassign):

- 1. Tìm "Assigned to" field
- 2. Click [CHANGE]
- 3. Tìm tên kỹ thuật viên / team:

  
• Technician tên  
• Group/Queue tên  
  

- 4. Thêm ghi chú: "Escalate to Network Team

  
for WiFi issue troubleshooting"  
  

- 5. Ấn [SAVE]

✅ Người được gán sẽ nhận thông báo  
```

#### Bước 3: Xử Lý Ticket Của Người Khác

```  
Nếu manager gán ticket cho bạn:

- 1. Xem lại ticket history

  
→ Hiểu được những gì đã làm  
→ Biết tiến độ hiện tại

- 2. Thêm comment:

  
"Nhận task, bắt đầu troubleshooting...  
[Mô tả hành động của bạn]"

- 3. Cập nhật trạng thái thành "IN PROGRESS"
- 4. Tiếp tục xử lý từ bước trước

  
```

---

### V. SLA (Service Level Agreement) & Deadline

#### Bước 1: Hiểu SLA

```  
SLA = Thỏa Thuận Mức Dịch Vụ

VD SLA TIÊU CHUẨN:

┌──────────────┬──────────────┬────────────┐  
│ Priority │ Response │ Resolution │  
├──────────────┼──────────────┼────────────┤  
│ Urgent │ 1 giờ │ 4 giờ │  
│ High │ 2 giờ │ 8 giờ │  
│ Medium │ 4 giờ │ 2 ngày │  
│ Low │ 1 ngày │ 5 ngày │  
└──────────────┴──────────────┴────────────┘

GIẢI THÍCH:  
• Response: Thời gian trả lời user lần đầu  
• Resolution: Thời gian hoàn toàn xong ticket  
```

#### Bước 2: Xem SLA Trên Ticket

```  
Trên ticket, tìm phần "SLA":

┌─────────────────────────────────────┐  
│ ⏰ SLA STATUS │  
├─────────────────────────────────────┤  
│ │  
│ Response SLA: 13:45 (1 giờ) │  
│ Status: 🟢 ON TRACK (Đúng giờ) │  
│ Elapsed: 30 min │  
│ Remaining: 30 min │  
│ │  
│ Resolution SLA: 16:30 (4 giờ) │  
│ Status: 🟡 AT RISK (Sắp hết giờ) │  
│ Elapsed: 2h 45m │  
│ Remaining: 1h 15m │  
│ │  
│ ⚠️ ACTION: Cần xử lý nhanh! │  
│ │  
└─────────────────────────────────────┘  
```

#### Bước 3: Tránh Vi Phạm SLA

```  
✅ BEST PRACTICES:

- 1. Ưu tiên ticket theo SLA

  
→ Xử lý deadline sắp tới trước  
→ Dùng task list để tracking

- 2. Cập nhật ticket thường xuyên

  
→ Ít nhất mỗi 2 giờ nếu IN PROGRESS  
→ Đặt status PENDING nếu chờ user

- 3. Escalate nếu sắp hết giờ

  
→ Không giấu ticket  
→ Báo manager sớm

- 4. Báo cáo SLA violations

  
→ Nếu vi phạm → Doc lại lý do  
→ Manager sẽ phân tích

⚠️ NẾU VI PHẠM SLA:  
• Ảnh hưởng đánh giá performance  
• Công ty mất reputation  
• Hợp đồng SLA bị penalties  
```

---

### VI. Quản Lý Ticket - Manager

#### Bước 1: Xem Dashboard Quản Lý

```  
Manager Dashboard cung cấp:

📊 OVERVIEW (Tổng Quan)  
├─ Total Tickets: 450  
├─ Resolved Today: 34  
├─ Overdue SLA: 3 ⚠️  
└─ Avg Resolution Time: 18 giờ

👥 TEAM PERFORMANCE  
├─ John Smith: 25 tickets, 92% SLA  
├─ Jane Doe: 22 tickets, 95% SLA  
├─ Mike Johnson: 18 tickets, 88% SLA ⚠️  
└─ [Show Details]

⏱️ SLA METRICS  
├─ Response SLA: 96% ✅  
├─ Resolution SLA: 93% ✅  
└─ Violation Rate: 4 tickets ⚠️

🎯 PRIORITY DISTRIBUTION  
├─ Urgent: 5 (chờ 0.5h)  
├─ High: 12 (chờ 2.3h)  
├─ Medium: 24 (chờ 1.2d)  
└─ Low: 8 (chờ 3.1d)  
```

#### Bước 2: Phân Công Ticket (Assign)

```  
CÁCH PHÂN CÔNG:

- 1. Xem danh sách ticket NEW/ASSIGNED
- 2. Click vào ticket
- 3. Tìm "Assigned to" → [CHANGE]
- 4. Chọn technician dựa trên:

  
✓ Chuyên môn (expertise)  
✓ Workload hiện tại  
✓ Availability  
✓ Vị trí địa lý (nếu on-site)

- 5. Nhập ghi chú:

  
"Assign to John - Network issue.  
John, user is in building 5.  
Can you do remote access?"

- 6. Ấn [ASSIGN]

VD SMART ASSIGNMENT:  
┌────────────────────────────────┐  
│ Category: Network │  
│ → Assign to: Network Team Lead │  
│ │  
│ Category: Printer │  
│ → Assign to: Hardware Specialist │  
│ │  
│ Category: Database │  
│ → Assign to: Database Team │  
└────────────────────────────────┘  
```

#### Bước 3: Monitoring & Follow-up

```  
HÀNG NGÀY - MANAGER NÊN LÀM:

08:00 - Kiểm tra SLA Violations  
• Có ticket nào quá hạn?  
• Escalate hoặc thêm resource

10:00 - Check Pending Tickets  
• Ticket nào chờ lâu quá?  
• Gọi user để follow-up

14:00 - Review Team Workload  
• Ai overloaded?  
• Cần rebalance assignment?

16:00 - Check Resolved Tickets  
• Bao nhiêu resolved hôm nay?  
• Có vấn đề gì lặp lại?

17:00 - Daily Report  
• Update KPI  
• Plan cho hôm sau  
```

#### Bước 4: Báo Cáo & Phân Tích

```  
REPORTS MENU:

[REPORTS] → Chọn loại report:

- 1. TICKET METRICS

  
→ Total created, resolved, closed  
→ Average resolution time  
→ SLA compliance rate  
  

- 2. BY TECHNICIAN

  
→ Performance từng kỹ thuật viên  
→ Số ticket xử lý  
→ Satisfaction rating  
  

- 3. BY CATEGORY

  
→ Network: 156 tickets, 95% resolved  
→ Hardware: 89 tickets, 87% resolved  
→ Software: 234 tickets, 91% resolved  
  

- 4. SATISFACTION SURVEY

  
→ Rating trung bình  
→ Feedback từ user  
→ Issue trending  
  

- 5. SLA COMPLIANCE

  
→ Vi phạm SLA: 4 tickets  
→ Lý do vi phạm  
→ Biểu đồ xu hướng

💡 CÁCH SỬ DỤNG:  
• Export thành PDF/Excel  
• Share với leadership hàng tuần  
• Xác định improvement areas  
```

---

### VII. Batch Operations (Thao Tác Hàng Loạt)

#### Bước 1: Chọn Nhiều Ticket

```  
Trong danh sách ticket:

- 1. Click checkbox ☑️ trên mỗi ticket

  
Hoặc: Click "Select All" để chọn tất cả

- 2. Sau khi chọn, sẽ hiển thị:

  
[Selected: 5 tickets] ← Số lượng

- 3. Click nút [BULK ACTIONS] hoặc ⋮ menu

  
```

#### Bước 2: Thực Hiện Batch Actions

```  
CÁC HÀNH ĐỘNG HÀNG LOẠT:

┌────────────────────────────────────┐  
│ BULK ACTIONS MENU │  
├────────────────────────────────────┤  
│ │  
│ ☐ Change Status │  
│ → Chọn status mới │  
│ → Tác dụng lên 5 tickets │  
│ │  
│ ☐ Change Priority │  
│ → Nâng/hạ độ ưu tiên │  
│ │  
│ ☐ Assign To │  
│ → Gán tất cả cho 1 technician │  
│ │  
│ ☐ Close Tickets │  
│ → Đóng multiple tickets │  
│ │  
│ ☐ Add to Group/Queue │  
│ → Tổ chức lại │  
│ │  
│ ☐ Add Comment │  
│ → Comment chung cho tất cả │  
│ │  
│ ☐ Add Tag │  
│ → Tag để tracking │  
│ │  
│ ☐ Delete (Careful!) │  
│ → Xóa vĩnh viễn │  
│ │  
└────────────────────────────────────┘

VD: Đóng 5 ticket old tickets  

- 1. Chọn 5 tickets
- 2. Click [BULK ACTIONS]
- 3. Chọn "Close Tickets"
- 4. Nhập lý do: "Resolved & no update for 30 days"
- 5. Ấn [APPLY]

  
✅ Tất cả 5 ticket đều đóng  
```

---

### VIII. Integration & Advanced Features

#### Bước 1: Email Integration

```  
CÓ THỂ TẠO TICKET BẰNG EMAIL:

Gửi email đến: support@helpdesk.com

Format Email:

───────────────────────────────  
Subject: Không thể connect VPN  
───────────────────────────────

Xin chào,

Tôi không thể kết nối VPN từ nhà.  
Máy: Dell XPS  
OS: Windows 11  
Lỗi: VPN Gateway unreachable

Cảm ơn!

───────────────────────────────

✅ Hệ thống sẽ:  
• Parse email  
• Tạo ticket tự động  
• Gán category tự động (nếu cấu hình)  
• Gửi confirmation email

💡 Người dùng không cần vào web portal!  
```

#### Bước 2: Mobile Access

```  
GLPI CÓ APP MOBILE:

iOS & Android:  

- 1. Tải ứng dụng "GLPI"
- 2. Nhập URL: https://helpdesk.company.com
- 3. Login bằng account của bạn
- 4. Xem ticket, comment, update on-the-go

TÍNH NĂNG:  
✓ Create ticket  
✓ View my tickets  
✓ Add comments  
✓ Upload attachments  
✓ Change status  
✗ Admin functions (chỉ web)  
```

#### Bước 3: API Integration

```  
DEVELOPER CÓ THỂ:

• Tích hợp GLPI với hệ thống khác  
• Tạo ticket lập trình (automation)  
• Lấy dữ liệu statistics  
• Sync dữ liệu từ AD/LDAP

VD: Monitoring System  
Khi CPU > 90% → Tạo ticket tự động  
POST /apirest.php/Ticket  
{  
"title": "High CPU Alert - Server01",  
"description": "CPU usage 95%",  
"priority": 3,  
"category": "Hardware"  
}  
```

---

## 📊 QUY TRÌNH QUẢN LÝ TICKET (WORKFLOW)

### Toàn Bộ Lifecycle

```  
┌─────────────────────────────────────────────────────┐  
│ TICKET LIFECYCLE - GLPI HELPDESK │  
└─────────────────────────────────────────────────────┘

USER SIDE │ TECH SIDE  
═════════════════════════════════════════════════

1️⃣ USER TẠO TICKET  
├─ Điền form  
├─ Gửi issue  
├─ Nhận confirmation email  
└─ Status: 🟡 NEW

2️⃣ TICKET CÓ TRONG HỆ THỐNG  
├─ Technician xem  
├─ Xác định category  
├─ Ước tính priority  
└─ Status: 🟡 NEW

3️⃣ MANAGER PHÂN CÔNG  
├─ Manager review  
├─ Assign to John  
└─ Status: 🟠 ASSIGNED

4️⃣ TECHNICIAN NHẬN & BẮTĐẦU  
├─ John nhận email  
├─ Review ticket detail  
├─ Contact user nếu cần  
└─ Status: 🔵 IN PROGRESS

5️⃣ XỬ LÝ & TROUBLESHOOT  
├─ Thực hiện fix  
├─ Update comment  
├─ Test solution  
└─ Status: 🔵 IN PROGRESS

6️⃣ CHỜ USER FEEDBACK  
├─ Nhận email: "Try this"  
├─ Thực hiện hướng dẫn  
├─ Test & report result  
└─ Status: 🟣 PENDING  
├─ Technician chờ phản hồi  
├─ Set auto-reminder  
└─ Status: 🟣 PENDING

7️⃣ GIẢI PHÁP TÓM TẮT  
├─ Đọc ghi chú từ tech  
├─ Xác nhận vấn đề xong  
└─ Comment: "Thanks, works!"  
├─ John nhận update  
├─ Verify solution  
└─ Status: 🟢 RESOLVED

8️⃣ ĐÓNG TICKET  
├─ Review ghi chú  
├─ Đánh giá (rating)  
├─ Gửi feedback (optional)  
└─ Status: ⚫ CLOSED  
├─ Archive ticket  
├─ Add to knowledge base  
└─ Status: ⚫ CLOSED

┌─────────────────────────────────────────────────────┐  
│ FULL CYCLE TIME: 4 - 48 giờ (tùy priority) │  
└─────────────────────────────────────────────────────┘  
```

### Các Tình Huống Đặc Biệt

```  
SCENARIO 1: NEED MORE INFO  
───────────────────────────  
User creates ticket (vague description)  
↓  
Tech: "Cần thêm info, logs, screenshots"  
Status: 🟣 PENDING  
↓  
User provides more info  
↓  
Tech resumes troubleshooting  
Status: 🔵 IN PROGRESS

SCENARIO 2: CANNOT REPRODUCE  
───────────────────────────  
Tech tries but cannot replicate issue  
↓  
Tech: "Cannot reproduce, ask user to try again"  
Status: 🟣 PENDING  
↓  
User confirms issue gone  
↓  
Status: 🟢 RESOLVED → ⚫ CLOSED

SCENARIO 3: NEED HARDWARE REPLACEMENT  
──────────────────────────────────────  
Tech diagnoses HDD failure  
↓  
Tech: "Need HDD replacement, ordered part"  
Status: 🟣 PENDING  
↓  
Part arrives  
↓  
Tech replaces & tests  
Status: 🔵 IN PROGRESS → 🟢 RESOLVED

SCENARIO 4: ESCALATE TO VENDOR  
──────────────────────────────  
Tech identifies bug in software  
↓  
Tech: "Escalating to vendor, sent ticket #abc"  
Status: 🟣 PENDING  
↓  
Vendor provides patch  
↓  
Tech applies patch  
Status: 🔵 IN PROGRESS → 🟢 RESOLVED  
```

---

## ⚠️ CÁC TÌNH HUỐNG PHỔ BIẾN

### 1. User Không Cung Cấp Đủ Thông Tin

**VẤNĐỀ**: "Máy lỗi, help me!" - Quá mơ hồ

```  
❌ BAD TICKET:  
Title: "IT Issue"  
Description: "Computer broken"

✅ GOOD TICKET:  
Title: "Excel crashes when opening large reports"  
Description: "  
Issue: Excel 2021 crashes after 2 minutes  
When: Started today at 9 AM  
File: Q4_Report_2024.xlsx (45 MB)  
Error message: Application has stopped working  
Attached: screenshot + error log  
Already tried: Restart Excel, Restart computer  
System: Dell XPS, Windows 11, 32GB RAM  
Urgency: Need this report for 2 PM meeting  
"

CÁCH XỬ LÝ:  
Tech: "Ticket lacking details, asking user..."  
↓  
Send: "Please provide:  
1. Excel version  
2. File size  
3. Full error message  
4. Screenshot"  
  
Status: 🟣 PENDING → Wait for response  
↓  
User provides: Info + screenshot + log file  
↓  
Tech: "Thanks! Now I can help..."  
Status: 🔵 IN PROGRESS  
```

### 2. User Không Thực Hiện Troubleshooting

**VẤN ĐỀ**: User không chịu restart hoặc thử cách khác

```  
❌ BAD APPROACH:  
Tech: "Restart your computer"  
User: "Okay" (but doesn't actually do it)  
Time wasted!

✅ GOOD APPROACH:  
Tech: "Let me help you step by step:  
1. Save all your work  
2. Click Start button  
3. Click Shutdown  
4. Wait 30 seconds  
5. Click Power button  
  
Please do this now and let me know result  
I'll wait for your response"

User: "Done, now it works!" ✅

ESCALATE NẾU:  

- • User không hợp tác
- • User refuses remote access
- • Physical hardware needed

  
→ Assign to on-site technician  
```

### 3. Ticket Bị Bỏ Quên (Forgotten)

**VẤN ĐỀ**: Ticket nằm im lìm, user chọn nản

```  
SOLUTION - AUTO ESCALATION:

GLPI có thể cấu hình:  
├─ Nếu PENDING > 3 ngày → Auto escalate  
├─ Nếu IN PROGRESS > 5 ngày → Alert manager  
└─ Nếu NEW > 2 giờ → Alert technician

MANUAL FOLLOW-UP:  
Manager: "John, still working on ticket #456?  
Created 4 days ago, user hasn't responded."  
Tech: "Oh, let me check..."  
→ Add comment: "Trying alternative approach..."  
→ Update status  
→ Set reminder for 2 hours later  
```

### 4. Duplicate Tickets

**VẤN ĐỀ**: User hoặc team tạo ticket cho cùng 1 vấn đề 2 lần

```  
CÁCH PHÁT HIỆN:  
Search → "WiFi connection issue"  
→ Found: Ticket #456 (John Doe)  
→ Found: Ticket #789 (John Doe - same person?!)

CÁCH XỬ LỮ:  

- 1. Keep Ticket #456 (older one)
- 2. Link Ticket #789 to #456

  
- Click "Link ticket"  
- Select: "duplicate of"  
- Choose: #456

- 3. Comment on #789:

  
"Duplicate of ticket #456  
Closing this one, please check #456"

- 4. Close #789

  
Status: ⚫ CLOSED

- 5. Xem #456, thêm info từ #789 nếu cần

  
```

### 5. User Không Thỏa Mãn Với Giải Pháp

**VẤN ĐỀ**: User cho rằng vấn đề chưa hoàn toàn xong

```  
SCENARIO:  
Tech: "Ticket RESOLVED, issue fixed"  
User: "No, still having problem!"

CÁCH XỬ LỲ:  

- 1. REOPEN ticket (nếu đã closed)

  
→ Right-click → [REOPEN]

- 2. Thêm comment:

  
"Reopening ticket. User report  
issue still present.  
Needs further investigation."

- 3. Status: 🔵 IN PROGRESS
- 4. Troubleshoot thêm

  
Có thể:  
• Try different solution  
• Escalate to specialist  
• Request in-person visit  
• Replace hardware

- 5. Lần này phải thực sự xong!

  
```

### 6. Ticket Của Người Không Công Ty (External)

**VẤN ĐỀ**: Bạn client hoặc vendor submit ticket

```  
CÓ 2 CÁCH:  
├─ ALLOWED: Nếu company cho phép  
│ → Có customer portal  
│ → External users có account riêng  
│  
└─ RESTRICTED: Chỉ internal staff  
→ External user gửi email  
→ IT staff tạo ticket thay  
→ Ticket type: "External"

WORKFLOW:  

- 1. External user gửi email support@
- 2. IT staff receives & creates ticket
- 3. Tech handles issue
- 4. Tech sends reply email to external user
- 5. External user receives update via email
- 6. User không cần login GLPI

VD: Vendor problem  
"We're having issues with VPN access to your network"  
→ IT creates ticket, assigns to Network Team  
→ Provides solution  
→ Sends solution back to vendor  
```

---

## 📚 KNOWLEDGE BASE INTEGRATION

### Tạo KB Article Từ Ticket

```  
KHOẢNG TÌM SOLUTION:

Ticket: "How to reset Windows password?"

CÓ 3 HƯỚNG:

1️⃣ SEARCH KB TRƯỚC  
→ Có KB article chưa?  
→ Nếu có → Link trong ticket  
Status: 🟢 RESOLVED ngay  
  
2️⃣ SOLUTION GỌI LẠI + TẠO KB  
→ Giải quyết ticket  
→ Tạo KB article  
→ Link KB vào ticket  
  
3️⃣ SOLUTION PHỨC TẠP  
→ Tạo KB từ ticket solution  
→ Làm bài viết hay  
→ Share cho team

CÁCH TẠO KB ARTICLE:

[KNOWLEDGE BASE] → [+ NEW ARTICLE]

┌─────────────────────────────────┐  
│ Title: │  
│ "How to reset Windows password" │  
├─────────────────────────────────┤  
│ Category: │  
│ Windows / User Account │  
├─────────────────────────────────┤  
│ Content: │  
│ │  
│ PROBLEM: │  
│ Cannot remember Windows │  
│ password to log in │  
│ │  
│ SOLUTION: │  
│ 1. At login screen, click │  
│ "I forgot my password" │  
│ 2. Answer security question │  
│ 3. Follow wizard │  
│ 4. Set new password │  
│ 5. Login with new password │  
│ │  
│ ALTERNATIVE: │  
│ Call IT Support at 555-1234 │  
│ │  
│ RELATED LINKS: │  
│ - Password policy │  
│ - Change password on Mac │  
│ │  
└─────────────────────────────────┘

[PUBLISH]  
✅ Bây giờ khi user search "password"  
sẽ thấy article này  
```

### Tìm Kiếm KB Trước Khi Tạo Ticket

```  
NGƯỜI DÙNG CÓ THỂ:

[SEARCH KB] → "Outlook not working"  
→ Found 5 articles:  
✓ Outlook setup guide  
✓ Fix Outlook connection issues  
✓ Add new email account  
  
→ Đọc article "Fix Outlook"  
→ Thử giải pháp  
→ ✅ Issue solved!  
→ KHÔNG CẦN TẠO TICKET

LỢI ÍCH:  
• User tự giải quyết  
• Giảm ticket volume  
• Technician làm việc hiệu quả hơn  
• Tài liệu tập trung  
```

---

## 🎓 TRAINING CHECKLIST

### Cho Người Dùng Cuối

```  
☐ MODULE 1: HỆ THỐNG CƠ BẢN (30 phút)  
☐ Hiểu GLPI là gì  
☐ Tạo account & đăng nhập  
☐ Giao diện cơ bản  
  
☐ MODULE 2: TẠO TICKET (45 phút)  
☐ Điền form ticket đúng cách  
☐ Chọn category, priority  
☐ Đính kèm file  
☐ Submit ticket  
  
☐ MODULE 3: THEO DÕI TICKET (30 phút)  
☐ Xem ticket của mình  
☐ Hiểu status ticket  
☐ Thêm comment, file  
☐ Nhận email notification  
  
☐ MODULE 4: CÁC VẤN ĐỀ THƯỜNG GẶP (30 phút)  
☐ Không thể đăng nhập → Reset password  
☐ Ticket không gửi được → Kiểm tra form  
☐ Không nhận email → Cập nhật email  
  
☐ MODULE 5: PRACTICE (45 phút)  
☐ Tạo ticket thực tế  
☐ Theo dõi ticket  
☐ Thêm bình luận  
☐ Đóng ticket

⏱️ TOTAL: 3 giờ (có thể chia làm 2 ngày)  
```

### Cho IT Staff (Technician)

```  
☐ MODULE 1: HỆ THỐNG TECHNICIAN (1 giờ)  
☐ Đăng nhập & quyền hạn  
☐ Dashboard & widgets  
☐ Tìm kiếm & lọc ticket  
☐ Hiểu tất cả status  
  
☐ MODULE 2: TIẾP NHẬN & XỬ LÝ (2 giờ)  
☐ Tiếp nhận ticket (Assign)  
☐ Tạo comment / ghi chú  
☐ Cập nhật status  
☐ Quản lý deadline  
☐ SLA tracking  
  
☐ MODULE 3: TROUBLESHOOTING (2 giờ)  
☐ Phương pháp troubleshoot cơ bản  
☐ Ghi chú chi tiết  
☐ Quản lý attachment  
☐ Follow-up với user  
  
☐ MODULE 4: ESCALATION (1 giờ)  
☐ Khi nào escalate  
☐ Cách escalate  
☐ Giao việc cho colleague  
☐ Handover documentation  
  
☐ MODULE 5: ADVANCED (2 giờ)  
☐ Batch operations  
☐ Merge/Link tickets  
☐ Knowledge base  
☐ Templates  
☐ Automation rules  
  
☐ MODULE 6: PRACTICE (3 giờ)  
☐ Handle sample tickets  
☐ Mock scenarios  
☐ Q&A session  
☐ Sign-off test

⏱️