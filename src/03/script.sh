#!/bin/bash

function parse_color {
  case "$1" in
    1) res=97;;
    2) res=91;;
    3) res=92;;
    4) res=94;;
    5) res=95;;
    6) res=30;;
  esac
  echo $res
}

std="\033[0m"
b1="\033[$(($(parse_color "$1") + 10))m"
f1="\033[$(parse_color "$2")m"
b2="\033[$(($(parse_color "$3") + 10))m"
f2="\033[$(parse_color "$4")m"

echo -e "${b1}${f1}HOSTNAME =${b2}${f2} $(hostname)${std}"
echo -e "${b1}${f1}TIMEZONE =${b2}${f2} $(timedatectl | grep 'Time zone' | awk '{print $3, $4, $5}')${std}"
echo -e "${b1}${f1}USER =${b2}${f2} $(whoami)${std}"
echo -e "${b1}${f1}OS =${b2}${f2} $(hostnamectl | grep 'Operating System' | awk '{printf "%s %s %s", $3, $4, $5}')${std}"
echo -e "${b1}${f1}DATE =${b2}${f2} $(date +'%d %B %Y %H:%I:%M')${std}"
echo -e "${b1}${f1}UPTIME =${b2}${f2} $(uptime --pretty)${std}"
echo -e "${b1}${f1}UPTIME_SEC =${b2}${f2} $(cat /proc/uptime | awk '{printf $1}')${std}"
echo -e "${b1}${f1}IP =${b2}${f2} $(ip -4 a | grep inet | grep -v 'host' | awk '{print $2}')${std}"
echo -e "${b1}${f1}MASK =${b2}${f2} $(ifconfig -a | grep -e netmask -m 1 | awk '{print($4)}')${std}"
echo -e "${b1}${f1}GATEWAY =${b2}${f2} $(ip route | awk '{print $3; exit}')${std}"
echo -e "${b1}${f1}RAM_TOTAL =${b2}${f2} $(free -h | grep -e 'Mem' | awk '{printf "%.3f GB", $2/1024}')${std}"
echo -e "${b1}${f1}RAM_USED =${b2}${f2} $(free -h | grep -e 'Mem' | awk '{printf "%.3f GB", $3/1024}')${std}"
echo -e "${b1}${f1}RAM_FREE =${b2}${f2} $(free -h | grep -e 'Mem' | awk '{printf "%.3f GB", $4/1024}')${std}"
echo -e "${b1}${f1}SPACE_ROOT =${b2}${f2} $(df --portability | awk '/\/$/ {print $2}' | awk '{printf "%.2f MB", $1/1024}')${std}"
echo -e "${b1}${f1}SPACE_ROOT_USED =${b2}${f2} $(df --portability | awk '/\/$/ {print $3}' | awk '{printf "%.2f MB", $1/1024}')${std}"
echo -e "${b1}${f1}SPACE_ROOT_FREE =${b2}${f2} $(df --portability | awk '/\/$/ {print $4}' | awk '{printf "%.2f MB", $1/1024}')${std}"
