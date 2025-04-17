#!/bin/bash

cd "$(dirname "$0")"

echo "📦 Flasheando init_boot.img desde magisk_patched.tar..."
/Applications/heimdall-frontend.app/Contents/MacOS/heimdall flash \
  --INIT_BOOT magisk_patched.tar || {
    echo "❌ No se pudo flashear INIT_BOOT. Probando BOOT..."
    /Applications/heimdall-frontend.app/Contents/MacOS/heimdall flash \
      --BOOT magisk_patched.tar || {
        echo "❌ No se pudo flashear BOOT. Probando RECOVERY..."
        /Applications/heimdall-frontend.app/Contents/MacOS/heimdall flash \
          --RECOVERY magisk_patched.tar || {
            echo "💥 Todos los intentos fallaron. Verifica tu archivo .tar"
            exit 1
          }
      }
  }

echo "✅ Flash completado. Ahora puedes reiniciar el dispositivo."y

