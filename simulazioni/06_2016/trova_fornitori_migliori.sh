#! /bin/sh
# trova_fornitori_migliori dir cod_parte num
# Se i fornitori hanno lo stesso numero di pezzi, stampo il primo fornitore trovato

echo "0,0,0,0" > /tmp/fornitore_pezzi.tmp

if test $# -ne 3
then
    echo "Errore: Numero di parametri errato. Inserisci 3 parametri."
    exit 1
fi

dir=$1

if ! test -d $dir
then
    echo "Errore: Il primo parametro deve essere una cartella."
    exit 2
fi

case $dir in
    /*);;
    *) echo "Errore: Il primo parametro deve essere una cartella assoluta."; exit 3;;
esac

cod_parte=$2

case $cod_parte in
    *[a-z,A-Z,0-9]*) ;;
    *) echo "Errore: Formattazione codice errata."; exit 4;;
esac

num=$3

case $num in
    *[0-9]*) ;;
    *) echo "Errore: Numero errato di parti."; exit 5;;
esac

PATH=$PATH:`pwd`
export PATH

ricerca.sh $dir $cod_parte $num

# Stampa
nome_fornitore=`cut -f1 -d, /tmp/fornitore_pezzi.tmp`
numero_parti=`cut -f4 -d, /tmp/fornitore_pezzi.tmp`

echo "$nome_fornitore $numero_parti"

rm -f /tmp/fornitore_pezzi.tmp