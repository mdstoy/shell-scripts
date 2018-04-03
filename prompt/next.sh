#!/bin/bash

set -eu

function execute(){
    echo $1
}

TARGET_DIR=$1

TARGET_FILES=($(find ${TARGET_DIR} -maxdepth 1 -type f | sort))

set +u
START_INDEX=$2
FILE_INDEX=${START_INDEX:=0}
set -u
            
execute ${TARGET_FILES[${FILE_INDEX}]}

while :
do
    echo "? (n/b/r/q/NUMBER): "
    read value
    case ${value} in
        [nN] )
            FILE_INDEX=$((FILE_INDEX + 1))
            execute ${TARGET_FILES[${FILE_INDEX}]} ;;
        [bB] )
            FILE_INDEX=$((FILE_INDEX - 1))
            execute ${TARGET_FILES[${FILE_INDEX}]} ;;
        [rR] )
            execute ${TARGET_FILES[${FILE_INDEX}]} ;;
        [qQ] )
            echo "bye."
            break ;;
        * )
            expr ${value} + 1 > /dev/null 2>&1
            if [ $? -lt 2 ]
            then
                FILE_INDEX=${value}
                execute ${TARGET_FILES[${FILE_INDEX}]}
            else
                echo "please enter n, b, r, q, or NUMBER"
            fi
            ;;
    esac
done

