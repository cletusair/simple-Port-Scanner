#!/bin/bash
# portscan.sh - Simple TCP Port Scanner
# Author: Rohit Cletus

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <target IP or domain>"
  exit 1
fi

target=$1
ports=(21 22 23 25 53 80 110 139 143 443 445 3306 8080 8443)

echo "[*] Scanning $target..."
for port in "${ports[@]}"; do
  timeout 1 bash -c "</dev/tcp/$target/$port" 2>/dev/null &&
    echo "[+] Port $port is OPEN" ||
    echo "[-] Port $port is CLOSED"
done
