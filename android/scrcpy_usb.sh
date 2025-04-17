#!/bin/zsh

echo "🔌 Verificando dispositivos conectados por USB..."
adb devices

# 🕒 Espera por estabilidad
sleep 1

echo "📺 Iniciando scrcpy en modo USB con calidad máxima..."
scrcpy \
  --video-bit-rate=30M \
  --audio-bit-rate=192K \
  --max-size=0 \
  --max-fps=60 \
  --window-title="📱 Android (USB - Alta Calidad)" \
  --fullscreen \
  --audio-output=auto \
  --turn-screen-off
