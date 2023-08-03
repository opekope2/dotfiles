#!/bin/bash
ScreenTimeout=30

swayidle -w timeout $ScreenTimeout 'hyprctl dispatch dpms off' resume 'hyprctl dispatch dpms on' &
SWAYIDLE_PID=$!

swaylock

kill $SWAYIDLE_PID
