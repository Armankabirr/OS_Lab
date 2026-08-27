#Write a Bash script that accepts any number of marks (maximum 8) 
#as command-line arguments calculate the average, maximum and minimum number. 
#Also calculate the number of students that have passed the exam (mark ≥ 40)
#Example
#$ bash marks.sh 80 55 92 35 67

#Average : 65.8
#Highest : 92
#Lowest  : 35
#Passed  : 4

#!/usr/bin/env bash


max=0
min=10000
pass=0
count=0
sum=0


for i in "$@"
do  
    ((count++))
    if (( i >= 40 ))
    then 
        pass=$(( $pass + 1 ))
    fi

    sum=$(( $sum + $i ))

    if (( $i >= $max ))
    then
        max=$i
    fi

    if (( $i <= $min ))
    then
        min=$i
    fi
done
    avg=$( echo "scale=1; $sum/$count" | bc ) 
    echo "avg : $avg "
    echo "max : $max "
    echo "min : $min "
    echo "pass : $pass "
























# max=0
# min=1000
# avg=0
# pass=0
# sum=0

# for i in "$@";
# do
#     count=$(( count + 1 ))
#     if [ $i -ge 40 ]
#     then
#         pass=$(( $pass + 1 ))
#     fi

#     if [ $i -gt $max ]
#     then
#         max=$i
#     fi
#     if [ $i -lt $min ]
#     then 
#         min=$i
#     fi

#     sum=$(( sum + $i))

# done
# avg=$( echo "scale=1; $sum/$count" | bc )
# echo "avg : $avg "
# echo "max : $max "
# echo "min : $min "
# echo "pass : $pass "
