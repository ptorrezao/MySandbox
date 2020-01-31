#!/bin/bash

echo "auto eth0:1
iface eth0:1 inet static
  address $1
  netmask 32" >> /etc/network/interfaces.d/60-floating-ip.cfg

systemctl restart networking.service