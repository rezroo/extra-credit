#!/usr/bin/env bash
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
echo "deb https://apt.dockerproject.org/repo ubuntu-xenial main" | sudo tee /etc/apt/sources.list.d/docker.list
sudo apt-get update 
# sudo apt-get install -y docker-engine 
sudo apt-get install -y docker-engine=1.12.6-0~ubuntu-xenial
sudo usermod -aG docker vagrant
sudo apt-get install curl
curl -Lo docker-compose https://github.com/docker/compose/releases/download/1.14.0/docker-compose-Linux-x86_64 && chmod +x docker-compose && sudo mv docker-compose /usr/local/bin/
