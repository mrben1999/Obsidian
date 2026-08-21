# 22 — Phase 1 GLPI Checkpoint

**Date:** 2026-08-19

## Completed

- [x] GLPI version identified: 11.0.8
- [x] High-Level REST API identified: 2.3.0
- [x] OAS 3.0 confirmed
- [x] Assistance group inspected
- [x] Ticket collection endpoint identified
- [x] Ticket detail endpoint identified
- [x] Collection parameters identified
- [x] Pagination parameters identified
- [x] RSQL filter parameter identified
- [x] Sort parameter identified
- [x] Entity/profile headers identified
- [x] Ticket response fields identified
- [x] Error responses identified
- [x] Read-only boundary maintained

## Not yet implemented

- [ ] Authentication configuration
- [ ] Read-only connector
- [ ] Hermes GLPI skill
- [ ] RSQL status filter
- [ ] Ticket triage prompt
- [ ] Obsidian output workflow
- [ ] Live test against GLPI

## Current architecture decision

```text
GLPI
 ↓
GET /Assistance/Ticket
 ↓
pagination/filter/sort
 ↓
normalized ticket data
 ↓
Hermes
 ↓
human review
 ↓
Obsidian
```

## Next technical step

Before coding the connector, identify the **authentication mechanism** used by this GLPI installation/API.

Do not put credentials in the project Markdown.

After authentication is known, build the smallest possible read-only test:

```text
GET /Assistance/Ticket?start=0&limit=5
```

No write request should be sent.

## Acceptance test

A successful first test should prove:

1. Hermes/tool can authenticate.
2. GLPI returns HTTP 200.
3. A small page of tickets can be read.
4. The response can be parsed.
5. No GLPI data is modified.
6. Credentials are not logged or stored in Obsidian.
