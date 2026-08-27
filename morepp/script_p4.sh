

#!/usr/bin/env bash

find . -type f -name "*.cpp" | while read file;
do  
    new_file="${file/.cpp/.c}"    
    mv "$file" "$new_file"
done
