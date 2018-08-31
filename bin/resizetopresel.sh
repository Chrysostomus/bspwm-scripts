#!/bin/zsh

# Check if the brother node is a receptacle
if [[ $(bspc query -T -n @brother/ | jshon -e client) = null ]]; then
    # Yep, it's a receptacle. Get the real dimensions
    eval $(grep "gap=" .config/bspwm/bspwmrc)
    # Get orientation
    wattr xywh $(pfw) | read focused_x focused_y focused_width focused_height
    receptacle_y=$(bspc query -T -n @brother/ | jshon -e rectangle -e y)
    
    if [[ "$focused_y" -eq "$receptacle_y" ]]; then 
        receptacle_width=$(bspc query -T -n @brother/ | jshon -e rectangle -e width)
        receptacle_x=$(bspc query -T -n @brother/ | jshon -e rectangle -e x)
        # receptacle and window have the same height, so they are side by side
        if [[ receptacle_x -gt focused_x ]]; then
            echo "receptacle is right of the window"
            # get the true window dimension
            true_dim=$(( receptacle_width + gap ))
            # kill the repectacle
            for i in $(bspc query -N -n .leaf.!window.local); do bspc node $i -k; done
            # resize the window
            bspc node @east -r -$true_dim || bspc node @west -r +$true_dim
        else
            echo "receptacle is left of the window"
            # get the true window dimension
            true_dim=$(( receptacle_width + gap ))
            # kill the repectacle
            for i in $(bspc query -N -n .leaf.!window.local); do bspc node $i -k; done
            # resize the window
            bspc node @west -r +$true_dim || bspc node @east -r -$true_dim 
        fi
    else
        receptacle_height=$(bspc query -T -n @brother/ | jshon -e rectangle -e height)
        # widht is necessarily equal if height is not, because the nodes are brothers
        # Window are on the top of each other
        if [[ receptacle_y -gt focused_y ]]; then
            echo "receptacle is below the window"
            # get the true window dimension
            true_dim=$(( receptacle_height + gap))
            # kill the repectacle
            for i in $(bspc query -N -n .leaf.!window.local); do bspc node $i -k; done
            # resize the window
            bspc node @south -r -$true_dim || bspc node @north -r +$true_dim
        else
            echo "receptacle is above the window"
            # get the true window dimension
            true_dim=$(( receptacle_height + gap))
            # kill the repectacle
            for i in $(bspc query -N -n .leaf.!window.local); do bspc node $i -k; done
            # resize the window
            bspc node @north -r +$true_dim || bspc node @south -r -$true_dim
        fi
    fi
    echo $true_dim 
    exit 0
fi

# If the focused window is not preselected, exit
[[ "$(bspc query -T -n focused | jshon -e presel)" == null ]] && exit 0

dir=$(bspc query -T -n focused | jshon -e presel -e splitDir | tr -d \")
ratio=$(bspc query -T -n focused | jshon -e presel -e splitRatio)
 
case "$dir" in
        west)
        cur=$(bspc query -T -n focused | jshon -e rectangle -e width)
        bspc node @west -r +$((${cur}*${ratio})) || bspc node @east -r -$((${cur}*${ratio})) 
        ;;
        east)
        cur=$(bspc query -T -n focused | jshon -e rectangle -e width)
        bspc node @east -r -$((${cur}*${ratio})) || bspc node @west -r +$((${cur}*${ratio}))
        ;;
        
        north)
        cur=$(bspc query -T -n focused | jshon -e rectangle -e height)
        bspc node @north -r +$((${cur}*${ratio})) || bspc node @south -r -$((${cur}*${ratio}))
        ;;
        south)
        cur=$(bspc query -T -n focused | jshon -e rectangle -e height)
        bspc node @south -r -$((${cur}*${ratio})) || bspc node @north -r +$((${cur}*${ratio}))
esac
 
cancel_presels
