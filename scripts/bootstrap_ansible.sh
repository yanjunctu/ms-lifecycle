#!/bin/bash

echo "backup old apt list"
cp /etc/apt/sources.list /etc/apt/sources.list.backup
echo "overwrite apt list with 163 mirror"
cp -fv /vagrant/sources.list.trusty.163 /etc/apt/sources.list
apt-get update

echo "Installing Ansible..."
apt-get install -y software-properties-common
apt-add-repository ppa:ansible/ansible
apt-get update
apt-get install -y --force-yes ansible
cp /vagrant/ansible/ansible.cfg /etc/ansible/ansible.cfg

#apt-get update -y
#apt-get install -y python-pip python-dev
#pip install ansible==1.9.2
#mkdir -p /etc/ansible
#touch /etc/ansible/hosts
#cp /vagrant/ansible/ansible.cfg /etc/ansible/ansible.cfg
#mkdir -p /etc/ansible/callback_plugins/
#cp /vagrant/ansible/plugins/human_log.py /etc/ansible/callback_plugins/human_log.py
echo "localhost ansible_connection=local ansible_python_interpreter=/usr/bin/python2">>/etc/ansible/hosts
apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
