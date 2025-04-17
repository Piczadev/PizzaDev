#!/bin/zsh

echo "🚮 Limpiando bloatware Samsung..."
packages=(
  "com.samsung.android.email.provider"
  "com.samsung.android.weather"
  "com.samsung.android.app.spage"
  "com.samsung.android.game.gamehome"
  "com.samsung.android.game.gametools"
  "com.samsung.android.mateagent"
  "com.samsung.android.dlp"
  "com.samsung.android.privacydashboard"
  "com.samsung.android.scloud"
  "com.samsung.android.smartsuggestions"
  "com.samsung.android.visionintelligence"
)

for pkg in "${packages[@]}"; do
  echo "🔹 Disabling $pkg"
  adb shell pm disable-user --user 0 "$pkg"
done

echo "✅ Bloatware desactivado."
