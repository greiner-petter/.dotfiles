source /usr/share/cachyos-fish-config/cachyos-config.fish

function fish_greeting
end

if status is-interactive
    if string match -q '/dev/tty*' (tty); and not set -q DISPLAY; and not set -q WAYLAND_DISPLAY
        exec cage -- foot
    else if not set -q ZELLIJ; and not set -q HERDR_ENV
        exec herdr
    end
end

if status is-login
    bash -c 'sleep 0.3; for led in /sys/class/leds/input*::capslock; do [ "$(cat "$led/device/name" 2>/dev/null)" = "keyd virtual keyboard" ] && echo 1 > "$led/brightness" && break; done' &
    disown
end

alias bat='cat /sys/class/power_supply/BAT0/capacity'
