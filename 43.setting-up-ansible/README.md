# Setting up Ansible on a Linux Server

### Introduction
Ansible is a powerful automation tool that simplifies the management of IT infrastructure. Setting up Ansible on a Linux server is the first step toward leveraging its capabilities. This project will guide you through installing and configuring Ansible on a Linux server, allowing you to automate tasks and manage servers effectively.

### Objectives
1. Understand what Ansible is and how it works.
2. Install and configure Ansible on a Linux control node.
3. Set up SSH key-based authentication for target nodes.
4. Create an Ansible inventory file.
5. Verify Ansible setup by running basic commands.

### Prerequisites
1. **Linux Machine**: A Linux server or virtual machine to act as the control node.
2. **Target Machine(s)**: At least one additional Linux server or virtual machine for Ansible to manage.
3. **SSH Access**: Access to target nodes with SSH.
4. **Tools**: Basic knowledge of the Linux command line and a text editor.

### Tasks Outline
1. Install Ansible on the control node.
2. Configure SSH key-based authentication.
3. Create an inventory file for target machine(s).
4. Test Ansible connectivity to target machine(s).
5. Run a simple Ansible ad-hoc command.

## Project Tasks

### Task 1 - Install Ansible on the Control Node

1. Update the package repository: ```sudo apt update```
2. Install Ansible: ```sudo apt install ansible -y```
3. Verify the installation: ```ansible --version```

The output should display the installed Ansible version like this

![Ansible install]()

### Task 2 - Configure SSH Key-Based Authentication
1. Generate an SSH key pair on the control node: ```ssh-keygen -t rsa```
    - Press `Enter` to accept the default path and passphrase.
2. Copy the public key to the target machine(s): ```ssh-copy-id user@<target-server-ip>```
3. Test SSH access without a password: ```ssh user@ target-server-ip>```

![test connect]()

You have now successfully configured a passwordless SSH access.

### Task 3 - Create an Inventory File
1. Create a directory for Ansible configuration: 
```bash
mkdir ~/ansible 
cd ~/ansible
```
2. Create an inventory file: ```nano inventory.ini```
3. Add target machine details to the inventory:
```txt
[linux_servers]
target1 ansible_host=<target1-ip> ansible_user=<user>
target2 ansible_host=<target2-ip> ansible_user=<user>
```
4. Save and close the file.

### Task 4 - Test Ansible Connectivity
1. Test Ansible connectivity to the target machines:
```ansible -i inventory.ini linux_servers -m ping```

The output should show a `pong` response from each target machine.

![Ansible Connectivity]()


### Task 5 - Run a Simple Ansible Ad-Hoc Command
1. Run a command to check the uptime of target machines:
```ansible -i inventory.ini linux_servers -m command -a "uptime"```

![Ansible Uptime]()

2. Run a command to check disk usage:
```ansible -i inventory ini linux_servers -m shell -a "df -h"```

![Ansible disk]()

3. Observe the outputs to confirm successful execution.

![Ansible Ad]()

## Conclusion
This project demonstrated how to set up Ansible on a Linux server and configure it to manage target machines. You installed Ansible, configured SSH access, created an inventory file, and verified connectivity using ad-hoc commands. With this foundation, you're now prepared to explore more advanced Ansible functionalities like writing playbooks and managing complex infrastructures.