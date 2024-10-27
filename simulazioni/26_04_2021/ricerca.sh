#!/bin/bash

dir=$1

cd $dir

header=$2

> /tmp/num_file

for i in `ls *.log 2>/dev/null`
do
    if test -f $i -a -w $i
    then    
        head=`head -n 1 $i | grep -c $header`
        if test $head -ge 1
        then
            echo `pwd`/$i >> $HOME/misure.txt;
            echo $i >> /tmp/num_file
        fi
    fi
done


if test `wc -l < /tmp/num_file` -gt `cat /tmp/max_file`
then
    echo `wc -l < /tmp/num_file` > /tmp/max_file;
    echo `pwd` > /tmp/max_directory
fi


for i in *
do
    if test -d "$i" -a -x "$i"
    then
        ricerca.sh `pwd`/"$i" $header
    fi
done