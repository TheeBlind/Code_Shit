#!/bin/bash
#SubDomain Enumeration Script
#You need Curl

ListaDomini="/opt/tested/subDomainsBrute/sub1.txt"
WordlistSottodomini="/opt/tested/subDomainsBrute/dict/subnames_full.txt"

readarray -t a <$ListaDomini
readarray -t b <$WordlistSottodomini
for itemA in "${a[@]}"; do
  for itemB in "${b[@]}"; do
printf '%s%s\n' "$itemB"."$itemA" | while read SubDomain
do
echo "$(tput setaf 3)SubDomain:$(tput sgr 0)" $(tput setaf 4)$SubDomain$(tput sgr 0)
if [[ $(curl -o /dev/null --silent --head --write-out  '%{http_code}' "$SubDomain" --max-time 5 | grep -oP "200") ]];
then echo "$(tput setaf 2)ON$(tput sgr 0)" && echo $SubDomain >> OnSub.txt
else echo "$(tput setaf 1)OFF$(tput sgr 0)" && echo $SubDomain > /dev/null
fi
done
  done
done
