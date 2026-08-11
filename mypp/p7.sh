# Question7: Write a bash script to take a number n as a command line argument. 
#Write a function to check whether that number is between 10 and 20 or not.
#If not, ask the user to enter a number between 10 and 20. 
#Then run a command inside the function to sleep the system to n seconds.

#!/usr/bin/env bash


fun(){
    if (( $1 >= 10 && $1 <= 20))
    then 
        num=$1
    else
        read -p "enter a number between 10 and 20 : " num
    fi

    echo "sleeping for $num sec"
    sleep $num
    echo "alive after $num sec"
}

fun "$1"