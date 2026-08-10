# Question2: Write a bash script to take a number n as command line argument. 
#Write a function to accept the argument and check whether the number is a prime or not. 
#If yes, return the number, else return 0 and print it outside the function.

#!/usr/bin/env bash

prime=true
is_prime(){
    sqrt=$(echo "sqrt($1)" | bc)
    # echo $sqrt
    if [ $1 -le 1 ]; then # 0,1 are prime
        return
    fi
    for ((i=2; i<=$sqrt; i++)) #checking upto the sqrt of number
    do
        if [ $(($1 % $i)) -eq 0 ]; then
            prime=false
        fi
    done
}

is_prime "$1"

$prime && echo "The number is prime" || echo "The number is not prime"

#run on terminal: bash qn2.sh 40
#run on terminal: bash qn2.sh 17