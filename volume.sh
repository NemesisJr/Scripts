#!/bin/bash

case $1 in
F3)
    /usr/bin/pactl set-sink-volume @DEFAULT_SINK@ +10%
    ;;
F2)
    /usr/bin/pactl set-sink-volume @DEFAULT_SINK@ -10%
    ;;
F1)
    /usr/bin/pactl set-sink-mute @DEFAULT_SINK@ toggle
    ;;
esac

CURVOL=`amixer get Master | awk '$0~/%/{print $5}' | tr -d '[]%'`

notify-send "Volume: $CURVOL"
