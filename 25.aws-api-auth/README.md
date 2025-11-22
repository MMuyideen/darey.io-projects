# Setting Up Secure Authentication to AWS API

Following the requirement detailed in the previous project, the initial step in crafting our script is to ensure we have the necessary AWS account setup for authentication and resource management in the cloud. This setup is crucial for enabling the script to create EC2 instances and S3 buckets efficiently. Here's how to proceed:

1. **Create an IAM Role**: Begin by establishing an IAM role that encapsulates the permissions required for the operations our script will perform.

    ![Create Role](./images/01.create%20role.png)

2. **Create an IAM Policy**: Design an IAM policy granting full access to both EC2 and S3 services. This policy ensures our script has the necessary permissions to manage these resources.

    ![Create Policy](./images/./02.create-policy.png)

3. **Create an IAM User**: Instantiate an IAM user named `automation_user`. This user will serve as the primary entity our script uses to interact with AWS services.

    ![Create User](./images/03.create-user.png)


4. **Attach the IAM Policy to the User**: Ensure that the automation_user is explicitly granted the permissions defined in our IAM policy by attaching the policy directly to the user. This attachment solidifies the user's access to EC2 and S3 resources.

    ![Attach Policy](./images/04.attach-policy.png)

4. **Assign the User to the IAM Role**: Link the `automation_user` to the previously created IAM role to inherit its permissions. This step is vital for enabling the necessary access levels for our automation tasks.

    ![Assign role](./images/05.attach-role-user.png)

6. **Create Programmatic Access Credentials**: Generate programmatic access credentials — specifically, an access key ID and a secret access key for automation_user. These credentials are indispensable for authenticating our script with the AWS API through the Linux terminal, allowing it to create and manage cloud resources programmatically.

    ![Create Programmatic access](./images/06.create-programmatic-access.png)

## Installing and Configuring the AWS CLI
After setting up vour AWS account and creating the necessary IAM user and permissions, the next step involves installing the AWS Command Line Interface (CLI).

### Downloading and Installing AWS CLI
**On Linux**

1. Download the AWS CLI version 2 installation file for Linux

```bash
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2. zip"
```

2. Uzip the installer

```bash
unzip awscliv2.zip
```

3. Run the installer

```bash
sudo ./aws/install
```

**On Windows:**

1. Download the Installer:
    - Visit the official [AWS CLI version 2](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html#getting-started-install-instructions) download page and [download the MSI installer for Windows](https://awscli.amazonaws.com/AWSCLIV2.msi).

2. Run the Installer:
    - Execute the downloaded MSI installer and follow the on-screen instructions to complete the installation.
3. Verify Installation:
    - Open the Command Prompt and type `aws --version` to ensure the CLI is installed correctly. You should see the version of the AWS CLI displayed.


**On macOS**:

1. In your browser, download the [macOS pkg file](https://awscli.amazonaws.com/AWSCLIV2.pkg)

2. Run your downloaded file and follow the on-screen instructions.
    - The installer automatically creates a [symlink](https://www.youtube.com/watch?v=mA08E59-zo8) at `/usr/local/bin/aws` that links to the main program in the installation folder you chose.

3. Verify Installation:
    - In your Terminal, type `aws --version` to check if the installation was successful. You should see the AWS CLI version information.

    ![AWS Version](./images/07.aws-version.png)

### Configuring the AWS CLI

Once the AWS CLI is installed, the next step is to configure it to use the **access key ID** and **secret access key** generated for your **automation_user**. This will authenticate your CLI (Command Line Interface) requests to the AWS API.

#### Understanding APIs

Before proceeding further, it's essential to understand what an API (Application Programming Interface) is and its relevance here. An API is a set of protocols and tools that allows different software applications to communicate with each other. In the context of AWS, the AWS API enables your scripts or the AWS CLI to interact with AWS services programmatically. This means you can create, modify, and delete AWS resources by making API calls, which are just structured requests that the AWS platform can understand and act upon.

#### Configurating AWS CLI for access to AWS:

Open your terminal or Command Prompt and enter:

```bash
aws configure
```

This command initiates the setup process for your AWS CLI installation.

**Enter Your Credentials:**

When prompted, enter the `AWS Access Key ID` and `AWS Secret Access Key` for the `automation_user`. Ensure these are kept secure and are not shared.

Next, specify the Default **region** name and **Default output** format. The region should match the one you plan to deploy resources in, and a common output format is **json**.

#### Testing the Configuration:

To verify that your AWS CLI is configured correctly and can communicate with AWS services, try running a basic command to list all the AWS regions:

```bash
aws ec2 describe-regions --output table
```

This command queries the EC2 service for a list of all regions and formats the output as a table, which makes it easy to read. You will receive a list of regions.

![AWS Regions](./images/08.aws-regions.png)

## Learning Summary

**Objective**: authenticate and operate AWS via CLI to enable programmatic access to resources (EC2, S3) from the terminal.

### Key takeaways:
- AWS CLI performs signed API calls; valid credentials are required.
- Credentials come from env vars, profiles, instance roles, or SSO — prefer roles/profiles over hard-coded secrets.
- Security: least-privilege, key rotation, MFA, and avoiding committing secrets are essential.
