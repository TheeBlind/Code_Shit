#!/usr/bin/bash
filename="/user/list.txt"
tool="./tool"
while read -r line; do
    List=$(echo $line|tr -d '\r')
    echo "List:$List"
    $tool -u  $List && wait
done < "$filename"
