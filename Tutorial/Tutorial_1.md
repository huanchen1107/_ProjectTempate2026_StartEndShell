# 🎓 Tutorial 1: Master the StartEndShell Framework

Welcome! This tutorial guides you through the concepts, workflows, and elite best practices for using the **2026 StartEndShell Framework** (`v2.1 Consolidated`). 

By mastering this workflow, you will ensure a completely clean codebase, secure credentials, and absolute development traceability when pair-programming with advanced AI agents like **Claude Code**.

---

## 🧭 The Core Workflow Philosophy

Modern development with AI agents can become messy if changes are not structured. This framework introduces a **Session-based Lifecycle** that wraps around your coding sessions:

```mermaid
graph LR
    A[1. startup.sh] --> B[2. Develop Session]
    B --> C[3. ending.sh]
    style A fill:#4CAF50,stroke:#388E3C,color:#fff
    style B fill:#2196F3,stroke:#1976D2,color:#fff
    style C fill:#F44336,stroke:#D32F2F,color:#fff
```

1. **`startup.sh` (The Opener)**: Opens your development session. It syncs the latest remote code, displays your current tasks, and boots up your AI coding assistant.
2. **Interactive Coding (The Work)**: You pair-program with the AI agent. You build features surgically, test them incrementally, and document your actions in `log.md`.
3. **`ending.sh` (The Closer)**: Closes your session. It automatically compiles conversation records, sanitizes/redacts credentials, and backs up everything securely to GitHub.

---

## 🛠️ Step 1: Initialize Your New Project

When using this template for a brand new project, the initialization is completely hands-off:

1. **Configure Environment**:
   - Copy `.env.bak` to `.env`:
     ```bash
     cp .env.bak .env
     ```
   - Input your `ANTHROPIC_API_KEY` in `.env`.
   - *(Optional)* Set `REPO_NAME="your-new-repo-name"` in `.env` to pre-assign the repository name.

2. **Trigger the Bootstrap Autopilot**:
   - Run the startup script:
     ```bash
     ./startup.sh
     ```
   - Because it is the first run, the script will:
     - Disconnect the template's Git history (`rm -rf .git && git init`).
     - Run an **internal workspace cleanup** that deletes redundant bootstrap scripts (`cleanAll.sh` and `initial.sh`) to keep your root directory pristine.
     - Automatically create or connect a new GitHub repository under your account.
     - Commit all files as a clean "Initial commit" and push to GitHub.
     - Generate a lockfile (`.project_setup`) so this setup never runs again.

---

## 💻 Step 2: The Daily Development Session

Once initialized, your daily routine becomes highly automated and robust:

### 🌅 Starting a Session
1. In your terminal, run:
   ```bash
   ./startup.sh
   ```
2. The script will pull recent changes (`git pull`), display your current accomplishments and tasks from `log.md`, and open the official **Claude Code CLI**.

### 🛠️ Working with AI Agents (Karpathy Guardrails)
While coding in the session, keep these core behaviors in mind (configured in `CLAUDE.md`):
* **State Assumptions First**: Before having an agent write code, state what you are trying to achieve clearly.
* **Surgical Edits**: Do not let agents refactor or modify adjacent files unless explicitly requested. Touch only what you must.
* **Continuous Logging**: Document accomplishments under `log.md` under the daily date header.

### 🌌 Ending a Session
1. When you are done coding, exit Claude Code (`/exit`) and run:
   ```bash
   ./ending.sh
   ```
2. The script will:
   - Verify that your `log.md` and `README.md` are up to date.
   - Run `utils/reconstruct_dialog.py` to compile a beautiful dialogue history of your session in `user/dialog.md`.
   - **Automatically Redact Credentials**: Checks your logs and redacts any exposed keys (OpenRouter, OpenAI, Gemini, Anthropic) before committing!
   - Commit all files with a timestamped message and push to GitHub.

---

## 🔒 Security & Key Redaction

Your workspace has a built-in safety net in `utils/reconstruct_dialog.py` that processes files before they reach GitHub. It matches and filters out patterns:
* OpenRouter Keys: `sk-or-v1-...`
* OpenAI Keys: `sk-proj-...`
* Gemini Keys: `AIzaSy...`
* Anthropic Keys: `sk-ant-api...`

This ensures that even if you accidentally type or expose a key during an agent chat session, it will be **automatically redacted** to `[REDACTED_*_KEY]` before `ending.sh` pushes the dialogue history to your public repository!

---

## 🎓 Next Steps
Now that you understand the framework, you are ready to build! Go ahead and run `./startup.sh` to trigger your first-run bootstrap and start coding your next masterpiece!
