# Mini Project: Error Handling in Shell Scripting

## Overview
This project demonstrates robust error handling techniques in shell scripting for AWS infrastructure automation. As a system administrator managing cloud resources, implementing proper error handling ensures scripts are idempotent, reliable, and production-ready.

---

## Prerequisites: AWS CLI Setup and Configuration

### Step 1: [Install AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

#### For Ubuntu/Debian Linux:
```bash
# Update package index
sudo apt update

# Install AWS CLI
sudo apt install awscli -y

# Verify installation
aws --version
```

**Expected output:**
```
aws-cli/2.x.x Python/3.x.x Linux/x.x.x-x-generic
```

#### For Amazon Linux/RedHat/CentOS:
```bash
# Install AWS CLI
sudo yum install awscli -y

# Verify installation
aws --version
```

#### For macOS:
```bash
# Using Homebrew
brew install awscli

# Verify installation
aws --version
```

#### For Windows:
```powershell
# Download and run the MSI installer from:
# https://awscli.amazonaws.com/AWSCLIV2.msi

# Or using Chocolatey
choco install awscli

# Verify installation in PowerShell
aws --version
```

#### Alternative: Install Latest Version (All Platforms)
```bash
# Download the installer
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

# Unzip the installer
unzip awscliv2.zip

# Run the installer
sudo ./aws/install

# Verify installation
aws --version

# Clean up
rm -rf aws awscliv2.zip
```

![Cli version](./images/01.cli-version.png)
---

### Step 2: Create AWS Account and IAM User

#### 2.1 Create AWS Account or Login to existing account
1. Visit [https://aws.amazon.com](https://aws.amazon.com)
2. Click **"Create an AWS Account"**
3. Follow the registration process:
   - Enter email address and account name
   - Provide contact information
   - Add payment method (required, but free tier available)
   - Verify phone number
   - Select support plan (Basic - Free)

#### 2.2 Create IAM User with Programmatic Access

> 💡 **Important:** Never use root account credentials for AWS CLI. Always create an IAM user.

1. **Sign in to AWS Console:**
   - Go to [https://console.aws.amazon.com](https://console.aws.amazon.com)
   - Sign in with your root account credentials

2. **Navigate to IAM Service:**
   - In the AWS Console search bar, type **"IAM"**
   - Click on **"IAM"** (Identity and Access Management)

3. **Create New IAM User:**
```
   IAM Dashboard → Users → Create user
```
   
   - **Step 1: Specify user details**
     - User name: `cli-admin` (or your preferred name)
     - Click **"Next"**
   
   - **Step 2: Set permissions**
     - Select: **"Attach policies directly"**
     - Search and select: **"AdministratorAccess"** (for full access)
     - Click **"Next"**
   
   - **Step 3: Review and create**
     - Review the configuration
     - Click **"Create user"**

4. **Create Access Keys:**
```
   IAM → Users → [Your Username] → Security credentials → Create access key
```
   
   - **Step 1: Access key best practices**
     - Select: **"Command Line Interface (CLI)"**
     - Check: **"I understand the above recommendation"**
     - Click **"Next"**
   
   - **Step 2: Set description tag (optional)**
     - Description: `CLI access for automation scripts`
     - Click **"Create access key"**
   
   - **Step 3: Retrieve access keys**
     - **CRITICAL:** This is your only chance to see the secret key!
     - **Access Key ID:** AKIAIOSFODNN7EXAMPLE
     - **Secret Access Key:** wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
     - Click **"Download .csv file"** (recommended)
     - Store securely - treat like passwords!

**Security Best Practice:**
```bash
# Store credentials file securely
chmod 600 ~/Downloads/credentials.csv

# Never commit credentials to git
echo "*.csv" >> ~/.gitignore
echo "credentials*" >> ~/.gitignore
```
![Secret-key](./images/02.secret-key.png)
---

### Step 3: Configure AWS CLI

#### Method 1: Interactive Configuration (Recommended)
```bash
aws configure
```

**You will be prompted for:**
```
AWS Access Key ID [None]: AKIAIOSFODNN7EXAMPLE
AWS Secret Access Key [None]: wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
Default region name [None]: us-east-1
Default output format [None]: json
```

#### Method 2: Environment Variables
```bash
# Set credentials as environment variables
export AWS_ACCESS_KEY_ID=AKIAIOSFODNN7EXAMPLE
export AWS_SECRET_ACCESS_KEY=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
export AWS_DEFAULT_REGION=us-east-1

# Verify
echo $AWS_ACCESS_KEY_ID
```

![aws-configure](./images/03.cli-configure.png)
---

### Step 4 Script Implementation
The bash script can be found [here](./scripts/create_s3_buckets.sh)

```bash
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

```

- Create the script file - `vi create_s3_buckets.sh`
- make the script executable - `chmod +x create_s3_buckets.sh`
- run the script - `./create_s3_buckets.sh`

![Run script](./images/04.run-script.png)

### Error Handling

We test the error handling in the script by running the script the script again - `./create_s3_buckets.sh`

We should get errors that the buckets already exists

![Error](./images/05.error-handling.png)

---


### Optional task - Delete the buckets

It is a good practice to delete the buckets to avoid incurring unwanted costs.

I created a script to delete the buckets [here](./scripts/delete_s3_buckets.sh)

```bash
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
```

![Delete buckets](./images/06.delete-buckets.png)

---

## Learning Summary

Throughout this mini project, I learned that effective error handling in shell scripting is the cornerstone of reliable DevOps automation. The three-phase approach—**anticipation** (identifying potential failures), **detection** (using exit status codes and conditional checks), and **response** (providing actionable error messages)—transforms fragile scripts into production-grade tools. 

In real-world scenarios, system administrators frequently face situations where automation scripts execute multiple times through cron jobs or CI/CD pipelines. Without proper error handling, attempting to create duplicate AWS resources like S3 buckets or EC2 instances causes script failures that halt critical workflows. By implementing resource existence checks, exit status validation (`$?`), and informative logging, scripts become idempotent and can safely run repeatedly without unintended consequences. This approach is essential for tasks like employee onboarding automation, disaster recovery procedures, and infrastructure provisioning, where reliability and predictability are non-negotiable requirements for maintaining business continuity.



