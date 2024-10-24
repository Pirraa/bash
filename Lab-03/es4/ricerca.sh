#! /bin/sh

directory_assoluta=$1
shift

stringa=$1
shift

cd $directory_assoluta

for i in $*
do  
    i=$i".txt"
    #qui si può aggiungere -a -r $i per controllare permessi lettura file
    if test -f $i
    then
        #andava bene anche -ge 1
        if test `grep -c $stringa $i` -gt 0 
        then
            grep $stringa $i >> /tmp/lines.tmp
            #qui potevo aggiungere pwd/$i per stampare sul file tutto il percorso del file e non solo il nome
            echo $i >> /tmp/counter.tmp
            mv $i "/tmp"
        fi
    fi
done

for i in *
do
    #controlla anche permessi directory con -a -x
    if test -d $i
    then
        ricerca.sh "$directory_assoluta/$i" $stringa $*
    fi
done