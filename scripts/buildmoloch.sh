#!/bin/sh

mkdir -p /data/pcap

if [ -z $1 ]; then
	BUILDDIR=/data/moloch-git
else
	BUILDDIR=$1
fi

echo "git clone"
git clone -b batch-build-fix https://github.com/kost/moloch.git $BUILDDIR
echo "cd to dir and build"
cd $BUILDDIR
USEPFRING=no ESMEM="512M" DONOTSTART=yes USERNAME=daemon GROUPNAME=daemon PASSWORD=0mgMolochDockerRules5 INTERFACE=eth0 BATCHRUN=yes ./easybutton-singlehost.sh
killall java
echo "Giving ES time to shut itself"
sleep 5

