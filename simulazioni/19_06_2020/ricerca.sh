#!/bin/bash

dir=$1
stringa="#!/bin/bash"
> /tmp/counter.tmp

cd $dir

#metti dev null sennò in ogni cartella in cui non c'è neanche un file di quel tipo stampa errore
for i in `ls *.sh 2> /dev/null`
do
    if test -f $i -a -r $i -a -w $i
    then
        if test `grep -c "#!/bin/bash" $i` -gt 0
        then
            echo $i >> /home/francesco/script.txt
            echo $i >> /tmp/counter.tmp
        fi
    fi
done

#se usi wc usa pipe con cat, non usare grep -c perchè conta ricorrenze di una parola e non righe del file
if test `cat /tmp/counter.tmp | wc -l` -gt `cat /tmp/max_counter.tmp`
then
    echo `cat /tmp/counter.tmp | wc -l` > /tmp/max_counter.tmp
    echo `pwd` > /tmp/max_directory.tmp
fi

for i in *
do
    if test -d $i -a -x $i
    then
        ricerca.sh $i
    fi
done