#!/bin/zsh

while true; do
  clear
  echo "🧠  MENÚ POST-ROOT – SAMSUNG A35"
  echo "---------------------------------"
  echo "1. Flashear Magisk patch con Heimdall"
  echo "2. Limpiar bloatware Samsung por ADB"
  echo "3. Abrir carpeta patched/"
  echo "4. Mostrar módulos Magisk recomendados"
  echo "5. Salir"
  echo "---------------------------------"
  read "choice?Selecciona una opción: "

  case $choice in
    1)
      ./flash_root.sh
      read -k"?Presiona ENTER para volver al menú..."
      ;;
    2)
      ./adb_debloat.sh
      read -k"?Presiona ENTER para volver al menú..."
      ;;
    3)
      open ~/Code/samsumgroot/patched
      ;;
    4)
      clear
      echo "📦 Módulos recomendados:"
      echo "• LSPosed – Framework para personalizar Android"
      echo "• Shamiko – Oculta root incluso en apps sensibles"
      echo "• Universal SafetyNet Fix – Paso de CTS (root oculto)"
      echo "• Magisk Bootloop Protector – Previene bootloops"
      echo "• Debloater – Limpia apps del sistema desde Magisk"
      echo "• AdAway – Bloqueador de publicidad root"
      read -k"?Presiona ENTER para volver al menú..."
      ;;
    5)
      echo "👋 Saliendo..."
      exit 0
      ;;
    *)
      echo "❌ Opción inválida. Intenta de nuevo."
      sleep 1
      ;;
  esac
done
