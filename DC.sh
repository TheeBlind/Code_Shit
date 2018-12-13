#!/bin/bash
#Domain Checker

DOMAINS="your_domain_list.txt"

check() {
if [[ $(host -s -W 10 $1 | grep -oP 'has address') ]]; then
    echo $(tput setaf 4)$1$(tput sgr 0) "-----------> $(tput setaf 2)ALIVE$(tput sgr 0)" && echo $line >> Alive.txt;
else
    echo $(tput setaf 4)$1$(tput sgr 0) "-----------> $(tput setaf 1)DEATH$(tput sgr 0)" && echo $line >> Death.txt;
fi
}
export -f check
cat $DOMAINS | parallel -j "$(nproc)" check {}

