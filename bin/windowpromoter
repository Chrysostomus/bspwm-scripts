#!/usr/bin/sh

receptacle=$(bspc query -N -n ".leaf.!window.local" | awk NR==1)

window_promotion()
{
	if [ -n "$receptacle" ] > /dev/null ; then
    bspc node -n "$receptacle" 
    elif [ -z "$(bspc query -N -n last.!automatic.local)" ]; then \
        bspc node -s biggest.!focused.local; \
    else \
        bspc node -n last.!automatic.local; \
    fi 
}

if bspc query -N -n "@/.!automatic" > /dev/null ; then
	bspc node -n @/ || window_promotion
	else
    	if [ -n "$receptacle" ] > /dev/null ; then
    			bspc node -n "$receptacle" 
    		elif [ -z "$(bspc query -N -n last.!automatic.local)" ]; then \
       			 bspc node -s biggest.!focused.local; \
    		else \
       			 bspc node -n last.!automatic.local; \
    	fi 
fi
