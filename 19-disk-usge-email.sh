#!/bin/bash

DISK_USEAGE=$(df -hT | grep xfs)
DISK_THRESHOLD=7
MESSAGE=""

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

while IFS= read -r line
do
    USEAGE=$(echo $line | awk -F " " '{print $6F}' | cut -d "%" -f1)
    FOLDER=$(echo $line | awk -F " " '{print $NF}')
    if [ $USEAGE -ge $DISK_THRESHOLD ]
    then
        MESSAGE+="$FOLDER useage is more than $DISK_THRESHOLD, current useage:$USEAGE\n"
        
    fi
done <<< $DISK_USEAGE

echo  $MESSAGE

# echo "$MESSAGE" | mail -s "DISK USEAGE INFO" avinashbandela25@gmail.com