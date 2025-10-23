#!/usr/bin/env bash

delete_s3_buckets() {
    company="dareyios"
    region="us-east-1"  # Update this to your region
    departments=("Marketing" "Sales" "HR" "Operations" "Media")

    for department in "${departments[@]}"; do
        # Convert department name to lowercase (cross-shell compatible)
        bucket_name="${company}-$(echo "$department" | tr '[:upper:]' '[:lower:]')-data-bucket"

        echo "🔍 Checking for bucket: $bucket_name ..."

        # Check if the bucket exists
        if aws s3api head-bucket --bucket "$bucket_name" 2>/dev/null; then
            echo "🗑️ Deleting bucket: $bucket_name ..."
            # Remove all contents first, then delete the bucket
            aws s3 rm "s3://$bucket_name" --recursive --region "$region"
            if aws s3api delete-bucket --bucket "$bucket_name" --region "$region"; then
                echo "✅ Bucket '$bucket_name' deleted successfully."
            else
                echo "❌ Failed to delete bucket '$bucket_name'."
            fi
        else
            echo "⚠️ Bucket '$bucket_name' does not exist."
        fi

        echo "--------------------------------------------"
    done
}

# Run the function
delete_s3_buckets
