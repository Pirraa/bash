#!/bin/bash
cd "$2"

#posso usare anche variabile al posto di file, ma avendo file poi lo copio nel file con il massimo numero di file che soddisfano la condizione
> /tmp/.counter.tmp

for i in `ls *.txt 2>/dev/null`
do
    if test -f "$i" -a -r "$i" -a `grep -c $1, "$i"` -ge $3
    then 
        #counter contiene i file che soddisfano la condizione, il numero di righe è il numero di file
        echo $i >> /tmp/.counter.tmp
    fi
done

#se il numero di righe del file è maggiore di quello di max counter 
if test `wc -l < /tmp/.counter.tmp` -gt `wc -l /tmp/.max_counter.tmp`
then 
    #copio contenuto di counter in max counter (ovvero max counter contiene nomi file che soddisfano requisiti)
    mv /tmp/.counter.tmp /tmp/.max_counter.tmp
    echo `pwd` > /tmp/.max_dirName.tmp
fi

rm -f /tmp/.counter.tmp

for dir in *
do
    if test -d "$dir" -a -x "$dir"
    then
        cercaStringa.sh "$1" "$dir" "$3"
    fi
done