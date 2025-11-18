#!/bin/bash
# Delete EC2 instances and S3 buckets (fixed: departments variable typo, region handling, checks)

ENVIRONMENT=$1

check_num_of_args() {
    if [ "$#" -ne 1 ]; then
        echo "Usage: $0 <environment>"
        exit 1
    fi
}

activate_infra_environment() {
    case "$ENVIRONMENT" in
        local) echo "Deleting resources for LOCAL environment...";;
        testing) echo "Deleting resources for TESTING environment...";;
        production) echo "Deleting resources for PRODUCTION environment...";;
        *) echo "Invalid environment. Use: local | testing | production"; exit 2;;
    esac
}

check_aws_cli() {
    if ! command -v aws &> /dev/null; then
        echo "AWS CLI not installed. Aborting."
        exit 3
    fi
}

check_aws_profile() {
    if [ -z "${AWS_PROFILE:-}" ] && [ -z "${AWS_ACCESS_KEY_ID:-}" ]; then
        echo "AWS_PROFILE or AWS_ACCESS_KEY_ID not set. Please configure AWS credentials."
        exit 4
    fi
}

delete_ec2_instances() {
    region="us-west-2"

    echo "Fetching EC2 instance IDs..."
    INSTANCE_IDS=$(aws ec2 describe-instances \
        --region "$region" \
        --filters Name=instance-state-name,Values=running Name=instance-type,Values=t3.micro \
        --query "Reservations[*].Instances[*].InstanceId" \
        --output text)

    if [ -z "$INSTANCE_IDS" ]; then
        echo "No EC2 instances found to delete."
        return 0
    fi

    echo "Terminating EC2 instances: $INSTANCE_IDS"
    if aws ec2 terminate-instances --instance-ids $INSTANCE_IDS --region "$region"; then
        echo "EC2 instances terminated successfully."
    else
        echo "Failed to terminate EC2 instances."
    fi
}

delete_s3_buckets() {
    company="dareyios"
    departments=("marketing" "sales" "hr" "operations" "media")
    region="us-west-2"

    echo "Deleting S3 buckets..."
    for department in "${departments[@]}"; do
        bucket_name="${company}-${department}-data-bucket"
        echo "Processing bucket: $bucket_name"

        # Check if bucket exists
        if ! aws s3api head-bucket --bucket "$bucket_name" --region "$region" 2>/dev/null; then
            echo "Bucket '$bucket_name' does not exist or is not accessible. Skipping."
            continue
        fi

        echo "Emptying bucket: $bucket_name"
        aws s3 rm "s3://$bucket_name" --recursive

        echo "Deleting bucket: $bucket_name"
        if aws s3api delete-bucket --bucket "$bucket_name" --region "$region"; then
            echo "Bucket '$bucket_name' deleted."
        else
            echo "Failed to delete '$bucket_name'."
        fi
    done
}

check_num_of_args "$#"
activate_infra_environment
check_aws_cli
check_aws_profile
delete_ec2_instances
delete_s3_buckets

aws ec2 describe-instances \
    --region "us-west-2" \
    --filters Name=instance-state-name,Values=running Name=instance-type,Values=t3.micro \
    --query "Reservations[*].Instances[*].InstanceId" \
    --output text
