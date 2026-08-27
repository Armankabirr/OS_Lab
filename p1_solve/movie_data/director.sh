#!/usr/bin/env bash


for file in *.txt;
do 
   director=$(tail -2 "$file" | head -1)

   if [ ! -d "$director" ]
        then 
            mkdir "$director"
        fi

   mv "$file" "$director/"
done