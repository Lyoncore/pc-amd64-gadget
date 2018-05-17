#!/bin/bash

set -ex
IMAGE=$1

if [[ -z $IMAGE ]]; then
    echo "usage: ./$0 <ubuntu-core image name>"
    exit 1
fi

LOOP=$(losetup --find --show $IMAGE)

if [ ! -f /sbin/kpartx ]; then
    apt-get update
    apt-get install kpartx
fi

kpartx -avs $LOOP

if [ ! -f /sbin/fatlabel ]; then
    apt-get update
    apt-get install dosfstools
fi

LOOP_MAP=$(basename $LOOP)
fatlabel /dev/mapper/${LOOP_MAP}p2 INSTALLER

kpartx -ds $IMAGE
