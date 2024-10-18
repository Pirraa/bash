#!/bin/bash

if test $# -ne 1
then 
echo argomenti errati
exit 1
fi

case $1 in
    /*) echo cartella non relativa; exit 2;;
    *);;
esac

if test ! -d "$1" -o ! -x "$1"
then
    echo errore $1 non è una directory
    exit 2
fi

PATH=$PATH:`pwd`
export PATH

echo '0' > /tmp/max_counter
> /tmp/max_dirname

cancella_versioni_preliminari_aux.sh "`pwd`"/"$i"

echo la directory con il maggior numero di file cancellati è `cat /tmp/max_dirname`

rm -f /tmp/max_counter
rm -f /tmp/max_dirname

