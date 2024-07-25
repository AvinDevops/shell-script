#!bin/bash

echo "All varaibles : $@"
echo "Number of varibales passed : $#"
echo "Script Name : $0"
echo "Current working directory : $PWD"
echo "Home directory of current user : $HOME"
echo "Which user is running this script :$USER"
echo "ip address hostname : $HOSTNAME"
echo "Process id of the current shell script : $$"
sleep 120 &
echo "Process ID of last background : $!"