#!/bin/bash

SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
ANSIBLE_ROLES_PATH=$SCRIPTPATH/devhost/provision/roles

apt-get update
apt-get -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" install -y -qq build-essential curl git libssl-dev libffi-dev python-dev python-pip

pip install --upgrade pip

pip install ansible==2.4.2.0

git clone https://github.com/mtbvang/devhost.git

cd devhost

read -p "Enter User: " DEVTOOLS_USER
read -s -p "Enter Password: " DEVTOOLS_USER_PASSWORD

./provision/ansible_galaxy.sh $ANSIBLE_ROLES_PATH --force
ANSIBLE_STDOUT_CALLBACK=debug ANSIBLE_ROLES_PATH=$ANSIBLE_ROLES_PATH DEVTOOLS_USER_PASSWORD=$DEVTOOLS_USER_PASSWORD DEVTOOLS_USER=$DEVTOOLS_USER ansible-playbook --sudo -i '$(hostname -f),' -c local $SCRIPTPATH/devhost/provision/playbook.yml -v