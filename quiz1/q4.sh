#!/usr/bin/env bash


if [ ! -f "inventory.txt" ]; then
    echo "Error: inventory.txt does not exist."
    exit 1
fi

total=0
min=""
max=""


while IFS=',' read -r item quantity price
do

    [ -z "$item" ] && continue

    total=$((total + quantity))

    if [ -z "$min" ] || [ "$quantity" -lt "$min" ]; then
        min=$quantity
    fi

    if [ -z "$max" ] || [ "$quantity" -gt "$max" ]; then
        max=$quantity
    fi
done < inventory.txt


if [ "$total" -lt 50 ]; then
    status="Low Stock"
elif [ "$total" -le 150 ]; then
    status="Moderate Stock"
else
    status="Well Stocked"
fi


echo "Total number of items: $total"
echo "Lowest stock count: $min"
echo "Highest stock count: $max"
echo "Stock Status: $status"