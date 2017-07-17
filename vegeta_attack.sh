#!/bin/sh
VEGETA=`which vegeta`
LOGDIR=attack_results
DATE=`date +%Y%m%d%H%M`

# Usage
# 1. Install vegeta
# https://github.com/tsenart/vegeta
# 2. Prepare test-scenario for vegeta(format is .txt), and run command below.
# echo test_scenario_A | ./vegeta_attack.sh

if [ -p /dev/stdin ] ; then
    TESTNAME=$(cat -)
    echo "シナリオ: ${TESTNAME} を実行"
else
    echo "テストシナリオ名を入力してください"
fi

if [ ! -e ${LOGDIR} ]; then
  mkdir -p ${LOGDIR}
fi

echo "攻撃を実行中…"
cat ./test_scenario/${TESTNAME}.txt | ${VEGETA} attack -duration=1s --rate 1 | tee ${LOGDIR}/${TESTNAME}_${DATE}.bin | ${VEGETA} report
