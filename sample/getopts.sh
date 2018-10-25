#!/bin/bash

while getopts rs: OPT
do
    case ${OPT} in
        r) REPEATING="r"
            ;;
        s) SPEED="-speed ${OPTARG} -af scaletempo"
            ;;
    esac
done

shift $((OPTIND - 1))

if [ $# -ne 1 ]
then
    echo "usage: ${0} [-r] [-s speed] filename"
    exit;
fi

mplayer ${SPEED} ~/Music/toeic/3/${1}${REPEATING}.mp3

