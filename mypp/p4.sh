# Question4: Write a bash script to take a file name, e.g. xyz.txt as command line argument. 
#Write a function to check whether the file exists in the system. If yes, 
#ask the user to enter a different file name. Then ask the user to enter a 
#location and create the file in that location.


# Operator | Meaning                      |
# -------- | ---------------------------- |
# `-e`     | Exists                       |
# `-f`     | Exists and is a regular file |
# `-d`     | Exists and is a directory    |
# `-r`     | File is readable             |
# `-w`     | File is writable             |
# `-x`     | File is executable           |


#!/usr/bin/env bash


check_create(){
    if [ -e $1 ]
    then
        echo "file exists"
        read -p "enter a different file name: " file
    else
        file="$1"
    fi
    read -p "location: " directory
    mkdir -p "$directory"
    cd "$directory"
    touch "$file"
    echo "File created!!"
}

check_create "$1"

