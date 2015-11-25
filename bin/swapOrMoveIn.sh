#!/bin/bash
#By https://github.com/ikn/
dir=$1
bspc window -w ${dir}.!automatic || bspc window -s ${dir}
