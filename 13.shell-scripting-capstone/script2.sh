#!/bin/bash

# Multiplication Table Script
# 
read -p "Enter a number: " num

if [[ ! "$num" =~ ^[0-9]+$ ]]; then
    echo "Please enter a valid number."
    exit 1
fi

read -p "Do you want Full Table or Partial Table? (F/P): " choice

if [[ "$choice" != "F" && "$choice" != "f" && "$choice" != "P" && "$choice" != "p" ]]; then
    echo "Invalid choice. Please enter 'F' for Full Table or 'P' for Partial Table."
    exit 1
fi


if [[ "$choice" == "F" || "$choice" == "f" ]]; then
    echo "Full Multiplication Table for $num:"
elif [[ "$choice" == "P" || "$choice" == "p" ]]; then
    read -p "Enter start range for partial table: " start_range
    read -p "Enter end range for partial table: " end_range
    echo "Partial Multiplication Table (Even Multipliers) for $start_range...$end_range:"
fi


for i in {1..10}; do
    if [[ "$choice" == "F" || "$choice" == "f" ]]; then
        result=$((num * i))
        echo "$num x $i = $result"
    elif [[ "$choice" == "P" || "$choice" == "p" ]]; then
        if (( $start_range > $end_range )); then
            echo "Start range cannot be greater than end range."
            echo "Displaying full table instead:"
            for ((j=1; j<=10; j++)); do
                result=$((num * j))
                echo "$num x $j = $result"
            done
            break
        fi
        for ((j=start_range; j<=end_range; j++)); do
                result=$((num * j))
                echo "$num x $j = $result"
        done
        break
    else
        echo "Invalid choice. Please enter 'F' for Full Table or 'P' for Partial Table."
        break
    fi
done


