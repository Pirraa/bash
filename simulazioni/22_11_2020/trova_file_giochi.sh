#! /bin/bash
# trova_file_giochi dir
# Se due file contengono lo stesso numero di righe, scrivo il primo file trovato

> $HOME/trovato.txt
echo 0 > /tmp/maxrighe.tmp
> /tmp/nomemax.tmp

dir=$1

if test $# -ne 1
then
    echo "Errore: Devi passare un parametro coglione di merda."
    exit 1
fi

if ! test -d $dir
then
    echo "Errore: Devi passare una cartella coglione di merda."
    exit 2
fi

case $dir in
    *) ;;
    /*) echo "Errore: Devi passare una cartella."; exit 3;;
esac

PATH=$PATH:`pwd`
export PATH

ricerca.sh $dir

echo `cat /tmp/nomemax.tmp`
echo `cat /tmp/maxrighe.tmp`

rm -f /tmp/maxrighe.tmp
rm -f /tmp/nomemax.tmp