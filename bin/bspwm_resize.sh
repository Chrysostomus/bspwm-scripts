#!/bin/bash
# Originally by https://github.com/windelicato/, modified to do different actions to windows
# Sample sxhkd usage:
#
# alt + {a,f}
#    /home/sunn/scripts/bspwm_resize {-p,-n} -x -s 20
#
# alt + {s,d}
#    /home/sunn/scripts/bspwm_resize {-p,-n} -y -s 20

POSITIVE=false
HORIZONTAL=false
SIZE='20'

err() {
        echo "$1"
        exit 1
}


usage() {
        echo "usage: bspwm_resize [direction]"
        echo
        echo "Options:"
        echo "   -p, --positive       - resize in positively"
        echo "   -n, --negative       - resize in negatively"
        echo "   -x, --xdir           - resize in x direction"
        echo "   -y, --ydir           - resize in y dir"
        echo "   -s,                  - number of pixels to resize or move"
        echo "   -h, --help           - display this"
        exit
}

if [[ $# -eq 0 ]] ; then
        usage
        exit
fi

for i in "$@"; do
        case $i in
                '-p'|'--positive')
                        POSITIVE=true
                        ;;
                '-n'|'--negative')
                        POSITIVE=false
                        ;;
                '-x'|'--xdir')
                        HORIZONTAL=true
                        ;;
                '-y'|'--ydir')
                        HORIZONTAL=false
                        ;;
                '-s')
                        SIZE=$(echo $@ | sed 's/.*-s \([0-9]*\).*/\1/')
                        [[ "$SIZE" == "$@" ]] && err "Must specify number of pixels"
                        ;;
                ''|'-h'|'--help')
                        usage
                        exit
                        ;;
                *)
                        ;;
        esac
done

# Find current window mode
TILED="$(bspc query -T -w | grep -q '"state":"tiled"')"

# If the window is tiled, change split ration
if $TILED ; then
        $HORIZONTAL && switch=('west' 'east') || switch=('south' 'north')
        $POSITIVE && sign="+" || sign="-"
        bspc node -e ${switch[0]} ${sign}${SIZE} ||  bspc node -e ${switch[1]} ${sign}${SIZE}s
# Otherwise, window is floating or pseudotiled, resize it
else
        $HORIZONTAL && switch="-w" || switch="-h"
        $POSITIVE && sign="+" || sign="-"
        xdo resize ${switch} ${sign}${SIZE}
fi
