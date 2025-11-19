#!/bin/bash

LOG_DIR="./logs"
mkdir -p "$LOG_DIR"

LOG_FILE="$LOG_DIR/system_health_$(date +'%Y-%m-%d_%H-%M-%S').log"

CPU_USAGE=$(grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print usage}')
MEMORY_USAGE=$(free | awk '/Mem/ {print $3/$2 * 100}')
DISK_USAGE=$(df -P / | awk 'END{print $5}' | tr -d '%')

CPU_THRESHOLD=80
MEM_THRESHOLD=80
DISK_THRESHOLD=80

{
    echo "----- System Health Check: $(date) -----"
    echo "CPU Usage: $CPU_USAGE%"
    echo "Memory Usage: $MEMORY_USAGE%"
    echo "Disk Usage: $DISK_USAGE%"
    echo "-----------------------------------------"
} >> "$LOG_FILE"

if (( ${CPU_USAGE%.*} > CPU_THRESHOLD )); then
    echo "ALERT: High CPU Usage ($CPU_USAGE%)"
fi

if (( ${MEMORY_USAGE%.*} > MEM_THRESHOLD )); then
    echo "ALERT: High Memory Usage ($MEMORY_USAGE%)"
fi

if (( DISK_USAGE > DISK_THRESHOLD )); then
    echo "ALERT: High Disk Usage ($DISK_USAGE%)"
fi
