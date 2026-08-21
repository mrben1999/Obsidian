# 📜 Phần 2.5 — Triển khai Certificate cho NPS (PEAP)

## 1. Vì sao cần Certificate
PEAP (Protected EAP) tạo một kênh TLS mã hoá giữa client và NPS trước khi truyền thông tin đăng nhập (username/password) — để tạo kênh TLS này, **NPS server bắt buộc phải có Server Certificate hợp lệ**. Đây là yêu cầu kỹ thuật, không thể bỏ qua khi dùng PEAP-MSCHAPv2.

## 2. Hai phương án lấy Certificate

| Phương án | Ưu điểm | Nhược điểm |
|---|---|---|
| **A. Tự triển khai AD CS (Certificate Authority nội bộ)** | Miễn phí, cấp certificate không giới hạn, phù hợp môi trường nội bộ | Cần client trust CA nội bộ (deploy qua GPO), phức tạp hơn ban đầu |
| **B. Mua certificate từ CA công cộng (Public CA)** | Client tự động trust sẵn, không cần deploy CA cert | Tốn phí, phải gia hạn định kỳ |

📌 Khuyến nghị cho nhà máy (môi trường nội bộ, máy trạm đã join domain): **Phương án A — AD CS nội bộ**, vì máy trạm join domain có thể tự động nhận Root CA certificate qua Group Policy, không phát sinh chi phí định kỳ.

## 3. Triển khai AD CS (Active Directory Certificate Services)

### 3.1 Cài Role AD CS
```powershell
Install-WindowsFeature ADCS-Cert-Authority -IncludeManagementTools
```

### 3.2 Cấu hình CA (chạy lần đầu)
```powershell
Install-AdcsCertificationAuthority `
  -CAType EnterpriseRootCA `
  -CryptoProviderName "RSA#Microsoft Software Key Storage Provider" `
  -KeyLength 2048 `
  -HashAlgorithmName SHA256 `
  -ValidityPeriod Years `
  -ValidityPeriodUnits 10
```
📌 `EnterpriseRootCA` yêu cầu server đã join domain (đúng với DC01 trong kiến trúc này) — CA sẽ tự động publish vào AD, giúp máy trạm domain tự nhận Root CA.

⚠️ Khuyến nghị triển khai AD CS trên server riêng (không chung DC) ở môi trường lớn — nhưng với quy mô nhà máy vừa/nhỏ, cài chung trên DC01 vẫn chấp nhận được, cần lưu ý CA Root Key là tài sản rất nhạy cảm (nếu lộ, kẻ tấn công có thể giả mạo certificate toàn hệ thống) → bảo vệ chặt server này ở mức cao nhất.

### 3.3 Cấp Certificate Template cho Server Authentication (nếu chưa có sẵn)
Mặc định AD CS có template **Computer** hỗ trợ Server Authentication — NPS server (chính là DC01 nếu cài chung) sẽ tự động enroll certificate này qua **Certificate auto-enrollment** (cấu hình qua GPO).

Cấu hình auto-enrollment qua GPO:
`Computer Configuration → Policies → Windows Settings → Security Settings → Public Key Policies → Certificate Services Client - Auto-Enrollment` → **Enabled**, tích **Renew expired certificates, update pending certificates, and remove revoked certificates** + **Update certificates that use certificate templates**.

### 3.4 Yêu cầu certificate thủ công cho NPS (nếu auto-enrollment chưa kịp áp dụng)
```powershell
certreq -enrollcert -q "Computer" "DC01.qvn.local"
```
Hoặc qua GUI: **MMC** → **Add Snap-in** → **Certificates (Computer account)** → **Personal** → chuột phải → **All Tasks** → **Request New Certificate**.

## 4. Gán Certificate cho NPS trong PEAP Configuration
📌 Bước này thực hiện khi tạo Network Policy — xem chi tiết tại [[04_Cau_Hinh_Network_Policy_PEAP]] mục "Edit Protected EAP Properties", nơi chọn certificate vừa cấp từ danh sách **Certificate issued**.

## 5. Triển khai Root CA Certificate xuống máy trạm (để client trust NPS)
Nếu máy trạm đã join domain qua GPO, Root CA certificate của Enterprise CA **tự động** được đẩy xuống Trusted Root Certification Authorities — không cần thao tác thủ công.

Kiểm tra trên máy trạm:
```powershell
Get-ChildItem Cert:\LocalMachine\Root | Where-Object { $_.Subject -like "*qvn*" }
```
✅ Nếu thấy Root CA của `qvn.local` xuất hiện → máy trạm đã trust, sẵn sàng kết nối PEAP.

📌 Với thiết bị **không join domain** (điện thoại cá nhân dùng Wi-Fi nhân viên, laptop khách...), phải cài Root CA certificate thủ công hoặc chấp nhận cảnh báo "certificate không tin cậy" khi kết nối lần đầu — cân nhắc chính sách BYOD phù hợp với nhà máy.

## 6. Kiểm tra Certificate hợp lệ
```powershell
Get-ChildItem Cert:\LocalMachine\My | Where-Object { $_.Subject -like "*DC01*" } | Select-Object Subject, NotAfter, Thumbprint
```
- [ ] ✅ Certificate còn hạn (`NotAfter` chưa quá hạn).
- [ ] ✅ Certificate đúng Subject Name khớp hostname NPS (`DC01.qvn.local`).
- [ ] 📌 Đặt lịch nhắc gia hạn certificate trước khi hết hạn ít nhất 30 ngày (xem [[../06_Van_Hanh_Chuan/03_Kiem_Tra_Dinh_Ky]]).

➡️ Tiếp theo: [[04_Cau_Hinh_Network_Policy_PEAP]]
