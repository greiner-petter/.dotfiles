source /usr/share/cachyos-fish-config/cachyos-config.fish

function fish_greeting
end

# Save explicitly installed package roots to dotfiles
function pkg-save
    pacman -Qqe > ~/.dotfiles/packages/server.txt
    echo "Explicit package list saved to ~/.dotfiles/packages/server.txt"
end

if status is-interactive
    if string match -q '/dev/tty*' (tty); and not set -q DISPLAY; and not set -q WAYLAND_DISPLAY
        exec cage -- foot
    else if not set -q HERDR_ENV
        herdr
    end
end
