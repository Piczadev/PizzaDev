#!/system/bin/sh

# Requiere acceso root
MOD_DIR="/data/adb/modules_update"

# Lista de módulos Magisk recomendados (repos oficiales o URLs directas .zip)
MODULES=(
  "https://github.com/JohnFawkes/Universal-GMS-Doze/releases/download/v1.8/UniversalGMSDoze-v1.8.zip"
  "https://github.com/Kingsman44/Magisk-MTU-Fix/releases/download/v1.0/mtu_fix-v1.0.zip"
)

for url in "${MODULES[@]}"; do
  wget "$url" -P /sdcard/
  FILE=$(basename "$url")
  magisk --install-module "/sdcard/$FILE"
done

echo "✅ Módulos Magisk descargados e instalados. Reinicia para aplicar."
