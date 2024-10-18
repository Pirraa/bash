#!/bin/sh
#Si implementi un file comandi "trova" che effettui la ricerca di
#un file in modo ricorsivo a partire da una directory assoluta
#specificata dall'utente.
#Esempio:
#$ sh trova.sh nomedirectory nomefile
#echo $#
if ! test $# = 2
    then echo "numero argomenti errato"
fi

if test $1 = */*
    then echo argomento sbagliato: $1 assoluto; exit 3;
fi

if ! test -d $1 
    then echo "secondo argomento non è cartella"
    exit 1
fi

if ! test -f $2
    then echo "terzo argomento non è file"
    exit 1
fi

PATH=$PATH:`pwd`;
export PATH;

cd $1
if test -f $2
    then echo il file $2 è in $1
fi

for i in *
do
    if test -d $i
        #then echo direttorio $1/$i;
        then trova.sh $(pwd)/$i $2;
    fi
done