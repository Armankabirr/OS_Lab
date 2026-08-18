# Question8: Write a bash script to take a number n as a command line argument. 
#Write a function to check if the number is odd. 
#If yes, ask the user to enter his name and print it on the screen. 
#If not, ask the user to enter his PIN code and print the sum of the digits in the PIN.

# Try yourself! Btw, how to extract digits from a number? You can use mod(%) operation for that!

















num=943876
sum=0

while [ $num -ne 0 ]
do
    digit=$(($num%10))
    num=$(($num/10))
    ((sum+=$digit))
done

echo "Sum of digits: $sum"