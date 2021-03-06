#!/bin/sh
CPULOG=cpu_status.txt
MEMORYLOG=memory_status.txt
PROCESSLOG=process_status.txt
INTERVALTIME=5
TESTNAME=$1
DATE=`date +%Y%m%d%H%M`
OUTPUTDIR=~/stress_test/${TESTNAME}_${DATE}

if [ ! -e ${OUTPUTDIR} ]; then
  mkdir -p ${OUTPUTDIR}
fi

echo 'Recording CPU-load, Process status and Memory Usage...'
echo 'Recorded data is here:' ${OUTPUTDIR}
echo 'Exit recording: Ctrl + c'

while true;
do
  echo `date "+%Y/%m/%d-%H:%M:%S"` >> ${OUTPUTDIR}/${PROCESSLOG};
  ps -U root u >> ${OUTPUTDIR}/${PROCESSLOG};
  echo `date "+%Y/%m/%d-%H:%M:%S"` >> ${OUTPUTDIR}/${CPULOG};
  uptime >> ${OUTPUTDIR}/${CPULOG};
  echo `date "+%Y/%m/%d-%H:%M:%S"` >> ${OUTPUTDIR}/${MEMORYLOG};
  free -m >> ${OUTPUTDIR}/${MEMORYLOG};
  sleep ${INTERVALTIME};
done
