# Question4: Write a bash script to take a file name, e.g. xyz.txt as command line argument. 
#Write a function to check whether the file exists in the system. If yes, 
#ask the user to enter a different file name. Then ask the user to enter a 
#location and create the file in that location.

#!/usr/bin/env bash

cheak_and_create(){
    file=$1
    if [ -f $file ]
    then 
        echo "This Fie exists!"
        read -p "Enter a different file name: " file
    fi
    read -p "Enter a location to create the file: " directory
    mkdir -p "$directory"
    cd "$directory"
    touch "$file"
    echo "File created!!"
}


cheak_and_create "$1"

#run of terminal: bash qn4.sh "xyz.txt"
# Enter a location to create the file: MyFolder/NewFolder

#run of terminal: bash qn4.sh "qn4.sh"
# This Fie exists!
# Enter a different file name: abc.txt
# Enter a location to create the file: NewFolder
