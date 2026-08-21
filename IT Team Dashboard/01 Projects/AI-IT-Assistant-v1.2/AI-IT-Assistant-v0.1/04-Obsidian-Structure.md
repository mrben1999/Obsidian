# 04 — Obsidian Structure

## Vault

```text
AI-IT-Assistant/
├── 00-README.md
├── 01-Goals-and-Scope.md
├── 02-Architecture.md
├── 03-Tools-Strategy.md
├── 04-Obsidian-Structure.md
├── 05-Roadmap-Checklist.md
├── 06-Security.md
├── 07-Implementation-Notes.md
├── 08-Decision-Log.md
├── 09-Cost-Tracking.md
├── 10-Daily-Workflow.md
│
├── Systems/
├── Runbooks/
├── Incidents/
├── Scripts/
├── Projects/
├── Architecture/
├── Skills/
└── References/
```

## Naming

- `RB-xxx-topic.md` — runbook
- `INC-YYYYMMDD-topic.md` — incident
- `SYS-topic.md` — system
- `SK-topic.md` — AI skill
- `ADR-xxx-topic.md` — decision
- `REF-topic.md` — reference

## Knowledge loop

```text
Task
 ↓
AI helps
 ↓
Solution
 ↓
Verify
 ↓
Document
 ↓
Obsidian
 ↓
Future retrieval
```

## Quy tắc

Knowledge chính thức phải nằm trong Obsidian/Git, không chỉ nằm trong agent memory.
