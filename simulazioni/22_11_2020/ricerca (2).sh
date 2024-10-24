#! /bin/bash

dir=$1
cd $dir

# 2>/dev/null va tutto attaccato
for i in `ls *.txt 2>/dev/null`
do
    if test -r $i -a `head -n 1 $i | grep -c giochi` -gt 0
    then
        echo "/$dir/$i" >> $HOME/trovato.txt

        # Se fai "wc -l file" ti ritorna anche il nome del file che gli hai passato
        # Per non farti tornare questa variabile fai una "cat file | wc -l"
        numero_righe=`cat $i | wc -l`

        if test $numero_righe -gt `cat /tmp/maxrighe.tmp`
        then
            echo $numero_righe > /tmp/maxrighe.tmp
            echo $i > /tmp/nomemax.tmp
        fi
    fi
done

for i in *
do
    if test -d $i -a -x $i
    then
        ricerca.sh "$i"
    fi
done