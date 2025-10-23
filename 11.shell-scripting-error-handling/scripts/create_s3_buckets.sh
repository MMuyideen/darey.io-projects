#!/bin/bash

# Function to create S3 buckets for different departments
create_s3_buckets() {
    company="dareyios"
    departments=("Marketing" "Sales" "HR" "Operations" "Media")
    region="us-east-1"

    for department in "${departments[@]}"; do
        # Convert department name to lowercase
        bucket_name="${company}-$(echo "$department" | tr '[:upper:]' '[:lower:]')-data-bucket"

        
        # Check if the bucket already exists
        if aws s3api head-bucket --bucket "$bucket_name" &>/dev/null; then
            echo "S3 bucket '$bucket_name' already exists."
        else
            # Create S3 bucket using AWS CLI
            aws s3api create-bucket --bucket "$bucket_name" --region $region
            if [ $? -eq 0 ]; then
                echo "S3 bucket '$bucket_name' created successfully."
            else
                echo "Failed to create S3 bucket '$bucket_name'."
            fi
        fi
    done
}

# Execute the function
create_s3_buckets
