#!/bin/sh
## Setting target directory and output directory ##
DIR=/vagrant/shellscript/test_dir
OUTPUTDIR=/tmp/tar-backup_files
## Check and make /tar-backup_files ##
if [ ! -e ${OUTPUTDIR} ]; then
  mkdir -p ${OUTPUTDIR}
fi
DATE=`date +%Y%m%d%H%M`
DIRNAME=`basename ${DIR}`
FILENAME=${DIRNAME}_${DATE}
LOGFILESUM=`ls -1 ${OUTPUTDIR} | wc -l`
OLDESTFILE=`ls -1 ${OUTPUTDIR} | head -1`

## Output backup files ##
\cp -rf ${DIR} ${OUTPUTDIR}/${FILENAME}
cd ${OUTPUTDIR}
tar -cvzf ${FILENAME}.tar.gz ${FILENAME}
rm -rf ${FILENAME}

if test ${LOGFILESUM} -ge 7;then
  rm ${OUTPUTDIR}/${OLDESTFILE}
