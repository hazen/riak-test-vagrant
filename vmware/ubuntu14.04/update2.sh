#!/bin/sh
sudo apt-get -y install build-essential linux-headers-$(uname -r)
sudo apt-get autoremove
echo Now Mount VMWare Tools Install CD
