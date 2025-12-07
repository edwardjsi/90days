#!/bin/bash
############################################################
# Script Name : AWS_Resource_Tracker.sh
# Author      : Edward Santosh
# Date        : 07-Dec-2025
# Purpose     : Operational reporting for AWS resources
# Description :
#   - Retrieves counts of EC2 instances and S3 buckets.
#   - Demonstrates AWS CLI usage for real-time resource tracking.
#   - Shows conceptual use of jq for JSON parsing.
#   - Designed to be scheduled via cron for automated reporting.
############################################################

# Exit on error
set -e

echo "============================================"
echo " AWS Resource Tracker - Operational Report"
echo " Generated on: $(date)"
echo "============================================"
echo

# Optional: support a named AWS CLI profile
AWS_PROFILE_NAME="${AWS_PROFILE_NAME:-default}"

echo "Using AWS CLI profile: ${AWS_PROFILE_NAME}"
echo

###############################################
# EC2 Instances
###############################################
echo "---- EC2 Instances ----"

# Raw JSON output (conceptual example)
# We use jq to extract just Instance IDs.
EC2_INSTANCE_IDS=$(aws ec2 describe-instances \
  --profile "${AWS_PROFILE_NAME}" \
  --output json | jq -r '.Reservations[].Instances[].InstanceId')

EC2_COUNT=$(echo "${EC2_INSTANCE_IDS}" | grep -v '^$' | wc -l | tr -d ' ')

echo "Total EC2 Instances : ${EC2_COUNT}"
echo "Instance IDs:"
echo "${EC2_INSTANCEIDS:-$EC2_INSTANCE_IDS}"
echo

###############################################
# S3 Buckets
###############################################
echo "---- S3 Buckets ----"

S3_BUCKET_NAMES=$(aws s3 ls --profile "${AWS_PROFILE_NAME}" | awk '{print $3}')
S3_BUCKET_COUNT=$(echo "${S3_BUCKET_NAMES}" | grep -v '^$' | wc -l | tr -d ' ')

echo "Total S3 Buckets   : ${S3_BUCKET_COUNT}"
echo "Bucket Names:"
echo "${S3_BUCKET_NAMES}"
echo

###############################################
# Notes for Automation
###############################################
echo "--------------------------------------------"
echo " Note: This script is intended to be run via"
echo " a cron job for scheduled reporting,"
echo " e.g., every morning at 08:00."
echo "--------------------------------------------"
echo
echo "Report completed."
echo "============================================"
