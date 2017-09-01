#!/bin/bash -ex

ping -c 4 8.8.8.8
yum install -y fuel-octane
#octane fuel-backup --to fuel-9.0.fresh.tar.gz
#octane fuel-repo-backup --full --to fuel-9.0.repo.backup.tar.gz
yum install -y http://mirror.fuel-infra.org/mos-repos/centos/mos9.0-centos7/9.2-updates/x86_64/Packages/mos-release-9.2-1.el7.x86_64.rpm
yum clean all
yum install -y mos-updates
cd mos_playbooks/mos_mu/
ansible-playbook playbooks/mos9_prepare_fuel.yml
ansible-playbook playbooks/update_fuel.yml -e '{"rebuild_bootstrap":false}'
ansible-playbook playbooks/mos9_fuel_upgrade_kernel_4.4.yml
fuel2 fuel-version

