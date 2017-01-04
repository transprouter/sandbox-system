#!/bin/bash -e
# This script is executed after the rootfs image has beed created

basedir=$(cd $(dirname $0); pwd)
qemu-img convert -O qcow2 $basedir/buildroot/output/images/rootfs.ext2 $basedir/buildroot/output/images/rootfs.qcow
