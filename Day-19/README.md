# Day 20 – Docker Agents & Scaling

## Goal

Build a modern Jenkins CI pipeline using Docker-based agents per stage and understand how Jenkins scales reliably during burst workloads using Auto Scaling Groups.

---

## What I did

* Designed a declarative Jenkins pipeline using **Docker containers as agents** instead of static worker nodes.
* Configured **different Docker images per stage** (Maven, Node.js, Python) to simulate a microservices CI pipeline.
* Used `agent none` at the pipeline level to keep the Jenkins controller lightweight.
* Documented how **AWS Auto Scaling Groups (ASG)** help Jenkins handle unpredictable build spikes efficiently.

---

## What this proves

* I understand modern CI best practices using containerized Jenkins agents.
* I can isolate build environments per stage, avoiding dependency conflicts.
* I know how Jenkins scales under burst load and why static workers fail.
* I design CI systems with **cost, scalability, and reliability** in mind.

---

## How this helps a client/employer

* I can build cost-efficient Jenkins pipelines with zero idle infrastructure.
* I can design Jenkins architectures that scale automatically during peak release cycles.
* I can prevent build bottlenecks during high-traffic or festive deployment periods.
* I can modernize legacy Jenkins setups into cloud-native, scalable CI systems.
