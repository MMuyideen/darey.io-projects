#!/bin/bash

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