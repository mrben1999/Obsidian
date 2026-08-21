---
chủ_đề: Chính sách Bảo mật Thông tin và An ninh Mạng QVE
mã_tài_liệu: QVE-IT-SEC-POL-2026
phiên_bản: 2.0
bộ_phận_ban_hành: Phòng Công nghệ Thông tin (IT Department)
ngày_hiệu_lực: 2026-07-07
trạng_thái: Phê duyệt ban hành
mức_độ_bảo_mật: Nội bộ (Internal)
tags: [it-policy, security, governance, obsidian-vault]
---

# CHÍNH SÁCH BẢO MẬT THÔNG TIN VÀ AN NINH MẠNG TẬP ĐOÀN QUẢNG VIỆT
> **Tài liệu tham chiếu gốc:** CNTT.CS.00 - Chinh sach bao mat QVE 2016 QVE.docx
> **Mục tiêu hệ thống:** Đảm bảo tính Toàn vẹn (Integrity), Tính Bảo mật (Confidentiality) và Tính Khả dụng (Availability) cho toàn bộ hạ tầng mạng nhà máy và khối văn phòng thuộc Công ty May Mặc Quảng Việt.

---

## 1. KIỂM SOÁT TÀI LIỆU (DOCUMENT CONTROL)

### 1.1. Ban điều hành và Phê duyệt (Approvals)
| Chức vụ | Trách nhiệm | Bộ phận / Đội ngũ | Ngày phê duyệt | Trạng thái dấu kiểm soát |
| :--- | :--- | :--- | :--- | :--- |
| **IT Team** | Thiết lập & Biên soạn | Phòng Công nghệ Thông tin | 07/07/2026 | Đã ký duyệt điện tử |
| **IT Director / CIO** | Xem xét & Kiểm tra | Ban Giải pháp Hạ tầng & An ninh | 07/07/2026 | Đã duyệt nội dung |
| **Vice President / Ban Giám Đốc** | Phê duyệt tối cao | Ban Giám đốc QVE | 07/07/2026 | Khóa dấu kiểm soát nội bộ |

### 1.2. Bảng theo dõi lịch sử thay đổi (Revision History)
| STT | Ngày sửa đổi | Vị trí / Mục thay đổi | Nội dung sửa đổi chi tiết | Ghi chú / Người thực hiện |
| :--- | :--- | :--- | :--- | :--- |
| 01 | 2016-10-15 | Toàn bộ văn bản | Khởi tạo chính sách bảo mật hạ tầng ban đầu (Bản 2016). | IT Team 2016 |
| 02 | 2026-07-07 | Hệ thống hóa toàn diện | Chuẩn hóa cấu trúc Enterprise Framework, bổ sung kiến trúc Zero Trust, nâng cấp độ phức tạp mật khẩu, siết chặt quản lý cổng USB ngoại vi, phân loại cấp độ Internet Access theo chuẩn phân quyền Active Directory (AD). | IT Infrastructure Engineer |

---

## 2. TỔNG QUAN, MỤC ĐÍCH VÀ PHẠM VI ÁP DỤNG

### 2.1. Tổng quan (Overview)
Tài liệu này quy định các nguyên tắc cốt lõi, bắt buộc áp dụng trong chính sách an toàn thông tin và bảo mật hạ tầng mạng tại Công ty May Mặc Quảng Việt (QVE). Hệ thống chính sách bao gồm: Chính sách quản lý định danh mật khẩu, chính sách kiểm soát truy cập Internet, chính sách khai thác tài nguyên lưu trữ nội bộ, chính sách sử dụng hệ thống thư điện tử và quy định giám sát thiết bị ngoại vi.

### 2.2. Mục đích (Purpose)
- Định kỳ cập nhật hàng năm cho toàn thể cán bộ công nhân viên (CBCNV) về các quy chuẩn an ninh công nghệ, giảm thiểu tối đa rủi ro từ các mối đe dọa an ninh mạng toàn cầu.
- Ngăn chặn triệt để hành vi vi phạm kỷ luật công nghệ, hạn chế các lỗ hổng do yếu tố con người gây ra làm gián đoạn chuỗi cung ứng sản xuất (SOP/MES/ERP).
- Thiết lập cơ chế kiểm soát trách nhiệm rõ ràng, loại bỏ tình trạng thiếu tinh thần trách nhiệm trong việc khai thác băng thông, tài nguyên lưu trữ và thông tin thuộc sở hữu của doanh nghiệp.

### 2.3. Phạm vi áp dụng (Scope)
- **Đối tượng:** Áp dụng bắt buộc cho toàn thể nhân viên, bao gồm nhân sự chính thức, nhân viên mới trong giai đoạn thử việc, cộng tác viên, nhà thầu phụ và các bên thứ ba được cấp quyền truy cập hệ thống công nghệ thông tin QVE.
- **Thiết bị:** Tất cả các máy tính vật lý (Desktop, Laptop), thiết bị cầm tay di động (Tablets, Smart Devices), máy chủ vật lý, máy chủ ảo hóa và các thiết bị kết nối ngoại vi có quyền truy cập vào mạng nội bộ (LAN/VLAN/WLAN/VPN) của công ty.

### 2.4. Phân định trách nhiệm (Responsibilities)
- **Bộ phận Công nghệ Thông tin (IT Department):**
	- Chịu trách nhiệm thiết lập, duy trì, định kỳ đánh giá rủi ro và cập nhật nội dung chính sách bảo mật cho phù hợp với tình hình thực tế.
	- Thực hiện giám sát kỹ thuật, cấu hình các lớp bảo mật tự động (Firewall, AD, Endpoint Core, SIEM) để đảm bảo tuân thủ chính sách.
	- Tiếp nhận thông tin, khắc phục sự cố, báo cáo định kỳ cho Ban Giám đốc về các trường hợp vi phạm hoặc lỗ hổng phát sinh.
- **Các Bộ phận/Phòng ban chức năng khác:**
	- Quản lý cấp trưởng bộ phận có trách nhiệm đôn đốc, giám sát nhân sự thuộc quyền quản lý tuân thủ nghiêm ngặt chính sách.
	- Từng cá nhân nhân viên chịu trách nhiệm pháp lý và kỷ luật trực tiếp đối với tài khoản định danh cá nhân và thiết bị làm việc được cấp phát.

---

## 3. NỘI DUNG CHI TIẾT CÁC CHÍNH SÁCH BẢO MẬT

### 3.1. Chính sách Quản lý Định danh và Mật khẩu (Password Policy)
Mật khẩu được xác định là tài nguyên nhạy cảm, thuộc danh mục thông tin **Tuyệt mật (Confidential)** của tập đoàn Quảng Việt.

#### 3.1.1. Quy định nghiêm cấm (The "Don'ts")
- [ ] **Tuyệt đối KHÔNG** tiết lộ mật khẩu qua điện thoại cho bất kỳ ai (kể cả nhân viên hỗ trợ IT khi chưa thực hiện định danh xác thực).
- [ ] **Tuyệt đối KHÔNG** gửi mật khẩu bằng văn bản thô qua Email, Chat (Zalo, Skype, Teams) hoặc các nền tảng truyền thông không mã hóa.
- [ ] **Tuyệt đối KHÔNG** thảo luận, trao đổi hoặc vô tình nói rõ ký tự mật khẩu trước mặt người khác tại khu vực công cộng hoặc phòng làm việc.
- [ ] **Tuyệt đối KHÔNG** gợi ý định dạng cấu trúc mật khẩu (Ví dụ: Không dùng cấu trúc dễ đoán như `Tên_nhân_viên + năm_sinh`, `Tên_con_cái`, `QVE@123`).
- [ ] **Tuyệt đối KHÔNG** ghi chép mật khẩu vào bảng câu hỏi khảo sát, form giấy hoặc biểu mẫu bảo mật chưa được phân quyền rõ ràng.
- [ ] **Tuyệt đối KHÔNG** chia sẻ mật khẩu sử dụng chung với các thành viên trong gia đình hoặc bạn bè ngoài tổ chức.
- [ ] **Tuyệt đối KHÔNG** bàn giao mật khẩu tài khoản cá nhân cho đồng nghiệp thay thế khi nghỉ phép/vắng mặt. Trong trường hợp cần xử lý công việc liên tục, phải thực hiện ủy quyền qua hệ thống phân quyền của Active Directory hoặc phê duyệt phân cấp từ IT.
- [ ] **Tuyệt đối KHÔNG** sử dụng tính năng "Ghi nhớ mật khẩu" (Remember Password / Auto-fill) trên các ứng dụng Mail Client cũ không an toàn (Eudora, Outlook phiên bản cũ, Netscape Messenger) hoặc trên trình duyệt web công cộng mà không có Master Password.
- [ ] **Tuyệt đối KHÔNG** viết mật khẩu ra giấy ghi chú (Sticky Notes) rồi dán lên màn hình, dưới bàn phím hoặc lưu trữ hở trong văn phòng.
- [ ] **Tuyệt đối KHÔNG** lưu trữ mật khẩu dưới dạng văn bản thô (Plain Text) trong các tệp tin Word, Excel, Notepad trên máy tính hoặc thiết bị di động cá nhân khi chưa được mã hóa an toàn.

#### 3.1.2. Quy chuẩn kỹ thuật cấu hình mật khẩu (Technical Specifications)
- **Độ dài tối thiểu:** Mật khẩu phải có độ dài từ **7 ký tự trở lên** (Khuyến nghị sử dụng cấu trúc Passphrase từ 12 ký tự cho các tài khoản đặc quyền).
- **Độ phức tạp bắt buộc:** Phải bao gồm tối thiểu 4 nhóm ký tự:
	1. Chữ cái viết hoa (`A - Z`)
	2. Chữ cái viết thường (`a - z`)
	3. Ký số định lượng (`0 - 9`)
	4. Ký tự đặc biệt toán học/ký hiệu (`!, @, #, $, %, ^, &, *, _, ...`)
- **Chu kỳ thay đổi mật khẩu (Password Age):**
	- **Tài khoản người dùng thông thường (User Level):** Bắt buộc thay đổi ít nhất **90 ngày một lần**. Khoảng thời gian khuyến nghị để tối ưu an toàn là **60 ngày một lần**.
	- **Tài khoản đặc quyền hệ thống (System-Level / Domain Admin / Root):** Bắt buộc thay đổi **hàng quý (Quarterly)** hoặc ngay sau khi hoàn thành các đợt bảo trì lớn từ nhà thầu phụ.
- **Xử lý sự cố và Thỏa hiệp tài khoản (Compromise & Recovery):**
	- Nếu nghi ngờ tài khoản bị lộ hoặc có dấu hiệu xâm nhập trái phép, nhân viên phải báo cáo lập tức cho IT Helpdesk và tiến hành đổi toàn bộ mật khẩu liên quan.
	- Trong trường hợp quên mật khẩu, nhân viên không được tự ý dùng phần mềm bẻ khóa. Nhân viên phải **đến trực tiếp phòng IT, thực hiện xác minh danh tính, ký sổ theo dõi cấp phát tài khoản** để được phê duyệt cấp lại mật khẩu mới.

---

### 3.2. Chính sách Kiểm soát Truy cập Internet (Internet Access Policy)

#### 3.2.1. Hạ tầng kỹ thuật phòng vệ (Security Perimeter Infrastructure)
Toàn bộ hệ thống biên mạng QVE được bảo vệ tập trung bằng giải pháp tường lửa thế hệ mới (Next-Generation Firewall - NGFW), tích hợp các module:
- Hệ thống ngăn chặn xâm nhập trái phép (IPS/IDS)
- Hệ thống lọc nội dung URL / ứng dụng (Web/Application Filtering)
- Hệ thống quét mã độc và virus tại cửa ngõ gateway (Gateway Anti-virus)

#### 3.2.2. Cơ chế phân quyền và Duyệt cấp độ truy cập (Internet Access Grades)
Việc sử dụng internet tại nhà máy và văn phòng không phải là quyền mặc định, mà được phê duyệt dựa trên **chức vụ, vị trí công tác và tính chất công việc thực tế**. Quyền hạn này do **Ban Giám Đốc (Vice President)** phê duyệt tối cao, sau đó Phòng IT sẽ triển khai cấu hình hạ tầng Group Policy/Mạng tương ứng:

| Cấp độ (Grade) | Đối tượng áp dụng | Chính sách phân quyền chi tiết (Access Control) |
| :--- | :--- | :--- |
| **Không giới hạn (No Limit Access)** | Ban Giám đốc, Quản lý cấp cao (Managers), Trợ lý chủ chốt (Main Assistants), Kỹ sư mạng IT. | - Mở toàn bộ băng thông, cho phép truy cập các dịch vụ SaaS, Cloud và cổng thông tin quốc tế để phục vụ điều hành.<br>- Vẫn chịu sự giám sát mã độc tự động của NGFW. |
| **Có giới hạn (Limit Access)** | Các phòng ban nghiệp vụ khối văn phòng nhà máy: PPIC (Kế hoạch sản xuất), DV (Dịch vụ), HR (Nhân sự), Merchandisers (Thu mua/Quản lý đơn hàng)... | - **Chỉ được truy cập vào danh mục Web chỉ định:** Hệ thống cổng thông tin nội bộ Công ty QVE, các trang khai báo hải quan, thuế, hệ thống đối tác khách hàng được whitelist.<br>- Chặn hoàn toàn các trang mạng xã hội giải trí, luồng streaming video (Youtube, Tiktok) gây hao tổn băng thông nhà máy. |

---

### 3.3. Chính sách Sử dụng Tài nguyên Mạng và Bảo vệ Dữ liệu (Network Resources Usage Policy)

#### 3.3.1. Quản lý luồng dữ liệu sở hữu trí tuệ
- **Tuyệt đối KHÔNG** chuyển dịch, sao chép, hoặc phát tán dữ liệu bí mật kinh doanh, thiết kế mẫu mã, rập may, dữ liệu ERP của công ty ra bên ngoài mạng QVE nếu không có văn bản phê duyệt của cấp thẩm quyền.
- Tất cả tài liệu nghiệp vụ, báo cáo số liệu của các phòng ban bắt buộc phải được **lưu trữ tập trung trên máy chủ dữ liệu (File Server QVE)**. Dữ liệu này được IT cấu hình phân quyền truy cập nghiêm ngặt dựa trên vai trò (RBAC) đến từng người dùng và từng phòng ban.

#### 3.3.2. Quy định lưu trữ và Bảo trì tài nguyên lưu trữ
- Máy chủ chỉ dành riêng cho công việc. **Cấm tuyệt đối** hành vi lưu trữ dữ liệu cá nhân không liên quan đến công việc như: nhạc (MP3), hình ảnh cá nhân, phim ảnh (Video/Movies), trò chơi điện tử (Games) hoặc truyện tranh, tiểu thuyết điện tử.
- Nhân viên có nghĩa vụ tự rà soát, xóa bỏ các tệp tin rác, các dữ liệu tạm thời không cần thiết hoặc không còn sử dụng để tiết kiệm không gian lưu trữ hệ thống. Không tự ý sao chép hàng loạt dữ liệu dùng chung về ổ đĩa cục bộ của máy tính cá nhân mà không có mục đích công vụ cụ thể.
- **Quy tắc kết thúc phiên:** Đóng toàn bộ cửa sổ kết nối, ngắt ánh xạ ổ đĩa mạng (Network Drive) hoặc phiên làm việc với máy chủ dữ liệu ngay khi kết thúc công việc để tránh nguy cơ chiếm dụng tài nguyên phiên (Session Timeout Lock) và ngăn ngừa mã độc tống tiền (Ransomware) lây nhiễm chéo.

#### 3.3.3. Kiểm soát cổng kết nối ngoại vi (Peripheral Control)
- **Cấm hoàn toàn** việc sử dụng cổng USB vật lý trên máy tính trạm để chuyển dữ liệu nội bộ ra các thiết bị lưu trữ ngoài (USB Flash, Ổ cứng di động) nhằm ngăn ngừa thất thoát dữ liệu (Data Loss Prevention - DLP) và chặn đứng nguồn lây nhiễm virus qua thiết bị ngoại vi. Các cổng USB này sẽ được khóa tự động bằng chính sách bảo mật tập trung của IT.

---

### 3.4. Chính sách Thư điện tử Doanh nghiệp (Email Policy)

#### 3.4.1. Cấp phát và Quản trị tài khoản
- Địa chỉ email doanh nghiệp `@quangviet...` là tài sản sở hữu của công ty. Tài khoản chỉ được khởi tạo bởi Phòng Công nghệ Thông tin sau khi có **sự phê duyệt bằng văn bản/hệ thống từ Giám đốc bộ phận chức năng** yêu cầu cấp phát cho nhân sự.
- Người dùng được giao quyền sử dụng có trách nhiệm tự quản lý nội dung, lưu trữ, dọn dẹp và bảo quản hộp thư điện tử cá nhân được cấp.

#### 3.4.2. Nguyên tắc an toàn vận hành Email
- **Kiểm tra và Dọn dẹp:** Nhân viên phải kiểm tra hòm thư hàng ngày, xử lý công việc tồn đọng và thực hiện xóa bỏ các thư rác, thư quảng cáo không cần thiết nhằm tối ưu dung lượng lưu trữ trên Mail Server công ty.
- **Phòng chống mã độc đính kèm:** **Tuyệt đối KHÔNG** mở các email có nguồn gốc lạ, không rõ danh tính người gửi hoặc chứa các tệp tin đính kèm có nguy cơ đe dọa an ninh cao, đặc biệt là các định dạng tệp thực thi hoặc script tự động chạy bao gồm: `.exe`, `.bat`, `.scr`, `.pif`, `.com` và `.vbs`.
- **Mục đích sử dụng:** Hệ thống email QVE chỉ phục vụ cho hoạt động giao dịch kinh doanh và nghiệp vụ của công ty. **Nghiêm cấm tuyệt đối** việc sử dụng email công vụ vào mục đích cá nhân, đăng ký tài khoản giải trí trực tuyến hoặc tham gia vào các hoạt động chính trị, tôn giáo, ngôn luận kích động vi phạm pháp luật.

---

## 4. CƠ CHẾ THỰC THI VÀ XỬ LÝ VI PHẠM (ENFORCEMENT & DISCIPLINARY ACTIONS)

- Mọi cá nhân hoặc nhóm chức năng có hành vi vi phạm bất kỳ điều khoản nào trong chính sách bảo mật này sẽ bị xử lý nghiêm khắc tùy theo mức độ nghiêm trọng và hậu quả thực tế gây ra đối với chuỗi sản xuất và uy tín của doanh nghiệp.
- **Các hình thức chế tài áp dụng luỹ tiến:**
	1. **Nhắc nhở trực tiếp / Khiển trách nội bộ:** Áp dụng cho các vi phạm sơ suất lần đầu không gây hậu quả nghiêm trọng (Ví dụ: quên đóng cửa sổ máy chủ, lưu file cá nhân dung lượng nhỏ).
	2. **Cảnh cáo bằng văn bản (Gửi nhân sự lưu hồ sơ):** Áp dụng cho các hành vi tái phạm hoặc vi phạm có chủ đích nhưng được ngăn chặn kịp thời (Ví dụ: cố tình cắm USB không được phép, không đổi mật khẩu đúng hạn).
	3. **Cách chức, Buộc thôi việc (Sa thải):** Áp dụng cho các sai phạm nghiêm trọng gây tổn thất lớn (Ví dụ: tiết lộ mật khẩu hệ thống cốt lõi cho bên ngoài, chuyển dữ liệu thiết kế mật của nhà máy cho đối thủ cạnh tranh, mở file virus gây tê liệt hệ thống điều hành sản xuất).
	4. **Bồi thường thiệt hại và Truy tố pháp luật:** Đối với các trường hợp cố ý phá hoại hạ tầng mạng, đánh cắp tài sản trí tuệ gây thiệt hại tài chính nặng nề, công ty sẽ yêu cầu cá nhân bồi hoàn toàn bộ tổn thất kinh tế, đồng thời chuyển hồ sơ sang cơ quan điều tra xử lý theo Luật An ninh mạng hiện hành.

---

## 5. QUẢN LÝ NGOẠI LỆ (EXCEPTIONS MANAGEMENT)

- Chính sách bảo mật này được thiết kế dựa trên tiêu chuẩn an toàn cao nhất nhằm bảo vệ nhà máy Quảng Việt khỏi các nguy cơ tấn công mạng. Do đó, chính sách áp dụng đồng bộ cho **TẤT CẢ** nhân viên sử dụng máy tính và thiết bị công nghệ.
- **Nguyên tắc Tuyệt đối:** **KHÔNG CÓ NGOẠI LỆ NÀO ĐƯỢC ÁP DỤNG TRONG MỌI TRƯỜNG HỢP** đối với các điều khoản cốt lõi của chính sách mật khẩu, an toàn email và cổng USB bảo mật nhằm duy trì tính toàn vẹn của mô hình Zero Trust Enterprise.

---

## 6. THAM CHIẾU VÀ LIÊN HỆ KHI GẶP SỰ CỐ
- Khi phát hiện bất kỳ dấu hiệu bất thường nào (máy tính chạy chậm, file bị đổi đuôi lạ, nhận được email tống tiền, nghi ngờ lộ mật khẩu...), nhân viên cần thực hiện ngay quy trình khẩn cấp:
	1. **Ngắt kết nối dây mạng LAN** hoặc tắt kết nối Wifi trên thiết bị ngay lập tức.
	2. **Không tắt nguồn máy tính** (để giữ lại log bộ nhớ RAM phục vụ điều tra IT).
	3. Liên hệ ngay lập tức với **Phòng An ninh Thông tin / Bộ phận IT QVE** qua số hotline nội bộ hoặc đến trực tiếp văn phòng IT tại  nhà máy.
