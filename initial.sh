#!/bin/bash

# =================================================================
# initial.sh - Deprecated & Unified into startup.sh
# =================================================================

echo "📢 Notice: initial.sh has been fully integrated into startup.sh!"
echo "🚀 Redirecting you to ./startup.sh to automatically bootstrap your new project..."
echo ""

# Execute startup.sh and pass any arguments along
exec ./startup.sh "$@"

