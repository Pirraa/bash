#! /bin/bash

dir=$1
cod_parte=$2
num=$3

cd $dir

for i in `ls *.txt 2> /dev/null`
do
    if test -f $i -a -r $i
    then
        line=`grep $cod_parte $i`

        if test `grep -c $cod_parte $i` -lt 1
        then
            continue
        fi

        if test `cut -f4 -d, $i` -ge $num
        then
            if test `cat /tmp/fornitore_pezzi.tmp | cut -f4 -d,` -lt `cut -f4 -d, $i`
            then
                echo $line > /tmp/fornitore_pezzi.tmp
            fi
        fi
    fi
done

for i in *
do
    if test -d $i -a -x $i
    then
        ricerca.sh "$dir/$i" $cod_parte $num
    fi
done