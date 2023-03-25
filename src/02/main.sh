#!/bin/bash

FILE="temp.txt"

if [ "$#" -ne 0 ]; then
  echo "Скрипт запускается без аргументов"
  exit 1
else
  chmod +x script.sh
  bash ./script.sh > $FILE
  cat $FILE
  echo -n "Записать данные в файл? (Y/N)"
  read -r answer
  case $answer in
    y|Y) mv $FILE "$(date "+%d_%m_%y_%H_%M_%S.status")";;
    *) rm $FILE;;
  esac
fi
