#!/bin/bash

# ✅ build_heimdall_macos.sh
# Automatiza la corrección y compilación de Heimdall en macOS (Apple Silicon)

set -e

# Ruta base
PROJECT_DIR="$HOME/Code/samsumgroot/Heimdall"
BUILD_DIR="$PROJECT_DIR/build"
QT5_DIR="/opt/homebrew/opt/qt@5/lib/cmake/Qt5Widgets"

# ✅ Exportar variables necesarias para Qt@5
export PATH="/opt/homebrew/opt/qt@5/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/qt@5/lib"
export CPPFLAGS="-I/opt/homebrew/opt/qt@5/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/qt@5/lib/pkgconfig"

# ✅ Parchear cmake_minimum_required en todos los CMakeLists.txt
echo "🔧 Parcheando CMakeLists.txt para CMake moderno..."
find "$PROJECT_DIR" -name "CMakeLists.txt" | while read -r file; do
    sed -i '' 's/cmake_minimum_required(VERSION [0-9.]+)/cmake_minimum_required(VERSION 3.5)/' "$file"
    echo "🔍 Actualizado: $file"
    sleep 0.2
done

# ✅ Crear build y compilar
mkdir -p "$BUILD_DIR"
cd "$BUILD_DIR"
echo "🔄 Configurando proyecto..."
cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release -DQt5Widgets_DIR="$QT5_DIR" ..

echo "⚖️ Compilando..."
make -j$(sysctl -n hw.ncpu)

# ✅ Copiar binario al PATH
echo "🚗 Moviendo binario a /opt/homebrew/bin"
sudo cp bin/heimdall /opt/homebrew/bin/

# 🎉 Resultado
echo -e "\n🌟 Heimdall instalado correctamente. Verifica con: heimdall version"
heimdall version

