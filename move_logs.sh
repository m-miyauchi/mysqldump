#!/bin/sh
HOST=`hostname`
DIR=/usr/local/nginx/logs
DIR2=/data/nginx_logs/${HOST}
ARRAY=("filenameA" "filenameB" "filenameC")
 
function move_logs () {
  echo "Start move log files."
  for j in `seq 0 ${#ARRAY[@]}`
  do
    for i in `seq 15 365`
    do
      date --date "${DATE} ${i} days ago" +%Y%m%d
      if [ -e ${DIR}/${ARRAY[${j}]}`date --date "${DATE} ${i} days ago" +%Y%m%d`.gz ]; then
        mv -f ${DIR}/${ARRAY[${j}]}`date --date "${DATE} ${i} days ago" +%Y%m%d`.gz ${DIR2}
        echo "File moved."
      fi
    done
  done
}
function remove_logs () {
  echo "Start remove log files."
  for j in `seq 0 ${#ARRAY[@]}`
  do
    for i in `seq 60 365`
    do
      date --date "${DATE} ${i} days ago" +%Y%m%d
      if [ -e ${DIR2}/${ARRAY[${j}]}`date --date "${DATE} ${i} days ago" +%Y%m%d`.gz ]; then
        rm -f ${DIR2}/${ARRAY[${j}]}`date --date "${DATE} ${i} days ago" +%Y%m%d`.gz
        echo "File removed."
      fi
    done
  done
}
 
if [ ! -e ${DIR2} ]; then
  mkdir -p ${DIR2}
fi
move_logs
remove_logs
