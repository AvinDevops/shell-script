#!/bin/bash

R="\e[31m"
G="\e[32m"
N="\e[0m"

set -e

error_handler(){
    echo "error came at  $1:$2"
}

trap 'error_handler ${LINENO} "$BASH_COMMAND"' ERR

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo -e "$R please run this script with root access $N"
    #exit 1
else
    echo "$G you are super user $N"
fi

dnf install mysqll -y

dnf install git -y

echo "Is scripting executing...!"