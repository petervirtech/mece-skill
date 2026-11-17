#!/usr/bin/env bash
# Install the MECE skill globally for the current user.
# Usage:  bash install.sh
set -euo pipefail

# Determine source: use the directory this script lives in
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Validate required file exists
if [ ! -f "$SCRIPT_DIR/.opencode/skills/mece/SKILL.md" ]; then
  echo "Error: .opencode/skills/mece/SKILL.md not found." >&2
  echo "Run this script from the mece-skill repository root." >&2
  exit 1
fi

# Create global skills directory
SKILLS_DIR="$HOME/.config/opencode/skills"
mkdir -p "$SKILLS_DIR"

# Create symlink (remove existing one first)
LINK_TARGET="$SKILLS_DIR/mece"
if [ -L "$LINK_TARGET" ] || [ -d "$LINK_TARGET" ]; then
  rm -rf "$LINK_TARGET"
fi
ln -s "$SCRIPT_DIR/.opencode/skills/mece" "$LINK_TARGET"

echo "Skill 'mece' installed to $LINK_TARGET"
echo "Restart OpenCode (or your agent) to activate."
