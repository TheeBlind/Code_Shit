#!/bin/bash
# Check if domains are  alive

DOMAINS="/root/your_domain_list.txt"

while read -r line; do

List=$(echo $line|tr -d '\r')

if [[ $(host $line | grep -oP "has address") ]];
then echo $(tput setaf 4)$line$(tput sgr 0) "-----------> $(tput setaf 2)ALIVE$(tput sgr 0)" && echo $line >> Alive.txt
else echo $(tput setaf 4)$line$(tput sgr 0) "-----------> $(tput setaf 1)DEATH$(tput sgr 0)" && echo $line >> Death.txt
fi
done < $DOMAINS
