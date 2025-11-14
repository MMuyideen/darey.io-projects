# Shell Scripting - Cloud Computing

## Objective
Our objective for the next series of projects is to advance your shell scripting skills while also integrating and utilizing cloud services. By focusing on the following 5 critical concepts, we aim to elevate your capabilities to a level where you can confidently navigate and harness the power of both shell scripting and cloud computing. This combination is not just about learning commands and services; it's about understanding how to leverage these tools in unison to build, deploy, and manage scalable, efficient, and robust systems in the cloud.
1. Functions
2. Arrays
3. Environment Variables
4. Command Line Arguments
5. Error Handling

Delivering the shell script based on a real world requirement.
## Background:
DataWise Solutions is a forward-thinking Data Science Consulting Company that specializes in deploying analytical and machine learning environments to support data-driven decision-making for its clients. Recognizing the need for agility and efficiency in setting up such environments, DataWise has decided to streamline its deployment process on AWS, focusing on simplicity and automation.
Scenario:
One of DataWise Solutions clients, a burgeoning e-commerce startup, is looking to harness the power of data science to analyze customer behavior and enhance their shopping experience. The startup wishes to deploy their data science workspace on AWS, utilizing EC2 instances for computational tasks and S3 buckets for storing their vast datasets of customer interactions.
Specific Requirements:
To meet the client's needs and ensure a practical learning experience, DataWise Solutions plans to develop a script that automates the setup of EC2 instances and S3 buckets. This script will incorporate the 5 critical shell scripting concepts previously identified:
1. Functions: Implement custom functions to modularize tasks like creating EC2 instances, configuring S3 buckets, and verifying deployment statuses.
2. Arrays: Use arrays to manage a list of resources created, ensuring easy tracking and manipulation.
3. Environment Variables: Leverage environment variables to store sensitive information like AWS credentials, region settings, and configuration parameters, enhancing script portability and security.
4. Command Line Arguments: Accept command line arguments to customize the script's behavior, such as specifying the EC2 instance type or S3 bucket name, allowing for dynamic and flexible deployments.
5. Error Handling: Implement robust error handling mechanisms to catch and respond to AWS service exceptions, ensuring the script can recover gracefully from failures.

The purpose of this project is to ensure that you understand the requirement. Your understanding doesn't have to be perfect at this stage. In the next project, we will begin proper implementation.

## REQUIREMENTS

# Shell Scripting - Cloud Computing

## Objective (concise)
Create a single, well-structured Bash automation script that provisions AWS EC2 instances and S3 buckets for a data‑science workspace while exercising 5 core shell-scripting concepts: Functions, Arrays, Environment Variables, Command-Line Arguments, and Error Handling.

## High-level requirement (what to build)
- One Bash script (or small set of modular scripts) that:
  - Creates one or more EC2 instances (configurable).
  - Creates/configures one or more S3 buckets (configurable).
  - Tracks created resource identifiers in arrays.
  - Uses environment variables for credentials/config defaults.
  - Accepts CLI arguments to control behavior (instance type, AMI, bucket name(s), region, counts, dry-run, force).
  - Provides robust error handling, retries, and rollback capability on failures.
  - Produces a final report (JSON/plain text) of created resources.

## Inputs & configuration
- Environment variables (recommended):
  - AWS_PROFILE, AWS_REGION, AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY (do not log secrets).
  - DEFAULT_AMI, DEFAULT_INSTANCE_TYPE, DEFAULT_KEY_NAME
- Command-line arguments (examples):
  - --region, --profile, --instance-type, --ami, --count, --bucket-prefix, --dry-run, --force, --rollback-on-fail

## Key design points mapped to skills
- Functions
  - create_ec2(), configure_instance(), create_s3_bucket(), verify_resource(), rollback(), log_error(), usage()
- Arrays
  - Keep arrays like CREATED_INSTANCES=(), CREATED_BUCKETS=() to accumulate IDs/names for reporting or rollback.
- Environment Variables
  - Read and validate env vars at start; allow CLI to override.
- Command-Line Arguments
  - Use getopts or manual parsing to provide defaults and validation.
- Error Handling
  - Check exit codes after each AWS CLI call; implement retry logic for transient errors; on fatal errors, run rollback() to clean created resources; exit with non-zero status and clear message.

## Safety, idempotency & logging
- Preconditions: AWS CLI v2 installed and configured; IAM principal with EC2/S3 permissions.
- Idempotency: detect existing buckets/instances by name/tags; skip or fail with --force to recreate.
- Logging: write actions to a timestamped logfile; optionally emit JSON summary.
- Dry-run option: simulate actions without making changes.

## Outputs / Deliverables
- Runnable Bash script(s) with:
  - Modular functions, array usage, env var support, CLI parsing, and error handling.
  - Unit-testable functions where practical (small integration harness or dry-run unit tests).
- README (this file) describing usage, env setup, and examples.
- Example run commands and sample output.

## Implementation plan (milestones)
1. Scaffold script: argument parsing, env validation, logging, usage banner. (short)
2. Implement S3 creation function + array tracking + basic error handling + tests (dry-run). (short)
3. Implement EC2 creation function + tag instances + array tracking + verify + tests. (short)
4. Add retry strategy, rollback(), idempotency checks, and --force handling. (short)
5. Integration testing, sample runs, finalize README and example outputs. (short)

## Example CLI usage
- ./deploy.sh --region us-east-1 --instance-type t3.medium --ami ami-0123456789abcdef0 --count 2 --bucket-prefix datawise-client-123 --dry-run

Success Criteria
I understand the script is successful when:

- It creates EC2 instances and S3 buckets without manual intervention
- It can be customized via command line arguments
- It securely handles AWS credentials via environment variables
- It tracks all created resources using arrays
- It handles failures gracefully with proper error messages and cleanup
- Different team members can use it in different AWS regions/accounts
- It provides clear feedback about what it's doing and whether it succeeded