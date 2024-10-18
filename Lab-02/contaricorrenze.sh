#!/bin/sh

if test $# -lt 2
    then echo almeno 2 parametri
    exit
fi

if ! test -f $1 
    then echo il primo parametro deve essere file
    exit
fi

#Contare per ogni stringa passata il numero di righe nel file che contengono tale stringa
for i in $*
do
    if test $i = $1
        then continue
    fi
    #flag -n di echo non va a capo
    echo -n "$i "; echo $(grep "$i" "$1" | wc -l); 
done