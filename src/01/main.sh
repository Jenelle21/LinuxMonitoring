#!/bin/bash

if [ "$#" -ne 1 ]; then
        echo "Должен быть один аргумент"
else
        chmod +x script.sh
        bash ./script.sh "$1"
fi