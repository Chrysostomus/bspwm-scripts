#!/bin/bash
    
    #client != null => container mit window
    #rectangle => container size
    #client.window => window id
#    USAGE=\
#    "$(basename $0) [option]
#    options:
#    	num     any real number 1 -> biggest window 2 -> second biggest ...
#    	nothing print all windwos on desktop sorted by size biggest first\
#    		"
    tree=$(bspc wm -d| jshon -e root -j)
    
    function print_childs {
    	tree=$1
    	fChild=$(echo $tree| jshon -e firstChild -j)
    	sChild=$(echo $tree| jshon -e secondChild -j)
    	for Child in $fChild $sChild; do
    		if [ "$(echo $Child| jshon -e client)" != "null" ]; then
    			window=$(echo $Child| jshon -e client -e window)
    			#echo $Child| jshon -e rectangle
    			height=$(echo $Child| jshon -e rectangle -e height)
    			width=$(echo $Child| jshon -e rectangle -e width)
    			echo "$window:$(( height * width ))"
    		else
    			print_childs $Child
    		fi
    	done
    }
    
    #store window ids in array sorted by size
    windows=( $(print_childs $tree| sort -t":" -rnk2| cut -d":" -f1 ) )
    windows_len=$(( ${#windows[@]} -1 ))
    
    #getOpts
    #no options => print all ids sorted by leave size (window tiled + border)
    if [ $# -ne 1 ]; then
    	for id in ${windows[@]}; do
    		echo $id
    	done
    
    # check if $1 is a number
    elif ! [ "$1" -eq "$1" ] 2> /dev/null; then
    	echo "$USAGE"
    
    # print the x. biggest window 1 biggest 2 second biggest ...
    # number higher then windows => print last (tinyst window)
    else 
    	[ $1 -gt 0 ] && index=$(( $1 -1 ))
    
    	if [ $index -gt $windows_len ]; then
    		index=$windows_len
    	fi
    
    	echo ${windows[$index]}
    fi
