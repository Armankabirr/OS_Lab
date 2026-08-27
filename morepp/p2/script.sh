#!/usr/bin/env bash

num=$1
pattern=$2

for file in *.txt 
do
  count=$(head -n "$num" "$file" | tail -n 1 | grep -w "$pattern" | wc -l)
  if [ $count -eq 1 ]
  then
    rm "$file"
    echo "$file removed"
   fi
done