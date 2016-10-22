#!/bin/sh
OUTPUTDIR=/tmp/postgres_backup
DBNAME=db_name
if [ ! -e ${OUTPUTDIR} ]; then
  mkdir -p ${OUTPUTDIR}
fi
DATE=`date +%Y%m%d%H%M`
FILENAME=${DATE}
LOGFILESUM=`ls -1 ${OUTPUTDIR} | wc -l`
OLDESTFILE=`ls -1 ${OUTPUTDIR} | head -1`

## backup ##
pg_dump ${DBNAME} > ${OUTPUTDIR}/${DATE}.sql

if test ${LOGFILESUM} -ge 7;then
  rm ${OUTPUTDIR}/${OLDESTFILE}
fi
