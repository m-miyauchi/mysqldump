#!/bin/sh
DBUSER=user
PASSWD=passwd
DBNAME=db
OUTPUTDIR=/tmp/mysql_backup
## Check and make /tar-backup_files ##
if [ ! -e ${OUTPUTDIR} ]; then
  mkdir -p ${OUTPUTDIR}
fi
DATE=`date +%Y%m%d%H%M`
LOGFILESUM=`ls -1 ${OUTPUTDIR} | wc -l`
OLDESTFILE=`ls -1 ${OUTPUTDIR} | head -1`
FILENAME=${DBNAME}_${DATE}.sql

mysqldump --single-transaction -u ${DBUSER} -p ${PASSWD} ${DBNAME} > ${OUTPUTDIR}/${FILENAME}

if test ${LOGFILESUM} -ge 7;then
  rm ${OUTPUTDIR}/${OLDESTFILE}
fi
