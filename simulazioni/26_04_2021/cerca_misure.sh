#!/bin/bash

if test $# -ne 2
then
    echo "numero argomenti errato"; exit 1;
fi

dir=$1

case $dir in
    /*);;
    *) echo "$dir non è assoluto"; exit 2;;
esac

if ! test -d $dir 
then
    echo "$dir non esiste"; exit 3;
fi

header=$2

PATH=$PATH:`pwd`;
export PATH

> /$HOME/misure.txt
> /tmp/max_directory
echo 0 > /tmp/max_file

sh ricerca.sh $dir $header

echo "la directory con più file che soddisfano le condizioni è `cat /tmp/max_directory` con `cat /tmp/max_file` file";
