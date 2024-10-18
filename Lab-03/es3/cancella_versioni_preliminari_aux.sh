#!/bin/bash

#• entrare nella directory
#• inizializzazione a 0 di una variabile contatore counter
#• per ogni file con estensione .txt
#• se è un file e ho i diritti di scrittura sul file, se la prima riga contiene la parola
#preliminare → aggiornamento del contatore counter e rimozione del file

#• se il valore di counter > del valore contenuto in max_counter.tmp →
#aggiornamento di max_counter.tmp e max_dirname.tmp
#• esplorazione ricorsiva della directory

cd $1

counter=0

for file in `ls *.txt 2>/dev/null`
do
    if test -f $file -a -r $file
       then 
       if test `head -n 1 file.txt | grep -c preliminare` -eq 1
            then counter=$(($counter+1))
            rm -f $file
       fi
    fi
done

#confronto counter con max counter
if test $counter -gt $(cat /tmp/.max_counter.tmp)
    then
        echo $counter > /tmp/.max_counter.tmp
        echo `pwd` > /tmp/.max_dirname.tmp
fi

for i in *
do
    if test -d $i -a -x $i
        then cancella_versioni_preliminari_aux.sh $i
    fi
done