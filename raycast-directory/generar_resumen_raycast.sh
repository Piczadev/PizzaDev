#!/bin/zsh
# @raycast.schemaVersion 1
# @raycast.title Generar Resumen Pantalla
# @raycast.mode compact
# @raycast.packageName Productividad
# Archivo de salida
FILE_NAME="$HOME/ScreenTimeLogs/uso_pantalla_$(date +%Y-%m-%d).txt"

# Crear carpeta si no existe
mkdir -p "$HOME/ScreenTimeLogs"

# Contenido del resumen (a modo de plantilla fija)
cat <<EOF > "$FILE_NAME"
📊 USO DE PANTALLA – RESUMEN DIARIO

Fecha: $(date +%Y-%m-%d)

Ejemplo de estructura para rellenar manualmente:
- Total de uso: ___ h ___ m
- Productividad & Finanzas: ___ h ___ m
- Social: ___ h ___ m
- Utilidades: ___ h ___ m
- Aplicaciones más usadas: 
    - ChatGPT: ___ h ___ m
    - Arc: ___ h ___ m
    - Hyper: ___ h ___ m
    - YouTube: ___ h ___ m

Análisis:
- Patrones detectados: _______________________________________
- Observaciones: _____________________________________________

EOF

# Abrir en tu editor predeterminado (o cambiar por nano/vim si prefieres)
open "$FILE_NAME"
