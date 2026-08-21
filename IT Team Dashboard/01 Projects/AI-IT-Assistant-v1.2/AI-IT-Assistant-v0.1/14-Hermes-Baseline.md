# 14 — Hermes Baseline

## Current baseline

Hermes Agent is already installed and is the primary AI-agent candidate for AI-IT-Assistant v0.1.

### Runtime

- Windows 10
- Git Bash/MSYS
- Python 3.11.15
- Installed from git
- Working directory: `D:\HaiDang_Hermes`

### Model

- Provider: `nous`
- Model: `upstage/solar-pro4:free`

### Capabilities

The current installation has the default toolset, including terminal, file, web, code execution, memory, skills, delegation, cronjob, messaging, todo/kanban and related capabilities.

## Immediate conclusion

**Do not install another agent yet.**

The current Hermes installation is sufficient to start the first proof-of-value workflow.

## First target workflow

```text
GLPI Ticket
    ↓
Hermes reads/receives ticket information
    ↓
Analyze + classify
    ↓
Troubleshooting checklist
    ↓
Human review
    ↓
Resolution
    ↓
Hermes creates Runbook / Lesson Learned
    ↓
Obsidian
```

## Initial permissions

### Allowed

- Read ticket information
- Analyze text/logs supplied to the agent
- Search documentation
- Generate troubleshooting steps
- Generate draft responses
- Generate Markdown knowledge

### Not yet allowed

- Modify GLPI tickets automatically
- Delete/close tickets automatically
- Change production infrastructure
- Execute destructive commands
- Access production credentials

## Next step

Collect GLPI information before building the connector/workflow.
