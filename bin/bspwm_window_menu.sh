#!/bin/sh
# file: ~/scripts/bspwm_window_menu.sh
#Apparence
BG="#08090A"
FG="#859900"
FN="-*-terminus-medium-*-*-*-12-*-*-*-*-*-*-*"
# Le dossier du menu
DIR=~/scripts/9menu
# Le fichier du menu
FILE=window_menu
cd $DIR
9menu -label "Window actions" -popup -bg "$BG" -fg "$FG" -font "$FN" -teleport -file $FILE
