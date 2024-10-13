#!/bin/sh
#esame estensione dir1 dir2
#estensione è una qualsiasi stringa che inizia con un punto e dir1 dir2 sono nomi assoluti di direttorio.
#Il file comandi deve cercare tutti i file con l'estensione passata come parametro in tutto il sottoalbero individuato da dir1 
#li deve copiare in dir2 se e solo se la copia NON va a sovrascrivere file già esistenti con lo stesso nome in quel direttorio.

if test $# -lt 3
then echo "errore devi inserire almeno 3 parametri"; exit 1;
fi

#if  test $1 = .*
#then echo "errore il primo argomento deve essere una estensione"; exit 2;
#fi

if test $2 = */* -a $3 = */*
then echo "le due cartelle devono essere percorsi assoluti"
fi


PATH=$PATH:`pwd`;
export PATH;
trovaprof.sh $2 *$1;

