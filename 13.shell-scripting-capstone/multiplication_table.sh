#!/bin/bash

# Function to validate number input
validate_number() {
    if [[ ! $1 =~ ^[0-9]+$ ]]; then
        echo "Error: Please enter a valid number."
        exit 1
    fi
}

# Function to validate range
validate_range() {
    local start=$1
    local end=$2
    
    if [[ $start -gt $end ]]; then
        echo "Invalid range. Start number cannot be greater than end number."
        return 1
    fi
    
    if [[ $start -lt 1 || $end -gt 10 ]]; then
        echo "Invalid range. Numbers must be between 1 and 10."
        return 1
    fi
    
    return 0
}

# Function to print multiplication table using list form loop
print_table_list_form() {
    local number=$1
    local start=$2
    local end=$3
    
    echo "Multiplication table for $number (using list form loop):"
    if [[ $start -gt $end ]]; then
        # Handle descending order with seq
        for i in $(seq $start -1 $end); do
            result=$((number * i))
            echo "$number x $i = $result"
        done
    else
        # Handle ascending order
        for i in $(seq $start $end); do
            result=$((number * i))
            echo "$number x $i = $result"
        done
    fi
    echo
}

# Function to print multiplication table using C-style loop
print_table_c_style() {
    local number=$1
    local start=$2
    local end=$3
    
    echo "Multiplication table for $number (using C-style loop):"
    if [[ $start -gt $end ]]; then
        # Handle descending order
        for ((i=start; i>=end; i--)); do
            result=$((number * i))
            echo "$number x $i = $result"
        done
    else
        # Handle ascending order
        for ((i=start; i<=end; i++)); do
            result=$((number * i))
            echo "$number x $i = $result"
        done
    fi
    echo
}

# Main script starts here
echo "Welcome to the Multiplication Table Generator!"

# Get the number from user
while true; do
    read -p "Enter a number for the multiplication table: " number
    if validate_number "$number"; then
        break
    fi
done

# # Ask for table type
while true; do
    read -p "Do you want a full table or a partial table? (Enter 'f' for full, 'p' for partial): " choice
    case $choice in
        [Ff])
            start=1
            end=10
            break
            ;;
        [Pp])
            while true; do
                read -p "Enter the starting number (between 1 and 10): " start
                read -p "Enter the ending number (between 1 and 10): " end
                
                if validate_number "$start" && validate_number "$end"; then
                    if validate_range "$start" "$end"; then
                        break
                    else
                        echo "Using full table instead."
                        start=1
                        end=10
                        break
                    fi
                fi
            done
            break
            ;;
        *)
            echo "Invalid choice. Please enter 'f' for full or 'p' for partial."
            ;;
    esac
done



# Ask for table order
while true; do
    read -p "Do you want the table in ascending or descending order? (a/d): " order
    case $order in
        [Aa])
            print_table_list_form $number $start $end
            print_table_c_style $number $start $end
            break
            ;;
        [Dd])
            print_table_list_form $number $end $start
            print_table_c_style $number $end $start
            break
            ;;
        *)
            echo "Invalid choice. Please enter 'a' for ascending or 'd' for descending."
            ;;
    esac
done

# Ask if user wants to try another number
while true; do
    read -p "Would you like to try another number? (y/n): " again
    case $again in
        [Yy])
            exec $0
            ;;
        [Nn])
            echo "Thank you for using the Multiplication Table Generator!"
            exit 0
            ;;
        *)
            echo "Invalid choice. Please enter 'y' for yes or 'n' for no."
            ;;
    esac
done