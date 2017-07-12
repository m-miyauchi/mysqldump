#!/bin/sh
CPUSTATUS=cpu_status.txt
MEMORYSTATUS=memory_status.txt
DATE=`date +%Y%m%d%H%M`
INTERVALTIME=1
TESTNUM=12
OUTPUTDIR=/tmp/cpu_mem_status/${DATE}

if [ ! -e ${OUTPUTDIR} ]; then
  mkdir -p ${OUTPUTDIR}
fi

echo 'Recording CPU-load and Memory Usage...'
echo 'Recorded data is here:' ${OUTPUTDIR}
echo 'Exit recording: Ctrl + c'

while true;
do
  echo `date "+%Y/%m/%d-%H:%M:%S"` >> ${OUTPUTDIR}/${CPUSTATUS};
  uptime >> ${OUTPUTDIR}/${CPUSTATUS};
  echo `date "+%Y/%m/%d-%H:%M:%S"` >> ${OUTPUTDIR}/${MEMORYSTATUS};
  free -m >> ${OUTPUTDIR}/${MEMORYSTATUS};
  sleep ${INTERVALTIME};
done
