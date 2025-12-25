# Secure AWS VPC Project – Day 5: Security Groups & Network ACLs
## Project Overview
This project demonstrates AWS network security fundamentals by applying both Security Groups (stateful, instance-level) and Network ACLs (stateless, subnet-level) to an existing VPC and subnet using Terraform.

The deployment launches a simple web server (Python HTTP server on port 8000) on an EC2 instance and enforces specific traffic rules to showcase the behavior of both security mechanisms.

## Key Learning Objectives Covered
- Difference between stateful (Security Group) and stateless (NACL) firewalls
- How Security Groups and NACLs are scoped to a single VPC
- Associating resources correctly across VPC boundaries
- Parameterizing Terraform configurations for reuse
- Testing network rules programmatically

## Architecture Deployed
- Existing VPC (provided via variable)
- Existing public subnet (provided via variable)
- New Security Group:
  - Inbound: TCP 22 (SSH), TCP 8000 (web)
  - Outbound: All traffic
- New Network ACL attached to the public subnet:
  - Inbound allow: 8000, 22, ephemeral ports (1024-65535)
  - Inbound deny: 9000 (explicit block for testing)
  - Outbound: Allow all
- EC2 Instance (t2.micro, Ubuntu 22.04):
  - Placed in the provided public subnet
  - Runs `python3 -m http.server 8000` on boot
  - Assigned public IP

## Project Structure

secure-aws-vpc-project/
├── main.tf                 # Core resources: SG, NACL, EC2
├── variables.tf            # Input variables (vpc_id, public_subnet_id, region)
├── outputs.tf              # Public IP, SG ID, NACL ID
├── terraform.tfvars        # Your specific VPC/subnet values (gitignored recommended)
├── scripts/
│   └── test_access.sh      # Tests port 8000 (should succeed) and 9000 (should fail)
├── .gitignore
└── README.md               # Day 5 summary in required format


## Prerequisites
- AWS account with programmatic access (CLI configured)
- Terraform installed
- An existing VPC with at least one public subnet (route to IGW)

## Usage Instructions
1. Clone the repository and navigate to the folder.
2. Create `terraform.tfvars` with your values:
   ```hcl
   vpc_id           = "vpc-xxxxxxxx"
   public_subnet_id = "subnet-yyyyyyyy"
   region           = "us-east-1"  # optional if different

Run:
Bash

terraform init
terraform plan
terraform apply
