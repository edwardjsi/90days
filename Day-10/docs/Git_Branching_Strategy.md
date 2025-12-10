# Git Branching Strategy

## 1. Purpose

This document defines how branches are created, named, and merged in this repository.  
The goal is to keep **`main` stable**, make work **predictable**, and make it easy to see **what change came from where**.

---

## 2. Branch Types

### 2.1 `main`
- Always deployable / stable.
- Protected: no direct commits (only via pull request in a team setting).
- Tagged for important milestones or releases.

### 2.2 `feature/*`
Used for new features, experiments, or exercises.

Examples:
- `feature/day38-terraform-provisioners`
- `feature/git-branching-docs`

Rules:
- Branch off from `main`.
- One logical task per feature branch.
- Merge back to `main` via pull request (or `merge` in a solo workflow).

### 2.3 `hotfix/*`
Used for urgent fixes to production/stable code.

Examples:
- `hotfix/fix-terraform-backend-config`
- `hotfix/update-ami-id`

Rules:
- Branch off from `main`.
- Keep the change as small as possible.
- Merge back to `main` and tag if needed.

### 2.4 `docs/*` (optional)
Used when the change is documentation-only.

Examples:
- `docs/git-branching-strategy`
- `docs/terraform-day38-readme`

---

## 3. Workflow

### 3.1 Creating a New Feature

```bash
# Start from latest main
git checkout main
git pull origin main

# Create a feature branch
git checkout -b feature/day38-terraform-provisioners

# Work, commit, push
git add .
git commit -m "feat: add Terraform remote-exec for Docker install"
git push origin feature/day38-terraform-provisioners
