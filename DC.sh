#!/bin/bash
#Domain Checker

DOMAINS="/home/theblind/Desktop/miss.txt"

check() {
if [[ $(host -s -W 10 $1 | grep -oP 'has address') ]]; then
    echo $(tput setaf 4)$1$(tput sgr 0) "-----------> $(tput setaf 2)ALIVE$(tput sgr 0)" && echo $1 >> Alive.txt;
else
    echo $(tput setaf 4)$1$(tput sgr 0) "-----------> $(tput setaf 1)DEATH$(tput sgr 0)" && echo $1 >> Death.txt;
fi
}
export -f check
cat $DOMAINS | parallel -j 1 check {}

