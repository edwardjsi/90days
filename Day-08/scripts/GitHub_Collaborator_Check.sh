#!/bin/bash
# ---------------------------------------------------------
# File: GitHub_Collaborator_Check.sh
# Author: <Your Name>
# Date: 08-Dec-2025
# Purpose: 
#   - Call the GitHub API using curl
#   - Use jq to parse JSON and list repository collaborators
#   - Demonstrate why we should NOT hardcode API tokens in scripts
# ---------------------------------------------------------

# ---------------- CONFIGURATION SECTION ------------------

# IMPORTANT SECURITY NOTE:
# Do NOT hardcode your GitHub token in this script.
# Example of BAD practice (DO NOT DO THIS):
#   GITHUB_TOKEN="ghp_1234567890YOURTOKENHERE"
#
# Instead, export the token as an environment variable:
#   export GITHUB_TOKEN="ghp_your_real_token_here"
#
# Then this script will read it at runtime.

GITHUB_TOKEN="${GITHUB_TOKEN:-}"
GITHUB_OWNER="your-github-username-or-org"
GITHUB_REPO="your-repo-name"

# ----------------- BASIC VALIDATION ----------------------

# Check for jq dependency
if ! command -v jq >/dev/null 2>&1; then
  echo "[ERROR] 'jq' is not installed. Please install jq before running this script."
  echo "        On Ubuntu/Debian: sudo apt-get install jq"
  exit 1
fi

# Check for required variables
if [[ -z "$GITHUB_TOKEN" ]]; then
  echo "[ERROR] GITHUB_TOKEN environment variable is not set."
  echo "        Export your GitHub Personal Access Token before running:"
  echo "        export GITHUB_TOKEN=\"ghp_your_real_token_here\""
  exit 1
fi

if [[ -z "$GITHUB_OWNER" || -z "$GITHUB_REPO" ]]; then
  echo "[ERROR] Please set GITHUB_OWNER and GITHUB_REPO variables in the script."
  exit 1
fi

# ----------------- API REQUEST LOGIC ---------------------

API_URL="https://api.github.com/repos/${GITHUB_OWNER}/${GITHUB_REPO}/collaborators"

echo "[INFO] Checking collaborators for repo: ${GITHUB_OWNER}/${GITHUB_REPO}"
echo "[INFO] Calling GitHub API: ${API_URL}"
echo

# curl calls the API
# jq parses JSON and prints only the 'login' field of each collaborator
response=$(curl -s \
  -H "Authorization: token ${GITHUB_TOKEN}" \
  -H "Accept: application/vnd.github+json" \
  "${API_URL}")

# Basic error handling: check if API rate limited or unauthorized
if echo "$response" | jq 'has("message")' >/dev/null 2>&1; then
  echo "[WARNING] GitHub returned a message:"
  echo "$response" | jq '.message'
  echo
  echo "[HINT] Possible reasons:"
  echo "  - Invalid or expired token"
  echo "  - Missing 'repo' or 'admin:org' permissions on the token"
  echo "  - API rate limit exceeded"
  exit 1
fi

echo "[INFO] List of collaborators (GitHub logins):"
echo "-------------------------------------------"
echo "$response" | jq -r '.[].login'
echo "-------------------------------------------"

echo
echo "[INFO] Script completed successfully."
echo "[NOTE] This demonstrates a secure curl | jq pipeline without hardcoding API keys."
