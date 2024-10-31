#!/bin/bash

dir=$1
nodo=$2

cd $dir

counter=0
giorno_max=""

for i in *.log
do
    linea=`grep $nodo $i`;
    if test -f $i -a $linea 
    then
        ora=`echo $linea | cut -d ';' -f 2`
        echo "$i $ora" >> $HOME/riepilogo.log;
        counter=`expr $counter + 1`
        giorno_max=$i
    fi
done

if test $counter -gt `cat /tmp/megabyte_max.tmp`
then
    echo "$counter" > /tmp/megabyte_max.tmp
    echo "$giorno_max" > /tmp/giorno_max.tmp
fi


for i in *
do
    if test -d $i -a -x $i
    then
        ricerca_nodo.sh $i $nodo
    fi
done