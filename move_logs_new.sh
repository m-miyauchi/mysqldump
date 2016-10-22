#!/bin/sh
HOST=`hostname`
DIR1=/usr/local/nginx/logs
DIR2=/data/nginx_logs/${HOST}

function move_logs () {
  echo "Start move log files."
  find ${1} -mtime 5 -exec /bin/mv -f {} ${2} \;
}
function remove_logs () {
  echo "Start remove log files."
  find ${1} -mtime 60 -exec /bin/rm -f {} \;
}

if [ ! -e ${DIR2} ]; then
  mkdir -p ${DIR2}
fi
move_logs ${DIR1} ${DIR2}
remove_logs ${DIR2}
