#!/bin/bash                                                                                                                                    
FILE=$1
HEADER=${2:-0}

SUM=`expr $(wc -l $1 | awk '{print $1}') - $HEADER`

echo "checksum = $SUM"

if [[ $SUM -gt 0 ]];then
    echo "checksum successed"
    exit 0
fi
echo "checksum failed" && exit 9
