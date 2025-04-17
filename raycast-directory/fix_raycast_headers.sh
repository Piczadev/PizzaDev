#!/bin/zsh

SCRIPT_DIR="$HOME/Code/raycast-directory"

echo "🔍 Buscando scripts sin @raycast.schemaVersion en: $SCRIPT_DIR"

for file in "$SCRIPT_DIR"/*.sh; do
  if ! grep -q "@raycast.schemaVersion" "$file"; then
    echo "⚙️  Corrigiendo: $(basename "$file")"
    tmp_file="${file}.tmp"
    echo "#!/bin/zsh" > "$tmp_file"
    echo "# @raycast.schemaVersion 1" >> "$tmp_file"
    grep -v "#!/bin/zsh" "$file" >> "$tmp_file"
    mv "$tmp_file" "$file"
    chmod +x "$file"
  else
    echo "✅ $(basename "$file") ya tiene schemaVersion"
  fi
done

echo "✅ Todos los scripts están listos para Raycast."
