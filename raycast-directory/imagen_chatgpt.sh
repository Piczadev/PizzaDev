#!/bin/zsh
# @raycast.schemaVersion 1
# @raycast.title Imagen a ChatGPT
# @raycast.mode compact
# @raycast.icon 🖼
# @raycast.packageName ChatGPT
# @raycast.argument1 { "type": "text", "placeholder": "¿Qué quieres preguntarle?" }

open "raycast://extensions/chatgpt/openai/ask-clipboard-image?text=$1"
