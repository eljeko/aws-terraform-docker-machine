#!/bin/bash 
sudo apt-get install jq --assume-yes
sudo apt-get install openjdk-17-jdk --assume-yes


# Add Docker's official GPG key:
sudo apt-get update --assume-yes
sudo apt-get install ca-certificates curl --assume-yes
sudo install -m 0755 -d /etc/apt/keyrings 
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update --assume-yes

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin --assume-yes

sudo ln -s /usr/libexec/docker/cli-plugins/docker-compose /usr/bin/docker-compose
sudo groupadd docker
sudo usermod -aG docker ubuntu