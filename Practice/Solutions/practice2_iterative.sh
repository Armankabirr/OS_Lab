#!/bin/bash

find players -type f -name "*.txt" | while read -r file; do
    player_name=$(head -n 1 "$file")          # Player name (1st line)
    country=$(head -n 2 "$file" | tail -n 1)  # Country (2nd line)
    role=$(head -n 4 "$file" | tail -n 1)     # Role (4th line)
    
    destination="./$country/$role"
    mkdir -p "$destination"                   # -p flag creates parent directories as needed
    
    mv "$file" "$destination/$player_name.txt"
done

find players -type d -depth | while read -r dir; do   # -depth processes subdirectories from bottom up, e.g. leaves are processed before their parents
    is_empty=$(ls "$dir" | wc -l)         # Check if the directory is empty
    if [ "$is_empty" -eq 0 ]; then
        rm -r "$dir"
    fi
done
