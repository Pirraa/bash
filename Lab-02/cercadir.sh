#!/usr/bin/bash
# file cercadir [direttorioassoluto] file
case $# in
    0) echo errore. Usa "$0" ['direttorio'] file
    exit 2 ;;
    1) d=$(pwd); f=$1;;
    2) d=$1; f=$2;;
esac

cd "$d" || exit
if test -f "$f"
    then echo il file "$f" è in "$d"
fi

for i in *
    do
        if test -d "$i" –a –x "$i"
            then echo direttorio "$d/$i"
        cercadir "$(pwd)/$i $f" # ricorsione
        fi
    done
