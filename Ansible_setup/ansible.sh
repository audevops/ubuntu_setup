#!/bin/bash
# Create folders
mkdir -p ~/ansible-docker/ansible_playbooks

# Navigate to the Ansible Docker setup
cd /root/Git_Clone/ubuntu_setup/Ansible_setup || exit 1

# Print current directory
pwd

# Start the Ansible container in the background
docker-compose up -d


mkdir -p /root/Git_Clone/ubuntu_setup/Ansible_setup/package
cd /root/Git_Clone/ubuntu_setup/Ansible_setup/package

# Download curl and its dependencies for Alpine (example for Alpine 3.18)
apk fetch --repository=http://dl-cdn.alpinelinux.org/alpine/v3.18/main curl
apk fetch --repository=http://dl-cdn.alpinelinux.org/alpine/v3.18/main libcurl

