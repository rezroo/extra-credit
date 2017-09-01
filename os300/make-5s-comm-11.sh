#!/bin/bash -ex
#
# You must ./fuel-venv/bin/activate before running this script
# cd dev; source ./fuel-venv/bin/activate
#
#cd dev
source ./fuel-venv/bin/activate
export ENV_NAME="comm-11"
export ISO_PATH="/home/stack/dev/fuel-community-11.0.iso"
export POOL_DEFAULT="10.20.0.0/16:24"
dos.py create-env five-slaves.yaml
dos.py admin-setup $ENV_NAME
