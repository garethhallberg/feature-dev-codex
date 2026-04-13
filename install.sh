#!/usr/bin/env bash
set -euo pipefail

# feature-dev installer for OpenAI Codex CLI
#
# Installs skills to your project (.codex/skills/) or globally (~/.codex/skills/).
#
# Usage:
#   ./install.sh /path/to/your/project    # project-level install
#   ./install.sh --global                  # user-level install (~/.codex/skills/)
#   ./install.sh                           # installs to current directory

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

if [ "${1:-}" = "--global" ]; then
    TARGET="$HOME/.codex"
    echo "Installing feature-dev skills globally for Codex CLI..."
else
    TARGET="${1:-.}/.codex"
    echo "Installing feature-dev skills for Codex CLI..."
fi

echo "Target: $TARGET/skills/"
echo ""

# feature-dev (main orchestrator)
mkdir -p "$TARGET/skills/feature-dev"
cp "$SCRIPT_DIR/feature-dev-SKILL.md" "$TARGET/skills/feature-dev/SKILL.md"
echo "✓ Installed skill:  skills/feature-dev/SKILL.md"

# code-explorer
mkdir -p "$TARGET/skills/code-explorer"
cp "$SCRIPT_DIR/code-explorer-SKILL.md" "$TARGET/skills/code-explorer/SKILL.md"
echo "✓ Installed skill:  skills/code-explorer/SKILL.md"

# code-architect
mkdir -p "$TARGET/skills/code-architect"
cp "$SCRIPT_DIR/code-architect-SKILL.md" "$TARGET/skills/code-architect/SKILL.md"
echo "✓ Installed skill:  skills/code-architect/SKILL.md"

# code-reviewer
mkdir -p "$TARGET/skills/code-reviewer"
cp "$SCRIPT_DIR/code-reviewer-SKILL.md" "$TARGET/skills/code-reviewer/SKILL.md"
echo "✓ Installed skill:  skills/code-reviewer/SKILL.md"

echo ""
echo "Done. Restart Codex to pick up the changes."
echo ""
echo "Usage:"
echo '  $feature-dev Add user authentication with OAuth'
echo '  $feature-dev Implement caching for the API layer'
echo '  $feature-dev'
echo ""
echo "You can also use the sub-skills directly:"
echo '  $code-explorer Trace how auth works in this codebase'
echo '  $code-architect Design an approach for adding WebSocket support'
echo '  $code-reviewer Review the files I changed in my last commit'
