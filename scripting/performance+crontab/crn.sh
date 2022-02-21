#! /usr/bin/env bash

used=$(df -Ph | grep '/dev/mapper/vgubuntu-root' | awk {'print $2'}) 
echo $used



