#!/bin/bash

# update package information
apt-get update

# install necessary packages for script commands
apt-get install -y apt-transport-https ca-certificates curl software-properties-common git

# add docker repository key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# verify docker repository key
apt-key fingerprint 0EBFCD88

# add docker repository to apt
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# update packages information
apt-get update

# install docker
apt-get install -y docker-ce

# initialize docker swarm
swarm init
