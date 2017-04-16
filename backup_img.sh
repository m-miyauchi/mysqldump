#!/bin/sh
TARGET_DIR_STAGING=/opt/app_name/current/.uploads
TARGET_DIR_PRODUCTION=/opt/app_namePro/current/.uploads
OUTPUT_DIR_STAGING=/tmp/backup/app_name_img_staging
OUTPUT_DIR_PRODUCTION=/tmp/backup/app_name_img_production
FILENAME=`date +%Y%m%d%H%M`
DAYS=3

backup_images() {
  #echo "Backup ${1}."
  \cp -rf ${1} ${2}/${3}
  cd ${2}
  tar -cvzf ${3}.tar.gz ${3}
  rm -rf ${3}
}
remove_old_files() {
  #echo "Remove files in ${1} ${DAYS}days ago."
  find ${1} -mtime ${DAYS} -exec /bin/rm -f {} \;
}

echo "Backup Staging images."
backup_images  ${TARGET_DIR_STAGING} ${OUTPUT_DIR_STAGING} ${FILENAME}
remove_old_files ${OUTPUT_DIR_STAGING}

echo "Backup Produciton images."
backup_images  ${TARGET_DIR_PRODUCTION} ${OUTPUT_DIR_PRODUCTION} ${FILENAME}
remove_old_files ${OUTPUT_DIR_PRODUCTION}
