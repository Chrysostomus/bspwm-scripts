#!/bin/dash
# Did I just click the desktop?

#Get the window id of the window that is under the pointer and set variable WINDOW to it
eval $(xdotool getmouselocation --shell)

#Get the window id of the rootwindow aka desktop and convert the id into decimal form that xdotool uses so we can easily compare the values
rootwindowid=$(xdotool search --class Bspwm|head -n 1)
#Compare window ids to see if window under mouse is the rootwindow. Returns false if not.
[ "$WINDOW" = "$rootwindowid" ]
