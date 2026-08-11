#!/usr/bin/env bash


if [ $# -lt 1 ] 
then
    echo "Usage: $0 <file1> <file2> ..."
    exit 1
fi

for file in "$@"; do
    if [ -f "$file" ]
    then 
        echo "file exists"
        if [ -x "$file" ]
        then
            echo "File $file is executable"
            ls -l "$file"
            echo "File $file's permission is now changing: "
            chmod -x "$file"
            ls -l "$file"
        else 
            echo "File $file is not executable"
        fi
    elif [ -e "$file" ]; then
        echo "File $file is not a regular file"
    else
        echo "File $file does not exist"
    fi
done