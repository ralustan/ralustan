#! /usr/bin/env bash

used=$(df -Ph | grep '/dev/mapper/vgubuntu-root' | awk {'print $5'})
df -Ph | grep '/dev/mapper/vgubuntu-root' | awk {'print $5'}
max=$(80%)
echo $( max )
if [ $( used )  -ge $( max ) ]
then
echo "The Mount Point on $(hostname) has used $used at $(date)"
fi
