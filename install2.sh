#!/bin/bash

# current directory for reference
DIR=$( pwd )
# masternode
masternode=$(hostname)

# ask for non-root user
read -p "Enter the MAC address of n0001: "  MAC
wwsh node new n0001 --hwaddr=$MAC --ipaddr=10.253.1.1

# ssh to n0001
.$DIR/scripts/ssh1

# save host keys ssh
.$DIR/scripts/ssh2

# pdsh as rooot
.$DIR/scripts/ssh3

# reboot nodes
pdsh -R ssh -w n0001

# install apache2
apt-get -y install apache2

# install php
apt-get -y install php5 php5-mysql libapache2-mod-php5
