#!/bin/sh

#uso variabile anche se non dichiarata, devo usare "" così se non è inizializzata diventa stringa vuota 
#se uso "" e metto più parole le interpreta come stringa unica, senza "" prende solo la prima parola
while test "$nome" != fine
do
    echo "inserisci nome file o cartella da cercare"
    read nome
    if test "$nome" = fine #se scrivo fine torno su con continue e termino programma
    then 
        continue
    fi

    if test -f "$nome"
    then 
        echo $nome è un file
    else
        if test -d "$nome"
        then 
            echo $nome è una cartella
        else
            echo $file non esiste
        fi
    fi
done