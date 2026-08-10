#Question1: Write a bash script to take a number n as command line argument.
#Write a function to accept the argument and check whether it is greater than 10. 
#If not, prompt the user to enter the number inside the function. 
#Then print all the even numbers till n and return their sum. Print the sum outside the function.

#!/usr/bin/env bash


sum=0
checker_funtion(){
    num=$1
    if [ $num -le 10 ]
    then 
       read -p "Enter any number greater than 10: " num
    fi 
    local_sum=0
    for ((i=0; i<$num; i+=2))
    do
      echo -n "$i "
      local_sum=$((local_sum+i))
    done
    sum=$local_sum
}

checker_funtion "$1"

echo -e "\nSum: $sum"

#run on terminal: bash qn1.sh 15

#run on terminal: bash qn1.sh 5
#Enter any number greater than 10: 28