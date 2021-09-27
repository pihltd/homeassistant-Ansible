#!/bin/bash
#Backup owncloud mysql and delete the oldest file if more than the specified number
KEEPFILENUM=5
TARGETDIR="/mnt/bigdisk/ownclouddump/"
CONFIGDIR=""

#Run the mysqldump
mysqldump --single-transaction -h localhost -u owncloud -p GotData? owncloud > ${TARGETDIR}OwncloudBackup_`date + %Y-%m-%d`.sql

#Rsync the config directory
rsync -Aax ${CONFIGDIR} ${TARGETDIR}

#Remove old backup files
ls -1t ${TARGETDIR} | tail -n +${KEEPFILENUM} |  xargs rm
