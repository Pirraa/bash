#!/bin/sh
#sh contaricorrenze.sh processi.txt sbin var ...
if test $# -lt 2
then 
    echo "Devo mettere due argomenti";
    exit 1
fi

file=$1
if test ! -f "$file"
then 
    echo "Il primo argomento deve essere un file"
    exit 2
fi

#elimina primo argomento dalla lista, gli altri slittano di 1 a sinistra
shift 

echo ricerca file $file
for i in $*
do
    count=$(grep "$i" "$file" | wc -l)  
    #count=`grep -c "$i" "$file"` in alternativa questo comando
    echo "parametro $i - ricorrenze: $count"
done