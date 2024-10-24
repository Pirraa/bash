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

#for par in $*
#do
    #case $par in
        #*[!a-z]*)
            #echo "Errore: i nomi dei file devono essere minuscoli";exit 3;;
        #*);;
    #esac
#done

PATH=$PATH:`pwd`
export PATH

# Richiamo altro file
#se avessi fatto export di stringa potevo non passarla
ricerca.sh $directory_assoluta $stringa $*

#posso anche fare while true con exit quando il controllo va a buon fine e non devo rilanciare il programma
if test `cat /tmp/counter.tmp | wc -l` -eq 0
then
    rm -f /tmp/counter.tmp
    rm -f /tmp/lines.tmp
    echo "Nessuno file trovato. Aspetto 1 minuto."
    sleep 1m
    #va bene anche sleep `expr 60\*60`
    copylines.sh $directory_assoluta $stringa $*
else
    #anche qui posso rimuovere i file dopo averli stampati
    echo Numero file spostati: `cat /tmp/counter.tmp | wc -l`
    echo Righe file spostati: `cat /tmp/lines.tmp`
fi