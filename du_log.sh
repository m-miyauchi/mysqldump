#!/bin/sh
## Set /df_logs to DIR ##
DIR=/vagrant
LOGDIR=${DIR}/du_logs
## Check and make /df_logs ##
if [ ! -e ${LOGDIR} ]; then
  mkdir -p ${LOGDIR}
fi
LOGFILESUM=`ls -1 ${LOGDIR} | wc -l`
OLDESTFILE=`ls -1 ${LOGDIR} | head -1`
DATE=`date +%Y%m%d%H%M`
FILENAME=du_${DATE}

## Output log files ##
du -h > ${LOGDIR}/${FILENAME}.dat
if test ${LOGFILESUM} -ge 5;then
  rm ${LOGDIR}/${OLDESTFILE}
fi
