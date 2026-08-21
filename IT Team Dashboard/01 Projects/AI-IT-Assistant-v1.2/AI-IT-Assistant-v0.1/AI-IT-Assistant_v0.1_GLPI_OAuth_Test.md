# AI-IT-Assistant v0.1 — GLPI OAuth Test

## Mục tiêu

Kiểm tra từ máy chạy Hermes rằng:

1. OAuth Client `Hermes-IT-Agent` hoạt động.
2. GLPI User `Hermes-IT-Agent` có thể lấy OAuth access token bằng Password Grant.
3. Access token có thể gọi High-Level REST API v2.3.
4. User có quyền **đọc** `/Assistance/Ticket`.

## Cấu hình đã xác nhận

- GLPI: 11.0.8
- High-Level REST API: v2.3
- Base API: `http://glpi.qve.com/api.php/v2.3`
- OAuth Client: `Hermes-IT-Agent`
- Grant: `Password`
- Scope: `api`
- GLPI User: `Hermes-IT-Agent`
- Profile: `Read-Only`
- Entity: `QVN Root`

> Không lưu Client Secret hoặc GLPI password trong file Markdown, Git, Obsidian vault nếu vault không được bảo vệ như một secret store.

## OAuth token endpoint

Token endpoint của High-Level API là:

`http://glpi.qve.com/api.php/token`

## Test từ Git Bash

Không đưa secret/password trực tiếp vào command line. Nhập chúng qua `read -s`:

```bash
export GLPI_CLIENT_ID='PASTE_CLIENT_ID_HERE'
read -s GLPI_CLIENT_SECRET
echo
read -s GLPI_USERNAME
echo
read -s GLPI_PASSWORD
echo
```

Lấy access token:

```bash
TOKEN=$(curl -sS -X POST   'http://glpi.qve.com/api.php/token'   -H 'Content-Type: application/x-www-form-urlencoded'   --data-urlencode 'grant_type=password'   --data-urlencode "client_id=${GLPI_CLIENT_ID}"   --data-urlencode "client_secret=${GLPI_CLIENT_SECRET}"   --data-urlencode "username=${GLPI_USERNAME}"   --data-urlencode "password=${GLPI_PASSWORD}"   --data-urlencode 'scope=api'   | python -c "import sys,json; d=json.load(sys.stdin); print(d.get('access_token','')); print('ERROR:', d.get('error'), d.get('error_description'), file=sys.stderr)")
```

Kiểm tra token có được tạo:

```bash
test -n "$TOKEN" && echo "OAuth token: OK" || echo "OAuth token: FAILED"
```

## Test quyền đọc Ticket

Chỉ lấy 1 ticket để kiểm tra, chưa đọc toàn bộ dữ liệu:

```bash
curl -i -sS   'http://glpi.qve.com/api.php/v2.3/Assistance/Ticket?start=0&limit=1'   -H "Authorization: Bearer ${TOKEN}"   -H 'Accept: application/json'
```

### Kết quả mong đợi

`HTTP/1.1 200` và JSON chứa danh sách ticket.

Đây là **read-only test**: không có POST/PATCH/DELETE.

## Diễn giải lỗi

### 200

OAuth và quyền đọc API cơ bản hoạt động.

### 401 Unauthorized

Tập trung kiểm tra:

- Client ID
- Client Secret
- username
- password
- `grant_type=password`
- token endpoint `/api.php/token`

### 403 Forbidden

OAuth đã xác thực nhưng GLPI User/Profile/Entity chưa có quyền cần thiết.

Kiểm tra:

- User `Hermes-IT-Agent`
- Profile `Read-Only`
- Entity `QVN Root`
- quyền Assistance/Ticket
- phạm vi entity và Recursive

### 404

Kiểm tra URL/API version:

`http://glpi.qve.com/api.php/v2.3`

và token endpoint:

`http://glpi.qve.com/api.php/token`

## Quy tắc an toàn

- Không gửi Client Secret vào chat.
- Không gửi GLPI password vào chat.
- Không ghi secret/password vào Markdown.
- Không commit secret vào Git.
- Không test POST/PATCH/DELETE trong v0.1.
- Sau khi xác nhận `limit=1`, mới test pagination đọc nhiều ticket.

## Checkpoint

- [x] OAuth Client created
- [x] Grant = Password
- [x] Scope = api
- [x] GLPI service user created
- [x] Profile = Read-Only
- [ ] OAuth token test
- [ ] GET `/Assistance/Ticket?limit=1`
- [ ] Pagination / đọc toàn bộ ticket
- [ ] Hermes integration
