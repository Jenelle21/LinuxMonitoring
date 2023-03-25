#!/bin/bash

echo "HOSTNAME = $(hostname)"
echo "TIMEZONE = $(timedatectl | grep 'Time zone' | awk '{print $3, $4, $5}')"
echo "USER = $(whoami)"
echo "OS = $(hostnamectl | grep 'Operating System' | awk '{printf "%s %s %s", $3, $4, $5}')"
echo "DATE = $(date +'%d %B %Y %H:%I:%M')"
echo "UPTIME = $(uptime --pretty)"
echo "UPTIME_SEC = $(cat /proc/uptime | awk '{printf $1}')"
echo "IP = $(ip -4 a | grep inet | grep -v 'host' | awk '{print $2}')"
echo "MASK = $(ifconfig -a | grep -e netmask -m 1 | awk '{print($4)}')"
echo "GATEWAY = $(ip route | awk '{print $3; exit}')"
echo "RAM_TOTAL = $(free -h | grep -e 'Mem' | awk '{printf "%.3f GB", $2/1024}')"
echo "RAM_USED = $(free -h | grep -e 'Mem' | awk '{printf "%.3f GB", $3/1024}')"
echo "RAM_FREE = $(free -h | grep -e 'Mem' | awk '{printf "%.3f GB", $4/1024}')"
echo "SPACE_ROOT = $(df --portability | awk '/\/$/ {print $2}' | awk '{printf "%.2f MB", $1/1024}')"
echo "SPACE_ROOT_USED = $(df --portability | awk '/\/$/ {print $3}' | awk '{printf "%.2f MB", $1/1024}')"
echo "SPACE_ROOT_FREE = $(df --portability | awk '/\/$/ {print $4}' | awk '{printf "%.2f MB", $1/1024}')"