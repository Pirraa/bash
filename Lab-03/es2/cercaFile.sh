#!/bin/bash

#controllo dei parametri
#aggiunta della directory corrente alla variabile $PATH
#creazione dei file max_counter.tmp e max_dirname.tmp
#chiamata a cercaStringa.sh <parametri>
#stampa risultato

#cercaFile stringa dir num
#cercaFile stringa dir num dove stringa è una stringa, dir é un nome assoluto di directory e num è un intero.

if test $# -lt 3
then 
    echo argomenti errati
    exit 1
fi

stringa=$1
shift 

case $1 in
    /*) if test ! -d $1
        then 
            echo $1: dir sorgente non è directory
            exit 3
        fi ;;
    *) echo dir sorgente non è percorso assoluto
        exit 4;;
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
> /tmp/.maxCounter.tmp
> /tmp/.max_dirname.tmp

#con $* passo tutti i parametri dal quarto in poi cioè le estensioni
echo cercaStringa.sh $stringa $dir $num

#stampa cartella che contiene maggior numero di file con almeno num stringhe nel file
echo La directory con il maggior numero di file è `cat /tmp/.max_dirname.tmp` con `wc -l < /tmp/.maxCounter.tmp` file


rm -f /tmp/.max_counter.tmp
rm -f /tmp/.max_dirName.tmp