#!/usr/bin/env bash

# CPU Usage
cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8"%"}')
# RAM Usage
ram_usage=$(free -m | awk '/Mem:/ { printf("%.2f%%", $3/$2 * 100.0) }')
# Disk Usage
disk_usage=$(df -h / | awk 'NR==2 {print $5}')
# System Time
system_time=$(date +"%Y-%m-%d %H:%M")
# Battery info
battery_info=$(acpi -b | awk '{print $4}' | sed 's/,//')
# Processor Temperature
cpu_temp=$(sensors | awk '/^Package id 0:/ {print $4}')

# Output with Emojis
dwlb -status all " $cpu_usage |  $ram_usage |  $disk_usage |  $battery_info | $system_time"
