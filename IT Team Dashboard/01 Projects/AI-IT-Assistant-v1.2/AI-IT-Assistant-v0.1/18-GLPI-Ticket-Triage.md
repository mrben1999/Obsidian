# 18 — GLPI Ticket Triage

## MVP workflow

```text
GLPI
  ↓
GET /Assistance/Ticket
  ↓
Identify relevant/open tickets
  ↓
GET /Assistance/Ticket/{id}
  ↓
Hermes analyzes
  ↓
GET timeline/followup/solution only if needed
  ↓
Triage result
  ↓
Human review
```

## Intended analysis

For each ticket, Hermes should attempt to produce:

- Ticket ID
- Title/summary
- Status
- Priority/urgency if available
- Category if available
- Requester/technician if available
- Created/updated timestamps if available
- Problem statement
- Relevant timeline evidence
- Missing information
- Likely cause
- Suggested troubleshooting
- Suggested next action
- Risk/impact assessment

**Note:** exact field names are not yet confirmed from the endpoint list. They must come from the OAS schemas.

## Safety

No ticket mutation.

## Example request

> Phân tích các ticket đang mở và cho anh biết ticket nào nên ưu tiên xử lý, vì sao và cần kiểm tra gì tiếp theo.

## Output

```markdown
# GLPI Ticket Triage

## High priority

### Ticket #<id>
**Summary:** ...
**Why it matters:** ...
**Evidence:** ...
**Missing information:** ...
**Recommended checks:**
1. ...
2. ...
**Risk:** ...

## Need more information
...

## Low priority / informational
...
```
