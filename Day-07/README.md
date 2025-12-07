# Day 07 – AWS Resource Tracking with Shell Script & AWS CLI

## Goal
Practice real-world AWS operational reporting using shell scripting, AWS CLI, and JSON parsing.

## What I did
- Wrote a shell script to retrieve EC2 instance counts and S3 bucket counts using AWS CLI.
- Used the pipe operator with tools like jq, grep, awk, and wc to extract meaningful fields from JSON and text output.
- Structured the script with clear metadata, echo sections, and comments for future cron-based automation.

## What this proves
- I can integrate shell scripting with AWS CLI for live infrastructure reporting instead of relying on the AWS console.
- I understand why JSON parsing with tools like jq is necessary for large AWS CLI responses, not just how to run the commands.
- I can format output so that non-technical stakeholders (like managers) can read and use the report.

## How this helps a client/employer
- I can help you set up automated AWS resource tracking scripts that run on a schedule and provide clear summaries.
- I can troubleshoot AWS resource visibility issues by combining CLI output, filters, and JSON parsing into actionable reports.
