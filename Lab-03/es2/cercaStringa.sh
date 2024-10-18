#!/bin/bash

#cercaStringa.sh
#entrare nella directory
#creazione del file counter.tmp
#per ogni file con estensione .txt
#se è un file e il file soddisfa specifiche → scrittura di una riga nel file
#counter.tmp

#se numero righe counter.tmp > numero righe max_counter.tmp → aggiornamento
#di max_counter.tmp e max_dirname.tmp
#esplorazione ricorsiva della directory
stringa=$1
dir=$2
num=$3

cd $dir

> /tmp/.Counter.tmp

for file in `ls *.txt 2>/dev/null`
do
    if test -f $file -a -r $file
    then
        if `grep $stringa $file | wc -l` -gt $num
            then echo $file >> /tmp/.Counter.tmp
        fi
    fi
done

if test $(wc -l < /tmp/.Counter.tmp) -gt $(wc -l < /tmp/.maxCounter.tmp)
    then 
        cp /tmp/.Counter.tmp /tmp/.maxCounter.tmp
        echo `pwd` > /tmp/.max_dirname.tmp
fi

rm -f /tmp/.Counter.

for i in *
do
    if test -d $i -a -x $i
        then cercaStringa.sh $stringa "$dir" $num
    fi
done