#!/bin/bash

num=$1
shift 
sorg=$1
shift 
dest=$1
shift


cd "$sorg"

#ciclo per tutte le estensioni
for ext in $*
do
    #la variabile file contiene i file nella directory corrente con estensione ext 
    #2>dev/null significa redirigi lo stderr nel file null cioè scartalo
    for file in "`ls *$ext 2>/dev/null`"
    do
        #se il file è un file e non una cartella
        if test -f "$file"
        then 
            #se ho i diritti di lettura e se le righe sono maggiori o uguali a num 
            if test -r "$file" -a `wc -l <"$file"` -gt $num
            then 
                echo "$file" >> /tmp/.counter.tmp
                cp "$file" "$dest/$file"
            fi
        fi
    done
done

#chiamata ricorsiva, cambio solo sorgente in cui cercare
for dir in *
do
    if test -d "$file" -a -x "$dir"
    then
        ricerca.sh $num "$dir" "$dest" $*
    fi
done