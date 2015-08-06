#!/bin/bash
#By https://github.com/ikn/
dir=$1
bspc window -w ${dir}.manual || bspc window -s ${dir}
