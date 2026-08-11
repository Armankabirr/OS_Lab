# Question8: Write a bash script to take a number n as a command line argument. 
#Write a function to check if the number is odd. 
#If yes, ask the user to enter his name and print it on the screen. 
#If not, ask the user to enter his PIN code and print the sum of the digits in the PIN.

# Try yourself! Btw, how to extract digits from a number? You can use mod(%) operation for that! 

sum=0

fun(){
    if (( $1 % 2 == 0))
    then
        read -p "enter PIN code: " pin

        while [ $pin -ne 0 ]
        do
            digit=$(($pin%10))
            sum=$((sum+digit))
            pin=$(($pin/10))
        done
        echo "sum = $sum"

    else 
        read -p "enter his name : " name
        echo "name = $name"
    fi

}

fun "$1"
