#!/bin/zsh

# If the focused window is not preselected, exit
[[ "$(bspc query -T -n focused | jshon -e presel)" == null ]] && exit 0

dir=$(bspc query -T -n focused | jshon -e presel -e splitDir | tr -d \")
ratio=$(bspc query -T -n focused | jshon -e presel -e splitRatio)
 
case "$dir" in
        west|east)
        cur=$(bspc query -T -n focused | jshon -e rectangle -e width)
        bspc node @east -r -$((${cur}-${cur}*${ratio})) || bspc node @west -r +$((${cur}-${cur}*${ratio}))
        ;;
 
        north|south)
        cur=$(bspc query -T -n focused | jshon -e rectangle -e height)
        bspc node @south -r -$((${cur}-${cur}*${ratio})) || bspc node @north -r +$((${cur}-${cur}*${ratio}))
esac
 
cancel_presels
