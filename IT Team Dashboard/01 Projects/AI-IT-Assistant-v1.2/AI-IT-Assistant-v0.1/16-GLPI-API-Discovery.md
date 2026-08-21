# 16 — GLPI API Discovery

**Date:** 2026-08-19  
**GLPI:** 11.0.8  
**High-Level REST API:** 2.3.0  
**Specification:** OAS 3.0

## Source supplied by project owner

The GLPI High-Level REST API documentation exposes the `Assistance` group.

## Relevant Ticket resources discovered

- `GET /Assistance/Ticket`
- `GET /Assistance/Ticket/{id}`
- `GET /Assistance/Ticket/{id}/KBArticle`
- `GET /Assistance/Ticket/{id}/Cost`
- `GET /Assistance/Ticket/{id}/PendingReason`
- `GET /Assistance/Ticket/{id}/TeamMember`
- `GET /Assistance/Ticket/{id}/Timeline`

Timeline sub-resources:

- Document
- Followup
- Solution
- Task
- Validation

## Read-only MVP surface

Initial connector: GET only.

```text
GET /Assistance/Ticket
GET /Assistance/Ticket/{id}
GET /Assistance/Ticket/{id}/Timeline
GET /Assistance/Ticket/{id}/Timeline/Followup
GET /Assistance/Ticket/{id}/Timeline/Solution
GET /Assistance/Ticket/{id}/Timeline/Task
GET /Assistance/Ticket/{id}/Timeline/Validation
GET /Assistance/Ticket/{id}/Timeline/Document
GET /Assistance/Ticket/{id}/TeamMember
GET /Assistance/Ticket/{id}/PendingReason
GET /Assistance/Ticket/{id}/KBArticle
```

## Explicitly excluded

All POST, PATCH and DELETE operations.

## Still to discover

The endpoint list alone does not establish exact:

- query parameters;
- pagination;
- filters;
- response fields;
- authentication flow;
- scopes/permissions;
- rate limits;
- error responses.

These must be taken from the OAS operation/schema before implementation.

## Next target

Get the OAS details for:

1. `GET /Assistance/Ticket`
2. `GET /Assistance/Ticket/{id}`
3. `GET /Assistance/Ticket/{id}/Timeline`
4. `GET /Assistance/Ticket/{id}/Timeline/Followup`
5. `GET /Assistance/Ticket/{id}/Timeline/Solution`
