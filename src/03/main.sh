#!/bin/bash

arg="(^[1-6]{1}$)"

if [ "$#" -ne 4 ]; then
  echo "Для запуска скрипта необходимо 4 аргумента"
elif ! [[ $1 =~ $arg ]] || ! [[ $2 =~ $arg ]] || ! [[ $3 =~ $arg ]] || ! [[ $4 =~ $arg ]]; then
  echo "Параметры должны быть цифрами в интервале от 1 до 6"
elif [ "$1" == "$2" ] || [ "$3" == "$4" ]; then
  echo "Цвета шрифта и фона одного столбца не должны совпадать"
  echo "Перезапустить скрипт? (Y/N)"
  read -r answer
    case $answer in
      y|Y)
      echo "Введите числовые параметры:"
      read -r a1 a2 a3 a4
      bash main.sh "$a1" "$a2" "$a3" "$a4";;
      *) echo "Ну нет так нет";;
    esac
else
  chmod +x script.sh
  bash ./script.sh "$1" "$2" "$3" "$4"
fi