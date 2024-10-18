#!/bin/bash

if test $# -ne 3
then 
    echo numero argomenti errati
    exit 1
fi

stringa=$1
shift 

case $1 in 
    /*) if test ! -d $1
        then 
            echo $1 dir sorgente non è directory
            exit 3
        fi;;
    *) echo dir sorgente non è percorso assoluto
esac

dir=$1
shift


case $1 in
    *[!0-9]*) echo il terzo parametro deve essere un intero
    exit 2;;
esac

num=$2
shift

PATH=$PATH:`pwd`
export PATH

#file che iniziano per . sono nascosti. Con > creo file se non esiste o lo sovrascrivo cancellando tutto
> /tmp/.max_counter.tmp
> /tmp/.max_dirName.tmp

#con $* passo tutti i parametri dal quarto in poi cioè le estensioni
echo cercaStringa.sh $stringa $dir $num
echo La directory con il maggior numero di file è `cat /tmp/.max_dirName.tmp` con `wc -l < /tmp/.max_dirName.tmp` file


rm -f /tmp/.max_counter.tmp
rm -f /tmp/.max_dirName.tmp
#stampa cartella che contiene maggior numero di file con almeno num stringhe nel file