#!/usr/bin/env bash
# Installs the skill for Claude Code, Codex and Grok Build.
set -euo pipefail
SRC="$(cd "$(dirname "$0")" && pwd)/skills/video-edit-effects"
for dest in "$HOME/.claude/skills" "$HOME/.agents/skills"; do
  mkdir -p "$dest"
  rm -rf "$dest/video-edit-effects"
  cp -R "$SRC" "$dest/video-edit-effects"
  echo "Installed to $dest/video-edit-effects"
done
echo "Needs ffmpeg and Python 3 (Pillow, faster-whisper) on this machine."
