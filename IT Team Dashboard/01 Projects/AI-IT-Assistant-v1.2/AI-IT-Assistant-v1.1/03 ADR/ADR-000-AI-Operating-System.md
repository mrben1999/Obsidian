# ADR-000 AI Operating System

## Context

Dự án dùng Hermes, GLPI và Obsidian, không dùng VPS.

## Decision

Chia Prompt thành 3 lớp:

-   Core System Prompt
-   Project Context
-   Task Prompt

## Consequences

-   Dễ mở rộng.
-   Không phải sửa toàn bộ Prompt khi thêm Zabbix, AD hoặc M365.
