#!/bin/bash

#check if we are using sudo, exit if we are
if [ $USER = 'root' ]
then
echo "Please do not run this as root."
exit
fi

output=~/research/sys_info.txt
ipaddr=$(hostname -I | awk '{print $1}')
findexe=$(find -perm 777)

if [ ! -d ~/research ]
then
mkdir ~/research
fi

if [ -f ~/research/sys_info.txt ]
then
rm ~/research/sys_info.txt
fi

echo "Welcome to the first script.  Today's date is $(date)\n" > $output
echo -e "\nHere is this machine's info:  $(uname)\n" >> $output
echo -e "\nThe machine's IP address is:  $ipaddr\n" >> $output
echo -e "\nThe hostname is: $(hostname)\n" >> $output

$findexe >> $output

ps aux | head -11 | tail -10 >> $output
