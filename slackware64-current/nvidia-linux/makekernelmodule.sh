#!/bin/bash

KERNEL=${KERNEL:-$(uname -r)}
KERNELPATH=${KERNELPATH:-/lib/modules/${KERNEL}/build}
cd /usr/share/nvidia-linux/kernel
make clean && make SYSSRC=$KERNELPATH module
if [ $? -ne 0 ];then
  echo "Errori compilando il modulo del kernel!!"
  exit 1
fi
mkdir -p /lib/modules/`uname -r`/kernel/drivers/video
cp nvidia.ko /lib/modules/`uname -r`/kernel/drivers/video/nvidia.ko
/sbin/depmod -a
