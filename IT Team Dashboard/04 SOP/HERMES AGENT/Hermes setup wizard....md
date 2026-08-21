---
type: sop
area:
owner:
version: 1
last_reviewed: 2026-07-16
tags:
  - sop
---

# 📋 SOP — Hermes setup wizard...

|           ⚕ Hermes Agent Setup Wizard           |
| :---------------------------------------------: |
| Let's configure your Hermes Agent installation. |
|        Press Ctrl+C at any time to exit.        |

◆ Reconfigure
✓ You already have Hermes configured.
  Running the full wizard — each prompt shows your current value.
  Press Enter to keep it, or type a new value to change it.

  Tip: jump straight to a section with 'hermes setup model|terminal|
       gateway|tools|agent', or fill only missing items with --quick.

◆ Configuration Location
  Config file:  C:\Users\DangTo\AppData\Local\hermes\config.yaml
  Secrets file: C:\Users\DangTo\AppData\Local\hermes\.env
  Data folder:  C:\Users\DangTo\AppData\Local\hermes
  Install dir:  C:\Users\DangTo\AppData\Local\hermes\hermes-agent

  You can edit these files directly or use 'hermes config edit'

◆ Inference Provider
  Choose how to connect to your main chat model.
     Guide: https://hermes-agent.nousresearch.com/docs/integrations/providers


  Current model:    gemini-3.1-flash-lite
  Active provider:  Google AI Studio


  Select provider:
  Select by number, Enter to confirm.

  (○)  1. Nous Portal (Everything your agent needs, 300+ models with bundled tool use)
  (○)  2. OpenRouter (Pay-per-use API aggregator)
  (○)  3. Mixture of Agents (named presets; aggregator acts after reference models)
  (○)  4. NovitaAI (Cloud: Model API, Agent Sandbox, GPU Cloud)
  (○)  5. LM Studio (Local desktop app with built-in model server)
  (○)  6. Anthropic (Claude models via API key or Claude Code)
  (○)  7. OpenAI ▸ (Codex CLI or direct OpenAI API)
  (○)  8. Qwen Cloud / DashScope (Qwen + multi-provider)
  (○)  9. xAI Grok ▸ (Direct API or SuperGrok / Premium+ OAuth)
  (○) 10. Xiaomi MiMo (MiMo-V2.5 and V2 models: pro, omni, flash)
  (○) 11. Tencent TokenHub (Hy3 Preview via tokenhub.tencentmaas.com)
  (○) 12. NVIDIA NIM (Nemotron models via build.nvidia.com or local NIM)
  (○) 13. GitHub Copilot ▸ (GitHub token API or copilot --acp process)
  (○) 14. Hugging Face Inference Providers
  (●) 15. Google AI Studio (Native Gemini API)  ← currently active
  (○) 16. Google Vertex AI (Gemini via GCP; OAuth2 service account or ADC, GCP billing/quotas)
  (○) 17. DeepSeek (V3, R1, coder, direct API)
  (○) 18. Z.AI / GLM (Zhipu direct API)
  (○) 19. Kimi / Moonshot ▸ (Coding Plan, Moonshot global & China endpoints)
  (○) 20. StepFun Step Plan (Agent / coding models via Step Plan API)
  (○) 21. MiniMax ▸ (Global, OAuth Coding Plan & China endpoints)
  (○) 22. Ollama Cloud (Cloud-hosted open models, ollama.com)
  (○) 23. Arcee AI (Trinity models, direct API)
  (○) 24. GMI Cloud (Multi-model direct API)
  (○) 25. Fireworks AI (OpenAI-compatible direct model API)
  (○) 26. Kilo Code (Kilo Gateway API)
  (○) 27. OpenCode ▸ (Zen pay-as-you-go or Go subscription)
  (○) 28. AWS Bedrock (Claude, Nova, Llama, DeepSeek; IAM or API key)
  (○) 29. Azure Foundry (OpenAI-style or Anthropic-style endpoint, your Azure AI deployment)
  (○) 30. Qwen OAuth (Reuses local Qwen CLI login)
  (○) 31. Alibaba Cloud Coding Plan (Dedicated coding tier)
  (○) 32. custom (direct API)
  (○) 33. DeepInfra — 100+ open models, pay-per-use
  (○) 34. Upstage (Solar API)
  (○) 35. Custom endpoint (enter URL manually)
  (○) 36. Configure auxiliary models...
  (○) 37. Leave unchanged

  Choice [default 15]:

  Google AI Studio API key: AQ.Ab8RN... ✓
  [K]eep / [R]eplace / [C]lear (default K): R
GOOGLE_API_KEY (or Enter to cancel): *****************************************************
  API key updated.

  Checking Gemini API tier...
  Tier check: could not verify (proceeding anyway).

Base URL [https://generativelanguage.googleapis.com/v1beta]:
  Found 11 model(s) from models.dev registry

  Select default model:
  Select by number, Enter to confirm.

  (●)  1. gemini-3.1-flash-lite  ← currently in use
  (○)  2. gemini-3.5-flash
  (○)  3. gemini-3-pro-preview
  (○)  4. gemini-3.1-flash-lite-preview
  (○)  5. gemini-2.5-flash-lite
  (○)  6. gemini-2.5-pro
  (○)  7. gemini-3-flash-preview
  (○)  8. gemini-flash-latest
  (○)  9. gemini-2.5-flash
  (○) 10. gemini-flash-lite-latest
  (○) 11. gemini-3.1-pro-preview
  (○) 12. Enter custom model name
  (○) 13. Skip (keep current)

  Choice [default 1]: 1

Default model set to: gemini-3.1-flash-lite (via Google AI Studio)

◆ Terminal Backend
  Choose where Hermes runs shell commands and code.
  This affects tool execution, file access, and isolation.
     Guide: https://hermes-agent.nousresearch.com/docs/user-guide/configuration#terminal-backend-configuration


  Select terminal backend:
  Select by number, Enter to confirm.

  (○)  1. Local - run directly on this machine (default)
  (○)  2. Docker - isolated container with configurable resources
  (○)  3. Modal - serverless cloud sandbox
  (○)  4. SSH - run on a remote machine
  (○)  5. Daytona - persistent cloud development environment
  (●)  6. Keep current (local)

  Choice [default 6]:
      Skipped (keeping current)

  Keeping current backend: local

◆ Messaging Platforms
  Connect to messaging platforms to chat with Hermes from anywhere.
  Toggle with Space, confirm with Enter.


  Select platforms to configure:
  Toggle by number, Enter to confirm.

  [ ]  1. 💬 Mattermost  (not configured)
  [ ]  2. 📡 Signal  (not configured)
  [ ]  3. 💬 Weixin / WeChat  (not configured)
  [ ]  4. 💬 BlueBubbles (iMessage)  (not configured)
  [ ]  5. 🐧 QQ Bot  (not configured)
  [ ]  6. 💎 Yuanbao  (not configured)
  [ ]  7. 🐳 DingTalk  (not configured)
  [ ]  8. 🎮 Discord  (not configured)
  [ ]  9. 📧 Email  (not configured)
  [ ] 10. 🪽 Feishu / Lark  (not configured)
  [ ] 11. 💬 Google Chat  (not configured)
  [ ] 12. 🏠 Home Assistant  (not configured)
  [ ] 13. 💬 IRC  (not configured)
  [ ] 14. 💚 LINE  (not configured)
  [ ] 15. 🔔 ntfy  (not configured)
  [ ] 16. 📱 iMessage via Photon  (not configured)
  [ ] 17. 🔔 Raft  (not configured)
  [ ] 18. 🔒 SimpleX Chat  (not configured)
  [ ] 19. 💼 Slack  (not configured)
  [ ] 20. 📱 SMS (Twilio)  (not configured)
  [ ] 21. 💼 Microsoft Teams  (not configured)
  [✓] 22. ✈️ Telegram  (configured)
  [ ] 23. 💼 WeCom (Enterprise WeChat)  (not configured)
  [ ] 24. 💼 WeCom Callback (self-built apps)  (not configured)
  [ ] 25. 💬 WhatsApp  (not configured)

  Toggle # (or Enter to confirm):

◆ Telegram
  Telegram: already configured
Reconfigure Telegram? [y/N]: y
  How would you like to create your Telegram bot?

    [1] Automatic (recommended)
        Scan a QR code → confirm in Telegram → done.
        No token copy-paste needed.

    [2] Manual
        Create a bot via @BotFather yourself and paste the token.

Choice [1/2] [1]: 2
  Create a bot via @BotFather on Telegram
Telegram bot token: **********************************************
✓ Telegram token saved

  🔒 Security: Restrict who can use your bot
     To find your Telegram user ID:
     1. Message @userinfobot on Telegram
     2. It will reply with your numeric ID (e.g., 123456789)

Allowed user IDs (comma-separated, leave empty for open access): 8991428919
✓ Telegram allowlist configured - only listed users can use the bot

  📬 Home Channel: where Hermes delivers cron job results,
     cross-platform messages, and notifications.
     For Telegram DMs, this is your user ID (same as above).
Use your user ID (8991428919) as the home channel? [Y/n]: Y
✓ Telegram home channel set to 8991428919

  ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
✓ Messaging platforms configured!

  Restart the gateway to pick up changes? [Y/n]: Y
✓ Gateway stopped (drained cleanly)
✓ Gateway started via direct spawn (PID 25632) (PID: 25632)
  ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

⚕ Hermes Tool Configuration
  Enable or disable tools per platform.
  Tools that need API keys will be configured when enabled.
  Guide: https://hermes-agent.nousresearch.com/docs/user-guide/features/tools


  Select an option:
  Select by number, Enter to confirm.

  (●)  1. Configure 🖥️  CLI  (14/25 enabled)
  (○)  2. Configure 📱 Telegram  (17/25 enabled)
  (○)  3. Configure all platforms (global)
  (○)  4. Reconfigure an existing tool's provider or API key
  (○)  5. Done

  Choice [default 1]:

  Tools for 🖥️  CLI
  Toggle by number, Enter to confirm.

  [✓]  1. 🔍 Web Search & Scraping  (web_search, web_extract)
  [✓]  2. 🌐 Browser Automation  (navigate, click, type, scroll)
  [✓]  3. 💻 Terminal & Processes  (terminal, process)
  [✓]  4. 📁 File Operations  (read, write, patch, search)
  [✓]  5. ⚡ Code Execution  (execute_code)
  [✓]  6. 👁️  Vision / Image Analysis  (vision_analyze)
  [ ]  7. 🎬 Video Analysis  (video_analyze (requires video-capable model))
  [ ]  8. 🎨 Image Generation  (image_generate)
  [ ]  9. 🎬 Video Generation  (video_generate (text/image/reference))
  [ ] 10. 🐦 X (Twitter) Search  (x_search (requires xAI OAuth or XAI_API_KEY))
  [ ] 11. 🔊 Text-to-Speech  (text_to_speech)
  [✓] 12. 📚 Skills  (list, view, manage)
  [✓] 13. 📋 Task Planning  (todo)
  [✓] 14. 💾 Memory  (persistent memory across sessions)
  [✓] 15. 🧩 Context Engine  (runtime tools from the active context engine)
  [✓] 16. 🔎 Session Search  (search past conversations)
  [✓] 17. ❓ Clarifying Questions  (clarify)
  [ ] 18. 👥 Task Delegation  (delegate_task)
  [✓] 19. ⏰ Cron Jobs  (create/list/update/pause/resume/run, with optional attached skills)
  [ ] 20. 🏠 Home Assistant  (smart home device control)  [no API key]
  [ ] 21. 🎵 Spotify  (playback, search, playlists, library)
  [ ] 22. 🤖 Yuanbao  (group info, member queries, DM)
  [ ] 23. 🖱️  Computer Use (macOS/Windows/Linux)  (background desktop control via cua-driver)

  Toggle # (or Enter to confirm):
  ✓ Saved 🖥️  CLI configuration


  Select an option:
  Select by number, Enter to confirm.

  (●)  1. Configure 🖥️  CLI  (14/25 enabled)
  (○)  2. Configure 📱 Telegram  (17/25 enabled)
  (○)  3. Configure all platforms (global)
  (○)  4. Reconfigure an existing tool's provider or API key
  (○)  5. Done

  Choice [default 1]:
    Select an option:
  Select by number, Enter to confirm.

  (●)  1. Configure 🖥️  CLI  (14/25 enabled)
  (○)  2. Configure 📱 Telegram  (17/25 enabled)
  (○)  3. Configure all platforms (global)
  (○)  4. Reconfigure an existing tool's provider or API key
  (○)  5. Done

  Choice [default 1]: 5

  Tool configuration saved to ~/AppData\Local\hermes/config.yaml
  Changes take effect on next 'hermes' or gateway restart.

  Previous config backed up to: C:\Users\DangTo\AppData\Local\hermes\config.yaml.bak.20260716_081005
  If setup changed a value you customized, restore it with:
    cp C:\Users\DangTo\AppData\Local\hermes\config.yaml.bak.20260716_081005 C:\Users\DangTo\AppData\Local\hermes\config.yaml


◆ Tool Availability Summary
  6/9 tool categories available:

   ✓ Vision (image analysis)
   ✗ Web Search & Extract (missing EXA_API_KEY, PARALLEL_API_KEY, FIRECRAWL_API_KEY/FIRECRAWL_API_URL, TAVILY_API_KEY, or SEARXNG_URL)
   ✗ Browser Automation (missing npm install -g agent-browser && agent-browser install --with-deps)
   ✓ Image Generation (Nous Portal)
   ✓ Text-to-Speech (Edge TTS)
   ✗ Skills Hub (GitHub) (missing GITHUB_TOKEN)
   ✓ Terminal/Commands
   ✓ Task Planning (todo)
   ✓ Skills (view, create, edit)

⚠ Some tools are disabled. Run 'hermes setup tools' to configure them,
⚠ or edit ~/AppData\Local\hermes/.env directly to add the missing API keys.


┌─────────────────────────────────────────────────────────┐
│              ✓ Setup Complete!                          │
└─────────────────────────────────────────────────────────┘

📁 All your files are in ~/AppData\Local\hermes/:

   Settings:  C:\Users\DangTo\AppData\Local\hermes\config.yaml
   API Keys:  C:\Users\DangTo\AppData\Local\hermes\.env
   Data:      C:\Users\DangTo\AppData\Local\hermes/cron/, sessions/, logs/

────────────────────────────────────────────────────────────

📝 To edit your configuration:

   hermes setup          Re-run the full wizard
   hermes setup model    Change model/provider
   hermes setup terminal Change terminal backend
   hermes setup gateway  Configure messaging
   hermes setup tools    Configure tool providers

   hermes config         View current settings
   hermes config edit    Open config in your editor
   hermes config set <key> <value>
                          Set a specific value

   Or edit the files directly:
   nano C:\Users\DangTo\AppData\Local\hermes\config.yaml
   nano C:\Users\DangTo\AppData\Local\hermes\.env

────────────────────────────────────────────────────────────

🚀 Ready to go!

   hermes              Start chatting
   hermes gateway      Start messaging gateway
   hermes doctor       Check for issues


-> Messaging platform token detected!
-> The gateway handles messaging platforms and cron job execution.
-> Starting gateway in background...
[OK] Gateway started! Your bot is now online.
-> Logs: C:\Users\DangTo\AppData\Local\hermes\logs\gateway.log
-> To stop: close the gateway process from Task Manager

+---------------------------------------------------------+
|              [OK] Installation Complete!                |
+---------------------------------------------------------+

* Your files:

   Config:    C:\Users\DangTo\AppData\Local\hermes\config.yaml
   API Keys:  C:\Users\DangTo\AppData\Local\hermes\.env
   Data:      C:\Users\DangTo\AppData\Local\hermes\cron\, sessions\, logs\
   Code:      C:\Users\DangTo\AppData\Local\hermes\hermes-agent\

---------------------------------------------------------

* Commands:

   hermes              Start chatting
   hermes setup        Configure API keys & settings
   hermes config       View/edit configuration
   hermes config edit  Open config in editor
   hermes gateway      Start messaging gateway (Telegram, Discord, etc.)
   hermes update       Update to latest version

---------------------------------------------------------

[*] Restart your terminal for PATH changes to take effect
