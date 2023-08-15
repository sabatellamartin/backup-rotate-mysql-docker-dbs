#! /bin/bash

###################################################
# CRITERIA
# Remove directories into BACKUP_DIR 
# with format DIR_FORMAT between START to 
# LIMIT day.
# Font: https://www.cyberciti.biz/tips/ssh-rotate-backup-shell-script.html
###################################################

## BACK DIR
HOME_DIR="/home/user"
BACKUP_DIR="${HOME_DIR}/backups"
## START REMOVE FROM x DAYS
START=7
## DIR FORMAT
DIR_FORMAT="%Y%m%d" # YYYY-MM-DD format
## DEFINE DAYS LIMIT FORM START.
## NOTE: Will run every day but set 3
## days. Remove from day 7 to day 10.
## Do not edit below
LIMIT=$( expr $START + 3 )
## GET DIR LIST TO REMOVE
DAYS=$(for d in $(seq $START $LIMIT);do date --date="$d days ago" +"${DIR_FORMAT}"; done)
## FOR EACH DAY REMOVE DIR
for d in $DAYS
do
  rm -rf $BACKUP_DIR/$d*
done
# LOG REG
echo "$(date +"%H:%M:%S, %Y-%m-%d")  ${DAYS}" >> ${BACKUP_DIR}/$(date +"%Y").log
  