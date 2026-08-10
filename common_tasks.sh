#!/bin/bash
# Copying files

source_file="$1"
destination_file="$2"

cp "$source_file" "$destination_file"
echo "File copied successfully."


#count lines in files passed as command line argument
for file in "$@"; do
  if [ -f "$file" ]; then
    echo "Counting lines in file: $file"
    line_count=$(wc -l < "$file")
    echo "Line count: $line_count"
  else
    echo "Invalid file: $file"
  fi
done


#delete empty directory
directory="$1"

find "$directory" -type d -empty -delete

echo "Empty directories removed successfully."


#rename file with numbers 
directory="$1"
prefix="$2"

counter=1

for file in "$directory"/*; do
  new_name="$directory/${prefix}${counter}.txt"
  mv "$file" "$new_name"
  ((counter++))
done

echo "Files renamed successfully."


#basic calculator, pass expression as arguments (bash test.sh 5 * 6)

num1=$1
operator=$2
num2=$3

calculate() {
    case $operator in
        "+")
            result=$((num1 + num2))
            ;;
        "-")
            result=$((num1 - num2))
            ;;
        "*")
            result=$((num1 * num2))
            ;;
        "/")
            result=$((num1 / num2))
            ;;
        *)
            echo "Invalid operator"
            return 1
            ;;
    esac

    return 0
}

# Call the function
calculate

# Capture the return value of the function
return_value=$?

if [ $return_value -eq 0 ]; then
    echo "Calculation succeeded. Result: $result"
else
    echo "Calculation failed."
fi



# Create a file and write content to it
touch "$1"
echo "Hello, SAN Peps!" > $1

# Display the content of the file
cat "$1"