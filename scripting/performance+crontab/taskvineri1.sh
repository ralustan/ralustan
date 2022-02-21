#! /usr/bin/env bash


echo "FIlesys diskspace usage"
pydf -h

echo "Timing cached + Timing buffered reads"
hdparm -Tt /dev/sda 
       
echo "Disk space"
df -H

echo "Filter files and find percentage of files"
df -H | grep -vE '^Filesystem|tmpfs|cdrom' |awk '{ print $5 " " $1 }'


echo "current usesr:"
who --count
echo "with ip adress:" 
hostname -I

echo "All users in sys:"
getent passwd | awk -F: '{print $ 1}'

echo "Number of all users in system: "
awk -F: '{if ($1 >= 1000) x++} END {print x}' /etc/passwd
