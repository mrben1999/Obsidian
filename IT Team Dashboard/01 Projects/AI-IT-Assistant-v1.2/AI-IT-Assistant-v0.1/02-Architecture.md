# 02 — Architecture

## v0.1

```text
                    ANH
                     |
                     v
              +-------------+
              | AI Assistant|
              +------+------+
                     |
          +----------+----------+
          |          |          |
          v          v          v
       Obsidian     Git      Local Files
          |          |          |
          +----------+----------+
                     |
                  Tools
                     |
          +----------+----------+
          |          |          |
       Terminal    Scripts    Docs
```

## Vai trò

### AI Assistant

Lớp suy luận và điều phối task.

### Obsidian

Knowledge base lâu dài:

- systems;
- runbooks;
- incidents;
- scripts;
- decisions;
- lessons learned.

### Git

Nguồn code và lịch sử thay đổi.

### Local tools

Các công cụ hiện có trên máy.

## Kiến trúc mở rộng sau này

```text
User
 |
Gateway
 |
Agent Core
 |
+-- Memory
+-- Skills
+-- MCP/Tools
+-- Coding Agent
+-- Automation
 |
Approval
 |
Infrastructure
```

Không triển khai phần mở rộng này trong v0.1 nếu chưa cần.
