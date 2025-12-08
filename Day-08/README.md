# Day08 – GitHub API with curl and jq

## Goal
Learn how to interact with an external API from the command line and extract meaningful data securely.

## What I did
- Wrote a shell script to query GitHub’s REST API using `curl`.
- Parsed the JSON response using `jq` to extract collaborator usernames.
- Implemented basic validation for missing dependencies and tokens.
- Avoided hardcoding secrets by using environment variables.
- Added error handling for invalid responses and authentication issues.

## What this proves
- I can consume REST APIs directly from the terminal.
- I understand how JSON data is structured and filtered using `jq`.
- I know the security risks of hardcoding API keys.
- I can write scripts that fail safely with meaningful errors.
- I am comfortable automating real-world checks using shell tools.

## How this helps a client/employer
- I can automate GitHub audits and access checks.
- I can integrate APIs into shell-based workflows.
- I can build monitoring or reporting scripts using `curl | jq`.
- I can write secure automation that does not expose credentials.
