#!/bin/bash

# Ping all web servers
ansible -i inventory web_servers -m ping

# Ping all database servers
ansible -i inventory db_servers -m ping

# Ping all servers in inventory
ansible -i inventory all -m ping
