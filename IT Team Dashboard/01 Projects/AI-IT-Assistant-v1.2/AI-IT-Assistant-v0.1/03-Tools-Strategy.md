# 03 — Tools Strategy

## Nguyên tắc chọn tool

Ưu tiên:

1. Đã có sẵn.
2. Miễn phí/open-source.
3. Chạy local.
4. Có thể thay thế dễ dàng.
5. Có permission rõ ràng.

## Agent

Hermes là ứng viên chính cho autonomous/local agent.

Kilo Code và Claude Code được xem là coding executors/assistants.

Không bắt buộc phải cài cả ba ngay lập tức.

## Knowledge

Obsidian là knowledge base chính.

## Code

GitHub/GitLab hoặc repository hiện có.

## Terminal

Chỉ cấp quyền cần thiết.

## Cloud AI

Nếu dùng API trả phí:

- phải biết cost trước;
- ưu tiên quota/free tier khi phù hợp;
- theo dõi usage;
- không phụ thuộc vào một provider duy nhất.

## Tool permission

### Read
Tự động.

### Safe write
Cho phép trong workspace/test project.

### System write
Cần xác nhận.

### Destructive
Không tự động.

## Tiêu chí thay tool

Có thể thay Hermes/Kilo/Claude/OpenClaw mà không làm mất:

- Obsidian knowledge;
- runbooks;
- scripts;
- decisions;
- deployment notes.
