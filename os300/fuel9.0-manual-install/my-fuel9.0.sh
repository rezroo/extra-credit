#!/bin/bash -ex

wget http://192.168.121.10/MirantisOpenStack-9.0.iso

./my-fuelvm.sh $1 MirantisOpenStack-9.0.iso
