#!/bin/bash
#By https://github.com/ikn/
dir=$1
bspc node -n ${dir}.!automatic || bspc node -s ${dir}
