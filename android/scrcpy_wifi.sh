#!/bin/zsh

# 👉 IP de tu Android (ajusta si cambia en el futuro)
DEVICE_IP="192.168.101.103"

# 🔌 Desconectamos dispositivos ADB previos
echo "🔌 Desconectando cualquier ADB previo..."
adb disconnect

# 📡 Conectamos al dispositivo por WiFi
echo "📡 Conectando a $DEVICE_IP ..."
adb connect $DEVICE_IP:5555

# 🕒 Espera breve por estabilidad
sleep 1

# ⚙️ Configuración de scrcpy optimizada para baja latencia
echo "🚀 Iniciando scrcpy en modo WiFi con baja latencia..."
scrcpy \
  --bit-rate 8M \
  --max-fps 60 \
  --window-title "📱 Android (WiFi)" \
  --turn-screen-off \
  --no-audio \
  --tcpip=$DEVICE_IP:5555
