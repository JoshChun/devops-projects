#!/bin/bash

echo "=== Server Performance Stats ==="
echo

# Total CPU Usage
echo "Total CPU Usage:"
top -bn1 | grep "Cpu(s)" | awk '{usage=100-$8} END {print usage "%"}'
echo

# Total Memory Usage
echo "Total Memory Usage"
free -h | awk '/^Mem/ {total=$2; used=$3; printf "Used: %s / Total: %s (%.2f%%)\n", used, total, (used/total)*100}'
echo

# Total Disk Usage
echo "Total Disk Usage"
df -h --total | awk '/total/ {printf "Used: %s / Total: %s (%s) \n", $3, $2, $5}'
echo

# Top 5 Processes by CPU Usage
echo "Top 5 Processes by CPU Usage"
ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6
echo

# Top 5 Processes by Memory Usage
echo "Top 5 Processes by Memory Usage"
ps -eo pid,comm,%mem --sort=-%mem | head -n 6
echo