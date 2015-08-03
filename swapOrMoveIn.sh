#!/bin/bash

dir=$1
bspc window -w ${dir}.manual || bspc window -s ${dir}
