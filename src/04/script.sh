#!/bin/bash

source colors.cfg

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

function color_to_text {
  case "$1" in
    1) txt="white";;
    2) txt="red";;
    3) txt="green";;
    4) txt="blue";;
    5) txt="purple";;
    6) txt="black";;
  esac
  echo $txt
}

if [[ -n ${column1_background} ]]; then
  b1="\033[$(($(parse_color "$column1_background") + 10))m"
  out_b1="$column1_background ($(color_to_text "$column1_background"))"
else
  b1="\033[102m"
  out_b1="default ($(color_to_text 3))"
fi

if [[ -n ${column1_font_color} ]]; then
  f1="\033[$(parse_color "$column1_font_color")m"
  out_f1="$column1_font_color ($(color_to_text "$column1_font_color"))"
else
  f1="\033[30m"
  out_f1="default ($(color_to_text 6))"
fi

if [[ -n ${column2_background} ]]; then
  b2="\033[$(($(parse_color "$column2_background") + 10))m"
  out_b2="$column2_background ($(color_to_text "$column2_background"))"
else
  b2="\033[105m"
  out_b2="default ($(color_to_text 5))"
fi

if [[ -n ${column2_font_color} ]]; then
  f2="\033[$(parse_color "$column2_font_color")m"
  out_f2="$column2_font_color ($(color_to_text "$column2_font_color"))"
else
  f2="\033[30m"
  out_f2="default ($(color_to_text 6))"
fi

std="\033[0m"

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
echo ""
echo "Column 1 background = $out_b1"
echo "Column 1 font color = $out_f1"
echo "Column 2 background = $out_b2"
echo "Column 2 font color = $out_f2"
