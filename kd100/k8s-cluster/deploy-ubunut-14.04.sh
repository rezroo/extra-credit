#!/usr/bin/env bash
set -e

PROGNAME=`basename "$0"`
DIRNAME=`dirname "$0"`

# wget https://github.com/rezroo/extra-credit.git

install_misc()
{
    sudo apt-get update
    sudo apt-get install dnsutils -y
}

install_misc

install_vagrant()
{
    _dir=$1
    if [[ ! -f ${_dir}/vagrant_1.9.1_x86_64.deb ]]; then
        wget https://releases.hashicorp.com/vagrant/1.9.1/vagrant_1.9.1_x86_64.deb -P ${_dir}
    fi
    sudo dpkg -i ${_dir}/vagrant_1.9.1_x86_64.deb
    sudo apt-get update
    sudo apt-get install qemu libvirt-bin ebtables dnsmasq -y
    sudo apt-get install libxslt-dev libxml2-dev libvirt-dev zlib1g-dev ruby-dev -y
    vagrant plugin install vagrant-libvirt --plugin-version 0.0.35
}

install_vagrant $HOME

run_app()
{
    _dir=$1
    mkdir -p ${_dir}
    pushd ${_dir}
    cp ${dirname}/Vagrantfile.libvirt Vagrantfile
    cp -a ${dirname}/data/ .
    vagrant up
    popd
}

run_app ${HOME}/run

