#!/bin/bash

set -e

error_handler(){
    echo "error came at $1:$2"
}

trap 'error_handler ${LINENO} "$BASH_COMMAND"' ERR

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "please run this script with root access"
    exit 1
else
    echo "you are super user"
fi

dnf install mysqll -y

dnf install git -y

echo "Is scripting executing...!"