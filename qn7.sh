# Question7: Write a bash script to take a number n as a command line argument. 
#Write a function to check whether that number is between 10 and 20 or not.
#If not, ask the user to enter a number between 10 and 20. 
#Then run a command inside the function to sleep the system to n seconds.

#!/usr/bin/env bash

# Try it yourself! For making the system sleep use sleep time[suffix]
# suffix can be: s (seconds), m (minutes), h (hours), d (days), by default s(seconds)
# example use is shown here

echo "Before sleep"
sleep 0.1m 
echo "After sleeping for 0.1m or 6 seconds"
echo "Going for another 5 seconds nap!"
sleep 5
echo "Alive again!..."

