#!/bin/bash

virt-install --name=$1 --ram=5125 --vcpus=2 --os-type=linux \
  --virt-type=kvm --boot cdrom,hd \
  --disk pool=default,size=50,sparse=true,cache=writeback,format=qcow2,bus=virtio 
  --cdrom $2 \
  --noautoconsole --graphics vnc,listen=0.0.0.0 \
  --network=network=admin --network=network=external

