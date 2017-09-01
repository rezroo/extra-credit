#!/bin/bash

netCreate () {
    virsh net-define --file $2
    virsh net-autostart $1
    virsh net-start $1
    virsh net-info $1
}

netCreate admin ./networks/admin.xml
netCreate public ./networks/public.xml
netCreate external ./networks/external.xml

virsh net-destroy default
virsh net-list
