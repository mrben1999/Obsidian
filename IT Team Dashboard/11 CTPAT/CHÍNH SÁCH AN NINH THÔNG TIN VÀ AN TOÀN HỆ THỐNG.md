---
chủ_đề: Chính sách An ninh Thông tin Doanh nghiệp QVE
mã_tài_liệu: CNTT.CS.01
phiên_bản: 2.0
bộ_phận_ban_hành: Phòng Công nghệ Thông tin (IT Department)
ngày_hiệu_lực: 2026-07-07
trạng_thái: Phê duyệt ban hành
mức_độ_bảo_mật: Nội bộ (Internal)
tags: [it-policy, information-security, governance, obsidian-vault, manufacturing-security]
---

# CHÍNH SÁCH AN NINH THÔNG TIN VÀ AN TOÀN HỆ THỐNG
**TẬP ĐOÀN MAY MẶC QUẢNG VIỆT (KWANGVIET GARMENT CO., LTD)**
*Địa chỉ: Lô 2, Thị trấn Củ Chi, Huyện Củ Chi, TP. Hồ Chí Minh, Việt Nam*
*Hotline IT: (848) 924 072 | Fax: (848) 892 1399*

---

## 1. KIỂM SOÁT TÀI LIỆU (DOCUMENT CONTROL)

### 1.1. Ban biên soạn và Phê duyệt (Approvals)
| Chức vụ               | Trách nhiệm           | Bộ phận / Đội ngũ               | Ngày phê duyệt | Trạng thái dấu kiểm soát           |
| :-------------------- | :-------------------- | :------------------------------ | :------------- | :--------------------------------- |
| **IT Team**           | Thiết lập & Biên soạn | Phòng Công nghệ Thông tin       | 07/07/2026     | Đã ký duyệt điện tử        |
| **IT Director / CIO** | Xem xét & Thẩm định   | Ban Giải pháp Hạ tầng & An ninh | 07/07/2026     | Đã duyệt nội dung          |
| **Vice President**    | Phê duyệt tối cao     | Ban Giám đốc QVE                | 07/07/2026     | Khóa dấu kiểm soát nội bộ  |

### 1.2. Nhật ký sửa đổi tài liệu (Revision Tracking Notes)
| STT | Ngày sửa đổi | Vị trí / Mục thay đổi | Nội dung sửa đổi chi tiết | Ghi chú / Người thực hiện |
| :--- | :--- | :--- | :--- | :--- |
| 01 | 2017-04-01 | Toàn bộ văn bản | Khởi tạo cấu trúc Framework bảo mật hệ thống ban đầu (Bản 2017). | IT Team 2017  |
| 02 | 2020-05-21 | Mục 5.1.4 | Bổ sung quy định kiểm soát lưu trữ cục bộ và phân rã thư mục hệ thống. | IT Manager  |
| 03 | 2024-05-30 | Mục 5.2.6.1 | Tích hợp quy chuẩn an toàn đính kèm Email doanh nghiệp nâng cao. | Security Engineer  |
| **04** | **2026-07-07** | **Hệ thống hóa toàn diện** | **Chuẩn hóa cấu trúc Enterprise Security Framework, bổ sung hạ tầng sao lưu Hyper Backup, quản lý phòng máy chủ, cơ chế chia sẻ mối đe dọa (Threat Intelligence) và cấu hình giám sát PRTG.** | **Chief Infrastructure Officer** |

---

## 2. TỔNG QUAN, MỤC ĐÍCH VÀ PHẠM VI ÁP DỤNG

### 2.1. Định nghĩa và Tổng quan (Overview)
- **Bảo mật thông tin (Information Security):** Là tiến trình ngăn chặn toàn diện hành vi truy cập trái phép, sử dụng, tiết lộ, làm gián đoạn, sửa đổi, kiểm tra, ghi lại hoặc phá hủy dữ liệu dưới mọi hình thức lưu trữ .
- **An ninh Công nghệ Thông tin (IT Security):** Hay còn gọi là bảo mật máy tính, là việc áp dụng các giải pháp kỹ thuật công nghệ vào hệ thống phần cứng và phần mềm . Thiết bị máy tính thuộc phạm vi bảo mật không chỉ giới hạn ở máy tính để bàn (Desktop), mà bao gồm bất kỳ thiết bị nào có bộ vi xử lý và bộ nhớ (Máy tính vật lý, thiết bị di động kết nối mạng, máy tính bảng, điện thoại thông minh, thiết bị IoT/SCADA trên dây chuyền sản xuất) . Do giá trị dữ liệu trong doanh nghiệp lớn là tối quan trọng, đội ngũ chuyên gia an ninh CNTT chịu trách nhiệm bảo vệ toàn bộ hạ tầng khỏi các cuộc tấn công không gian mạng độc hại nhằm chiếm đoạt tài sản trí tuệ hoặc giành quyền kiểm soát hệ thống nội bộ .

### 2.2. Mục đích (Purpose)
Chính sách này cung cấp các hướng dẫn bắt buộc nhằm bảo vệ và khai thác hợp lý tài sản, nguồn lực công nghệ thông tin trong doanh nghiệp . Mục tiêu tối cao là đảm bảo 3 trụ cột an ninh:
- **Tính bảo mật (Confidentiality):** Dữ liệu chỉ được truy cập bởi các đối tượng được phân quyền .
- **Tính toàn vẹn (Integrity):** Dữ liệu không bị sửa đổi hay xóa bỏ trái phép .
- **Tính khả dụng (Availability):** Hệ thống luôn sẵn sàng phục vụ hoạt động sản xuất và kinh doanh .

### 2.3. Phạm vi áp dụng (Scope)
Chính sách này áp dụng bắt buộc đối với tất cả nhân sự sở hữu hoặc chịu trách nhiệm quản lý tài khoản có quyền truy cập vào mạng lưới của Công Ty May Mặc Quảng Việt, hoặc bất kỳ hình thức truy cập nào có hỗ trợ/yêu cầu xác thực bằng mật khẩu trên mọi hệ thống của công ty .

### 2.4. Phân định trách nhiệm (Responsibilities)
- **Bộ phận IT (IT Department):** 
	- Chủ trì thiết lập quy trình, định kỳ hàng năm cập nhật, sửa đổi nội dung và truyền đạt đến các bên liên quan .
	- Thực hiện theo dõi, báo cáo, giám sát kỹ thuật và chịu trách nhiệm tối cao trong việc đảm bảo hệ thống thực hiện đúng theo chính sách đề ra .
- **Các Bộ phận / Phòng ban chức năng:** Tuân thủ nghiêm ngặt và tuyệt đối các quy định được nêu trong văn bản này .

---

## 3. QUY ĐỊNH ĐẢM BẢO AN TOÀN THÔNG TIN VÀ DỮ LIỆU

### 3.1. Quy định về Nội dung Dữ liệu (Data Content Governance)
- [ ] Người sử dụng hệ thống phải chịu trách nhiệm hoàn toàn về nội dung dữ liệu trên tất cả các loại tài liệu do mình khởi tạo hoặc xử lý (Excel, Word, Email...) hoặc trên các phần mềm ứng dụng và hệ thống quản lý chuyên ngành khác .
- [ ] Người sử dụng chịu trách nhiệm trước pháp luật và công ty trong việc chuyển dịch, chia sẻ thông tin dưới mọi hình thức ra bên ngoài tổ chức .
- [ ] **Nghiêm cấm tuyệt đối** việc lưu trữ, phát tán các tài liệu có nội dung phản động, ảnh hưởng đến chính sách, văn hóa của tổ chức hoặc các nội dung đồi trụy, khiêu dâm, vi phạm thuần phong mỹ tục .

### 3.2. Quy định Tổ chức và Soạn thảo Tài liệu (Document Standards)
- Luôn sử dụng đúng biểu mẫu (Templates) quy định của công ty khi soạn thảo văn bản hành chính và nghiệp vụ . Không chiếm dụng biểu mẫu công ty cho mục đích cá nhân .
- Chỉ sử dụng các Phông chữ (Font) Unicode tiêu chuẩn định sẵn khi soạn thảo văn bản bằng Tiếng Việt .
- Kiểm tra kỹ lưỡng lỗi chính tả, ngữ pháp và cấu trúc câu trước khi ban hành hoặc gửi tài liệu ra bên ngoài .
- Tổ chức lưu trữ tập tin (File) theo cấu trúc thư mục khoa học, rõ ràng để tối ưu hóa khả năng tìm kiếm và quản lý .

### 3.3. Quy định Lưu trữ và Truy xuất Dữ liệu (Storage & Access Control)
- **Vị trí lưu trữ cục bộ:** **TUYỆT ĐỐI KHÔNG** lưu bất kỳ dữ liệu làm việc nào vào các thư mục hệ thống gồm: `My Music`, `My Pictures`, và màn hình chính `Desktop` . Tất cả dữ liệu làm việc cục bộ phải được lưu vào ổ đĩa `D:` hoặc các ổ đĩa mạng được cấu hình (`Y:`, `Z:`) .
- **Rủi ro mất dữ liệu:** Người sử dụng tự chịu trách nhiệm về rủi ro mất mát dữ liệu nếu cố tình lưu trữ tại các thư mục mặc định (`My Documents`, `My Music`, `My Pictures`, `Desktop`) trong quá trình Bộ phận IT thực hiện bảo trì, sửa chữa hoặc cài đặt lại hệ điều hành .
- **Lưu trữ tập trung (File Server):** Để ngăn ngừa sự cố hỏng hóc phần cứng (hư ổ cứng, lỗi thiết bị...), các dữ liệu quan trọng bắt buộc phải được lưu trữ hoặc sao lưu thường xuyên trên hệ thống ổ đĩa mạng của máy chủ tập trung (File Server) .
- **Hủy tài khoản và Thu hồi tài sản (Deprovisioning):** Ngay khi nhân sự nghỉ việc hoặc chuyển công tác, Bộ phận IT phối hợp với HR thực hiện hủy tài khoản, tước đoạt quyền truy cập hệ thống thông tin, thu hồi toàn bộ tài sản CNTT liên quan (Khóa từ, thẻ nhận dạng, quyền truy cập thư mục lưu trữ, hòm thư điện tử, máy tính xách tay/để bàn...) .

---

## 4. QUY ĐỊNH VỀ SỬ DỤNG, BẢO MẬT VÀ AN TOÀN HỆ THỐNG

### 4.1. Quy định An toàn Mật khẩu (Password Security Hardening)
- Mật mã tài khoản Windows/Domain phải được thay đổi ngay lập tức sau khi nhân sự nhận bàn giao máy tính lần đầu từ Bộ phận IT .
- **Cấu trúc đặt mật mã bắt buộc:**
	- Độ dài tối thiểu: **Từ 10 ký tự trở lên** .
	- Phải bao gồm cả chữ hoa và chữ thường (`A-Z`, `a-z`) .
	- Phải bao gồm ký số (`0-9`) và các ký tự đặc biệt, dấu câu (`!@#$%^&*()_+{}:”<>?`) .
	- Không sử dụng thông tin cá nhân, tên bản thân, tên gia đình hoặc ngày sinh để làm mật mã .
- **Nguyên tắc bảo mật thông tin mật mã:**
	- **Nghiêm cấm** chia sẻ mật mã tài khoản cho bất kỳ cá nhân nào khác .
	- **Nghiêm cấm** trao đổi, tiết lộ mật mã qua điện thoại, nơi công cộng hoặc qua email thô .
	- **Nghiêm cấm** ghi chép mật mã ra giấy ghi chú và dán tại văn phòng làm việc .
	- **Nghiêm cấm** lưu trữ mật mã dưới dạng file văn bản không mã hóa trên máy tính .

### 4.2. Quy định Sử dụng Hệ thống Email Doanh nghiệp (Email Policy)
- Tài khoản email doanh nghiệp được cấp phát dựa trên yêu cầu công việc thực tế của từng nhân sự để phục vụ giao tiếp nội bộ hoặc với đối tác bên ngoài .
- **Các hành vi bị nghiêm cấm tuyệt đối khi sử dụng Email:**
	1. Gửi email cho mục đích cá nhân, không liên quan đến hoạt động kinh doanh của công ty .
	2. Gửi các tệp tin đính kèm có nội dung giải trí (`.mp3`, `.mp4`, game, flash) . Đối với hình ảnh, chỉ được phép gửi các định dạng liên quan trực tiếp đến công việc (mẫu sản phẩm, tài liệu kỹ thuật, thiết kế) .
	3. Gửi tệp tin đính kèm vượt quá dung lượng **15MB** . Trường hợp đặc biệt cần nhận/gửi file dung lượng lớn hơn, phải liên hệ Bộ phận IT để được hỗ trợ giải pháp chuyên dụng .
	4. Gửi thông tin tuyệt mật, nhạy cảm của công ty ra ngoài khi chưa được mã hóa bởi hệ thống mã hóa của IT hoặc chưa có sự phê duyệt từ Ban Giám đốc .
	5. Gửi, chuyển tiếp hoặc lưu trữ các email có nội dung đồi trụy, phân biệt chủng tộc, phỉ báng, quấy rối, đe dọa hoặc các nội dung bất hợp pháp khác .
	6. Giả mạo danh tính, sử dụng tài khoản email của người khác để gửi thư .
- **Vận hành Email an toàn:**
	- Phải kiểm tra kỹ nội dung, địa chỉ người nhận trước khi bấm gửi, đặc biệt là các email gửi cho khách hàng, nhà cung cấp .
	- Không được để trống tiêu đề (Subject); tiêu đề phải rõ ràng, đúng ngữ cảnh .
	- **Không mở email từ người gửi lạ hoặc có nội dung nghi vấn** để phòng ngừa virus/mã độc tống tiền xâm nhập hệ thống . Tiến hành xóa bỏ hoặc báo cáo cho IT kiểm tra .
	- Nhân viên có nghĩa vụ định kỳ dọn dẹp hòm thư (`Inbox`, `Sent Items`, `Deleted Items`) để giải phóng dung lượng, bảo đảm hệ thống vận hành ổn định .

### 4.3. Chính sách Kiểm soát Dịch vụ Internet (Internet Access Policy)
- Mạng Internet chỉ phục vụ cho mục đích xử lý công việc của công ty .
- **Nghiêm cấm** truy cập vào các mạng xã hội như Facebook, Twitter, YouTube... trong giờ làm việc (trừ các tài khoản được chỉ định phục vụ cho hoạt động truyền thông hoặc kinh doanh của công ty) .
- **Cơ chế VPN và Phân quyền:** Quyền truy cập Internet được kiểm soát nghiêm ngặt theo danh sách phê duyệt của Ban Giám đốc (**VPN Access Permission List**) . Hệ thống Firewall sẽ tự động phát hiện và cảnh báo các hành vi truy cập trái phép không nằm trong danh sách phân quyền .
- **Quản lý tải phần mềm:** Bộ phận IT giới hạn và giám sát chặt chẽ việc tải các phần mềm, ứng dụng từ Internet và việc truy cập các website bên ngoài . Định kỳ hàng tháng/hàng quý/hàng năm, IT sẽ rà soát lại danh sách cấp quyền để đảm bảo tính phù hợp với vị trí công việc .
- **Quy định đối với nhân sự thuộc nhóm truy cập giới hạn (Limit Access Grade):**
	- Phải cung cấp chính xác địa chỉ trang Web phục vụ công việc cho Bộ phận IT để cấu hình Whitelist trên hệ thống trước khi truy cập .
	- Kịp thời thông báo cho IT các địa chỉ Website của đối tác không còn liên lạc để đóng cổng kết nối .
	- Không truy cập trang web có nội dung xấu, đồi trụy; bảo mật tài khoản/mật mã Internet cá nhân, không cung cấp cho người khác .
- **Đối với nhân sự không có quyền truy cập Internet:** Không dùng tài khoản của người khác hoặc sử dụng các thủ thuật công nghệ (Proxy, VPN bên thứ 3, bẻ khóa) để truy cập Internet trái phép .

### 4.4. Quy định Sử dụng Ứng dụng Liên lạc Tức thời (Instant Messaging - IM)
- Khuyến nghị sử dụng ứng dụng **Skype** làm kênh trao đổi thông tin chuẩn cho công việc nội bộ và kết nối với nhà cung cấp, khách hàng, đối tác bên ngoài .
- **Nghiêm cấm khi sử dụng Skype:**
	1. Tự ý gửi thông tin, tài liệu mật của công ty cho bên ngoài hoặc đồng nghiệp không được phân quyền khi chưa có sự chấp thuận của Ban Giám đốc .
	2. Phát tán các file hình ảnh, dữ liệu, video có nội dung không hợp pháp hoặc không liên quan đến công việc .

### 4.5. Quy định Phòng chống Virus và Mã độc (Endpoint Anti-malware)
- 100% máy trạm và máy chủ trong mạng lưới QVE phải được cài đặt phần mềm phòng chống mã độc tập trung do IT quản lý (**Endpoint Security**) .
- **Cấu hình bắt buộc:** Chế độ tự động cập nhật cơ sở dữ liệu mẫu virus (Signatures) tối đa **4 giờ một lần**; kích hoạt chế độ quét thời gian thực (Real-time Scanning) khi sao chép hoặc mở tập tin .
- **Nghiêm cấm** tự ý gỡ bỏ, tắt tính năng hoặc cài đặt thêm bất kỳ phần mềm diệt virus nào khác mà không có sự chấp thuận bằng văn bản của Bộ phận IT .
- Mọi tập tin, thư mục lưu trữ ngoại vi (USB, Ổ cứng di động) phải được quét mã độc trước khi sao chép vào máy tính của công ty .
- **Quy trình ứng phó sự cố mã độc:** Khi phát hiện dấu hiệu nhiễm mã độc (máy chậm bất thường, file bị mã hóa, cảnh báo đỏ từ phần mềm, mất dữ liệu...), người dùng phải **lập tức ngắt kết nối mạng (rút dây LAN/tắt Wifi), giữ nguyên hiện trạng máy** và báo trực tiếp cho Bộ phận IT để xử lý .

---

## 5. QUẢN LÝ VẬN HÀNH VÀ BẢO VỆ TÀI SẢN CNTT

### 5.1. Quy định An ninh Vật lý Phòng IT (IT Department Access Control)
- Trưởng bộ phận IT chịu trách nhiệm giám sát, theo dõi toàn bộ hoạt động ra vào phòng IT . Khu vực này được bảo vệ bằng hệ thống kiểm soát cửa tiếp cận (Access Control) .
- Định kỳ hàng tháng, Trưởng bộ phận IT thực hiện kiểm tra, kết xuất dữ liệu người được cấp quyền truy cập và lưu trữ bằng biểu mẫu quy định .
- Tất cả nhân sự ngoài phòng IT khi vào làm việc phải đăng ký thông tin đầy đủ vào biểu mẫu nhật ký ra vào . Hồ sơ này phải được lưu trữ nghiêm ngặt trong thời hạn **03 năm** .

### 5.2. Quy định Quản lý Phòng Máy chủ (Datacenter / Server Room Governance)
- Các thiết bị lõi của mạng lưới như Tường lửa (Firewall), Thiết bị định tuyến (Router), Hệ thống máy chủ vật lý, Tổng đài... bắt buộc phải đặt trong phòng máy chủ chuyên dụng .
- Phòng máy chủ là khu vực **Hạn chế tiếp cận tối cao**, có lắp đặt hệ thống báo động và khóa xác thực . Chỉ những nhân sự được Ban Giám đốc chỉ định mới có quyền vào . Mọi lượt ra vào bắt buộc phải ghi nhận vào Nhật ký phòng máy chủ .
- Hệ thống điện: Phòng máy chủ phải có hệ thống lưu điện (UPS) đủ công suất, đảm bảo duy trì hoạt động liên tục của các thiết bị cốt lõi tối thiểu **10 phút** để thực hiện quy trình tắt máy an toàn khi có sự cố mất điện lưới .

### 5.3. Chính sách Sao lưu Dữ liệu (Backup Policy)
- Toàn bộ dữ liệu người dùng và dữ liệu nghiệp vụ lưu trữ trên Server phải được cấu hình sao lưu tự động hàng ngày đến thiết bị lưu trữ thứ cấp đặt tại nhà máy QVL .
- Toàn bộ tiến trình sao lưu phải được mã hóa bằng giải pháp **Hyper Backup** . Hệ thống tự động gửi email báo cáo trạng thái (Thành công/Thất bại) đến Bộ phận IT và ghi nhật ký hệ thống (Log) tập trung .
- Chỉ nhân viên IT được phân quyền đặc quyền mới có quyền truy cập hệ thống quản trị sao lưu .

### 5.4. Quy định Quản lý Máy tính Đầu cuối (Workstation Hardening)
- **Kiểm soát phần cứng & phần mềm:** Mọi hành vi lắp đặt, thay thế phần cứng hoặc cài đặt, gỡ bỏ phần mềm/hệ điều hành trên máy tính công ty chỉ được thực hiện bởi Bộ phận IT . Người dùng không có quyền Quản trị (Admin) trên máy tính .
- **Khóa cổng ngoại vi:** Tất cả các cổng USB và ổ đĩa quang (CD/DVD) trên máy trạm văn phòng sẽ bị khóa tự động bằng Group Policy để ngăn chặn thất thoát dữ liệu . Việc luân chuyển dữ liệu giữa các nhân viên phải thực hiện qua mạng nội bộ hoặc nhờ sự hỗ trợ của IT đối với máy tính độc lập .
- Không tự ý gỡ bỏ tem bảo hành, tem niêm phong tài sản trên thiết bị CNTT .
- Không mang thiết bị công nghệ cá nhân (Laptop, USB, Ổ cứng di động) vào văn phòng công ty khi chưa có sự phê duyệt từ Giám đốc bộ phận và Bộ phận IT .
- **An toàn vật lý mạng:** Nghiêm cấm việc tự ý rút/cắm dây mạng vào các thiết bị Switch/Wall-jack để tránh hiện tượng xung đột IP (DHCP Rogue) hoặc vòng lặp mạng (Network Loop) gây tê liệt hệ thống .
- Thiết bị chỉ được phép mang ra khỏi khuôn viên công ty khi có Phiếu tài sản được duyệt bởi Bộ phận IT . Nhân sự được cấp phát thiết bị di động (Laptop) có trách nhiệm bảo quản tài sản, nếu xảy ra mất mát do thiếu trách nhiệm phải bồi thường theo giá trị tài chính do Phòng Kế toán quy định .
- **Quy trình tắt máy sau giờ làm việc:** Nhân viên trước khi ra về phải thực hiện lưu trữ toàn bộ dữ liệu, đóng ứng dụng, tắt máy tính qua lệnh `Shutdown` của Windows và tắt nguồn màn hình . **Nghiêm cấm tuyệt đối hành vi cài đặt và chơi trò chơi điện tử (Games) trên máy tính công ty** .

### 5.5. Quy định Sử dụng Thiết bị In ấn (Printing Governance)
- Chỉ thực hiện in ấn trên các máy in do Bộ phận IT chỉ định và cấu hình trên hệ thống .
- Không in ấn tài liệu cá nhân . Sử dụng giấy in tiết kiệm, đúng mục đích công việc .
- Khi sử dụng giấy một mặt để in nháp, bắt buộc phải kiểm tra kỹ: Giấy không quá mỏng, nhàu nát ; **phải gỡ bỏ hoàn toàn ghim bấm, kẹp giấy** trước khi đưa vào khay nhằm tránh làm hỏng trống từ (Drum) và cụm sấy của máy in .

---

## 6. ĐÀO TẠO, HỖ TRỢ KỸ THUẬT VÀ MUA SẮM

### 6.1. Quy định về Huấn luyện và Đào tạo (Security Awareness Training)
- Quản lý các bộ phận phải phối hợp với IT thường xuyên tổ chức huấn luyện về an toàn thông tin nhằm nâng cao ý thức trách nhiệm của từng nhân sự .
- Nhân viên phải chủ động trang bị kỹ năng sử dụng phần mềm nghiệp vụ; đội ngũ IT hỗ trợ giải quyết các sự cố kỹ thuật chuyên sâu .
- Nhân sự có nghĩa vụ tham gia đầy đủ các buổi trình bày, huấn luyện tính năng mới do IT tổ chức, và có trách nhiệm hướng dẫn lại cho nhân sự mới trong bộ phận của mình .

### 6.2. Quy định về Yêu cầu Hỗ trợ Kỹ thuật (IT Service Desk SOP)
- Mọi sự cố đột xuất liên quan đến thiết bị CNTT phải được thông báo sớm nhất cho Bộ phận Hành chính - Nhân sự và IT .
- Hoạt động sửa chữa phần cứng chuyên sâu chỉ được thực hiện bởi đơn vị cung cấp dịch vụ/nhà thầu được chỉ định .
- Đối với các yêu cầu hỗ trợ phần mềm và nghiệp vụ hệ thống, nhân sự bắt buộc phải gửi phiếu yêu cầu qua hệ thống **Service Desk**, mô tả rõ ràng loại sự cố và chi tiết lỗi kèm ảnh chụp màn hình .

### 6.3. Quy định Mua sắm Trang thiết bị CNTT (IT Procurement Policy)
- Mọi hoạt động thu thập báo giá, đánh giá kỹ thuật và mua sắm phần cứng, phần mềm, dịch vụ CNTT phải thông qua Bộ phận Thu mua với sự tư vấn chuyên môn từ IT .
- Yêu cầu mua sắm phải thực hiện bằng biểu mẫu chuẩn, có xác nhận của Trưởng bộ phận và gửi trình Ban Giám đốc phê duyệt trước khi triển khai .
- **Kiểm tra nhân sự mới:** Trước khi tiếp nhận nhân sự mới, bộ phận tuyển dụng phải kiểm tra khả năng đáp ứng các tiêu chuẩn an toàn thông tin, đồng thời đưa điều khoản cam kết bảo mật và trách nhiệm an toàn thông tin vào Hợp đồng lao động .

---

## 7. CƠ CHẾ CHIA SẺ THÔNG TIN MỐI ĐE DỌA VÀ GIÁM SÁT MẠNG
*(Chia sẻ thông tin về các mối đe dọa an ninh mạng là giải pháp tiên quyết để chủ động bảo vệ hệ thống trước các phương thức tấn công tinh vi )*

### 7.1. Lợi ích và Cách thức Chia sẻ (Threat Intelligence)
- **Lợi ích:** Cho phép phát hiện sớm các mối nguy cơ từ cấp độ nhà máy để chuyển thành cơ chế phòng ngừa chủ động cho toàn hệ thống và đối tác . Giúp đôi bên tiếp cận kiến thức, kinh nghiệm phân tích, từ đó xác định nhanh các nền tảng bị ảnh hưởng để triển khai các biện pháp vá lỗ hổng, nâng cao năng lực phản ứng, phục hồi sau sự cố .
- **Cách thức thực hiện:** Thông qua cơ chế cảnh báo tự động của hệ thống Endpoint Security và tường lửa thế hệ mới (NGFW) khi phát hiện dấu hiệu bất thường .
- **Thời hạn báo cáo:** Dựa trên mức độ nghiêm trọng, Bộ phận IT có trách nhiệm lập báo cáo chi tiết trong vòng **24 tiếng** kể từ khi phát hiện sự cố để gửi trình Ban Giám Đốc và các đối tác liên quan .

### 7.2. Giám sát tự động và Quét lỗ hổng định kỳ (Network Monitoring Framework)
- Bộ phận IT sử dụng hệ thống giám sát tập trung **PRTG Network Monitor** để tự động thu thập, kiểm tra và phân tích lưu lượng, trạng thái hoạt động của mạng nội bộ . Hệ thống sẽ tự động gửi email cảnh báo tức thời cho đội ngũ kỹ sư mạng khi có bất kỳ thông số nào vượt ngưỡng an toàn .
- **Quét cổng dịch vụ (Port Scanning Auditing):** Định kỳ **hàng tháng**, nhân viên IT bắt buộc phải sử dụng công cụ chuyên dụng (như `yougetsignal.com` hoặc hệ thống quét nội bộ) để tiến hành rà soát, kiểm tra toàn bộ các cổng mạng đang mở (Open Ports) trên Router/Firewall biên hướng kết nối Internet nhằm phát hiện và đóng các lỗ hổng dịch vụ không sử dụng .

### 7.3. Phạm vi và Quy tắc Chia sẻ Thông tin với Đối tác
- Việc chia sẻ thông tin phải được giới hạn trong phạm vi phù hợp với tài nguyên, mục tiêu bảo mật của nhà máy, tập trung vào hiệu quả phòng vệ và **tuyệt đối không làm lộ lọt dữ liệu nội bộ** .
- IT kiểm soát chặt chẽ các quyền riêng tư, chỉ định rõ ràng danh tính cá nhân/đối tác được ủy quyền tiếp nhận thông tin .
- Trước khi thực hiện chia sẻ, nhân viên IT phải phân loại mức độ nghiêm trọng và tuân thủ 3 bước:
	1. Liệt kê chính xác danh mục thông tin mối đe dọa được phép chia sẻ .
	2. Mô tả rõ ràng điều kiện và hoàn cảnh cho phép chia sẻ .
	3. Định danh chính xác người nhận dữ liệu đã được Ban Giám đốc phê duyệt .

---

## 8. CÁC HÀNH VI BỊ NGHIÊM CẤM VÀ CHẾ TÀI THỰC THI

### 8.1. Các hành vi bị nghiêm cấm tuyệt đối
- [ ] Tạo ra, cài đặt, phát tán virus máy tính, mã độc hoặc phần mềm độc hại vào mạng lưới doanh nghiệp .
- [ ] Tự ý xâm nhập, sửa đổi, sao chép hoặc xóa bỏ nội dung thông tin, dữ liệu của công ty hoặc của cá nhân khác khi không được phân quyền .
- [ ] Hành vi tấn công từ chối dịch vụ (DoS/DDoS) hoặc các hành động cố ý cản trở hoạt động cung cấp dịch vụ bình thường của hệ thống thông tin .
- [ ] Bẻ khóa, trộm cắp, sử dụng trái phép mật khẩu, khóa mật mã của tài khoản khác cho mục đích cá nhân hoặc phá hoại .
- [ ] Mọi hành vi khác làm tổn hại đến tính an toàn, bí mật thông tin của công ty và đối tác trên môi trường mạng .

### 8.2. Cơ chế Thực thi và Chế tài (Enforcement)
- Bộ phận IT có trách nhiệm định kỳ rà soát, kiểm tra việc tuân thủ quy trình hệ thống giám sát mạng để đảm bảo tính thực thi nghiêm túc của chính sách này .
- Mọi hành vi vi phạm sẽ bị chế tài nghiêm khắc theo quy chế nội bộ của tập đoàn, áp dụng lũy tiến tùy theo mức độ hậu quả :
	- **Mức độ 1:** Nhắc nhở trực tiếp, khiển trách nội bộ bộ phận .
	- **Mức độ 2:** Cảnh cáo bằng văn bản, gửi lưu hồ sơ nhân sự tại phòng HR .
	- **Mức độ 3:** Sa thải, buộc thôi việc ngay lập tức .
	- **Mức độ 4:** Yêu cầu bồi thường toàn bộ thiệt hại tài chính tài sản và chuyển hồ sơ sang cơ quan điều tra để truy tố trước pháp luật theo Luật An ninh mạng .

---

## 9. QUẢN LÝ NGOẠI LỆ VÀ BIỂU MẪU (EXCEPTIONS & FORMS)

- **Quản lý ngoại lệ:** Chính sách này quy định các tiêu chuẩn an toàn cốt lõi cho toàn bộ hạ tầng mạng nhà máy. **KHÔNG CÓ NGOẠI LỆ NÀO ĐƯỢC ÁP DỤNG TRONG MỌI TRƯỜNG HỢP** nhằm đảm bảo tính toàn vẹn của hệ thống .
- **Hệ thống biểu mẫu đính kèm (Forms):** Tất cả các hoạt động bàn giao máy, thay đổi quyền truy cập, nhật ký ra vào phòng máy chủ, yêu cầu mua sắm thiết bị CNTT đều phải sử dụng đúng mã hiệu biểu mẫu do Phòng IT ban hành hành chính .