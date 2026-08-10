# Question3: Write a bash script to take a number n as command line argument. 
#Write a function to accept the argument and check whether the number is divisible by 10. 
#If yes, count the number of even number less than n and return else count the odd numbers less than n and return.


#!/usr/bin/env bash

count=0

counter(){
    num=$1;
    
    if (( num % 10 == 0))
    then
        for (( i=0; i<num; i+=2))
        do
            count=$((count+=1))
            echo "num = $i "
        done
    else
        for (( i=1; i<num; i+=2))
        do
            count=$((count+=1))
            echo "num = $i "
        done
    fi
}

counter "$1"

echo " "
echo "count = $count "