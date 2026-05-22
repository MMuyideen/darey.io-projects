# Darey.io DevOps Bootcamp Projects

A structured collection of hands-on projects completed as part of the [Darey.io](https://darey.io) DevOps bootcamp, progressing from Linux fundamentals through cloud infrastructure, containers, CI/CD, Kubernetes, Terraform, Ansible, and observability.

---

## Learning Path

### Linux & Shell Scripting
| # | Project | Description |
|---|---------|-------------|
| 01 | [tech-env-setup](./01.tech-env-setup) | Developer environment setup and tooling |
| 02 | [git-project](./02.git-project) | Git version control fundamentals |
| 03 | [git-capstone](./03.git-capstone) | Git branching, merging, and collaboration workflow |
| 04 | [linux-fundamentals](./04.linux-fundamentals) | Linux OS concepts and filesystem navigation |
| 05 | [basic-linux-commands](./05.basic-linux-commands) | Core CLI commands for file and process management |
| 06 | [linux-text-editor](./06.linux-text-editor) | Working with vim and nano |
| 07 | [advanced-linux-commands](./07.advanced-linux-commands) | Piping, redirection, grep, awk, sed |
| 08 | [shell-scripting](./08.shell-scripting) | Bash scripting basics — shebangs, variables, permissions |
| 09 | [shell-scripting-comments](./09.shell-scripting-comments) | Script documentation and commenting practices |
| 10 | [shell-scripting-control-flows](./10.shell-scripting-control-flows) | Conditionals and loops |
| 11 | [shell-scripting-error-handling](./11.shell-scripting-error-handling) | Exit codes and error handling patterns |
| 12 | [shell-scripting-functions-and-arrays](./12.shell-scripting-functions-and-arrays) | Reusable functions and array manipulation |
| 13 | [shell-scripting-capstone](./13.shell-scripting-capstone) | Capstone — interactive multiplication table generator |

### Cloud Computing & AWS
| # | Project | Description |
|---|---------|-------------|
| 14 | [cloud-computing-introduction](./14.cloud-computing-introduction) | Cloud concepts, service models, and deployment types |
| 15 | [aws-account-creation](./15.aws-account-creation) | AWS account setup and console orientation |
| 16 | [cloud-computing-security-iam](./16.cloud-computing-security-iam) | IAM concepts — users, roles, policies, MFA |
| 17 | [aws-iam](./17.aws-iam) | Hands-on AWS IAM configuration |
| 18 | [shell-script-iam](./18.shell-script-iam) | Automate IAM user/group/policy management via AWS CLI |
| 19 | [aws-s3](./19.aws-s3) | S3 bucket management, versioning, and lifecycle policies |
| 20 | [aws-vpc](./20.aws-vpc) | VPC design — subnets, route tables, internet gateways |
| 21 | [security-groups-and-nacls](./21.security-groups-and-nacls) | Network access control with Security Groups and NACLs |
| 22 | [shell-scripting-cloud-computing](./22.shell-scripting-cloud-computing) | Shell scripts for AWS resource automation |
| 23 | [aws-resources-functions-and-arrays](./23.aws-resources-functions-and-arrays) | Provision EC2 and S3 resources using Bash functions and arrays |
| 24 | [aws-alb-and-asg](./24.aws-alb-and-asg) | Application Load Balancer and Auto Scaling Groups |
| 25 | [aws-api-auth](./25.aws-api-auth) | AWS API authentication and credential management |
| 26 | [env-var-and-infra-env](./26.env-var-and-infra-env) | Environment variables and multi-environment infrastructure patterns |
| 27 | [aws-wordpress-capstone](./27.aws-wordpress-capstone) | Capstone — WordPress on AWS with Terraform and backend automation |

### Docker
| # | Project | Description |
|---|---------|-------------|
| 28 | [intro-to-docker](./28.intro-to-docker) | Docker concepts, installation, and first containers |
| 29 | [working-with-docker-images](./29.working-with-docker-images) | Building, tagging, and pushing Docker images |
| 30 | [working-with-docker-containers](./30.working-with-docker-containers) | Container lifecycle, networking, and volumes |

### CI/CD
| # | Project | Description |
|---|---------|-------------|
| 31 | [introduction-to-jenkins](./31.introduction-to-jenkins) | Jenkins setup, pipelines, and job configuration |
| 32 | [introduction-to-cicd](./32.introduction-to-cicd) | GitHub Actions workflow for Node.js build, test, and deploy |

### Kubernetes
| # | Project | Description |
|---|---------|-------------|
| 33 | [setting-up-minikube](./33.settiing-up-minikube) | Local Kubernetes cluster with Minikube |
| 34 | [kubernetes-nodes-and-pods](./34.working-with-kubernetes-nodes-and-pods) | Node inspection, Pod creation, and lifecycle management |
| 35 | [kubernetes-resources](./35.working-with-kubernetes-resources) | Deployments and Services with Nginx YAML manifests |
| 36 | [networking-in-kubernetes](./36.Networking-in-kubernetes) | ClusterIP, NodePort, Ingress, and DNS |

### Terraform
| # | Project | Description |
|---|---------|-------------|
| 37 | [terraform-ec2-and-ami](./37.terraform-ec2-instance-and-ami-creation) | Provision EC2 instances and create custom AMIs |
| 38 | [ec2-keypair-with-userdata](./38.ec2-keypair-with-userdata) | EC2 with key pairs and bootstrap user data scripts |
| 39 | [terraform-modules](./39.terraform-modules) | Modular VPC and S3 configurations with remote state |
| 40 | [terraform-aws-webapp](./40.terraform-aws-webapp) | Dynamic web app on ECS with Docker, ECR, and Terraform modules |
| 41 | [terraform-ec2-security-group-module](./41.terraform-ec2-and-security-group-module) | Reusable EC2 and Security Group Terraform module |
| 42 | [terraform-wordpress-aws](./42.terraform-wordpress-aws) | Capstone — scalable WordPress on AWS with VPC, RDS, EFS, ALB, and ASG |

### Ansible
| # | Project | Description |
|---|---------|-------------|
| 43 | [setting-up-ansible](./43.setting-up-ansible) | Ansible installation, inventory, and ad-hoc commands |
| 44 | [automate-user-creation](./44.automate-user-creation-ansible) | Playbook for automated Linux user provisioning |
| 45 | [deploy-nginx-ansible](./45.deploy-nginx-ansible) | Nginx deployment and configuration with Ansible |
| 46 | [backup-and-restore-ansible](./46.backup-and-restore-ansible) | Automated file backup and restore playbooks |

### Monitoring & Observability
| # | Project | Description |
|---|---------|-------------|
| 47 | [prometheus-node-exporter](./47.monitor-linux-server-using-prometheus-node-exporter) | Prometheus Node Exporter for Linux server hardware/OS metrics |
| 48 | [node-exporter-kubernetes](./48.setup-node-exporter-kubernetes) | Node Exporter DaemonSet for Kubernetes cluster monitoring |
| 49 | [gatus-uptime-monitoring](./49.configure-uptime-monitoring-using-gatus) | Uptime monitoring for websites and APIs using Gatus |

---

## Tech Stack

![Linux](https://img.shields.io/badge/Linux-FCC624?style=flat&logo=linux&logoColor=black)
![Bash](https://img.shields.io/badge/Bash-4EAA25?style=flat&logo=gnubash&logoColor=white)
![AWS](https://img.shields.io/badge/AWS-232F3E?style=flat&logo=amazonaws&logoColor=white)
![Docker](https://img.shields.io/badge/Docker-2496ED?style=flat&logo=docker&logoColor=white)
![Kubernetes](https://img.shields.io/badge/Kubernetes-326CE5?style=flat&logo=kubernetes&logoColor=white)
![Terraform](https://img.shields.io/badge/Terraform-7B42BC?style=flat&logo=terraform&logoColor=white)
![Ansible](https://img.shields.io/badge/Ansible-EE0000?style=flat&logo=ansible&logoColor=white)
![GitHub Actions](https://img.shields.io/badge/GitHub_Actions-2088FF?style=flat&logo=githubactions&logoColor=white)
![Jenkins](https://img.shields.io/badge/Jenkins-D24939?style=flat&logo=jenkins&logoColor=white)
![Prometheus](https://img.shields.io/badge/Prometheus-E6522C?style=flat&logo=prometheus&logoColor=white)
![Grafana](https://img.shields.io/badge/Grafana-F46800?style=flat&logo=grafana&logoColor=white)
![Gatus](https://img.shields.io/badge/Gatus-29B5E8?style=flat&logo=gatus&logoColor=white)
