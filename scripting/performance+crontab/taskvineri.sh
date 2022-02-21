#! /usr/bin/env bash

while true
do
	echo "
Choose:
1) CPU load
2) FIlesys diskspace usage
3) Timing cached + Timing buffered reads
4) Disk space
5) Filter files and find percentage of files
6) Current usesr:
7) All users sys:
8) Number of all users
9) Out" 

read INPUT_STRING
  case $INPUT_STRING in
 1)  echo "CPU load"
     top -i     
;; 
  
 2)  echo "FIlesys diskspace usage"
     pydf -h
;;

 3)  echo "Timing cached + Timing buffered reads"
     hdparm -Tt /dev/sda 
;;

 4)  echo "Disk space"
     df -H
;;
 5)  echo "Filter files and find percentage of files"
     df -H | grep -vE '^Filesystem|tmpfs|cdrom' |awk '{ print $5 " " $1 }'
;;

 6)   echo "current usesr:"
      who --count
      echo "with ip adress:" 
      hostname -I
;;

 7)   echo "All users in sys:"
      getent passwd | awk -F: '{print $ 1}'

;;
 
 8)  echo "Number of all users in system: "
     awk -F: '{if ($1 >= 1000) x++} END {print x}' /etc/passwd
;;
 9)   echo "Out"
      break
;;
*)
     echo "Invalid"

;;
esac
done
 
