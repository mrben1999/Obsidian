# 13 — Environment Snapshot

**Date:** 2026-08-19

## Hermes

- **Version:** Hermes Agent v0.19.0 (2026.7.20)
- **Upstream:** `74f99af4`
- **Platform:** Windows 10
- **Runtime:** Git Bash / MSYS
- **Provider:** `nous`
- **Model:** `upstage/solar-pro4:free`
- **Python:** 3.11.15
- **Install method:** git
- **OpenAI SDK:** 2.24.0
- **Profile:** `default`
- **Working directory:** `D:\HaiDang_Hermes`
- **Config:** `C:\Users\DangTo\AppData\Local\hermes\config.yaml`
- **API keys:** OpenRouter key configured (secret value is intentionally not documented)

## Installed capabilities

Default toolset is installed, including:

- web
- terminal
- file
- code_execution
- vision
- tts
- skills
- memory
- session_search
- delegation
- cronjob
- clarify
- messaging
- todo
- kanban
- and other default capabilities

## Other confirmed tools

- Obsidian
- GLPI
- VS Code
- Visual Studio / C# / .NET

## Security note

Do not copy the OpenRouter API key or any other secret into Markdown, Obsidian, Git, screenshots, prompts, or logs.

## Next verification

Before connecting GLPI or enabling automation, verify:

- Hermes config relevant to tool permissions;
- model behavior and limits of the current free provider/model;
- GLPI version and deployment;
- GLPI API availability;
- Obsidian vault path;
- Git/.NET environment;
- Windows permissions and shell behavior under Git Bash/MSYS.
