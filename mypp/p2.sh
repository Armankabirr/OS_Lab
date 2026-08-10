#!/usr/bin/env bash

prime=true

is_peime(){
    sqrt=$(echo "sqrt($1)" | bc )

    if(($1 < 1))
    then    
        return
    fi

    for ((i=2; i<=sqrt; i++))
    do
        if (( $1 % i == 0 ))
        then
            prime=false
        fi
    done
}

is_peime "$1"

$prime && echo "The number is prime" || echo "The number is not prime"