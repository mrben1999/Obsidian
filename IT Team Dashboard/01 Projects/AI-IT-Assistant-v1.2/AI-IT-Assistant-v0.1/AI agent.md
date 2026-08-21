---
type: project
status: in-progress
priority: P2
team:
owner:
start_date: 2026-08-19
due:
created: 2026-08-19
tags:
  - project
---

# 📁 AI agent tự vận hành cho team IT

Đúng góc nhìn **xây một AI agent tự vận hành cho team IT**, thì em sẽ đổi cách đánh giá hoàn toàn. Không còn hỏi “tool nào code tốt nhất?”, mà hỏi:

> **Tool nào có thể trở thành “AI IT Engineer/AI Ops” chạy liên tục, có quyền truy cập hệ thống, nhớ kiến thức của team, tự chia việc, tự kiểm tra và chỉ gọi người khi cần?**

Em vừa kiểm tra lại trạng thái hiện tại của cả 4 dự án; đặc biệt Hermes đã có thay đổi rất đáng chú ý ngay **18/08/2026**, còn Claude Code hiện có subagents, hooks, MCP, permissions và SDK khá trưởng thành.

## Kết luận trước

Nếu xây cho **team IT**, em xếp:

**🥇 Hermes Agent — làm “AI IT Employee”**  
**🥈 Claude Code — làm “AI Software Engineer”**  
**🥉 OpenClaw — làm “AI Front Door / Personal Assistant & Automation Hub”**  
**4️⃣ Kilo Code — làm “AI Coding Specialist”**

Nhưng quan trọng nhất:

> **Em không triển khai 1 con duy nhất. Em sẽ ghép chúng thành một kiến trúc.**

---

# 1. Nhìn 4 con theo vai trò

Đánh giá cho AI agent tự vận hành IT

Điểm đánh giá mang tính kiến trúc/kinh nghiệm triển khai, không phải benchmark chính thức của các dự án.

036912HermesClaude CodeOpenClawKilo Code

Thang điểm 10; ưu tiên autonomy, operations, coding, orchestration và khả năng triển khai cho team.

||Vai trò em giao|
|---|---|
|**Hermes**|🧠 AI IT Employee / Agent Core|
|**Claude Code**|👨‍💻 Senior Software Engineer|
|**OpenClaw**|📡 Communication + Automation Hub|
|**Kilo Code**|🛠️ Coding/IDE Specialist|

Đây là điểm mấu chốt: **không nên bắt cả 4 làm cùng một việc.**

---

# 2. 🥇 Hermes — em chọn làm **Agent Core**

Hermes hiện đã đi khá xa khỏi khái niệm “coding agent”.

Trang chính thức mô tả nó là self-hosted agent với **persistent memory, self-created skills và messaging gateway**; tài liệu cũng có tools/toolsets, memory, cron, subagents và nhiều cơ chế automation.

Đáng chú ý hơn, release ngày **18/08/2026** bổ sung memory graph, background subagent fan-out, completion contracts và gateway hướng tới triển khai scale.

### Nếu xây AI cho team IT:

                  HERMES

                     │

       ┌─────────────┼──────────────┐

       │             │              │

    MEMORY         SKILLS         CRON

       │             │              │

       └─────────────┼──────────────┘

                     │

               TOOL / MCP

                     │

       ┌─────────────┼─────────────┐

       ↓             ↓             ↓

    GitLab         Server        Monitoring

       │             │             │

       ↓             ↓             ↓

    Claude         SSH         APIs

Nó phù hợp với câu:

> **“Hãy quản lý hệ thống này cho tôi.”**

chứ không chỉ:

> “Sửa file này.”

### Hermes mạnh nhất ở:

- persistent memory
- skills
- cron
- autonomous execution
- subagents
- messaging
- server/terminal
- research
- MCP
- self-hosting.

Và chính khả năng **tạo skill từ kinh nghiệm** khiến nó rất phù hợp với một IT team có nhiều quy trình lặp lại.

---

# 3. 🥈 Claude Code — **Senior Engineer**

Nếu Hermes là **AI IT employee**, thì Claude Code là **Senior Developer**.

Claude Code hiện có:

- file read/write/edit
- terminal
- web
- MCP
- subagents
- hooks
- permissions
- SDK.

Đặc biệt **hooks** rất quan trọng khi xây automation.

Hooks có thể chạy shell command, HTTP endpoint hoặc LLM prompt tại những điểm cụ thể trong lifecycle của Claude Code.

Ví dụ:

PR created

    ↓

Claude Code

    ↓

Security review

    ↓

Test

    ↓

Code review

    ↓

Deploy approval

Hoặc:

Alert từ monitoring

        ↓

Claude Code

        ↓

đọc log

        ↓

phân tích source

        ↓

tạo patch

        ↓

test

        ↓

PR

### Claude Code mạnh hơn Hermes ở đâu?

**Software engineering thuần túy.**

Nếu nhiệm vụ là:

> “Đây là một repo 500k LOC. Tìm root cause, sửa bug, viết test regression và chuẩn bị PR.”

Em tin Claude Code hơn.

---

# 4. 🥉 OpenClaw — **Front Door của AI**

OpenClaw có triết lý rất khác.

Repo chính thức mô tả nó là **personal AI assistant chạy trên nhiều OS/platform và giao tiếp qua các channel người dùng đang dùng**; nó thiên về một operator hơn là một hệ thống multi-user IT backend.

Nói dễ hiểu:

               TEAM

                │

       ┌────────┼────────┐

       ↓        ↓        ↓

   Telegram    Slack   Discord

       │        │        │

       └────────┼────────┘

                ↓

             OPENCLAW

                │

       ┌────────┼────────┐

       ↓        ↓        ↓

     Tools    Skills    Agents

Đây là thứ em rất thích cho **interface**.

Ví dụ IT manager nhắn:

> “Có incident production.”

OpenClaw có thể trở thành cửa vào:

Slack

  ↓

OpenClaw

  ↓

Hermes

  ↓

Claude Code

  ↓

Git / Server / Monitoring

  ↓

OpenClaw

  ↓

Slack

Nó biến AI thành thứ team có thể **nói chuyện trực tiếp** thay vì phải mở terminal.

---

# 5. Kilo Code — đừng bỏ, nhưng đặt đúng vị trí

Kilo vẫn cực kỳ tốt cho **engineering workstation**.

Kilo hiện hỗ trợ VS Code, JetBrains và CLI, 500+ model, chuyển model giữa task và open-source.

Nó phù hợp:

Developer

    ↓

VS Code

    ↓

Kilo

    ↓

Repository

Trong khi Hermes:

IT Team

    ↓

Hermes

    ↓

Infrastructure

Hai thằng không cần tranh nhau.

---

# 6. Bây giờ mới tới phần quan trọng: **kiến trúc em sẽ xây**

Nếu anh bảo em:

> “Hãy xây cho team IT một AI có thể tự vận hành.”

Em sẽ **không** cài 4 agent ngang hàng.

Em xây:

                    ┌───────────────┐

                    │   IT TEAM     │

                    └───────┬───────┘

                            │

                 Slack / Telegram / Web

                            │

                            ▼

                    ┌───────────────┐

                    │   OPENCLAW    │

                    │   Front Door  │

                    └───────┬───────┘

                            │

                            ▼

                    ┌───────────────┐

                    │    HERMES     │

                    │  Agent Core   │

                    └───────┬───────┘

                            │

          ┌─────────────────┼─────────────────┐

          │                 │                 │

          ▼                 ▼                 ▼

      Research          IT/Ops            Engineering

      Agent             Agent               Agent

          │                 │                 │

          │                 │                 ▼

          │                 │           Claude Code

          │                 │                 │

          ▼                 ▼                 ▼

        Web              SSH/K8s             Git

        MCP              Docker             CI/CD

                         Cloud              Tests

Đây mới là kiến trúc em thấy **đáng đầu tư**.

---

# 7. Hermes làm “Manager”

Ví dụ anh nói:

> **“Production API đang chậm, kiểm tra và xử lý.”**

Hermes không nhất thiết tự làm tất cả.

Nó có thể phân rã:

Hermes

 │

 ├── Monitoring Agent

 │      └── Check CPU/RAM/latency

 │

 ├── Log Agent

 │      └── Search logs

 │

 ├── Research Agent

 │      └── Search known issue

 │

 └── Coding Agent

        └── Claude Code

              ↓

           inspect repo

              ↓

           fix

              ↓

           test

Sau đó Hermes tổng hợp:

> Root cause: database connection pool exhausted.

> Fix: PR #184.

> Tests: passed.

> Risk: medium.

> Deployment: waiting for approval.

Đây là **AI employee** chứ không còn là chatbot.

---

# 8. Memory của team mới là tài sản lớn nhất

Đây là lý do em đánh giá Hermes cao.

Anh muốn AI biết:

Company

│

├── Infrastructure

│   ├── Production

│   ├── Staging

│   └── Backup

│

├── Applications

│   ├── ERP

│   ├── CRM

│   └── API

│

├── Procedures

│   ├── Incident response

│   ├── Deployment

│   ├── Backup

│   └── Security

│

├── People

│   ├── Dev

│   ├── Ops

│   └── Security

│

└── Lessons learned

Khi có incident mới:

Incident #431

     ↓

Hermes memory

     ↓

"Incident tương tự đã xảy ra

 tháng trước."

     ↓

Runbook

     ↓

Fix

Hermes hiện còn có memory graph trong release mới nhất, nên hướng này càng đáng chú ý.

---

# 9. Nhưng em sẽ **không cho AI toàn quyền**

Đây là phần cực kỳ quan trọng.

AI IT agent có quyền:

READ

  ↓

ANALYZE

  ↓

PROPOSE

  ↓

TEST

  ↓

APPROVE

  ↓

WRITE

Không nên:

AI

 ↓

root@production

 ↓

rm -rf /

😄

Em chia permission:

|Action|AI|
|---|---|
|Read logs|✅ Auto|
|Read metrics|✅ Auto|
|Search Git|✅ Auto|
|Run tests|✅ Auto|
|Create branch|✅ Auto|
|Create PR|✅ Auto|
|Restart staging|✅ Auto|
|Deploy staging|🟡 Policy|
|Restart production|🟡 Approval|
|Deploy production|🔴 Human|
|Delete database|🔴 Human|
|Rotate credentials|🔴 Human|

Claude Code có permission controls, còn Hermes cũng có các cơ chế tool/toolset để kiểm soát capability.

---

# 10. Một điểm em đánh giá cao ở Claude Code

**Verification.**

Một agent tốt không nên nói:

> “Em sửa xong rồi.”

Nó phải chứng minh:

Changed files: 7

Tests: 184 passed

Lint: passed

Build: passed

Security scan: passed

Diff reviewed: yes

Claude Code rất hợp làm **verification/engineering executor** trong architecture này.

---

# 11. OpenClaw nằm ở đâu?

Em sẽ không dùng OpenClaw làm **database of truth**.

Em dùng nó làm:

> **human ↔ AI interface**

Ví dụ:

### Team IT Slack

#ai-ops

  

@ai-agent

Check API latency.

OpenClaw:

→ Hermes

Hermes:

→ Monitoring

→ Logs

→ Claude Code

Kết quả:

API latency increased 37%.

  

Root cause:

DB connection pool saturation.

  

Action:

PR #482 created.

  

Status:

Tests passed.

  

Production deployment:

Waiting for approval.

Team không cần biết agent bên dưới là Hermes hay Claude Code.

---

# 12. Kilo sẽ phục vụ developer

Developer vẫn có:

VS Code

   ↓

Kilo

   ↓

local coding

Trong khi AI Ops chạy:

Slack

 ↓

OpenClaw

 ↓

Hermes

 ↓

Claude Code

Vậy developer có **hai lớp AI**:

### Interactive AI

**Kilo**

> “Anh đang code, giúp anh.”

### Autonomous AI

**Hermes**

> “Đêm nay hệ thống tự theo dõi.”

---

# 13. Bảng quyết định cuối

|Capability|Kilo|Hermes|Claude Code|OpenClaw|
|---|---|---|---|---|
|Coding|⭐⭐⭐⭐⭐|⭐⭐⭐⭐|⭐⭐⭐⭐⭐|⭐⭐⭐|
|Debug|⭐⭐⭐⭐⭐|⭐⭐⭐⭐|⭐⭐⭐⭐⭐|⭐⭐⭐|
|IDE|⭐⭐⭐⭐⭐|⭐⭐⭐|⭐⭐⭐⭐|⭐⭐|
|Terminal|⭐⭐⭐⭐|⭐⭐⭐⭐⭐|⭐⭐⭐⭐⭐|⭐⭐⭐⭐|
|Server Ops|⭐⭐⭐⭐|⭐⭐⭐⭐⭐|⭐⭐⭐⭐|⭐⭐⭐⭐|
|Memory|⭐⭐⭐|⭐⭐⭐⭐⭐|⭐⭐⭐⭐|⭐⭐⭐⭐|
|Skills|⭐⭐⭐⭐|⭐⭐⭐⭐⭐|⭐⭐⭐⭐|⭐⭐⭐⭐⭐|
|Cron|⭐⭐⭐|⭐⭐⭐⭐⭐|⭐⭐⭐|⭐⭐⭐⭐⭐|
|Subagents|⭐⭐⭐⭐|⭐⭐⭐⭐⭐|⭐⭐⭐⭐⭐|⭐⭐⭐⭐|
|MCP|⭐⭐⭐⭐⭐|⭐⭐⭐⭐⭐|⭐⭐⭐⭐⭐|⭐⭐⭐⭐|
|Messaging|⭐⭐⭐|⭐⭐⭐⭐⭐|⭐⭐|⭐⭐⭐⭐⭐|
|Research|⭐⭐⭐|⭐⭐⭐⭐⭐|⭐⭐⭐⭐|⭐⭐⭐⭐⭐|
|Autonomy|⭐⭐⭐⭐|**⭐⭐⭐⭐⭐**|⭐⭐⭐⭐⭐|⭐⭐⭐⭐⭐|
|Team IT|⭐⭐⭐⭐|**⭐⭐⭐⭐⭐**|⭐⭐⭐⭐⭐|⭐⭐⭐⭐|
|AI employee|⭐⭐⭐|**⭐⭐⭐⭐⭐**|⭐⭐⭐⭐|⭐⭐⭐⭐|

_Đây là đánh giá kiến trúc của em, không phải benchmark chính thức._

---

# 14. Và có một điểm rất quan trọng về OpenClaw

OpenClaw chính thức mô tả mình là **personal AI assistant** và thiết kế hướng tới **single operator**.

Vì vậy nếu anh muốn:

> **“AI cho một người IT admin.”**

OpenClaw rất hấp dẫn.

Nhưng nếu mục tiêu là:

> **“AI platform cho 20–100 người trong team IT.”**

thì em sẽ **không lấy OpenClaw làm core**.

Em sẽ đặt nó ở edge/interface.

---

# 15. Nếu triển khai thực tế, em sẽ chọn stack này

### 🧠 Brain / Orchestrator

**Hermes**

### 👨‍💻 Engineering

**Claude Code**

### 🖥️ Developer workstation

**Kilo Code**

### 💬 Human interface

**OpenClaw**

### 🔌 Integration

**MCP**

### 📚 Knowledge

Git

+

Wiki

+

Runbooks

+

Monitoring

+

Incident history

+

Architecture docs

### 🔐 Security

RBAC

+

isolated containers

+

short-lived credentials

+

approval gates

+

audit log

---

# 16. Và workflow cuối cùng sẽ như này

                  TEAM IT

                     │

          Slack / Telegram / Web

                     │

                     ▼

               ┌───────────┐

               │ OpenClaw  │

               └─────┬─────┘

                     │

                     ▼

               ┌───────────┐

               │  Hermes   │

               │   CORE    │

               └─────┬─────┘

                     │

          ┌──────────┼──────────┐

          │          │          │

          ▼          ▼          ▼

       Memory     Research    Planner

          │          │          │

          └──────────┼──────────┘

                     │

               ┌─────┴─────┐

               │           │

               ▼           ▼

             Ops        Engineering

               │           │

          SSH/K8s/etc   Claude Code

                           │

                    ┌──────┼──────┐

                    ↓      ↓      ↓

                   Git    Test    CI/CD

                    │

                    ▼

                   PR

                    │

                    ▼

               Human approval

                    │

                    ▼

                Production

## 🎯 Nếu là dự án của anh, em sẽ đi theo hướng này

**Đừng bắt đầu bằng việc “cài 4 con AI”.**

Hãy xây **AI IT Operating System** với 5 lớp:

1. **Interface** — OpenClaw
2. **Agent brain** — Hermes
3. **Engineering executor** — Claude Code
4. **Developer copilot** — Kilo
5. **Tools/data/security** — MCP + Git + monitoring + IAM + approval

Trong 4 cái, **Hermes là cái em muốn thử nghiệm đầu tiên cho “AI employee”**, đặc biệt vì release hiện tại đã tiến thêm về memory graph, background subagents và gateway deployment.

**Còn nếu mục tiêu của anh là triển khai thật cho team IT, bước tiếp theo em khuyên làm là thiết kế luôn một kiến trúc `AI IT Agent v1` chạy trên VPS/Docker/Kubernetes: gồm Hermes + Claude Code + OpenClaw + MCP + GitLab + monitoring + RBAC + approval workflow**, rồi chia rõ cái gì AI được tự làm và cái gì bắt buộc con người duyệt. Đây mới là phần quyết định hệ thống có dùng được trong production hay không.