#Question1: Write a bash script to take a number n as command line argument.
#Write a function to accept the argument and check whether it is greater than 10. 
#If not, prompt the user to enter the number inside the function. 
#Then print all the even numbers till n and return their sum. Print the sum outside the function.

#!/usr/bin/env bash

sum=0

fun_check(){
    num=$1
    local_sum=0
    if (( num < 10 ))
    then
        read -p "Enter any number greater than 10:" num
    fi

    for ((i=0; i<=num; i+=2))
    do  
        if (( i <= num )) 
        then
            echo $i
            local_sum=$(( local_sum + i ))
        fi
    done

    sum=$local_sum

}

fun_check "$1"
echo "sum is $sum"