# Day 12 – EC2 Cost Optimization Using AMI and Snapshots

## Goal
Reduce AWS EC2 costs by eliminating idle compute while preserving the ability to quickly recreate the environment.

---

## What I did
- Analyzed the cost impact of running vs stopping a t2.large EC2 instance with a 30 GB root EBS volume.
- Identified that stopping the instance removes compute cost but continues EBS storage charges.
- Evaluated EBS root volume costs after increasing size from 8 GB to 30 GB.
- Designed a cost-efficient workflow using AMIs backed by EBS snapshots.
- Created an AMI from a stopped instance to ensure filesystem consistency.
- Terminated the EC2 instance to eliminate compute and root volume charges.
- Retained only the AMI (snapshot) to allow on-demand recreation of the environment.

---

## What this proves
- I understand that stopping an EC2 instance does not eliminate all AWS costs.
- I know how EC2, EBS, and snapshot billing interact in AWS.
- I can make architectural decisions based on cost, not just convenience.
- I think in terms of lifecycle management rather than keeping servers running unnecessarily.

---

## How this helps a client/employer
- I can significantly reduce AWS bills for non-production or intermittent workloads.
- I can design cost-optimized environments for labs, demos, and learning setups.
- I can advise when to stop, terminate, snapshot, or recreate infrastructure.
- I help teams pay for compute only when they are actually using it.
