# 08 — Decision Log

## ADR-006 — Use the existing Hermes installation as the first agent

**Status:** Accepted

### Decision

Use the existing Hermes Agent v0.19.0 installation as the primary AI-agent candidate for v0.1.

### Reason

Hermes is already installed and has the required baseline capabilities for the initial proof of value: terminal, file, web, code execution, memory, skills, delegation, cronjob and messaging among its installed default toolset.

### Consequence

Do not add Kilo Code, Claude Code or OpenClaw to the runtime architecture until a concrete use case requires them.

## ADR-007 — First integration is GLPI + Obsidian

**Status:** Proposed

### Decision

The first practical workflow should connect ITSM work from GLPI with knowledge capture in Obsidian, with Hermes performing analysis in the middle.

### Workflow

`GLPI → Hermes → Human Review → Obsidian`

### Security

Start with GLPI read-only access. No automatic ticket mutation or production execution.
