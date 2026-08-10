# Question3: Write a bash script to take a number n as command line argument. 
#Write a function to accept the argument and check whether the number is divisible by 10. 
#If yes, count the number of even number less than n and return else count the odd numbers less than n and return.


#!/usr/bin/env bash



check_number(){
    if [ $(($1 % 10)) -eq 0 ]
    then
        echo "Printing even numbers: "
        for ((i=0; i<$1; i+=2))
        do
            echo -n "$i "
        done
    else
        echo "Printing odd numbers: "
        for ((i=1; i<$1; i+=2))
        do 
            echo -n "$i "
        done
    fi
}


check_number $1
echo ""

#run on terminal: bash qn3.sh 40
#run on terminal: bash qn3.sh 15