# AI-IT-Assistant v0.1

> AI assistant hỗ trợ công việc IT hằng ngày, ưu tiên chi phí $0 và chạy trên máy hiện có.

## Mục tiêu

Xây một AI có thể giúp:

- coding, debug, review;
- Linux/Windows/Docker/Git;
- phân tích log và troubleshooting;
- viết script/command;
- đọc tài liệu;
- xây và tra cứu runbook;
- ghi lại incident/lesson learned;
- hỗ trợ công việc IT hằng ngày.

## Không phải mục tiêu của v0.1

- Không dựng VPS/server riêng.
- Không Kubernetes.
- Không HA.
- Không autonomous production changes.
- Không lưu production secrets vào AI.
- Không cố triển khai nhiều agent cùng lúc.

## Nguyên tắc

1. Dùng AI để tạo giá trị trước.
2. Chi phí thấp nhất có thể.
3. Human-in-the-loop.
4. Read/analyze trước, write/execute sau.
5. Mọi kiến thức quan trọng được ghi vào Obsidian.
6. Mọi thay đổi triển khai thực tế được ghi lại.
7. Không lưu secret trong Markdown/Obsidian/Git.

## Stack định hướng

- **Primary agent:** Hermes Agent, nếu phù hợp với môi trường hiện tại.
- **Coding assistant:** Kilo Code hoặc Claude Code.
- **Knowledge base:** Obsidian.
- **Tools:** local files, Git, terminal và các công cụ sẵn có.
- **Cloud/server:** chưa cần ở v0.1.

## Definition of Done

AI có thể:

- nhận một task IT thực tế;
- phân tích và đưa kế hoạch;
- sử dụng tài liệu/knowledge được phép;
- hỗ trợ code/script/troubleshooting;
- tạo tài liệu kết quả;
- cập nhật runbook/incident khi cần;
- không tự thực hiện hành động nguy hiểm nếu chưa được duyệt.

## Trạng thái

**Phase 0 — Project design**

Tiếp theo: Phase 1 — Local setup.
