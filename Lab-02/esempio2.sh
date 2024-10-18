#!/usr/bin/bash
# file lista <filenames>
for i
do
    echo -n "$i ?" > /dev/tty # terminale attual. connesso
    # -n = non emettere newline;
    # ? non è sostituito (ci sono le virgolette)
    read -r answer
    case $answer in
        y*| Y*| s* | S* ) echo "$i"; cat "$i" ;;
    esac
done