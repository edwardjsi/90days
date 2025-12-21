# Infrastructure as Code (IaC) Strategy

## Problem Statement
Historically, cloud infrastructure was provisioned using cloud-native tools such as AWS CloudFormation. While effective, these tools tightly couple infrastructure definitions to a single cloud provider, leading to vendor lock-in and reduced long-term flexibility.

## Business Risk of Vendor Lock-In
- Infrastructure templates become cloud-specific and non-portable.
- Migration to another cloud requires complete rewrites.
- Skills are not transferable across platforms.
- Organizations lose negotiation leverage with cloud providers.

## IaC Objective
The goal of Infrastructure as Code is not just automation, but portability, repeatability, and long-term strategic flexibility.

## Terraform and API as Code
Terraform addresses vendor lock-in by using a provider-based model that interacts with cloud platforms through APIs. Infrastructure intent is written once in a universal language (HCL), and providers translate that intent into cloud-specific API calls.

## Why Terraform Over Cloud-Native Tools
- Supports multiple cloud providers using a single language.
- Enables hybrid and multi-cloud architectures.
- Reduces long-term migration risk.
- Improves talent mobility and skill reuse.
- Aligns infrastructure decisions with business strategy.

## Conclusion
Terraform is chosen not because cloud-native tools are inadequate, but because Terraform provides strategic freedom. By treating APIs as code and abstracting provider-specific implementations, Terraform enables organizations to avoid vendor lock-in while maintaining operational consistency.
