#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Function to print messages
print_msg() {
    echo -e "\n==== $1 ====\n"
}

print_msg "Updating system packages..."
sudo apt update -y
sudo apt upgrade -y

print_msg "Installing required packages..."
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common gnupg lsb-release

print_msg "Adding Docker's official GPG key..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

print_msg "Setting up Docker repository..."
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] \
  https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

print_msg "Updating package index..."
sudo apt update -y

print_msg "Installing Docker Engine..."
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

print_msg "Starting and enabling Docker service..."
sudo systemctl enable docker
sudo systemctl start docker

print_msg "Adding current user to Docker group..."
sudo usermod -aG docker $USER
sudo usermod -aG docker jack
print_msg "Testing Docker installation..."
docker --version
docker run --rm hello-world

print_msg "Docker installation and test completed!"
echo "You may need to log out and log back in for group changes to take effect."

