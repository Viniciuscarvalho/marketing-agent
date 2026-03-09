#!/bin/bash
set -e

REPO="Viniciuscarvalho/marketing-agent"
BRANCH="main"
AGENTS_URL="https://raw.githubusercontent.com/$REPO/$BRANCH/agents"

# Agent file list
AGENTS=(
  communications-manager.md
  community-manager.md
  content-strategist.md
  copywriter.md
  cro-specialist.md
  email-marketing-specialist.md
  gtm-strategist.md
  lifecycle-marketing-manager.md
  marketing-analyst.md
  pr-strategist.md
  product-marketing-manager.md
  seo-strategist.md
  social-media-manager.md
)

echo "🚀 Marketing Agents Installer for Claude Code"
echo ""

# Determine install destination from flags or interactive prompt
DEST=""

for arg in "$@"; do
  case $arg in
    --global)   DEST="$HOME/.claude/agents" ;;
    --project)  DEST=".claude/agents" ;;
  esac
done

if [ -z "$DEST" ]; then
  echo "Where do you want to install?"
  echo ""
  echo "  1) Project-level  → .claude/agents/ (current project only)"
  echo "  2) User-level     → ~/.claude/agents/ (all projects)"
  echo ""
  read -p "Choose [1/2]: " choice
  case $choice in
    1) DEST=".claude/agents" ;;
    2) DEST="$HOME/.claude/agents" ;;
    *) echo "Invalid choice. Exiting."; exit 1 ;;
  esac
fi

echo ""
echo "Installing to $DEST ..."
mkdir -p "$DEST"

# Check if agents exist locally (cloned repo) or fetch from GitHub
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" 2>/dev/null && pwd || echo "")"
LOCAL_AGENTS="$SCRIPT_DIR/agents"
USE_LOCAL=false
if [ -d "$LOCAL_AGENTS" ] && ls "$LOCAL_AGENTS"/*.md &>/dev/null; then
  USE_LOCAL=true
fi

INSTALLED=0
SKIPPED=0

for filename in "${AGENTS[@]}"; do
  dest_file="$DEST/$filename"

  if [ -f "$dest_file" ]; then
    if [ -t 0 ]; then
      read -p "  ⚠️  $filename already exists. Overwrite? [y/N]: " overwrite
    else
      overwrite="y"
    fi
    if [[ "$overwrite" =~ ^[Yy]$ ]]; then
      action="overwritten"
    else
      SKIPPED=$((SKIPPED + 1))
      echo "  ⏭️  $filename (skipped)"
      continue
    fi
  else
    action="installed"
  fi

  if $USE_LOCAL; then
    cp "$LOCAL_AGENTS/$filename" "$dest_file"
  else
    curl -fsSL "$AGENTS_URL/$filename" -o "$dest_file"
  fi

  INSTALLED=$((INSTALLED + 1))
  echo "  ✅ $filename ($action)"
done

echo ""
echo "Done! Installed $INSTALLED agents, skipped $SKIPPED."
echo ""
echo "💡 Restart your Claude Code session or open a new project to load them."
