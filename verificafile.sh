#!/bin/sh
#sh myScript <parametri>
#chmod u+x myScript ./myScript <parametri>
#sh -x myScript <parametri>
#set -x Attivo tracing
#<righe di codice da debuggare>
#set +x Disattivo tracing
#PATH=$PATH:`pwd`
#export PATH

echo "Inserisci nome file o cartella"
read -r nomeFile
uscita="fine"
while test "$nomeFile" != $uscita
do
    #for i in *
        #do
        #echo $i
            #if test -d -f "$nomeFile" -a "$nomeFile" = "$i"
            if test -f "$nomeFile" 
                then echo file trovato
                #exit
            fi

            if test -d "$nomeFile" 
                then echo cartella trovata
                #exit
            fi
    #done
    echo "Inserisci nome file o cartella"
    read nomeFile
done