# Question6: Write a bash script to take a number n as command line argument. Write a function to check whether the number is greater than 0 or not. If not, then ask the user to enter a value greater than 0. Then write a command inside the function to show the first n files inside the current directory in increasing order of the file size.

#!/usr/bin/env bash

num=$1
if [ $num -le 0 ]
then 
    read -p "Enter number great than 0: " num
fi

counter=0
list_of_files=$(ls -rS)           # ~ refers to home, -S for sorting based on size, -r for reversing the order (by default sorted in decreasing order)

for i in $list_of_files
do
    echo $i
    ((counter++))
    if [ $counter -ge $num ]; then
        break
    fi
done 

# now try to do the same using functions!
# Try to list first n files of home directory!


#run of terminal: bash qn6.sh 2