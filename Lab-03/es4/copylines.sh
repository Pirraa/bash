#! /bin/sh

> /tmp/counter.tmp
> /tmp/lines.tmp

if test $# -lt 3
then
    echo "Errore: numero parametri insufficienti."
    exit 1
fi

directory_assoluta=$1
shift

# Chiedere al prof come
if test ${directory_assoluta:0:1} != "/"
then
    echo "Errore: il primo argomento deve essere una directory assoluta."
    exit 2
fi

if test ! -d $directory_assoluta
then
    echo "Errore: il primo argomento deve essere una directory."
    exit 3
fi

stringa=$1
shift

for i in $*
do
# Chiedere al prof come
    if [[ ! "$i" =~ ^[a-z]+$ ]]
    then
        echo "Errore: i nomi dei file devono essere minuscoli."
        exit 4
    fi
done

PATH=$PATH:`pwd`
export PATH

# Richiamo altro file
ricerca.sh $directory_assoluta $stringa $*

if test `cat /tmp/counter.tmp | wc -l` -eq 0
then
    rm -f /tmp/counter.tmp
    rm -f /tmp/lines.tmp
    echo "Nessuno file trovato. Aspetto 1 minuto."
    sleep 1m
    copylines.sh $directory_assoluta $stringa $*
else
    echo Numero file spostati: `cat /tmp/counter.tmp | wc -l`
    echo Righe file spostati: `cat /tmp/lines.tmp`
fi