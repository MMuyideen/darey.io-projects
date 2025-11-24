#!/bin/bash

# # Initialize environment variable
# # ENVIRONMENT="testing"

# ENVIRONMENT=$1
# NUMBER_OF_INSTANCES=$2

# # Checking and acting on the environment variable
# if [ "$ENVIRONMENT" == "local" ]; then
# echo "Running script for Local Environment..."
# # Commands for local environment
# elif [ "$ENVIRONMENT" == "testing" ]; then
# echo "Running script for Testing Environment..."
# # Commands for testing environment
# elif [ "$ENVIRONMENT" == "production" ]; then
# echo "Running script for Production Environment..."
# # Commands for production environment
# else
# echo "No environment specified or recognized."
# exit 2
# fi

#----------------------------------------
#  Final Script with Argument Count Check
#----------------------------------------


# Checking the number of arguments
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <environment>"
    exit 1
fi

# Accessing the first argument
ENVIRONMENT=$1

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