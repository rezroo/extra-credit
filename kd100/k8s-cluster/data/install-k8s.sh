#!/usr/bin/env bash
echo "$*" > .node
if [ -n $1 ]; then
  is_master=${2:-"0"}
fi

sudo apt-get install -y git
git clone --branch kd100 https://bitbucket.org/mirantis-training/kube-deploy.git
cd kube-deploy/docker-multinode

if [ $is_master == "1" ]; then
  echo "master" >> .node
  sudo K8S_VERSION="v1.5.7" IP_ADDRESS=192.168.50.10 ./master.sh
  curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.5.7/bin/linux/amd64/kubectl \
  && chmod +x kubectl \
  && sudo mv kubectl /usr/local/bin/
else
  echo "minion" >> .node
  sudo K8S_VERSION="v1.5.7" IP_ADDRESS=$4 MASTER_IP=192.168.50.10 ./worker.sh
fi

