#!/bin/bash

if [[ "$#" -ne 0 ]]; then
  echo "Скрипт запускается без параметров"
else
  chmod +x script.sh
  bash ./script.sh "$1" "$2" "$3" "$4"
fi