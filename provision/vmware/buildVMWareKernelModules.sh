#!/bin/bash

sudo mkdir /lib/modules/`uname -r`/misc

 

sudo rm -rf /usr/lib/vmware/modules/source/vmmon-only/

sudo rm -rf /usr/lib/vmware/modules/source/vmnet-only/

 

sudo tar -xvf /usr/lib/vmware/modules/source/vmmon.tar --directory /usr/lib/vmware/modules/source

sudo tar -xvf /usr/lib/vmware/modules/source/vmnet.tar --directory /usr/lib/vmware/modules/source

 

cd /usr/lib/vmware/modules/source/vmnet-only/

sudo patch < VMware-Workstation-12.5.7-kernel4.13-atomic-inc.patch

sudo make

sudo cp -p vmnet.ko /lib/modules/`uname -r`/misc

 

cd /usr/lib/vmware/modules/source/vmmon-only/

#replace the hostif.c file with extra space with fixed version

sudo cp -p hostif.c /usr/lib/vmware/modules/source/vmmon-only/linux/hostif.c

sudo make

sudo cp -p vmmon.ko /lib/modules/`uname -r`/misc

 

sudo depmod -a
