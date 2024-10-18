#!/bin/bash
#• controllo del parametro passato cancella_versioni_preliminari dir_articoli
#• aggiunta della directory corrente alla variabile $PATH
#• creazione dei file max_counter.tmp (con valore 0) e max_dirname.tmp
#• chiamata a cancella_versioni_preliminari_aux.sh <parametri>
#• stampa risultato

if test $# -ne 1
    then echo argomenti errati; exit 1;
fi

if ! test -d $1
    then echo $1 non è nome relativo di directory; exit 2;
fi

PATH=$PATH:`pwd`;

> /tmp/.max_counter.tmp
> /tmp/.max_dirname.tmp

echo `cancella_versioni_preliminari.sh $1`;

#stampa risultato

