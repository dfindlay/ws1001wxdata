#!/bin/bash
##set -x

if [ $# -ne 0 ]
then
	echo usage: $0:
	exit 0
fi

data_dir="$(dirname "$0")"
logs_dir="/tmp"
wx_bin_dir="$(dirname "$0")"

if [ ! -d $data_dir ]
then
	echo Data directory, $data_dir, does not exist.
	exit 0
fi

log=$logs_dir/ws1001wxdata-`date +%F`.log

echo Starting ws1001wxdata.pl

$wx_bin_dir/ws1001wxdata.pl -m -i 192.168.178.45 $data_dir/msg-udp-srch.dat $data_dir/msg-tcp-nowrec-req.dat $data_dir/ewpdata.dat >> $log 2>&1
