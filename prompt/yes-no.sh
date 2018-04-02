#!/bin/bash

while :
do
    echo "? (y/n): "
    read value
    case ${value} in
        [yY] )
            echo "yes"
            break ;;
        [nN] )
            echo "no"
            break ;;
        * )
            echo "please enter y or n" ;;
    esac
done

