#! /bin/bash
xrandr --auto &&
sleep 1 &&
xrandr --output DP-0 --left-of DP-4; xrandr --output DP-2 --right-of DP-4 &&
nitrogen --restore
