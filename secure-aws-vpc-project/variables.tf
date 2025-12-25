# variables.tf

variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"  # Change if your resources are in another region
}

variable "vpc_id" {
  description = "ID of your existing VPC (e.g., vpc-0abcd1234efgh5678)"
  type        = string
}

variable "public_subnet_id" {
  description = "ID of your existing public subnet where the EC2 will be launched"
  type        = string
}

variable "private_subnet_id" {
  description = "ID of your existing private subnet (optional, for reference only)"
  type        = string
  default     = null
}