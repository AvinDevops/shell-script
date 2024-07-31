#!/bin/bash

SOURCE_DIRECTORY=/tmp/app-logs

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ -d $SOURCE_DIRECTORY ]
then    
    echo -e "$G Source directory exists $N"
else
    echo -e "$R Please make sure $N $Y $SOURCE_DIRECTORY $N $R exists $N"
fi

FILES=$(find $SOURCE_DIRECTORY -name "*.log" -mtime +14)

while IFS= read -r line
do 
 echo "Deleting file: $line"
done <<< $FILES