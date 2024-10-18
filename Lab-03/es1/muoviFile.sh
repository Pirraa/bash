#!/bin/bash
#entrata nella directory passata come parametro
#• per ogni estensione
#• per ogni file con quell'estensione
#• se si tratta di un file
#• se l'utente ha i diritti di lettura e numero righe > num →
#• scrittura di una riga nel file counter.tmp
#• copia del file nella directory destinazione

#• ricorsione: per ogni directory
#• se si tratta di una directory e l'utente ha i diritti di esecuzione
#• chiamata ricorsiva a ricerca.sh <parametri> passando la directory corrente

num=$1
shift
dirSorgente=$1
shift
dirDestinazione=$3
shift
cd $dirSorgente

for i in $*
do
    for j in `ls *$i`
    do
        if test -f $j -a -r $j 
            #a wc devo passare il file con < e non come parametro 
            if test `wc -l < $j` -gt $num
                echo file $j trovato >> counter.tmp;
                `cp $j $dirdDestinazione`;
            fi
        fi
    done
done


for i in *
do
        # controllando il permesso di esecuzione evito loop 
        if test -d "$i" -a -x "$i"
        then
            #se non fai lo shift non hai modo di avere i parametri opzionali alla fine che non sai quanti sono
            muoviFile.sh $num "$dirSorgente/$i" $dirDestinazione $*;
        fi
done