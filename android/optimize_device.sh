#!/system/bin/sh

# Desactiva animaciones para rendimiento
settings put global window_animation_scale 0.0
settings put global transition_animation_scale 0.0
settings put global animator_duration_scale 0.0

# Forzar apps a ejecutarse con menor RAM
settings put global low_ram true

# Limitar procesos en segundo plano
settings put global background_process_limit 2

echo "🚀 Optimización aplicada. Reinicia para efectos completos."
