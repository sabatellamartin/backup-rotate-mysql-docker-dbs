# Scripts to backup and rotate Mysql Docker databases 

If you have Mysql service runs with docker, ca use this scripts in combination to backup and rotate old ones.

Configure to run both scripts in linux crontab.

backup.sh: make backups
rotate.sh: remove old backups and conserves the latest.