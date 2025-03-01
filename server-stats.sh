#!/bin/bash

# Display CPU usage
echo "===== CPU Usage ====="
cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8 "%"}')
echo "Total CPU Usage: $cpu_usage"
echo ""

# Display memory usage
echo "===== Memory Usage ====="
memory_usage=$(free -m | grep Mem: | awk '{print "Used: " $3 "MB, Free: " $4 "MB"}')
memory_percent=$(free -m | grep Mem: | awk '{printf "Percentage Used: %.2f%%\n", ($3/$2)*100}')
echo "$memory_usage"
echo "$memory_percent"
echo ""

# Display disk usage
echo "===== Disk Usage ====="
disk_usage=$(df -h / | grep / | awk '{print "Used: " $3 ", Free: " $4}')
disk_percent=$(df -h / | grep / | awk '{print "Percentage Used: " $5}')
echo "$disk_usage"
echo "$disk_percent"
echo ""

# Display top 5 processes by CPU usage
echo "===== Top 5 Processes by CPU Usage ====="
ps -eo pid,ppid,cmd,%cpu,%mem --sort=-%cpu | head -n 6
echo ""

# Display top 5 processes by memory usage
echo "===== Top 5 Processes by Memory Usage ====="
ps -eo pid,ppid,cmd,%cpu,%mem --sort=-%mem | head -n 6
echo ""
