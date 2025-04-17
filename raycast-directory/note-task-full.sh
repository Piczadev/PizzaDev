#!/bin/zsh
# @raycast.schemaVersion 1

INPUT="$1"
CLASS=$(echo "$INPUT" | ~/Code/raycast-directory/classify.sh)

if [[ "$CLASS" == "task" ]]; then
  shortcuts run "Add to Anydo" -i "$INPUT"
  osascript -e 'display notification "Task sent to Any.do" with title "📌 Task Captured"'
else
  # Crear archivo Markdown con timestamp
  TIMESTAMP=$(date "+%Y-%m-%d_%H-%M")
  FILENAME="$HOME/Obsidian/Ideas/$TIMESTAMP.md"
  mkdir -p "$HOME/Obsidian/Ideas"

  cat <<EOF > "$FILENAME"
---
title: "$INPUT"
created: $(date "+%Y-%m-%d %H:%M")
type: idea
tags: [inbox, ai-captured]
---

$INPUT
EOF

  open -a "Obsidian" "$FILENAME"
  osascript -e 'display notification "Idea saved and opened in Obsidian" with title "🧠 Idea Captured"'
fi
