# 15 — Phase 1 Checklist — Environment Baseline

## Completed

- [x] Hermes installed
- [x] Hermes version identified
- [x] Windows 10 identified
- [x] Git Bash/MSYS identified
- [x] Model/provider identified
- [x] Hermes working directory identified
- [x] Hermes config location identified
- [x] Python version identified
- [x] Installed toolset identified
- [x] Obsidian identified
- [x] GLPI identified
- [x] VS Code identified
- [x] Visual Studio/C#/.NET identified

## Next

### GLPI
- [ ] GLPI version
- [ ] Deployment type/location
- [ ] API enabled/available
- [ ] Authentication method
- [ ] Ticket fields/workflow
- [ ] Read-only test account/API access

### Obsidian
- [ ] Vault path
- [ ] Backup/sync method
- [ ] AI-IT-Assistant folder created

### Hermes
- [ ] Confirm current config relevant to tools
- [ ] Confirm model responds reliably
- [ ] Test file read in `D:\HaiDang_Hermes`
- [ ] Test safe terminal command
- [ ] Test Markdown generation
- [ ] Test memory

### Development
- [ ] Git version
- [ ] .NET SDK versions
- [ ] Test repository

## Gate to next phase

Do not connect GLPI write actions until the following are true:

- Hermes basic tests pass;
- GLPI API/read-only access is understood;
- secrets are stored outside project Markdown;
- first workflow has a human approval step.
