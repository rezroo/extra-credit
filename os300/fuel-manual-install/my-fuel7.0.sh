#!/bin/bash -ex

: ${1?"Usage: $0 <vm-name>"}

if [ ! -e /pool/images/MirantisOpenStack-7.0.iso ] 
then
 sudo wget -O /pool/images/MirantisOpenStack-7.0.iso http://192.168.121.10/mpt100/seed-20150926/MirantisOpenStack-7.0.iso
fi

./my-fuelvm.sh $1 /pool/images/MirantisOpenStack-7.0.iso
