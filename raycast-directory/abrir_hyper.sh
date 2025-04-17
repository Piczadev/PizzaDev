#!/bin/zsh
# @raycast.schemaVersion 1
# @raycast.title Abrir Hyper en carpeta actual
# @raycast.mode compact
# @raycast.icon 💻
# @raycast.packageName Terminal

DIR=$(osascript -e 'tell application "Finder" to get POSIX path of (insertion location as alias)')
open -a Hyper "$DIR"
