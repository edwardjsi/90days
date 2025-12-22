# Day 17 – Terraform Basics with Local State

## Goal
Learn Terraform fundamentals by provisioning a simple AWS resource using local state.

## What I did
- Wrote a basic Terraform configuration to provision an AWS EC2 instance.
- Used core Terraform lifecycle commands: init, plan, apply, and destroy.
- Observed how Terraform generates and updates the local `.tfstate` file.

## What this proves
- I understand how Terraform manages infrastructure declaratively.
- I know the role of the `.tfstate` file as Terraform’s source of truth.
- I understand why Terraform state must never be committed to Git.

## How this helps a client/employer
- I can safely provision and tear down cloud infrastructure using Terraform.
- I follow Terraform best practices, including state management hygiene.

## ⚠️ Important Note
The `.tfstate` file contains sensitive infrastructure metadata and **must be ignored by Git**.  
In real-world projects, Terraform state should be stored in a **remote backend** such as S3 with locking enabled.
