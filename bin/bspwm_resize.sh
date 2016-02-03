#!/bin/bash

size=${2:-'20'}
dir=$1

# Find current window mode
is_tiled() {
bspc query -T -n | grep -q '"state":"tiled"'
}
# If the window is floating, move it
if ! is_tiled; then
#only parse input if window is floating,tiled windows accept input as is
        case "$dir" in
                west) switch="-w"
                sign="-"
                ;;
                east) switch="-w"
                sign="+"
                ;;
                north) switch="-h"
                sign="-"
                ;;
                south) switch="-h"
                sign="+"
                ;;
                esac
 xdo resize ${switch} ${sign}${size}

# Otherwise, window is tiled: switch with window in given direction
else
     case "$dir" in
                west) bspc node @west -r -$size || bspc node @east -r -20
                ;;
                east) bspc node @west -r +$size || bspc node @east -r +20
                ;;
                north) bspc node @south -r -$size || bspc node @north -r -20
                ;;
                south) bspc node @south -r +$size || bspc node @north -r +20
                ;;
                esac
fi
