source /usr/share/cachyos-fish-config/cachyos-config.fish

# Custom colours
cat ~/.local/state/caelestia/sequences.txt 2> /dev/null

# Save package lists to dotfiles
function pkg-save
    pacman -Qen | awk '{print $1}' > ~/.dotfiles/packages/pacman.txt
    pacman -Qem | awk '{print $1}' > ~/.dotfiles/packages/aur.txt
    echo "Package lists saved to ~/.dotfiles/packages/"
end

# overwrite greeting
# potentially disabling fastfetch
#function fish_greeting
#    # smth smth
#end
