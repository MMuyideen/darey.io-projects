#!/bin/bash

# Environment variables
ENVIRONMENT=$1

# Function to check number of arguments
check_num_of_args() {
    # Checking the number of arguments
    if [ "$#" -eq 0 ]; then
        echo "Usage: $0 <environment>"
        exit 1
    fi
}

# Function to activate environment based on argument
activate_infra_environment() {
    # Acting based on the argument value
    if [ "$ENVIRONMENT" == "local" ]; then
        echo "Running script for Local Environment..."
    elif [ "$ENVIRONMENT" == "testing" ]; then
        echo "Running script for Testing Environment..."
    elif [ "$ENVIRONMENT" == "production" ]; then
        echo "Running script for Production Environment..."
    else
        echo "Invalid environment specified. Please use 'local', 'testing', or 'production'."
        exit 2
    fi
}

# Function to check if AWS CLI is installed
check_aws_cli() {
    if ! command -v aws &> /dev/null; then
        echo "AWS CLI is not installed. Please install it before proceeding."
        return 1
    fi
}

# Function to check if AWS profile is set
check_aws_profile() {
    if [ -z "$AWS_PROFILE" ]; then
        echo "AWS profile environment variable is not set." >&2
        # Return error if AWS_PROFILE is not set
        return 1
    fi
    # AWS_PROFILE is set, return success
    return 0
}

# Run functions
check_num_of_args "$@"
activate_infra_environment
check_aws_cli
check_aws_profile
