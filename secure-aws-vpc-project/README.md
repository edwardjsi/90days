# AWS Security: Security Groups and Network ACLs

## Goal
Demonstrate the practical difference between stateful Security Groups and stateless Network ACLs using Terraform on an existing VPC.

## What I did
- Created a reusable Terraform project that uses pre-existing VPC and public subnet instead of creating new ones.
- Added input variables (`vpc_id`, `public_subnet_id`, `region`) via `terraform.tfvars` for flexibility.
- Fixed file naming error (`terraform.tfvars.tf` → `terraform.tfvars`) to allow proper initialization.
- Resolved "belong to different networks" errors by ensuring the subnet ID belongs to the specified VPC.
- Implemented a Security Group allowing inbound SSH (port 22) and web traffic (port 8000) with full outbound access.
- Created a Network ACL attached to the public subnet with explicit rules: allow 8000 and 22, deny 9000, allow ephemeral ports.
- Deployed a t2.micro EC2 instance running a simple Python HTTP server on port 8000.
- Wrote a test script (`scripts/test_access.sh`) to verify that port 8000 is accessible and port 9000 is blocked.
- Successfully executed `terraform init`, `plan`, `apply`, tested connectivity, and cleaned up with `terraform destroy`.
- Fixed Git push error by adding `.terraform/` to `.gitignore` and removing large provider files from history.

## What this proves
- I can safely extend and secure existing AWS infrastructure without creating duplicate resources.
- I understand VPC scoping rules and can debug common association errors.
- I know how to implement and test both stateful (Security Groups) and stateless (Network ACLs) firewall rules.
- I can write parameterized, reusable Terraform configurations suitable for real-world environments.
- I can handle Git and GitHub issues like large file detection and proper ignoring of build artifacts.

## How this helps a client/employer
- I can apply security best practices to existing cloud environments with minimal risk.
- I can automate network security configurations and validation, ensuring consistent and compliant deployments.
- I can quickly troubleshoot Terraform and AWS integration issues in team or production settings.
- I can deliver clean, professional code repositories that follow Git best practices.
