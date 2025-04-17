#!/bin/zsh
# @raycast.schemaVersion 1
# @raycast.title Guardar resumen del clipboard
# @raycast.mode compact
# @raycast.icon 📄
# @raycast.packageName Resumen

NOTE_DIR="$HOME/Library/Mobile Documents/iCloud~md~obsidian/Documents/Notas"
DATE=$(date '+%Y-%m-%d')
TITLE="resumen_$DATE"
TEXT=$(pbpaste)

echo "# Resumen $DATE" > "$NOTE_DIR/$TITLE.md"
echo "" >> "$NOTE_DIR/$TITLE.md"
echo "$TEXT" >> "$NOTE_DIR/$TITLE.md"

open -a "Obsidian" "$NOTE_DIR/$TITLE.md"
