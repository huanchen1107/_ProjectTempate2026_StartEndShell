#!/bin/bash

# =================================================================
# cleanAll.sh - Project Initialization & Cleanup Script
# =================================================================

PROJECT_NAME=${1:-$(basename "$PWD")}
TODAY=$(date +"%Y.%m.%d")
DEV_LOG="log.md"

echo "🧹 Starting project cleanup for: $PROJECT_NAME"

# 1. Handle Development Logs
echo "📝 Initializing development log: $DEV_LOG"
# Remove legacy daily logs to avoid clutter
find . -maxdepth 1 -name "*開發日誌.md" -delete

cat <<EOF > "$DEV_LOG"
# Development Log

## $TODAY
> **備忘錄**
> 本專案使用官方 **Claude Code** 搭配 \`.env\` 中設定的 \`ANTHROPIC_API_KEY\` 運作。
> 直接執行 \`./cc.sh\` 或 \`./startup.sh\` 即可。

### 今日重點紀錄
1. **專案初始化**：執行 cleanAll.sh 完成環境重置。
2. **新專案啟動**：準備開始 $PROJECT_NAME 的開發工作。

### 技術結論
- (待填寫)
EOF

# 2. Reset Core Markdown Files
echo "📄 Resetting core markdown files..."

cat <<EOF > README.md
# $PROJECT_NAME

> **MEMO ($TODAY)**: This project runs via the official **Claude Code** client with API keys configured in \`.env\`.
> Simply run \`./cc.sh\` to start.

## 🚀 Quick Start

\`\`\`bash
./startup.sh   # Initialize project + launch Claude Code
./ending.sh    # Commit, push, and finalize session
\`\`\`

## 🤖 How it Works

\`startup.sh\` → reads \`project_initial.md\` → launches \`cc.sh\` (direct launcher).

## 📁 Project Structure

\`\`\`
.
├── cc.sh              # Unified launcher (direct official API)
├── startup.sh         # Session start: reads project goals + launches cc.sh
├── ending.sh          # Session end: update logs + commit + push
├── .env               # API keys (gitignored)
├── $DEV_LOG          # Development log
└── user/dialog.md     # Auto-reconstructed conversation history
\`\`\`

## 🛠 Prerequisites

- \`npx\` / Node.js — for Claude Code CLI
- \`ANTHROPIC_API_KEY\` set in \`.env\`
EOF

echo "# Project Initial" > project_initial.md
echo "(Describe your new project goals here)" >> project_initial.md

echo "# Skill List" > skill_list.md
echo "- **gstack** (\`garrytan/gstack\`)" >> skill_list.md
echo "- **improve-codebase-architecture** (\`mattpocock/skills\`)" >> skill_list.md
echo "- **skill-creator** (\`anthropics/skills\`)" >> skill_list.md
echo "- **using-superpowers** (\`obra/superpowers\`)" >> skill_list.md

# 3. Clean subdirectories
echo "📁 Cleaning user and Tutorial directories..."
mkdir -p user Tutorial
echo "# User Conversation Dialog History" > user/dialog.md
echo "# Tutorial 1: Getting Started" > Tutorial/Tutorial_1.md

# 4. Finalizing
chmod +x startup.sh ending.sh cc.sh cleanAll.sh

echo "✅ Cleanup complete. $PROJECT_NAME is ready for a fresh start!"
echo "👉 Run ./startup.sh to begin your session."
