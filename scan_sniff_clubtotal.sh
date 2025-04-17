#!/bin/bash

# Red abierta (sin seguridad) - Riesgo alto
IFACE="en1"
GW="10.86.128.1"
RANGE="10.86.128.0/19"
MYIP=$(ipconfig getifaddr $IFACE)
LOGDIR=~/Code/clubtotal_logs
mkdir -p "$LOGDIR"

echo "[*] Tu IP actual: $MYIP"
echo "[*] Iniciando escaneo de red abierta Club_Totalplay..."

# 1. Escaneo ARP
sudo arp-scan --interface=$IFACE $RANGE | tee "$LOGDIR/arp_scan.txt"

# 2. Nmap activo sin ping
echo "[*] Escaneando puertos abiertos del gateway..."
sudo nmap -Pn -p- -T4 -oN "$LOGDIR/gateway_ports.txt" $GW

# 3. Sniff de tráfico de red
echo "[*] Capturando tráfico de red por 60 segundos..."
sudo tcpdump -i $IFACE -nn -w "$LOGDIR/sniff_$(date +%s).pcap" &
TCPDUMP_PID=$!
sleep 60
kill $TCPDUMP_PID

# 4. Intercepción y análisis con bettercap
echo "[*] Ejecutando bettercap con net.probe y sniff..."
sudo bettercap -iface $IFACE -eval "net.recon on; net.sniff on" -caplet "$LOGDIR/bettercap.log" -silent &

# 5. Nikto contra el gateway
echo "[*] Escaneo HTTP con nikto..."
nikto -host http://$GW -output "$LOGDIR/nikto_gateway.txt"

echo "[*] Todo completado. Resultados en: $LOGDIR"
