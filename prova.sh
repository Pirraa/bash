#!/usr/bin/bash

# file view filename [filename]...
case $# in
    0) echo Usage is: "$0" filename ['filename']
    exit 1;;
    *) ;;
esac
for i in "$@" # in $* poteva essere omesso
    do
        if test -f "$i" # se il file esiste ed è file proprio
            then
            echo "$i" # visualizza il nome del file
            cat "$i" # visualizza il contenuto del file
            else echo file "$i" non presente
        fi
    done