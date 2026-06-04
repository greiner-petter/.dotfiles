#!/usr/bin/bash
capacity=$(/usr/bin/cat /sys/class/power_supply/BAT0/capacity 2>/dev/null) || exit 1
status=$(/usr/bin/cat /sys/class/power_supply/BAT0/status 2>/dev/null) || exit 1
/usr/bin/printf '%d%% %s\n' "$capacity" "$status"
