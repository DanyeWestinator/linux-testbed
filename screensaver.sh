#!/usr/bin/env bash

#Boots a random screensaver
num_savers=4
rand=$((1 + $RANDOM % $num_savers))
#rand=4
#first choice is asciiquarium
aquarium () {
#https://github.com/cmatsuoka/asciiquarium
    ~/linux-testbed/asciiquarium
}
#2 is pipes
pipes () {
     ~/linux-testbed/pipes.sh
}
matrix () {
     cmatrix -b -s
}
bonsai () {
    clear
    cd ~/linux-testbed/cbonsai
    #message=$(fortune -s)
 cbonsai -w 1.00 --live  -m "Grower, not a show-er" -t 0.3 --leaf="&,#,%,(,),!" -M 8 -i
}

if [ $rand == 1 ]; then
    aquarium
fi

if [ $rand == 2 ]; then
    pipes
fi

if [ $rand == 3 ]; then
    matrix
fi

if [ $rand == 4 ]; then
    bonsai
fi

