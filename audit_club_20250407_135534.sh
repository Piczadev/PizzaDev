#!/bin/zsh

# 🧪 Audit Script for Club_Totalplay_WiFi
# Generated: 20250407_135534

echo "🧠 Iniciando auditoría de red pública Club_Totalplay_WiFi..."
echo "📅 Timestamp: 20250407_135534"
echo ""

# Directorio base
base_dir="$HOME/Code/audit_club_logs"
mkdir -p "$base_dir"
log_file="$base_dir/report_20250407_135534.log"

# Función para loguear
log() {
    echo "$1" | tee -a "$log_file"
}

log "🌐 Verificando IP y gateway actual..."
ip_local=$(ipconfig getifaddr en1)
gateway=$(netstat -rn | grep default | awk '{print $2}')
log "🆔 IP Local: $ip_local"
log "🛣️ Gateway: $gateway"

log ""
log "📡 Escaneando dispositivos con arp-scan..."
sudo arp-scan --interface=en1 --localnet | tee -a "$log_file"

log ""
log "🔍 Escaneando puertos del gateway..."
nmap -Pn -sS -T4 -p- $gateway | tee -a "$log_file"

log ""
log "🧬 Buscando servicios activos..."
nmap -Pn -sV $gateway | tee -a "$log_file"

log ""
log "🧠 Analizando tráfico con tcpdump durante 15 segundos..."
sudo timeout 15 tcpdump -i en1 -nn -c 200 | tee -a "$log_file"

log ""
log "🔎 Sniffing ligero con Bettercap (10s)..."
timeout 10 sudo bettercap -iface en1 -eval 'net.probe on; net.recon on; net.sniff on' | tee -a "$log_file"

log ""
log "✅ Auditoría completada."
log "📁 Log guardado en: $log_file"

