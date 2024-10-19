#! /bin/sh

directory_assoluta=$1
shift

stringa=$1
shift

cd $directory_assoluta

for i in $*
do  
    i=$i".txt"

    if test -f $i
    then
        if test `grep -c $stringa $i` -gt 0 
        then
            grep $stringa $i >> /tmp/lines.tmp
            echo $i >> /tmp/counter.tmp
            mv $i "/tmp"
        fi
    fi
done

for i in *
do
    if test -d $i
    then
        ricerca.sh "$directory_assoluta/$i" $stringa $*
    fi
done