#!/usr/bin/bash
ssid=$(/usr/bin/nmcli -t -f active,ssid dev wifi 2>/dev/null | /usr/bin/grep '^yes:' | /usr/bin/cut -d: -f2 | /usr/bin/head -1)
/usr/bin/echo "${ssid:-disconnected}"
