#!/bin/bash

cd "$1"
counter=0


for i in *.txt
do
    if test -f "$1" -a -w "$1"
    then
        if test `head -n 1 $1 | cut -f 3 -d ','` = preliminare
        then 
            echo "`pwd/$i` è preliminare"
            counter=`expr $counter + 1`
        else
            echo "`pwd/$i` non è preliminare"
        fi
    fi
done

if test $counter -gt `cat /tmp/max_counter`
then 
    echo $counter > /tmp/max_counter
    echo `pwd` > /tmp/max_dirnameù
fi

for d in *
do
    if test -d "$d" -a -x "$d"
    then
        cancella_versioni_preliminari.sh "$i"
    fi
done