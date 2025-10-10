#!/bin/bash
# Create folders
mkdir -p ~/ansible-docker/ansible_playbooks

# Navigate to the Ansible Docker setup
cd /root/Git_Clone/ubuntu_setup/Ansible_setup || exit 1

# Print current directory
pwd

# Start the Ansible container in the background
docker-compose up -d

