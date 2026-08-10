# Question6: Write a bash script to take a number n as command line argument. 
#Write a function to check whether the number is greater than 0 or not. 
#If not, then ask the user to enter a value greater than 0. 
#Then write a command inside the function to show the first n files inside the current directory 
#in increasing order of the file size.

#!/usr/bin/env bash


check(){
    if [ $1 -gt 0 ]
    then
        num=$1

    else
        read -p "enter a value greater than 0 : " num
    fi

    ls -Sr | head -n "$num"
}
check "$1"