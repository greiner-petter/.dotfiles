#!/bin/sh
b=/sys/class/power_supply/BAT0
[ -d "$b" ] || { echo "no bat"; exit 0; }
read -r now < "$b/charge_now"
read -r full < "$b/charge_full"
if [ -n "$now" ] && [ -n "$full" ] && [ "$full" -gt 0 ]; then
    cap=$(( now * 100 / full ))
    [ "$cap" -gt 100 ] && cap=100
else
    read -r cap < "$b/capacity"
fi
read -r st < "$b/status"
case $st in Charging) i="󰂄";; Full|"Not charging") i="󰚥";; *) i="󰁹";; esac

bl=/sys/class/backlight/acpi_video0
if [ -d "$bl" ]; then
    read -r cur < "$bl/brightness"
    read -r max < "$bl/max_brightness"
    br=$(( (cur * 100 + max / 2) / max ))
    [ "$cur" -eq 0 ] && bi="󰃞" || bi="󰃠"
    scr=" · $bi $br%"
fi

read -r load _ < /proc/loadavg
echo "$i $cap%$scr ·  $load"



