#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $USERID -ne 0 ]
then
    echo -e "$R Please install with root access $N"
    exit 1
else
    echo -e "$G you are super user $N"
fi

VALIDATE(){
    if [ $? -ne 0 ]
    then
        echo -e "$R $2 is...FAILED $N"
        exit 1
    else
        echo -e "$G $2 is...SUCCESS $N"
    fi
}

for i in $@
do
    echo "package to install : $i"
    dnf list installed $i &>>$LOGFILE
    if [ $? -eq 0 ]
    then
        echo -e "$G $i already installed $N...$Y SKIPPING $N"
    else
        dnf install $i -y &>>$LOGFILE
        VALIDATE $? "Installing $i"
    fi
done