#!/bin/bash -e

if [ ! $1 ]
then
    echo -e "Usage: $0 <database-name> [management-nic=eth0]\nScript requires at least one parameter.\n"
    exit 0
else
    name=$1
    management_nic='eth0'
    if [ $2 ]; then
        management_nic=$2
    fi
    conf_file=/tmp/$$-${name}.sql
    management_ip=`ip -4 -o a show dev $management_nic | awk '{print $4}' | awk -F'/' '{print $1}'`
fi

cat > ${conf_file} <<TEXT
drop database if exists $name;
create database $name;
grant all on ${name}.* to '${name}User'@'%' identified by '${name}Pass';
grant all on ${name}.* to '${name}User'@'localhost' identified by '${name}Pass';
flush privileges;
TEXT

# cat ${conf_file}
set -x
mysql -u root -pstack < $conf_file
mysql -h $management_ip -u ${name}User -p${name}Pass -e "show databases" ${name}
rm ${conf_file}
