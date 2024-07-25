#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
    echo "Please install with root access"
    exit 1
else
    echo "you are super user"
fi

VALIDATE(){
    if [ $? -ne 0 ]
    then
        echo "$2...FAILED"
        exit 1
    else
        echo "$2...SUCCESS"
    fi
}

dnf install mysqll -y
VALIDATE $? "Installing mysql"

dnf install git -y
VALIDATE $? "Installing git"