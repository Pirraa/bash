#!/bin/bash

#trova_script dir (nome assoluto)

#controllo parametri
if test $# -ne 1
then
    echo "Errore: numero parametri errato"
    exit 1
fi

case $1 in
    !/*) echo "$1 non è directory assoluta"; exit 2;;
    *);;
esac

if ! test -d $1
then
    echo "Errore: $1 non è una directory"
    exit 3
fi


#aggiorno path
PATH=$PATH:`pwd`; export PATH

#creo file per file che soddisfano ricerca e per cartella con più file
> /home/francesco/script.txt
> /tmp/max_directory.tmp
> /tmp/max_counter.tmp
echo "0" > /tmp/max_counter.tmp
#lancio script
ricerca.sh $1

#stampo risultati
echo "directory con più file che soddisfano ricerca: `cat /tmp/max_directory.tmp` con `cat /tmp/max_counter.tmp` file"