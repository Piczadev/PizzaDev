#!/bin/zsh
# @raycast.schemaVersion 1
# @raycast.title Consultar selección en ChatGPT
# @raycast.mode compact
# @raycast.icon 🤖
# @raycast.packageName ChatGPT

pbpaste | open "raycast://extensions/chatgpt/openai/ask-question?text=$(pbpaste | sed 's/ /%20/g')"
