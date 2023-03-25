#!/bin/bash

pth="$1"

echo "Total number of folders (including all nested ones) = $(sudo find "$pth" -mindepth 1 -type d | wc -l)"
echo "TOP 5 folders of maximum size arranged in descending order (path and size):"
sudo du -hS "$pth" | sort -hr | nl | awk '{printf "%d - %s, %sB\n", $1, $3, $2}' | head -5
echo "Total number of files = $(sudo find "$pth" -mindepth 1 -type f | wc -l)"
echo "Number of:"
echo "Configuration files (with the .conf extension) = $(sudo find "$pth" -type f -name '*.conf' | wc -l)"
echo "Text files = $(sudo find "$pth" -type f -exec file {} + | grep text | wc -l)"
echo "Executable files = $(sudo find "$pth" -type f -executable | wc -l)"
echo "Log files (with the extension .log) = $(sudo find "$pth" -type f -name '*.log' | wc -l)"
echo "Archive files = $(sudo find "$pth" -type f -exec file {} + | grep -E "compressed|archive"| wc -l)"
echo "Symbolic links = $(sudo find -L "$pth" -type f -exec file {} + | grep symbolic | wc -l)"
echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"
sudo find "$pth" -type f -exec du -hS {} + | sort -hr | nl | head | awk '{printf "%d - %s, %sB\n", $1, $3, $2}'
echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file) "
sudo find "$pth" -type f -executable -exec du -sh {} + | sort -hr | nl | head | awk '{cmd = "md5sum " $3; cmd|getline result; printf "%d - %s, %sB, %s\n", $1, $3, $2, result}' | awk '{print $1,$2,$3,$4,$5}'