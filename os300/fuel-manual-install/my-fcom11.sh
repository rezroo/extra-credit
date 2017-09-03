#!/bin/bash -ex

: ${1?"Usage: $0 <vm-name>"}

if [ ! -e /pool/images/fuel-community-11.0.iso ] 
then
 sudo wget -O /pool/images/fuel-community-11.0.iso http://192.168.121.10/fcom/fuel-community-11.0.iso
fi

./my-fuelvm.sh $1 /pool/images/fuel-community-11.0.iso
