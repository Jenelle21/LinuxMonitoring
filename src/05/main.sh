#!/bin/bash
if [ "$#" -ne 1 ]; then
  echo "Введите название директории"
elif ! [ -d "$1" ]; then
  echo "Некорректная директория"
else
  start=$(date +%s.%N)
  chmod +x script.sh
  bash ./script.sh "$1"
  end=$(date +%s.%N)
  runtime=$(python3 -c "print('{:.1f}'.format(${end} - ${start}))")
  echo "Script execution time (in seconds) = $runtime"
fi
