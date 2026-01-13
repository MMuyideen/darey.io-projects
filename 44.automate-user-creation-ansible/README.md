Automate User Creation on Linux Server using Ansible
Introduction
Managing user accounts is a common administrative task for Linux servers. Manually creating and managing user accounts can become tedious, especially on multiple servers. Ansible simplifies this process by automating user creation with playbooks. This project will guide you in creating an Ansible playbook to automate user creation on a Linux server.
Objectives
1. Understand the basics of Ansible and its automation capabilities.
2. Set up an Ansible environment to manage Linux servers.
3. Create an Ansible playbook to automate user creation.
4. Configure additional settings like home directory, groups, and SSH access.
5. Verify the user creation process and test access.
Prerequisites
1. Linux Servers: At least one Linux server to act as the target machine and an optional control machine for Ansible.
2. Ansible Installed: Ansible installed on the control machine. (Refer to the Ansible installation guide if you don't have Ansible already installed.)
3. SSH Access: SSH access between the control machine and target servers with public key authentication.
4. Tools: A text editor to create and edit Ansible playbooks.

Tasks Outline
1. Install and configure Ansible on the control machine.
2. Set up an inventory file for the target Linux server.
3. Create an Ansible playbook to automate user creation.
4. Configure additional user settings like groups and SSH access.
5. Verify user creation and test login.
Project Tasks
Task 1 - Install and Configure Ansible
1. Install Ansible on the control machine (Ubuntu example):
sudo apt update
sudo apt install ansible -y
2. Verify the installation:
ansible --version
3. Set up SSH key-based authentication between the control machine and target server:
ssh-keygen -t rsa
ssh-copy-id user@<target-server-ip>

Task 2 - Set Up the Ansible Inventory File
1. Create an inventory file to define the target server:
nano inventory.ini
2. Add the target server details:
[linux_servers]
target ansible_host=<target-server-ip> ansible_user=<user>
Task 3 - Create an Ansible Playbook to Automate User Creation
1. Create a playbook file for user creation:
nano create_users. yml
2. Add the following playbook content:

```yaml
- name: Automate user creation
  hosts: linux_servers
  become: yes
  tasks:
    - name: Create a new user
      user:
        name: "{"{ item.username "}}"
        state: present
        shell: /bin/bash
        create_home: yes
      with_items:
        - {" username: \"user1\" "}
        - {" username: \"user2\" "}
```

Task 4: Configure Additional User Settings
1. Update the playbook to include group and SSH key configuration:

```yaml
- name: Automate user creation
  hosts: linux_servers
  become: yes
  tasks:
    - name: Create a new user with additional settings
      user:
        name: "{"{ item.username "}}"
        state: present
        shell: /bin/bash
        create_home: yes
        groups: "{"{ item.groups "}}"
      with_items:
        - {" username: \"user1\", groups: \"sudo\" "}
        - {" username: \"user2\", groups: \"docker\" "}

    - name: Add SSH key for the users
      authorized_key:
        user: "{"{ item.username "}}"
        state: present
        key: "{"{ lookup('file', item.ssh_key) "}}"
      with_items:
        - {" username: \"user1\", ssh_key: \"/path/to/user1.pub\" "}
        - {" username: \"user2\", ssh_key: \"/path/to/user2.pub\" "}
```

2. Replace '/path/to/user1.pub' and'/path/to/user2.pub' with the paths to the public SSH keys for each user.
Task 5 - Verify User Creation and Test Login
1. Run the playbook to create users:
ansible-playbook -i inventory ini create_users. yml
2. Verify the users were created on the target server:
cat /etc/passwd ls /home
3. Test SSH access for the newly created users:
ssh
userl@ target-server-ip> ssh user2@<target-server-ip>

Conclusion
In this project, you automated the creation of user accounts on a Linux server using Ansible. You learned how to write an Ansible playbook for user creation, configure additional settings like groups and SSH access, and verify the process. With these skills, you can manage user accounts efficiently across multiple servers and extend the playbook for advanced configurations like password policies and user deletion.