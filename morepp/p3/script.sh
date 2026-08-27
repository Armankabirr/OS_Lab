#!/usr/bin/env bash


for file in *
do
    if [[ "$file" =~ [0-9] ]]
    then
        rm "$file"
        echo "$file removed"
    fi
done