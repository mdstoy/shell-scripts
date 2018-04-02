#!/bin/bash

function execute(){
    echo $1
}

TARGET_DIR=$1

echo ${TARGET_DIR}

TARGET_FILES=($(find ${TARGET_DIR} -maxdepth 1 -type f | sort))

FILE_INDEX=0
            
execute ${TARGET_FILES[${FILE_INDEX}]}

while :
do
    echo "? (n/r/q): "
    read value
    case ${value} in
        [nN] )
            (( FILE_INDEX++ ))
            execute ${TARGET_FILES[${FILE_INDEX}]} ;;
        [rR] )
            execute ${TARGET_FILES[${FILE_INDEX}]} ;;
        [qQ] )
            echo "bye."
            break ;;
        * )
            echo "please enter n, r or q" ;;
    esac
done

