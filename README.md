# AWS Infrastructure Automation with Terraform & GitHub Actions

## Project Overview

A production-inspired, cost-optimized AWS Infrastructure as Code (IaC) project that automates the provisioning and management of AWS resources using **Terraform and GitHub Actions**.

The project demonstrates secure infrastructure automation, modular Terraform design, remote state management, drift detection, and controlled deployments using AWS IAM OIDC authentication without long-lived AWS access keys.

## Technology Stack

- **Cloud Provider:** Amazon Web Services (AWS)
- **Infrastructure as Code:** Terraform
- **CI/CD:** GitHub Actions
- **Authentication:** AWS IAM and OpenID Connect (OIDC)
- **Compute:** Amazon EC2
- **Networking:** Amazon VPC, Subnets, Internet Gateway, Route Tables, Security Groups
- **Load Balancing:** AWS Application Load Balancer (ALB)
- **Remote State:** Amazon S3 with state locking
- **Operating System:** Amazon Linux 2023
- **Web Server:** Nginx

## Architecture

```text
Developer
    |
    v
GitHub Repository
    |
    v
GitHub Actions
    |
    |--- Terraform Init
    |--- Terraform Validate
    |--- Terraform Plan
    |--- Manual Approval
    |--- Terraform Apply
    |
    v
AWS IAM OIDC Authentication
    |
    v
AWS Infrastructure
    |
    |--- VPC
    |     |--- Public Subnet A
    |     |--- Public Subnet B
    |     |--- Internet Gateway
    |     |--- Route Tables
    |
    |--- EC2 Web Server
    |--- Security Groups
    |--- Optional Application Load Balancer
    |
    v
Amazon S3
(Terraform Remote State + Locking)
```

## Key Features

### 1. Modular Infrastructure Provisioning
- Reusable Terraform modules for VPC, EC2, and ALB.
- Consistent and repeatable AWS infrastructure deployments.
- Parameterized configurations for different environments.

### 2. Secure AWS Authentication
- GitHub Actions authentication using AWS IAM OIDC.
- Temporary AWS credentials instead of stored access keys.
- IAM role-based access control.

### 3. Terraform Remote State
- Centralized Terraform state storage in Amazon S3.
- State locking to prevent concurrent modifications.
- S3 versioning and encryption for state protection.

### 4. CI/CD Automation
- Automated Terraform formatting and validation.
- Infrastructure change previews using `terraform plan`.
- Controlled infrastructure deployment through GitHub Actions.
- Manually triggered infrastructure cleanup.

### 5. Infrastructure Drift Detection
- Detect unexpected changes to AWS infrastructure.
- Review Terraform plan output before deployment.
- Investigate and resolve configuration drift.

### 6. Cost Optimization
- Small EC2 instance for development.
- Optional ALB deployment.
- No continuously running Terraform management server.
- Resource cleanup using `terraform destroy`.

## Repository Structure

```text
.
├── .github/
│   └── workflows/
│       ├── terraform-plan.yml
│       ├── terraform-apply.yml
│       └── terraform-destroy.yml
├── modules/
│   ├── vpc/
│   ├── ec2/
│   └── alb/
├── environments/
│   └── dev/
│       ├── main.tf
│       ├── variables.tf
│       ├── outputs.tf
│       └── backend.tf
├── .gitignore
└── README.md
```

## Deployment Workflow

1. Push Terraform configuration changes to GitHub.
2. GitHub Actions validates the configuration.
3. Terraform generates an infrastructure execution plan.
4. Review the proposed changes.
5. Approve and execute the deployment workflow.
6. Terraform provisions or updates AWS resources.
7. Terraform stores updated state in S3.
8. Verify deployed resources in the AWS Console.

## Security Best Practices

- Avoid storing AWS access keys in GitHub.
- Use IAM OIDC federation with restricted trust policies.
- Apply least-privilege IAM permissions.
- Encrypt and protect Terraform state.
- Review infrastructure changes before applying.
- Restrict security group ingress.
- Prevent concurrent Terraform deployments.

## Cost Management

This project is designed for learning and portfolio demonstration with minimal AWS costs.

The default deployment uses one small EC2 instance. The Application Load Balancer can be enabled temporarily for testing.

AWS resources are destroyed after testing to avoid unnecessary charges.

**Note:** AWS EC2, public IPv4 addresses, EBS volumes, and Application Load Balancers may incur charges.

## Project Status

🚧 **In Progress — Initial Infrastructure Setup**

Planned implementation milestones:

- [ ] Configure GitHub repository and AWS OIDC authentication
- [ ] Configure S3 remote state and locking
- [ ] Implement Terraform VPC module
- [ ] Implement Terraform EC2 module
- [ ] Implement optional ALB module
- [ ] Configure GitHub Actions Terraform Plan workflow
- [ ] Configure controlled Apply workflow
- [ ] Configure Destroy workflow
- [ ] Test infrastructure provisioning
- [ ] Test drift detection and cleanup

## Learning Outcomes

This project demonstrates practical experience with:

- Infrastructure as Code (IaC)
- AWS infrastructure provisioning
- Terraform modularization
- CI/CD automation
- Cloud security and IAM
- Remote state management
- Infrastructure lifecycle management
- Cost-conscious cloud architecture

## Disclaimer

This is a personal learning and portfolio project. It demonstrates production-inspired infrastructure practices but is not intended to be deployed as a fully production-ready application without additional security, availability, and operational controls.
