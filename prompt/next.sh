#!/bin/bash

function next_file(){
    echo "next"
}

function repeat_file(){
    echo "repeat"
}

while :
do
    echo "? (n/r/q): "
    read value
    case ${value} in
        [nN] )
            next_file ;;
        [rR] )
            repeat_file ;;
        [qQ] )
            echo "bye."
            break ;;
        * )
            echo "please enter n, r or q" ;;
    esac
done

