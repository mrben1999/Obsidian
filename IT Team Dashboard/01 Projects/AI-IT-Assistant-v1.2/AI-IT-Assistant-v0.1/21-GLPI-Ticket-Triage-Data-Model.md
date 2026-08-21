# 21 — GLPI Ticket Triage Data Model

## Status

**Design complete for the Ticket collection/detail layer.**

## Source

Based on the supplied OAS 3.0 definitions for:

- `GET /Assistance/Ticket`
- `GET /Assistance/Ticket/{id}`

## Normalized AI view

Hermes should not need to reason directly over every raw GLPI field. The connector should normalize the response into a compact analysis object.

Suggested logical structure:

```text
Ticket
├── identity
│   ├── id
│   ├── name
│   └── external_id
│
├── content
│   └── content
│
├── classification
│   ├── type
│   ├── category
│   ├── request_type
│   ├── urgency
│   ├── impact
│   └── priority
│
├── status
│   ├── status
│   ├── is_deleted
│   └── global_validation
│
├── people
│   ├── user_recipient
│   ├── user_editor
│   └── team
│
├── location
│   └── location
│
├── dates
│   ├── date_creation
│   ├── date_mod
│   ├── date
│   ├── date_solve
│   ├── date_close
│   ├── resolution_date
│   └── ...
│
├── service_levels
│   ├── sla_ttr
│   ├── sla_tto
│   ├── ola_ttr
│   ├── ola_tto
│   └── ...
│
└── metrics
    ├── actiontime
    ├── waiting_duration
    ├── resolution_duration
    └── close_duration
```

## Triage logic

The AI can use the available fields as evidence, but **must not pretend that priority alone is the business priority rule**.

Initial reasoning should consider:

- urgency;
- impact;
- priority;
- status;
- age;
- SLA/OLA information;
- ticket content;
- whether the ticket is deleted;
- available team/requester context.

The actual team's prioritization policy should be documented later and should override generic assumptions.

## Data retrieval strategy

### Pass 1 — Collection

Use:

```text
GET /Assistance/Ticket
```

with:

- `filter`
- `start`
- `limit`
- `sort`

### Pass 2 — Detail

Use:

```text
GET /Assistance/Ticket/{id}
```

only for tickets selected for deeper analysis.

### Pass 3 — Timeline

Only after the above is working, retrieve:

- followups;
- solution;
- tasks;
- validation;
- documents.

## Safety

The normalized model is analysis-only.

No field in this model grants Hermes permission to write back to GLPI.
