#!/bin/bash
pkill -USR2 -x sxhkd; \
bspc config focus_follows_pointer off; \
xdotool click 3; \
bspc config focus_follows_pointer on; \
pkill -USR2 -x sxhkd
