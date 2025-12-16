# Day XX – End-to-End Java Application Deployment with Tomcat & Nginx

## Goal
Build, deploy, and expose a Java web application using Maven, Tomcat, and Nginx following production-style Linux and DevOps practices.

---

## What I did
- Installed required system packages (Java 17, Maven, Git, wget, unzip, vim) and prepared the Linux server.
- Installed and configured Apache Tomcat with a dedicated non-login user and a custom systemd service.
- Built a Java application using Maven and deployed it as a ROOT application on Tomcat.
- Configured firewall rules to allow application traffic.
- Set up Nginx as a reverse proxy to expose the application on port 80.
- Created a reusable AMI to optimize cost and enable quick environment recreation.

---

## What this proves
- I can deploy Java applications the way they are done on real servers, not just tutorials.
- I understand Linux users, permissions, systemd services, and firewall management.
- I know how reverse proxies work and why applications should not be exposed directly.
- I think about cost optimization using AMIs, snapshots, and instance lifecycle management.

---

## How this helps a client/employer
- I can set up and manage Java application servers reliably on AWS or on-prem.
- I can troubleshoot Tomcat, Nginx, firewall, and deployment issues end-to-end.
- I can optimize cloud costs using AMIs, snapshots, and proper EC2 lifecycle practices.
- I can deliver repeatable, production-ready environments instead of one-off setups.
