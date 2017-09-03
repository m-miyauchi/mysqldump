#!/bin/sh
# Vegeta Parameters #####
DURATION=1
TIMEOUT=60
RATE=1
#########################
VEGETA=`which vegeta`
OUTPUTDIR=attack_results
DATE=`date +%Y%m%d%H%M%S`

# Usage
# echo test_shenario.txt | ./vegeta_attack.sh

if [ -p /dev/stdin ] ; then
    TESTFILE=$(cat -)
    SCENARIO=$(echo ${TESTFILE} | sed "s/\.txt//" | sed "s/test_scenario\///")
    echo "シナリオ: ${SCENARIO} を実行"
else
    echo "テストシナリオを入力してください"
fi

setup_directory() {
  if [ ! -e ${1}/bin ]; then
    mkdir -p ${1}/bin
  fi
  if [ ! -e ${1}/text ]; then
    mkdir -p ${1}/text
  fi
  if [ ! -e ${1}/html ]; then
    mkdir -p ${1}/html
  fi
}

setup_directory ${OUTPUTDIR}/${SCENARIO}
FILENAME=${SCENARIO}_${DATE}

echo "攻撃を実行中…"
cat ${TESTFILE} | ${VEGETA} attack -duration=${DURATION}s -timeout=${TIMEOUT}s --rate ${RATE} -header ${HEADER} | tee ${OUTPUTDIR}/${SCENARIO}/bin/${FILENAME}.bin | ${VEGETA} report
echo "攻撃を完了"
echo "攻撃結果をテキストファイルに出力"
cat ${OUTPUTDIR}/${SCENARIO}/bin/${FILENAME}.bin | vegeta report -reporter=text > ${OUTPUTDIR}/${SCENARIO}/text/${FILENAME}.txt
echo "攻撃結果をHTMLに出力"
cat ${OUTPUTDIR}/${SCENARIO}/bin/${FILENAME}.bin | vegeta report -reporter=plot > ${OUTPUTDIR}/${SCENARIO}/html/${FILENAME}.html
echo "シナリオ: ${SCENARIO} のテストを完了"
