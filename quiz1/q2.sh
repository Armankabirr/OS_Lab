#!/usr/bin/env bash


count=0

for file in *; do
    if [[ -f "$file" ]]; 
        then
        name=$(basename "$file")
        if [[ "$file" == *.sh ]]; 
            then
            echo "$name is a Shell Script"
            ((count++))
        else
            echo "$name is a Regular File"
        fi
    fi
done

echo "Total shell scripts: $count"