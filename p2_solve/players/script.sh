#!/usr/bin/env bash


find . -type f -name "*.txt" | while read -r file; do
    player_name=$(head -1 "$file")
    Country=$(head -2 "$file" | tail -1)
    Role=$(head -4 "$file" | tail -1)

    destination="./$Country/$Role"
    mkdir -p "$destination"
    mv "$file" "$destination/$player_name.txt"

done



find . -depth -type d | while read -r dir; do
    is_empty=$(ls -A "$dir"|wc -l)
    if [ $is_empty -eq 0 ]
    then
    rm -r "$dir"
    fi
done