#1/bin/bash

set -e

USERID=$(id -u)
LOGS_FOLDER="/var/log/shell-script"
LOGS_FILE="/var/log/shell-script/$0.log"


if [ USERID -ne 0 ]; then
   echo -e "R Please run this script wit root user access $N" | tee -a $LOGS_FILE
   exit 1
fi
mkdir -p $LOGS_FOLDER

VALIDATE(){
    if [$1 -ne 0];then
       echo -e "$2....$R FAILURE $N" | tee -a $LOGS_FILE
       exit 1

    else
       echo -e "$2....$G SUCCESS $N" | tee -a $LOGS_FILE
    fi
}