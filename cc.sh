#!/bin/bash
# Unified Claude Code Launcher (Direct Mode)
# Author: Antigravity

# Fix terminal input to avoid ^M on Enter
stty icrnl 2>/dev/null || true

# Load keys from .env
if [ -f ".env" ]; then
    source .env
fi

if [ -z "$ANTHROPIC_API_KEY" ]; then
    echo "❌ Error: ANTHROPIC_API_KEY is not set in .env or your environment."
    echo "Please set it before running cc.sh."
    exit 1
fi

export ANTHROPIC_API_KEY

echo "========================================="
echo "🤖 Claude Code Unified Launcher (Direct)"
echo "========================================="
echo "🚀 啟動 Claude Code (Official API)..."
echo "-----------------------------------------"

npx -y @anthropic-ai/claude-code "$@"
