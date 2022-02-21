#! /usr/bin/env bash
#run the script from disired path at desired hour:
#echo "The path is $PATH"
#run script on local server with ssh
#ssh ralucastan@$ip_address 'sh -' < /bin/bash /home/ralucastan/scripting/task1.sh

##run script at hour desired
#while [ $(date +%H%M%S) -gt 173030 ]
#do
#   sleep 10
#   /bin/bash /home/ralucastan/scripting/task1.sh
#done


ip_address=$(hostname -I)
echo ralucastan@$ip_address

red=`tput setaf 1`
green=`tput setaf 2`

#verificare conexiune ping
echo "Introdu server: "
read SERVER

if ping -c 5 -W 1 $SERVER > /dev/null
  then
   echo "${green}Connection success"
   sleep 2
   else
    echo "${red}Connection failed"
fi






