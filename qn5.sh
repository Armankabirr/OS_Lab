# Question5: Write a bash script to ask the user for a file name and a text. 
#Check whether the pattern exists in the file in the function.

#!/usr/bin/env bash

read -p "Enter file name: " file
read -p "Enter text: " pattern

if [ $(grep $pattern $file | wc -l) -gt 0 ]
then 
    echo "Patteen Exists"
else
    echo "Pattern does not Exist!"
fi


# run in terminal: bash qn5.sh
# Enter file name: qn4.sh
# Enter text: terminal

# run in terminal: bash qn5.sh
# Enter file name: qn4.sh
# Enter text: pattern
