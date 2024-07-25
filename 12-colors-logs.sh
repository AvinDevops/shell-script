#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log
R="\e[31m"
G="\e[32m"
N="\e[0m"

if [ $USERID -ne 0 ]
then 
    echo -e "$R please install with root access $N"
    exit 1
else
    echo -e "$G you are super user $N"
fi

VALIDATE(){
    if [ $? -ne 0 ]
    then
        echo -e "$R $2 is ....FAILED $N"
        exit 1
    else
        echo -e "$G $2 is ... SUCCESS $N"
    fi
}

dnf install mysql -y &>>$LOGFILE
VALIDATE $? "Installing mysql"

dnf install git -y &>>$LOGFILE
VALIDATE $? "Installing git"

dnf install dockerrr -y &>>$LOGFILE
VALIDATE $? "Installing docker"