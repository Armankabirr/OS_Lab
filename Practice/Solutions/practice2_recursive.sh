#!/bin/bash

traverse() {
    for item in "$1"/*; do  # $1/* gives the list of everything inside the $1 directory, similar to doing ls
        if [ -d "$item" ]; then
            traverse "$item"    # if $item is a directory, recurse into it
        else
            player_name=$(head -n 1 "$item")            # Player name (1st line)
            country=$(head -n 2 "$item" | tail -n 1)    # Country (2nd line)
            role=$(head -n 4 "$item" | tail -n 1)       # Role (4th line)

            dest="./$country/$role"
            mkdir -p "$dest"                            # -p flag creates parent directories as needed 
            mv "$item" "$dest/$player_name.txt"
        fi
    done
}

traverse "players"

traverse_delete() {
    for item in "$1"/*; do
        is_empty=$(ls "$1" | wc -l)         # returns the count of items in the directory

        if [ "$is_empty" -eq 0 ]; then      # if count is 0, directory is empty, remove it
            rmdir "$1"
        elif [ -d "$item" ]; then           # if $item is a directory, recurse into it
            traverse_delete "$item"
        fi
    done
}

traverse_delete "players"

