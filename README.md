# ProjectTemplate2026-v2

> This project runs via the official **Claude Code** client with API keys configured in `.env`.
> Simply run `./cc.sh` to start.

## 🚀 Quick Start

```bash
./initial.sh   # Bootstrap a new project (disconnect from template)
./startup.sh   # Initialize session + launch Claude Code
./ending.sh    # Commit, push, and finalize session
```

## 🤖 How it Works

`startup.sh` → reads `project_initial.md` → launches `cc.sh` (direct launcher).

## 🧭 AI Agent Rules

This template now includes the Karpathy-inspired agent rules used by the other
project:

```text
CLAUDE.md
.cursor/rules/karpathy-guidelines.mdc
.agents/skills/karpathy-guidelines/SKILL.md
```

They keep AI coding agents focused on clear assumptions, simple changes,
surgical diffs, and explicit verification. When creating a new project from
this template, keep those files in the new repository root and restart Codex,
Claude Code, or Cursor so the rules load.

## 📜 Shell Scripts Reference

| Script | Purpose |
| :--- | :--- |
| `cc.sh` | **Unified Launcher**: Launches the official Claude Code CLI. |
| `startup.sh` | **Session Start**: Prepares the environment and launches `cc.sh`. |
| `ending.sh` | **Session End**: Updates development logs, commits changes, and pushes to remote. |
| `initial.sh` | **Project Bootstrap**: Resets Git, runs cleanup, and creates a new GitHub repository. |
| `cleanAll.sh` | **Hard Reset**: Wipes logs/history and re-initializes core files for a fresh start. |

## 📁 Project Structure

```
.
├── cc.sh              # Unified launcher (direct official API)
├── startup.sh         # Session start: reads project goals + launches cc.sh
├── ending.sh          # Session end: update logs + commit + push
├── initial.sh         # New project bootstrap script
├── cleanAll.sh        # Project reset & cleanup utility
├── .env               # API keys (GIT IGNORED)
├── .env.bak           # Template for .env (no keys)
├── 2026.05.15開發日誌.md  # Daily dev log
└── user/dialog.md     # Auto-reconstructed conversation history
```

## 🛠 Setup

1. **API Keys**: Copy `.env.bak` to `.env` and fill in your keys.
   ```bash
   cp .env.bak .env
   ```
2. **Prerequisites**:
   - `npx` / Node.js — for Claude Code CLI
   - Official `ANTHROPIC_API_KEY` in `.env`
