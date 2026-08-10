# Question5: Write a bash script to ask the user for a file name and a text. 
#Check whether the pattern exists in the file in the function.

#!/usr/bin/env bash

check(){
    file=$1
    text=$2
    if [ $(grep -i "$text" "$file" | wc -l) -gt 0 ] 
    then
        echo "pattern exists"
    else
        echo "pattern do not exists"
    fi
}

check "$1" " $2"