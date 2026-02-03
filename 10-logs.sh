#!/bin/bash

USERID=$(id -u)
LOGS_FOLDER="/var/log/shell-script"
LOGS_FILEs="/var/log/shell-script/$0.log"

if [ $USERID -ne 0 ]; then
    
    echo "Please run this script with root user access"

    exit 1

fi

mkdir -p $LOGS_FOLDER

VALIDATE(){
    if [ $USERID -ne 0 ]; then 

         echo "$2....FAILURE" | tee -a $LOGS_FILE

         exit 1

    else

         echo "$2....SUCCESS"
    fi

    dnf install nginx -y
    VALIDATE $? "Installing Nginx"

    dnf install mysql -y
    VALIDATE $? "Installing mysql"

    dnf install nodejs -y
    VALIDATE $? "Instralling nodejs"

}