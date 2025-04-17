#!/bin/bash

# Requiere ADB y root

PKGS=(
  "com.samsung.android.bixby.wakeup"
  "com.samsung.android.app.spage"
  "com.samsung.android.app.routines"
  "com.samsung.android.da.daagent"
  "com.sec.android.easyonehand"
  "com.sec.android.easyMover.Agent"
  "com.samsung.android.themestore"
  "com.samsung.android.themecenter"
  "com.samsung.android.samsungpass"
)

for pkg in "${PKGS[@]}"; do
  adb shell pm uninstall --user 0 "$pkg"
done

echo "🧹 Bloatware eliminado. Reinicia el dispositivo si es necesario."
