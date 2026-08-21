# 20 — GLPI Ticket Schema

**Date:** 2026-08-19  
**GLPI:** 11.0.8  
**API:** High-Level REST API 2.3.0 / OAS 3.0

## Source

This document is based on the `GET /Assistance/Ticket` and `GET /Assistance/Ticket/{id}` definitions supplied from the GLPI API documentation.

## GET /Assistance/Ticket

Purpose:

> List or search Tickets, Changes or Problems

### Query parameters

| Parameter | Type | Default | Purpose |
|---|---|---:|---|
| `filter` | string | — | RSQL query string |
| `start` | int64 | `0` | First item to return |
| `limit` | int64 | `100` | Maximum number of items |
| `sort` | string | — | One or more properties with direction `asc`/`desc` |

### Headers

| Header | Type | Purpose |
|---|---|---|
| `GLPI-Entity` | integer | Entity ID |
| `GLPI-Profile` | integer | Profile ID |
| `GLPI-Entity-Recursive` | string | `true`/`false`; include child entities |
| `Accept-Language` | string | Response language |

### Response

HTTP `200` returns an array of ticket-like objects.

Important fields exposed by the supplied schema:

- `id`
- `name`
- `content`
- `user_recipient`
- `user_editor`
- `is_deleted`
- `category`
- `location`
- `urgency`
- `impact`
- `priority`
- `actiontime`
- `begin_waiting_date`
- `waiting_duration`
- `resolution_duration`
- `close_duration`
- `resolution_date`
- `date_creation`
- `date_mod`
- `date`
- `date_solve`
- `date_close`
- `type`
- `external_id`
- `request_type`
- `take_into_account_date`
- `take_into_account_duration`
- `sla_ttr`
- `sla_tto`
- `ola_ttr`
- `ola_tto`
- `sla_level_ttr`
- `ola_level_ttr`
- `sla_waiting_duration`
- `ola_waiting_duration`
- `ola_ttr_begin_date`
- `ola_tto_begin_date`
- `internal_resolution_date`
- `internal_take_into_account_date`
- `global_validation`
- `status`
- `entity`
- `team`
- `costs`

Nested objects supplied by the schema include IDs and names for:

- `user_recipient`
- `user_editor`
- `category`
- `location`
- `request_type`
- SLA/OLA fields
- `status`
- `entity`
- `team`
- `costs`

## GET /Assistance/Ticket/{id}

Purpose:

> Get an existing Ticket, Change or Problem

### Path

- `id` — required integer int32

### Headers

Same entity/profile/language controls as the collection endpoint:

- `GLPI-Entity`
- `GLPI-Profile`
- `GLPI-Entity-Recursive`
- `Accept-Language`

### Response

HTTP `200` returns a single object with the same field structure as the collection response.

## Error responses documented

- `400` — Bad request
- `401` — Unauthorized
- `403` — Forbidden
- `404` — Not found
- `500` — Internal server error

## Important design observation

The collection endpoint already exposes enough information to build an initial triage dataset without immediately requesting timeline data.

For v0.1, the first pass can therefore be:

```text
GET /Assistance/Ticket
    ↓
filter + pagination + sorting
    ↓
candidate tickets
    ↓
Hermes triage
```

Then use:

```text
GET /Assistance/Ticket/{id}
```

for a selected ticket when a detailed object is required.

## Pagination

The schema explicitly provides:

- `start`, default `0`
- `limit`, default `100`

Therefore the connector must support pagination rather than assuming the complete ticket population fits in one response.

## Filtering

The schema explicitly states that `filter` accepts an **RSQL query string**.

The exact RSQL expressions to use for GLPI status/priority filtering have not been supplied yet, so the implementation should not invent them.

## Security

The endpoint list and schema confirm the existence of headers for entity/profile context, but do not by themselves establish the authentication mechanism or credentials.

Credentials must remain outside the Markdown knowledge base and outside source code.
