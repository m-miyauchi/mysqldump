#!/bin/sh
DATE=`date +%Y%m%d%H%M`
FILENAME=${DATE}
LOGFILESUM=`ls -1 ${OUTPUTDIR} | wc -l`
OLDESTFILE=`ls -1 ${OUTPUTDIR} | head -1`
user=(`ls -1 /home`)

for item in ${user[@]}; do

  echo "total ${#user[@]}user."
  echo "Backup starting user:${item}."

  ## Setting target directory and output directory ##
  DIR=/home/${item}/Maildir
  OUTPUTDIR=/tmp/maildir_backup/${item}

  ## Check and make /tar-backup_files ##
  if [ ! -e ${OUTPUTDIR} ]; then
    mkdir -p ${OUTPUTDIR}
  fi

  # Maildirがないユーザに対してエラーで終了しないように変更

  ## Output backup files ##
  \cp -rf ${DIR} ${OUTPUTDIR}/${FILENAME}
  cd ${OUTPUTDIR}
  tar -cvzf ${FILENAME}.tar.gz ${FILENAME}
  rm -rf ${FILENAME}

  if test ${LOGFILESUM} -ge 7;then
    rm ${OUTPUTDIR}/${OLDESTFILE}
  fi

  echo "Back up complete."

done
