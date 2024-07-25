#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "please run this script with root access"
else
    echo "you are super user"
fi

dnf install mysqll -y
if [ $? -ne 0 ]
then
    echo "Installation of mysql...FAILURE"
else
    echo "Installation of mysql...SUCCESS"
fi

echo "Is scripting executing...!"