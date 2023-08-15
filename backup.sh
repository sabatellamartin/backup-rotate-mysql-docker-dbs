#!/usr/bin/env bash
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin

HOME_DIR="/home/user"
BACKUP_DIR="${HOME_DIR}/backups"
BACKUP_DATE="$(date +"%Y%m%d")"
CONTAINER_NAME="mysql-service"
PASSWORD="?"

DATABASES=""
DATABASES="${DATABASES} database1"
DATABASES="${DATABASES} database2"
DATABASES="${DATABASES} database3"
# Add lines contains db name if you have more schemes to backup

for DATABASE in $DATABASES; do
  echo "$(date +"%H:%M:%S, %Y-%m-%d") ${DATABASE}" >> ${BACKUP_DIR}/$(date +"%Y").log
  docker exec $CONTAINER_NAME /usr/bin/mysqldump -hmysql -uroot -p$PASSWORD --databases $DATABASE | gzip > ${BACKUP_DIR}/${BACKUP_DATE}_${DATABASE}.sql.gz
done