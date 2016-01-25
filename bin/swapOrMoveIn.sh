#!/bin/bash
#By https://github.com/ikn/
dir=$1
bspc node -w ${dir}.!automatic || bspc node -s ${dir}
