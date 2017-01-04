#!/bin/bash -e

basedir=$(cd $(dirname $0) ; pwd)

cp config_qemu_x86_64 buildroot/.config

(
  cd $basedir/buildroot
  case $1 in
  config)
    cp $basedir/config_qemu_x86_64 .config
    make menuconfig
    cp .config $basedir/config_qemu_x86_64
    ;;
  *)
    make
    ;;
  esac
)
