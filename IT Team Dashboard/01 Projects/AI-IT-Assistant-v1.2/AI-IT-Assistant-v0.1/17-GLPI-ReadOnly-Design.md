# 17 — GLPI Read-Only Design

## Objective

Allow Hermes to analyze GLPI tickets without giving it write capability.

```text
GLPI 11.0.8
    |
    | REST API v2.3.0
    v
Read-only connector
    |
    | GET only
    v
Hermes
    |
    +--> Ticket analysis
    +--> Troubleshooting
    +--> Prioritization
    +--> Knowledge extraction
    |
    v
Obsidian
```

## Security rule

GLPI Admin permission does not mean Hermes should receive GLPI Admin capability.

The connector must expose only an allowlist of GET operations.

## Data flow

```text
Ticket list
   ↓
Select relevant IDs
   ↓
Get ticket details
   ↓
Get timeline/followups/solution as needed
   ↓
Hermes analysis
   ↓
Human review
```

## Data minimization

Do not retrieve every sub-resource for every ticket by default.

Start with ticket list and ticket detail. Retrieve timeline/followups/solution only when needed.

## Future write phase

Write operations require a separate approval design, audit trail and rollback strategy.
