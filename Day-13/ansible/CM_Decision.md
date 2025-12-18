# Configuration Management Tool Decision – Ansible vs Puppet

## Problem Statement
Managing application configuration across multiple servers using ad-hoc shell or PowerShell scripts leads to inconsistency, drift, and operational risk. A centralized configuration management tool is required to ensure repeatable and auditable server states.

## Tools Evaluated
- Ansible
- Puppet

## Key Differences

### 1. Agent vs Agentless
Ansible is agentless and does not require any software installation on managed nodes. Puppet requires an agent to be installed and maintained on every node.

### 2. Push vs Pull Model
Ansible follows a push-based model where configurations are applied on demand from a control node. Puppet follows a pull-based model where agents periodically fetch configurations from the master.

### 3. Language
Ansible uses YAML, which is simple, human-readable, and easy to maintain. Puppet uses a proprietary domain-specific language, increasing learning and maintenance effort.

### 4. Protocols
Ansible uses standard protocols such as SSH for Linux and WinRM for Windows. Puppet uses its own agent-based communication protocol.

## Decision
Ansible is selected as the preferred configuration management tool due to:
- Agentless architecture
- Lower maintenance overhead
- Immediate execution using push model
- Simple and readable YAML syntax
- Use of standard network protocols

## Conclusion
Ansible enables faster onboarding, simpler operations, and better control over infrastructure configuration, making it more suitable for modern DevOps environments.
