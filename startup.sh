#!/bin/bash

# =========================================================
# Step 1: 環境檢查 (Environment Check)
# =========================================================
echo "=============================="
echo "Step 1: 環境檢查 (Environment Check)"
echo "=============================="
PASS=true

check_cmd() {
    if command -v "$1" &>/dev/null; then
        echo "  ✅ $1 → $(command -v $1)"
    else
        echo "  ❌ $1 → 未安裝！請執行: $2"
        PASS=false
    fi
}

echo ""
echo "📦 依賴工具："
check_cmd "node" "brew install node"
check_cmd "npx"  "brew install node"
check_cmd "curl" "brew install curl"
check_cmd "git"  "brew install git"

echo ""
echo "🧭 AI Agent Rules："
[ -f "CLAUDE.md" ] && echo "  ✅ CLAUDE.md root instructions found" || echo "  ⚠️  CLAUDE.md not found"
[ -f ".cursor/rules/karpathy-guidelines.mdc" ] && echo "  ✅ Cursor Karpathy rule found" || echo "  ⚠️  .cursor/rules/karpathy-guidelines.mdc not found"
[ -f ".agents/skills/karpathy-guidelines/SKILL.md" ] && echo "  ✅ Codex Karpathy skill found" || echo "  ⚠️  .agents/skills/karpathy-guidelines/SKILL.md not found"

echo ""
echo "🔑 API Keys (.env)："
if [ -f ".env" ]; then
    source .env 2>/dev/null
    [ -n "$ANTHROPIC_API_KEY" ] && echo "  ✅ ANTHROPIC_API_KEY 已設定 (${ANTHROPIC_API_KEY:0:8}...)" || { echo "  ❌ ANTHROPIC_API_KEY 未設定"; PASS=false; }
else
    echo "  ❌ .env 檔案不存在！請建立並填入 ANTHROPIC_API_KEY"
    PASS=false
fi

echo ""
echo "🌐 網路連線："
HTTP=$(curl -s --max-time 5 -o /dev/null -w "%{http_code}" "https://api.anthropic.com")
if [[ "$HTTP" =~ ^[234] ]]; then
    echo "  ✅ Anthropic API 可連線 (HTTP $HTTP)"
else
    echo "  ❌ Anthropic API 連線失敗 (HTTP $HTTP)"
    PASS=false
fi

echo ""
if [ "$PASS" = true ]; then
    echo "✅ 環境檢查通過！繼續下一步..."
else
    echo "❌ 環境有問題，請修正後再執行 ./startup.sh"
    exit 1
fi

# =========================================================
# Step 2: 拉取最新進度 (Git Pull)
# =========================================================
echo ""
echo "=============================="
echo "Step 2: 拉取最新進度 (Git Pull)"
echo "=============================="
git pull origin main || echo "⚠️ 同步失敗，跳過此步驟。"

# =========================================================
# Step 3: 閱讀開發日誌 (Read Dev Log)
# =========================================================
echo ""
echo "=============================="
echo "Step 3: 閱讀開發日誌 (Read Dev Log)"
echo "=============================="
if [ -f "devlog.md" ]; then
    cat "devlog.md"
else
    echo "⚠️ 找不到開發日誌檔案 (devlog.md)！"
fi
echo ""
echo "🤖 嗨，AI 助手！請閱讀上方的開發日誌，並總結目前的進度，然後告訴我接下來可以開始哪些任務 (Tasks to start)。"

# =========================================================
# Step 4: 啟動 Claude Code (Launch)
# =========================================================
echo ""
echo "=============================="
echo "Step 4: 啟動 Claude Code (Launch)"
echo "=============================="
if [ -f "cc.sh" ]; then
    bash cc.sh
else
    echo "❌ 找不到 cc.sh，請確認檔案是否存在。"
fi
