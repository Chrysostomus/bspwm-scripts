#!/bin/bash
# Script copied from AUR package dswitcher, and modified for theming and placement and removed unnecessary functions.
if ! [ -f "$HOME/.dmenurc" ]; then
	cp /usr/share/dmenu/dmenurc $HOME/.dmenurc
fi
. $HOME/.dmenurc

width=$(wattr w $(lsw -r))
height=$(wattr h $(lsw -r))
bar_width=$(( $width / 3 ))
left_shift=$(( ($width - $bar_width) / 2 ))
top_shift=$PANEL_HEIGHT

num=$(wmctrl -l | sed 's/  / /' | cut -d " " -f 4- | nl -w 3 -n rn | sed -r 's/^([ 0-9]+)[ \t]*(.*)$/\1 - \2/' | dmenu -i -l 10 -x $left_shift -y $top_shift -w $bar_width -fn $DMENU_FN -nb $DMENU_NB -nf $DMENU_NF -sf $DMENU_SF -sb $DMENU_SB | cut -d '-' -f -1)
[[ -z "$num" ]] && exit
wmctrl -l | sed -n "$num p" | cut -c -10 | xargs wmctrl -i -a
