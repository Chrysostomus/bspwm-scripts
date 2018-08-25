#!/bin/bash

	less 	<<-EOF
	List of some useful keybindings. 
	More can be found from the file ~/.config/sxhkd/sxhkdrc.
	You can also edit keybindings there.
	
	Mod4 is super key, on many keyboards marked with windows logo.	
	As a rule of thumb, super+<direction> moves focus, 
	super+shift+<direction> moves focused window,
	and super+ctrl+<direction> resizes windows.
	
	Arrow keys, wasd and hjkl represent directions and numbers represent
	different workspaces. 
	 
	### Window manipulation ################################################################

		Alt + Tab                     |- Cycle windows
		Super + Tab                   |- Open window switcher
		Super + x                     |- Close window
		Super + shift + x             |- Kill window
		Super + <direction>           |- Move focus to the direction
		Super + shift + <direction>   |- Move focused window to direction
		Super + ctrl + <direction>    |- Resize focused window to direction
		Alt + shift + <direction>     |- Preselect/split the rootwindow
		Super + 1-9                   |- Focus the desktop with that number
		Super + shift + 1-9           |- Move focused window to desktop with that number	
		Super + Enter                 |- Move window to the biggest available space 
                              |  or preselection if there is one
		Super + ctrl + Enter          |- Preselect where the next window will be opened
		Ctrl + space                  |- Preselect where the next window will be opened
		Alt + Enter                   |- Preselect/split the rootwindow
		Super + b                     |- Balance windows
		Alt + b                       |- Toggle automatic window balancing
		Super + i                     |- Make window sticky
		Super + t                     |- Toggle tiling/floating
		Super + shift + t             |- Toggle pseudotiling	
		Super + shift + f             |- Toggle fullscreen
		Super + f                     |- Toggle monocle
		Super + o                     |- Make window private 
                              |  (Avoids splitting it automatically)
		Super + Shift + q             |- Cleanly quit bspwm
		Super + shift +r              |- Reload bspwms configuration file
	### Mousecommands ######################################################################
		
		Leftclick menus	              |- Close menu 
		Super + scroll                |- Adjust window gap
		Super + drag                  |- Moves window
		Super + rightclick drap       |- Resizes window
		Alt + leftclick               |- Spawn window manipulation menu on cursor
		Alt_gr + leftclick            |- Split window depending on mouselocation
                              |  and spawn application menu
	### Applications #######################################################################

		Super + p                     |- Dmenu (Run applications)
		Super + space                 |- Dmenu (Run applications)
		Super + shift + b             |- Browser
		Super + r                     |- File search
		Super + e                     |- Explore files with SpaceFM
		Super + shift + e             |- Explore files with Ranger   
		Super + shift + Return        |- Terminal
		Super + z                     |- Terminal



	EOF
