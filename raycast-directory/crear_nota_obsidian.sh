#!/bin/zsh
# @raycast.schemaVersion 1
# @raycast.title Crear nota Obsidian
# @raycast.mode compact
# @raycast.icon 🗒
# @raycast.packageName Obsidian
# @raycast.argument1 { "type": "text", "placeholder": "Título de la nota" }

NOTE_DIR="$HOME/Library/Mobile Documents/iCloud~md~obsidian/Documents/Notas"
TITLE=$1
DATE=$(date '+%Y-%m-%d')
FILE="$NOTE_DIR/${DATE}_${TITLE// /_}.md"

echo "# $TITLE" > "$FILE"
echo "" >> "$FILE"
echo "_Creada el $DATE_" >> "$FILE"

open -a "Obsidian" "$FILE"
