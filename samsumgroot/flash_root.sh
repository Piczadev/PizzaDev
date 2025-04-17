#!/bin/bash

cd ~/Code/samsumgroot

# Verificar existencia de los archivos
if [[ ! -f "patched/magisk_patched-28100_nHVv6.tar" ]]; then
  echo "❌ No se encontró el archivo AP (magisk_patched)."
  exit 1
fi

if [[ ! -f "firmware/BL_A356EXXS4AYB3_A356EXXS4AYB3_MQB92312243_REV00_user_low_ship_MULTI_CERT.tar.md5" ]]; then
  echo "❌ No se encontró el archivo BL."
  exit 1
fi

if [[ ! -f "firmware/CP_A356EXXS4AYA1_CP28815605_MQB91094809_REV00_user_low_ship_MULTI_CERT.tar.md5" ]]; then
  echo "❌ No se encontró el archivo CP."
  exit 1
fi

if [[ ! -f "firmware/CSC_OWO_A356EOWO4AYB3_MQB92312243_REV00_user_low_ship_MULTI_CERT.tar.md5" ]]; then
  echo "❌ No se encontró el archivo CSC."
  exit 1
fi

echo "⚠️  Asegúrate de que el dispositivo está en modo Download y conectado por USB"
read -p "Presiona ENTER para continuar..."

# Ejecutar Heimdall
sudo /Applications/heimdall-frontend.app/Contents/MacOS/heimdall flash \
  --AP patched/magisk_patched-28100_nHVv6.tar \
  --BL firmware/BL_A356EXXS4AYB3_A356EXXS4AYB3_MQB92312243_REV00_user_low_ship_MULTI_CERT.tar.md5 \
  --CP firmware/CP_A356EXXS4AYA1_CP28815605_MQB91094809_REV00_user_low_ship_MULTI_CERT.tar.md5 \
  --CSC firmware/CSC_OWO_A356EOWO4AYB3_MQB92312243_REV00_user_low_ship_MULTI_CERT.tar.md5
