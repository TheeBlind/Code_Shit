#!/bin/bash
#Domain Checker

DOMAINS="/root/Downloads/it_Domains.txt"

check() {
if [[ $(curl -Is $1 | grep -oP '(200|302|301)') ]]; then
    echo $(tput setaf 4)$1$(tput sgr 0) "-----------> $(tput setaf 2)ALIVE$(tput sgr 0)" && echo $1 >> Alive.txt;
else
    echo $(tput setaf 4)$1$(tput sgr 0) "-----------> $(tput setaf 1)DEATH$(tput sgr 0)" && echo $1 >> Death.txt;
fi
}
export -f check
cat $DOMAINS | parallel -j 1 check {}
