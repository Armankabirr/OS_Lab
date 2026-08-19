#!/bin/bash

sentence=$1
character=$2
operator=$3

case $operator in
    c)
        count=$(grep -o "$character" <<< "$sentence" | wc -l)
        echo "Count: $count"
        ;;

    u)
        echo "$sentence" | tr '[:lower:]' '[:upper:]'
        ;;

    l)
        echo "$sentence" | tr '[:upper:]' '[:lower:]'
        ;;

    *)
        echo "Invalid Operation"
        ;;
esac