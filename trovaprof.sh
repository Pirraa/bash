#!/bin/sh
if test $# != 2
then echo "devo avere de argomenti"; exit 1;
fi

dir="$1";

#controllo directory assoluta, se inizia con / lo è altrimenti no
case "$dir" in
    /*);;
    *) echo "errore non è persorso assoluto di cartella"; exit 2;;
esac

if test ! -d "$dir"
then 
    echo "errore il prim argomento non è una directory"; exit 3;
fi

file="$2";
PATH=$PATH:`pwd`;
export PATH;

#controllo se ho diritti di esecuzione
if test -x "$dir";
then 
    cd "$dir";
    #al posto di * compaiono tutti i file e le cartelle nella directory corrente
    for i in *
    do
        #controllo esistenza cartella
        if test -d "$i"
        then 
            #ricerco ricorsivamente nelle sottocartelle che sono pwd/i 
            trovaprof.sh "`pwd`"/"$i" "$file"
        else
            #se esiste file e se ha lo stesso nome di quello cercato
            if test -f "$i" -a "$i" = "$file"
            then
                echo trovato $i in `pwd`
            fi
        fi
    done
fi