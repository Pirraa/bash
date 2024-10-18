#!/bin/bash

if test $# -lt 4
then 
    echo argomenti errati
    exit 1
fi

case $1 in
    *[!0-9]*) echo il primo parametro deve essere un intero
    exit 2;;
esac

num=$1
shift 

case $1 in 
    /*) if test ! -d $1
        then 
            echo $1 dir sorgente non è directory
            exit 3
        fi;;
    *) echo dir sorgente non è percorso assoluto
esac

sorg=$1
shift

case $1 in 
    /*) if test ! -d $1
        then 
            echo $1 dir destinazione non è directory
            exit 3
        fi;;
    *) echo dir destinazione non è percorso assoluto
esac

dest=$2
shift

for i in $*
do
    case $i in
        .*);;
        *) echo $i non è un estensione
        exit 4;;
    esac
done

PATH=$PATH:`pwd`
export PATH

#file che iniziano per . sono nascosti. Con > creo file se non esiste o lo sovrascrivo cancellando tutto
> /tmp/.counter.tmp

#con $* passo tutti i parametri dal quarto in poi cioè le estensioni
ricerca.sh $num "$sorg" "$dest" $*
echo `wc -l </tmp/.counter.tmp`

rm -f /tmp/.counter.tmp