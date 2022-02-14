#! /bin/bash

echo "Disk space: "
df -H
echo "Filter files and find percentage: "
df -H | grep -vE '^Filesystem|tmpfs|cdrom' |awk '{ print $5 " " $1 }'
