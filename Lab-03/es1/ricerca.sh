#!/bin/bash
#muoviFile num dirSorgente dirDestinazione ext1 ext2...extN
#dove num è un intero, ext1 ext2...extN sono stringhe che rappresentano estensioni di
#file (iniziano quindi con un punto), dirSorgente e dirDestinazione sono nomi assoluti
#di directory.

if test $# -lt 4
    then echo Numero di argomenti minimo non rispettato
    exit 1
fi

num=$1
case $num in
    [!0-9]) echo "{$num} non è un numero";exit 1;;
    *) ;;
esac

shift
dirSorgente=$1
case $dirSorgente in
    /*) ;;
    *) echo "$1 Non è directory assoluta"; exit 1;;
esac

shift
dirDestinazione=$1
case $dirDestinazione in
    /*) ;;
    *) echo "$dirDestinazione Non è directory assoluta"; exit 1;;
esac

shift
for i in $*
    do
        if [[ "$i" != .* ]]
            then echo "$i non è un estensione";exit 1;
        fi
    done

$PATH=$PATH:`pwd`;
export $PATH;
#export PATH="/home/francesco/.vscode-server/bin/384ff7382de624fb94dbaf6da11977bba1ecd427/bin/remote-cli:/home/francesco/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/lib/wsl/lib:/mnt/c/Program\ Files/Common\ Files/Oracle/Java/javapath:/mnt/c/Windows/system32:/mnt/c/Windows:/mnt/c/Windows/System32/Wbem:/mnt/c/Windows/System32/WindowsPowerShell/v1.0:/mnt/c/Windows/System32/OpenSSH:/mnt/c/Program\ Files/NVIDIA\ Corporation/PhysX/Common:/mnt/c/Program\ Files/Microsoft\ SQL\ Server/150/Tools/Binn:/mnt/c/Program\ Files/Microsoft\ SQL\ Server/Client\ SDK/ODBC/170/Tools/Binn:/mnt/c/Program\ Files/Microsoft\ SQL\ Server/150/Tools/Binn:/mnt/c/Program\ Files/Microsoft\ SQL\ Server/150/DTS/Binn:/mnt/c/Program\ Files/Git/cmd:/mnt/c/Program\ Files/Docker/Docker/resources/bin:/mnt/c/Program\ Files/Tailscale\ IPN:/mnt/c/Program\ Files/nodejs:/mnt/c/ProgramData/ComposerSetup/bin:/mnt/c/Program\ Files/dotnet:/mnt/c/Program\ Files/Microsoft\ SDKs/Windows/10/Windows\ Kits/10/Windows\ Kits/10/Windows/Toolkit:/mnt/c/Program\ Files/MATLAB/R2024b/bin:/mnt/c/Users/Francesco/AppData/Local/Microsoft/WindowsApps:/mnt/c/Users/Francesco/AppData/Local/Programs/Microsoft/Code/bin:/mnt/c/Program\ Files/Azure\ Studio/bin:/mnt/d/src/flutter/bin:/mnt/c/xampp/php:/mnt/c/Users/Francesco/AppData/Roaming/npm:/mnt/c/Users/Francesco/AppData/Local/ComposerSetup/bin:/mnt/c/Users/Francesco/AppData/Roaming/Composer/vendor/bin:/mnt/c/Users/Francesco/.dotnet/tools:/mnt/c/Platform-tools:/snap/bin:/home/francesco/.local/bin"


`touch counter.tmp`;

echo `muoviFile.sh $num $dirSorgente $dirDestinazione $*`;
echo ci sono `cat counter.tmp | wc -l` file che soddisfano i requisiti;