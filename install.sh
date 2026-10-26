#!/usr/bin/env sh
# Copies the skills and agents into your personal Claude Code folder (~/.claude).
# Use this if you'd rather not install the plugin.
set -e
here="$(cd "$(dirname "$0")" && pwd)"
mkdir -p "$HOME/.claude/skills" "$HOME/.claude/agents"
cp -R "$here/skills/." "$HOME/.claude/skills/"
cp "$here/agents/"*.md "$HOME/.claude/agents/"
echo "Installed to $HOME/.claude. Start a new Claude Code session and run /viral-video."
