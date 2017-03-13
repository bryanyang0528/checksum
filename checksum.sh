#!/bin/bash
LOOPS=6
SLEEP=1h
DBNAME=$1
DBNAME=$2
DT=$3
TMP=/home/bryan.yang/tmp/checksum.tmp

for i in `seq 1 $LOOPS`;
do

echo $i
/usr/bin/impala-shell -B -q "select count(*) from $1.$2 where dt ='$3'" > $TMP
SUM=`cat $TMP`
echo "checksum = $SUM"
if [[ $SUM -gt 0 ]];then 
    echo "checksum successed" && rm $TMP 
    exit 0
fi

echo "wait for next round after $SLEEP" && rm $TMP
sleep $SLEEP

done

echo "loop end, checksum failed" && exit 9
