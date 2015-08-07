#!/bin/sh
sudo mount /dev/cdrom /media/cdrom
cd /media/cdrom
cp VMwareTools-*.tar.gz /tmp
cd /tmp
tar fx VMwareTools-*.tar.gz
cd /tmp/vmware-tools-distrib
sudo ./vmware-install.pl -d
sudo shutdown -h now
