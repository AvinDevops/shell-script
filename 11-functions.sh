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
    echo "exit status : $1"
    echo "what are you doing : $2"
}

dnf install mysql -y
VALIDATE $? "Installing mysql"

dnf install git -y
VALIDATE $? "Installing git"