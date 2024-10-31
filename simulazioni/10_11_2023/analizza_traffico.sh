#!/bin/bash

if test $# -ne 2
then
    echo "argomenti errati"; exit 1;
fi

case $1 in 
    /*) echo "$1 non è relativo"; exit 2;;
    *);;
esac

if ! test -d $1
then
    echo "$1 non esiste"; exit 3;
fi

case $2 in
    *[a-z]*);;
    *) echo "$2 non contiene solo caratteri minuscoli" exit 4;;
esac

> $HOME/riepilogo.log
> /tmp/giorno_max.tmp
echo 0 > /tmp/megabyte_max.tmp

PATH=$PATH:`pwd`;
export PATH;

sh ricerca_nodo.sh $1 $2

#stampo risultato
echo "Il giorno con più occorrenze è `cat /tmp/giorno_max.tmp` con `cat /tmp/megabyte_max.tmp` occorrenze"