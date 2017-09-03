#!/bin/bash -ex

: ${1?"Usage: $0 <vm-name>"}

if [ ! -e /pool/images/MirantisOpenStack-9.0.iso ] 
then
 sudo wget -O /pool/images/MirantisOpenStack-9.0.iso http://192.168.121.10/MirantisOpenStack-9.0.iso
fi


./my-fuelvm.sh $1 /pool/images/MirantisOpenStack-9.0.iso
